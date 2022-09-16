using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;
using CalorieTracker.Service.Filters.ActionFilters;
using CalorieTracker.Service.Interfaces;
using System.Security.Claims;

namespace CalorieTracker.Controllers;


[Route("api/foodEntries")]
[ApiController]
public class FoodEntriesController : BaseApiController
{
    public FoodEntriesController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    [HttpPost]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Create([FromBody] FoodEntryDto input)
    {
        if (input == null) return new BadRequestObjectResult("Input object is null");
        var record = _mapper.Map<FoodEntry>(input);
        if (!IsAdminUser) record.UserId = CurrentUserId;
        FillBaseData(record);
        await _repository.FoodEntry.Create(record);
        await _repository.SaveAsync();
        var response = _mapper.Map<FoodEntryDto>(record);
        input.Id = response.Id;
        return CreatedAtRoute(new { id = record.Id }, input);
    }


    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        try
        {
            IEnumerable<FoodEntry> list;
            list = await _repository.FoodEntry.GetAll(CurrentUserId, trackChanges: false);

            var listDto = _mapper.Map<IEnumerable<FoodEntryDto>>(list);
            return Ok(listDto);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Something went wrong in the {nameof(GetAll)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }


    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(int id)
    {
        var record = await _repository.FoodEntry.GetById(id, trackChanges: false);

        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            if (!IsAdminUser && record.UserId != CurrentUserId) return NotFound();
            var recordDto = _mapper.Map<FoodEntryDto>(record);
            return Ok(recordDto);
        }
    }


    [HttpPut("{id}")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Update(int id, [FromBody] FoodEntryDto input)
    {
        if (input == null) return new BadRequestObjectResult("Input object is null");
        var record = await _repository.FoodEntry.GetById(id, trackChanges: true);
        if (record is null)
        {
            _logger.LogInfo($"Record with id: {id} doesn't exist in the database.");
            return NotFound();
        }
        else
        {
            if (!IsAdminUser && record.UserId != CurrentUserId) return NotFound();
            _mapper.Map(input, record);
            FillBaseData(record);
            await _repository.SaveAsync();
            return Ok(record);
        }


    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteById(int id)
    {
        var record = await _repository.FoodEntry.GetById(id, trackChanges: true);
        if (record == null || (!IsAdminUser && record.UserId != CurrentUserId)) return NotFound();
        await _repository.FoodEntry.Delete(record);
        await _repository.SaveAsync();
        return Ok(id);
    }

    #region Admin Methods


    [HttpGet(nameof(GetAllUsersData))]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> GetAllUsersData()
    {
        try
        {
            IEnumerable<FoodEntry> list;
            list = await _repository.FoodEntry.GetAll(trackChanges: false);
            var listDto = _mapper.Map<IEnumerable<FoodEntryDto>>(list.OrderByDescending(p => p.FoodTakenAt).ToList());
            var users = _repository.UserAuthentication.Users.ToDictionary(p => p.Id, q => q.FullName);
            foreach (var item in listDto)
            {
                item.UserFullName =  users.ContainsKey(item.UserId) ? users[item.UserId] : "";
            }
            return Ok(listDto);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Something went wrong in the {nameof(GetAll)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpGet(nameof(GetReportSummary))]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> GetReportSummary()
    {
        try
        {
            var toDate = DateTime.Now;
            var fromDate = DateTime.Now.Date.AddDays(-7);

            var summary = new ReportSummaryDto
            {
                EntriesLastWeek = await _repository.FoodEntry.GetEntriesCount(fromDate, toDate),
                EntriesWeekBeforeLastWeek = await _repository.FoodEntry.GetEntriesCount(fromDate.AddDays(-7), fromDate),
                AverageCalroies = await _repository.FoodEntry.GetAverageCalroiesValue(fromDate, toDate)
            };
            return Ok(summary);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Something went wrong in the {nameof(GetAll)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }

    #endregion

}
