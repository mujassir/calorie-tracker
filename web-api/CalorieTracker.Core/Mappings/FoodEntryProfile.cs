using AutoMapper;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;

namespace CalorieTracker.Core.Mappings;
public class FoodEntryProfile : Profile
{
    public FoodEntryProfile()
    {
        CreateMap<FoodEntry, FoodEntryDto>().ReverseMap();

    }
}
