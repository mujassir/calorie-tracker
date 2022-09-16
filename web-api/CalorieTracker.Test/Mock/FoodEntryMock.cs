using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Models;
using Microsoft.Extensions.Configuration;
using Moq;

namespace CalorieTracker.Test.Mock
{
    public static class FoodEntryMock
    {
        public static FoodEntryDto FoodEntryDto
        {
            get
            {
                return new FoodEntryDto()
                {
                    Name = "bread",
                    TotalCalories = 500,
                    FoodTakenAt = DateTime.UtcNow,
                    UserId = new Guid().ToString(),
                };
            }
        }
    }
}

