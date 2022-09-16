using System.Text.Json;

namespace CalorieTracker.Core.Models
{
    public class ResponseModel
    {
        public int StatusCode { get; set; }
        public string? Message { get; set; }
        public override string ToString() => JsonSerializer.Serialize(this);
    }
}
