using System.ComponentModel.DataAnnotations;

namespace CalorieTracker.Core.Dtos;
public class ReportSummaryDto
{
   public int EntriesLastWeek { get; set; }
   public int EntriesWeekBeforeLastWeek { get; set; }
   public decimal AverageCalroies { get; set; }
}
