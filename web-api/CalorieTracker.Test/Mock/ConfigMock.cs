using Microsoft.Extensions.Configuration;
using Moq;

namespace CalorieTracker.Test.Mock
{
    public static class ConfigMock
    {

        public static IConfiguration GetConfig() 
        {
            var mockConfSection = new Mock<IConfigurationSection>();
            mockConfSection.SetupGet(m => m[It.Is<string>(s => s == "validIssuer")]).Returns("https://localhost:7256/");
            mockConfSection.SetupGet(m => m[It.Is<string>(s => s == "validAudience")]).Returns("https://localhost:7256/");
            mockConfSection.SetupGet(m => m[It.Is<string>(s => s == "secret")]).Returns("WXJSAMFKLSTEHSYOV");
            mockConfSection.SetupGet(m => m[It.Is<string>(s => s == "expiresIn")]).Returns("10");
            
            var mockConfiguration = new Mock<IConfiguration>();
            mockConfiguration.Setup(a => a.GetSection(It.Is<string>(s => s == "JwtConfig"))).Returns(mockConfSection.Object);

            return mockConfiguration.Object;
        }
    }
}


//"JwtConfig": {
//    "validIssuer": "https://localhost:7256/",
//    "validAudience": "https://localhost:7256/",
//    "secret": "WXJSAMFKLSTEHSYOV",
//    "expiresIn": 10
//  },
