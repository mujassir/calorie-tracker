using Microsoft.EntityFrameworkCore;
using CalorieTracker.Core.Models;
using CalorieTracker.Repo.Data;
using CalorieTracker.Repo.GenericRepository.Service;
using CalorieTracker.Service.Interfaces;

namespace CalorieTracker.Service.Services;

public class ServiceRepositoryBase<T> : RepositoryBase<T>, IRepository<T> where T : ModelBase
{
    public ServiceRepositoryBase(RepositoryContext repositoryContext) : base(repositoryContext)
    {
    }
    public async Task Create(T input) => await CreateAsync(input);
    public async Task Delete(T input) => await RemoveAsync(input);
    public async Task Create(T[] input) => await CreateAsync(input);

    public async Task<IEnumerable<T>> GetAll(bool trackChanges)
        => await FindAllAsync(trackChanges).Result.ToListAsync();
    public async Task<T?> GetById(int id, bool trackChanges)
        => await FindByConditionAsync(c => c.Id.Equals(id), trackChanges).Result.SingleOrDefaultAsync();
    public async Task DeleteById(int id)
        => await RemoveAsync(FindByConditionAsync(c => c.Id.Equals(id),false).Result.SingleOrDefault());
}
