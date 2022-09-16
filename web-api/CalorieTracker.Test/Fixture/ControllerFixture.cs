using AutoMapper;
using CalorieTracker.Controllers;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Core.Mappings;
using CalorieTracker.Core.Models;
using CalorieTracker.Service.Interfaces;
using CalorieTracker.Service.Services;
using CalorieTracker.Test.Mock;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalorieTracker.Test.Fixture
{
    public class ControllerFixture
    {

        private RepositoryContextMock dbContextMock { get; set; }
        private IRepositoryManager repositoryManager { get; set; }
        private IMapper Mapper
        {
            get
            {
                var mappingConfig = new MapperConfiguration(mc =>
                {
                    mc.AddProfile(new FoodEntryProfile());
                    mc.AddProfile(new UserMappingProfile());
                });

                return mappingConfig.CreateMapper();

            }
        }

        private ILoggerManager Logger
        {
            get
            {
                return new Mock<LoggerManager>().Object;

            }
        }

        public AuthController authController { get => new AuthController(repositoryManager, Logger, Mapper); }
        public FoodEntriesController foodEntryController { get => new FoodEntriesController(repositoryManager, Logger, Mapper); }

        public ControllerFixture()
        {

            // Arrange


            var mockStore = new Mock<IUserStore<User>>();
            //var userManagerMock = new Mock<UserManager<User>>(mockStore.Object, null, null, null, null, null, null, null, null);
            var userManagerMock = new Mock<FakeUserManager>();

            User testUser = new User { UserName = "user@test.com" };

            mockStore.Setup(x => x.CreateAsync(testUser, It.IsAny<CancellationToken>()))
               .Returns(Task.FromResult(IdentityResult.Success));

            mockStore.Setup(x => x.FindByNameAsync(testUser.UserName, It.IsAny<CancellationToken>()))
                        .Returns(Task.FromResult(testUser));
            userManagerMock.Setup(x => x.CheckPasswordAsync(It.IsAny<User>(), It.IsAny<string>())).ReturnsAsync(true);

            userManagerMock.Setup(x => x.CreateAsync(testUser).Result).Returns(new IdentityResult());
            userManagerMock.Setup(x => x.CreateAsync(testUser).Result).Returns(new IdentityResult());

            var optionsBuilder = new DbContextOptionsBuilder();
            optionsBuilder.UseSqlServer("server=.;database=CalorieTracker_TestDB;TrustServerCertificate=True;Integrated Security=true");

            dbContextMock = new RepositoryContextMock(optionsBuilder.Options);
            repositoryManager = new RepositoryManagerMock(dbContextMock, userManagerMock.Object, Mapper, ConfigMock.GetConfig());

            //authController = new AuthController(repositoryManager, Logger, Mapper);
            //quizController = new QuizzesController(repositoryManager, Logger, Mapper);

            initializeTestData();

        }




        private void initializeTestData()
        {

            repositoryManager.UserAuthentication.RegisterUserAsync(new UserRegistrationDto()
            {
                FullName = "Mujassir Nasir",
                UserName = "mujassir@gmail.com",
                Email = "mujassir@gmail.com",
                Password = "123456",
            });

            repositoryManager.UserAuthentication.RegisterUserAsync(new UserRegistrationDto()
            {
                FullName = "Khan Muhammad",
                UserName = "kmuhammad@gmail.com",
                Email = "kmuhammad@gmail.com",
                Password = "123456",
            });
        }

    }
}
