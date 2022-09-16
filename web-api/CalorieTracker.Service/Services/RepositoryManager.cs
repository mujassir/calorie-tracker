using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using CalorieTracker.Core.Models;
using CalorieTracker.Repo.Data;
using CalorieTracker.Service.Interfaces;

namespace CalorieTracker.Service.Services;

public class RepositoryManager : IRepositoryManager
{
    private IFoodEntryRepository _foodEntryRepository;
    private IUserAuthenticationRepository _userAuthenticationRepository;

    private readonly RepositoryContext _repositoryContext;
    private readonly UserManager<User> _userManager;
    private readonly IMapper _mapper;
    private readonly IConfiguration _configuration;

    public RepositoryManager(RepositoryContext repositoryContext, UserManager<User> userManager, IMapper mapper, IConfiguration configuration)
    {
        _repositoryContext = repositoryContext;
        _userManager = userManager;
        _mapper = mapper;
        _configuration = configuration;
    }

    public IFoodEntryRepository FoodEntry
    {
        get
        {
            if (_foodEntryRepository is null)
                _foodEntryRepository = new FoodEntryRepository(_repositoryContext);
            return _foodEntryRepository;
        }
    }

    public IUserAuthenticationRepository UserAuthentication
    {
        get
        {
            if (_userAuthenticationRepository is null)
                _userAuthenticationRepository = new UserAuthenticationRepository(_userManager, _configuration, _mapper);
            return _userAuthenticationRepository;
        }
    }
    public Task SaveAsync() => _repositoryContext.SaveChangesAsync();
}
