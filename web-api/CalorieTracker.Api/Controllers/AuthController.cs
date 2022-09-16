using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;
using CalorieTracker.Service.Filters.ActionFilters;
using CalorieTracker.Service.Interfaces;

namespace CalorieTracker.Controllers;


[Route("api/auth")]
[ApiController]
[AllowAnonymous]
public class AuthController : BaseApiController
{
    public AuthController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper) : base(repository, logger, mapper)
    {
    }

    [HttpPost("register")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> RegisterUser([FromBody] UserRegistrationDto userRegistration)
    {
        if (userRegistration == null) return new BadRequestObjectResult("Input object is null");
        var userResult = await _repository.UserAuthentication.RegisterUserAsync(userRegistration);
        return !userResult.Succeeded ? new BadRequestObjectResult(userResult) : StatusCode(201);
    }

    [HttpPost("login")]
    [ServiceFilter(typeof(ValidationFilterAttribute))]
    public async Task<IActionResult> Authenticate([FromBody] UserLoginDto user)
    {
        if (user == null) return new BadRequestObjectResult("Input object is null");
        var userInfo = await _repository.UserAuthentication.ValidateUserAsync(user);

        return userInfo == null
            ? Unauthorized()
            : Ok(new
            {
                User = userInfo,
                AccessToken = await _repository.UserAuthentication.CreateTokenAsync()
            });
    }

    [HttpGet(nameof(GetAllUsers))]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> GetAllUsers()
    {
        try
        {
            var users = _repository.UserAuthentication.Users.Select(p => new IdNameDto() { Id = p.Id, Name = p.FullName });
            return Ok(users);
        }
        catch (Exception ex)
        {

            _logger.LogError($"Something went wrong in the {nameof(GetAllUsers)} action {ex}");
            return StatusCode(500, "Internal server error");
        }
    }

}
