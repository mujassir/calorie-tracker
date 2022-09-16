using Microsoft.AspNetCore.Identity;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;

namespace CalorieTracker.Service.Interfaces;

public interface IUserAuthenticationRepository
{
    IQueryable<User> Users { get; }

    Task<IdentityResult> RegisterUserAsync(UserRegistrationDto userForRegistration);
    Task<UserInfoDto?> ValidateUserAsync(UserLoginDto loginDto);
    Task<string> CreateTokenAsync();
}

