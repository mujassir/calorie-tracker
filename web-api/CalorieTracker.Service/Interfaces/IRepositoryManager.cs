namespace CalorieTracker.Service.Interfaces;

public interface IRepositoryManager
{
    IFoodEntryRepository FoodEntry { get; }
    IUserAuthenticationRepository UserAuthentication { get; }
    Task SaveAsync();
}
