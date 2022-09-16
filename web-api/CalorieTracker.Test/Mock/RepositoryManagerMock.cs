using AutoMapper;
using CalorieTracker.Core.Models;
using CalorieTracker.Service.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalorieTracker.Test.Mock
{
    public class RepositoryManagerMock : RepositoryManager
    {
        public RepositoryManagerMock(RepositoryContextMock repositoryContext, UserManager<User> userManager, IMapper mapper, IConfiguration configuration) : base(repositoryContext, userManager, mapper, configuration)
        {
        }
    }
}
