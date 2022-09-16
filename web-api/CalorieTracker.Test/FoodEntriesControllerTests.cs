using CalorieTracker.Controllers;
using CalorieTracker.Core.Dtos;
using CalorieTracker.Test.Fixture;
using CalorieTracker.Test.Mock;
using Microsoft.AspNetCore.Mvc;

namespace CalorieTracker.Test
{
    public class FoodEntriesControllerTests : IClassFixture<ControllerFixture>
    {
        private readonly FoodEntriesController _controller;
        public FoodEntriesControllerTests(ControllerFixture fixture)
        {
            _controller = fixture.foodEntryController;
        }
        [Fact]
        public async Task Create_ReturnsBadRequest_GivenInvalidModel()
        {
            var result = await _controller.Create(null);
            Assert.IsType<BadRequestObjectResult>(result);
        }
        [Fact]
        public async Task Create_ReturnsResult_GivenValidModel()
        {
            var result = await _controller.Create(FoodEntryMock.FoodEntryDto);

            Assert.IsType<CreatedAtRouteResult>(result);
        }

        [Fact]
        public async Task GetAll_ReturnsOKResult()
        {
            var result = await _controller.GetAll();
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_ReturnsNotFoundResult()
        {
            var result = await _controller.GetById(-1);
            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task GetById_ReturnsOKResult()
        {
            var result = await _controller.Create(FoodEntryMock.FoodEntryDto);
            var id = ((FoodEntryDto)((CreatedAtRouteResult)result).Value).Id;
            var data = await _controller.GetById(id);
            Assert.IsType<OkObjectResult>(data);
        }

        [Fact]
        public async Task Update_ReturnsBadRequestObjectResult_GivenInvalidModel()
        {
            var result = await _controller.Update(-1, null);
            Assert.IsType<BadRequestObjectResult>(result);
        }

        [Fact]
        public async Task Update_ReturnsNotFoundResultResult_GivenInvalidId()
        {
            var result = await _controller.Update(-1, FoodEntryMock.FoodEntryDto);
            Assert.IsType<NotFoundResult>(result);
        }


        [Fact]
        public async Task Update_ReturnsOKResult_GivenValidModel()
        {
            var obj = FoodEntryMock.FoodEntryDto;
            var result = await _controller.Create(obj);
            var id = ((FoodEntryDto)((CreatedAtRouteResult)result).Value).Id;

            obj.Id = id;
            obj.Name += " Updated";
            var data = await _controller.Update(id, obj);
            Assert.IsType<OkObjectResult>(data);
        }

        [Fact]
        public async Task DeleteById_ReturnsNotFoundResult()
        {
            var result = await _controller.DeleteById(-1);
            Assert.IsType<NotFoundResult>(result);
        }


        [Fact]
        public async Task DeleteById_ReturnsOKResult_GivenValidId()
        {
            var obj = FoodEntryMock.FoodEntryDto;
            var result = await _controller.Create(obj);
            var id = ((FoodEntryDto)((CreatedAtRouteResult)result).Value).Id;

            var data = await _controller.DeleteById(id);
            Assert.IsType<OkObjectResult>(data);
        }

        [Fact]
        public async Task GetAllUsersData_ReturnsUnauthorizedResult_GivenNonAdminUser()
        {
            var data = await _controller.GetAllUsersData();
            Assert.IsType<UnauthorizedResult>(data);
        }

        [Fact]
        public async Task GetAllUsersData_ReturnsUnauthorizedResult_GivenAdminUser()
        {
            var data = await _controller.GetAllUsersData();
            Assert.IsType<OkObjectResult>(data);
        }


        [Fact]
        public async Task GetReportSummary_ReturnsUnauthorizedResult_GivenNonAdminUser()
        {
            var data = await _controller.GetReportSummary();
            Assert.IsType<UnauthorizedResult>(data);
        }

        [Fact]
        public async Task GetReportSummary_ReturnsUnauthorizedResult_GivenAdminUser()
        {
            var data = await _controller.GetReportSummary();
            Assert.IsType<OkObjectResult>(data);
        }
    }
}