﻿using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;
using CalorieTracker.Service.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace CalorieTracker.Service.Services;

internal sealed class UserAuthenticationRepository : IUserAuthenticationRepository
{
    private readonly UserManager<User> _userManager;
    private readonly IConfiguration _configuration;
    private readonly IMapper _mapper;
    private User? _user;

    public UserAuthenticationRepository(UserManager<User> userManager, IConfiguration configuration, IMapper mapper)
    {
        _userManager = userManager;
        _configuration = configuration;
        _mapper = mapper;
    }

    public IQueryable<User> Users => _userManager.Users;

    public async Task<IdentityResult> RegisterUserAsync(UserRegistrationDto userRegistration)
    {
        var user = _mapper.Map<User>(userRegistration);
        var result = await _userManager.CreateAsync(user, userRegistration.Password);
        return result;
    }

    public async Task<UserInfoDto?> ValidateUserAsync(UserLoginDto loginDto)
    {
        _user = await _userManager.FindByNameAsync(loginDto.UserName);
        var result = _user != null && await _userManager.CheckPasswordAsync(_user, loginDto.Password);
        return result ? _mapper.Map<UserInfoDto>(_user) : null;
    }

    public async Task<string> CreateTokenAsync()
    {
        var signingCredentials = GetSigningCredentials();
        var claims = await GetClaims();
        var tokenOptions = GenerateTokenOptions(signingCredentials, claims);
        return new JwtSecurityTokenHandler().WriteToken(tokenOptions);
    }

    private SigningCredentials GetSigningCredentials()
    {
        var jwtConfig = _configuration.GetSection("jwtConfig");
        var key = Encoding.UTF8.GetBytes(jwtConfig["Secret"]);
        var secret = new SymmetricSecurityKey(key);
        return new SigningCredentials(secret, SecurityAlgorithms.HmacSha256);
    }

    private async Task<List<Claim>> GetClaims()
    {
        var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, _user.UserName),
            new Claim(ClaimTypes.Sid, _user.Id),
        };
        if (_user.IsAdmin.HasValue && _user.IsAdmin.Value)
            claims.Add(new Claim(ClaimTypes.Role, "Admin"));

        //var roles = await _userManager.GetRolesAsync(_user);
        //foreach (var role in roles)
        //{
        //    claims.Add(new Claim(ClaimTypes.Role, role));
        //}
        return claims;
    }

    private JwtSecurityToken GenerateTokenOptions(SigningCredentials signingCredentials, List<Claim> claims)
    {
        var jwtSettings = _configuration.GetSection("JwtConfig");
        var tokenOptions = new JwtSecurityToken
        (
        issuer: jwtSettings["validIssuer"],
        audience: jwtSettings["validAudience"],
        claims: claims,
        expires: DateTime.Now.AddMinutes(Convert.ToDouble(jwtSettings["expiresIn"])),
        signingCredentials: signingCredentials
        );
        return tokenOptions;
    }


}
