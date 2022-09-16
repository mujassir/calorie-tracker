using AutoMapper;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;

namespace CalorieTracker.Core.Mappings;
public class UserMappingProfile : Profile
{
    public UserMappingProfile()
    {
        CreateMap<UserRegistrationDto, User>();
        CreateMap<User, UserInfoDto>();
    }
}
