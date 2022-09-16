using System.ComponentModel.DataAnnotations;
namespace CalorieTracker.Core.Dtos;
public class UserRegistrationDto
{
    public string? FullName { get; init; }

    [Required(ErrorMessage = "Username is required")]
    public string? UserName { get; init; }

    [Required(ErrorMessage = "Password is required")]
    public string? Password { get; init; }
    public string? Email { get; init; }
    public decimal? DailyCalorieLimit { get; init; }
}
