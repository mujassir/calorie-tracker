using CalorieTracker.Core.Models;
using CalorieTracker.Repo.Data;
using CalorieTracker.Service.Interfaces;

namespace CalorieTracker.Service.Services;

public class FoodEntryRepository : ServiceRepositoryBase<FoodEntry>, IFoodEntryRepository
{
    public FoodEntryRepository(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }
    public async Task<IEnumerable<FoodEntry>> GetAll(string userId, bool trackChanges)
       => await FindByConditionAsync(c => c.UserId == userId, trackChanges);


    public async Task<decimal> GetAverageCalroiesValue(DateTime fromDate, DateTime toDate)
    {
        var res = await FindByConditionAsync(p => p.FoodTakenAt.HasValue && p.FoodTakenAt >= fromDate && p.FoodTakenAt <= toDate, false);
        var average = res.Where(p => p.TotalCalories.HasValue).Average(p => p.TotalCalories);
        return average ?? 0;
    }

    public async Task<int> GetEntriesCount(DateTime fromDate, DateTime toDate)
    {
        var res = await FindByConditionAsync(p => p.FoodTakenAt.HasValue && p.FoodTakenAt >= fromDate && p.FoodTakenAt <= toDate, false);
        return res.Count();
    }
}
