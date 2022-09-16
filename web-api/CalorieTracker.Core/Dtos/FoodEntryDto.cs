using System.ComponentModel.DataAnnotations;

namespace CalorieTracker.Core.Dtos
{
    public class FoodEntryDto
    {
        public int Id { get; set; }
        public string? Name { get; set; }

        public string? Unit { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? UnitCalorieValue { get; set; }
        public decimal? TotalCalories { get; set; }

        public DateTime? FoodTakenAt { get; set; }

        public string? UserId { get; set; }
        public string? UserFullName { get; set; }
    }


}
