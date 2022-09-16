using Microsoft.AspNetCore.Identity;

namespace CalorieTracker.Core.Models;

public class User : IdentityUser
{
    public string? FullName { get; set; }
    public bool? IsAdmin { get; set; }
    public decimal? DailyCalorieLimit { get; set; }
}
