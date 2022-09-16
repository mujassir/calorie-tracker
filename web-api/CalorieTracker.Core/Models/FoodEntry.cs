using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CalorieTracker.Core.Models
{
    public class FoodEntry : ModelBase
    {

        [Required(ErrorMessage = "Food name is a required field.")]
        public string? Name { get; set; }

        public string? Unit { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? UnitCalorieValue { get; set; }
        [Required(ErrorMessage = "Calorie value is a required field.")]
        public decimal? TotalCalories { get; set; }

        public DateTime? FoodTakenAt { get; set; }


        [ForeignKey(nameof(User))]
        public string? UserId { get; set; }

    }
}
