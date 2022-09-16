using System.ComponentModel.DataAnnotations;
namespace CalorieTracker.Core.Dtos;
public class UserInfoDto
{
    public string Id { get; init; }
    public string? FullName { get; init; }

    public string? UserName { get; init; }

    public string? Email { get; init; }
    public string? PhoneNumber { get; init; }

    public bool? IsAdmin { get; init; }
    public decimal? DailyCalorieLimit { get; set; }
}
