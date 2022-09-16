using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using CalorieTracker.Service.Interfaces;
using System.Security.Claims;
using CalorieTracker.Core.Models;

namespace CalorieTracker.Controllers;

[Authorize]
public class BaseApiController : ControllerBase
{
    protected readonly IRepositoryManager _repository;
    protected readonly ILoggerManager _logger;
    protected readonly IMapper _mapper;

    public BaseApiController(IRepositoryManager repository, ILoggerManager logger, IMapper mapper)
    {
        _repository = repository;
        _logger = logger;
        _mapper = mapper;
    }



    protected string CurrentUserId
    {
        get
        {
            var userClaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Sid);
            return userClaim?.Value;
        }

    }

    protected bool IsAdminUser
    {
        get
        {
            var userClaims = HttpContext.User.Claims.Where(p => p.Type == ClaimTypes.Role);
            return userClaims.Any(p => p.Value == "Admin");
        }
    }

    protected void FillBaseData(ModelBase input) 
    {
        if (input.Id == 0)
        {
            input.CreatedBy = CurrentUserId;
            input.CreatedAt = DateTime.Now;
        }
        else {
            input.ModifiedBy = CurrentUserId;
            input.ModifiedAt = DateTime.Now;
        }
        //return input;
    }
}
