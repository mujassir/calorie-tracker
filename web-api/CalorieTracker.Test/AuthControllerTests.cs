using CalorieTracker.Controllers;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Test.Fixture;
using Microsoft.AspNetCore.Mvc;

namespace CalorieTracker.Test
{
    public class AuthControllerTests : IClassFixture<ControllerFixture>
    {
        private readonly AuthController _authController;
        public AuthControllerTests(ControllerFixture fixture)
        {
            _authController = fixture.authController;
            _authController.ModelState.AddModelError("error", "some error");
        }

        [Fact]
        public async Task Authenticate_ReturnsBadRequest_GivenInvalidModel()
        {
            var result = await _authController.Authenticate(null);
            Assert.IsType<BadRequestObjectResult>(result);
        }

        [Fact]
        public async Task Authenticate_ReturnsUnAuthorized_GivenInvalidCredentials()
        {
            var result = await _authController.Authenticate(new UserLoginDto { UserName = "username", Password = "password" });
            Assert.IsType<UnauthorizedResult>(result);
        }

        [Fact]
        public async Task Authenticate_ReturnsOK_GivenValidCredentials()
        {
            var result = await _authController.Authenticate(new UserLoginDto { UserName = "mujassir@gmail.com", Password = "123456" });
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task Register_ReturnsBadRequest_GivenInvalidModel()
        {
            var result = await _authController.RegisterUser(null);
            Assert.IsType<BadRequestObjectResult>(result);
        }

        [Fact]
        public async Task Register_ReturnsOK_GivenValidModel()
        {
            var result = await _authController.RegisterUser(new UserRegistrationDto()
            {
                FullName = "Mujassir Nasir",
                UserName = "mujassir@gmail.com",
                Email = "mujassir@gmail.com",
                Password = "123456",
            });

            Assert.IsType<OkObjectResult>(result);
        }


    }
}