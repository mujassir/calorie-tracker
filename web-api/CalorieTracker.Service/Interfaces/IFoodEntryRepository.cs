using CalorieTracker.Core.Models;

namespace CalorieTracker.Service.Interfaces;

public interface IFoodEntryRepository : IRepository<FoodEntry>
{
    Task<IEnumerable<FoodEntry>> GetAll(string userId,bool trackChanges);
    Task<int> GetEntriesCount(DateTime fromDate, DateTime toDate);
    Task<decimal> GetAverageCalroiesValue(DateTime fromDate, DateTime toDate);



}
