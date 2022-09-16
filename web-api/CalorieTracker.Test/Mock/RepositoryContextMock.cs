using CalorieTracker.Repo.Data;
using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalorieTracker.Test.Mock
{
    public class RepositoryContextMock : RepositoryContext
    {
        public RepositoryContextMock(DbContextOptions options) : base(options)
        {
        }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    /**
        //     * At this stage, a copy of the actual database is created as a memory database.
        //     * You do not need to create a separate test database.
        //     */
        //    if (!optionsBuilder.IsConfigured)
        //    {
        //        //optionsBuilder.UseInMemoryDatabase(Guid.NewGuid().ToString());
        //        string connectionString = "server=.;database=CalorieTracker_TestDB;TrustServerCertificate=True;Integrated Security=true";
        //        optionsBuilder.UseSqlServer(connectionString);
        //    }
        //}
    }
}
