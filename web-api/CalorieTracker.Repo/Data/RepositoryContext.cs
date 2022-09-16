using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using CalorieTracker.Core.Models;

namespace CalorieTracker.Repo.Data;

public class RepositoryContext : IdentityDbContext<User>
{
    public RepositoryContext(DbContextOptions options) : base(options)
    {
    }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        //modelBuilder.ApplyConfiguration(new UserData());
    }

    public DbSet<FoodEntry> FoodEntries { get; set; }
    public DbSet<User> Users { get; set; }
}
