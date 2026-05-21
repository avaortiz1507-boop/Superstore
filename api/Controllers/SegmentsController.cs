using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SegmentsController : ControllerBase
{
    private readonly IDatabaseService _db;

    public SegmentsController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllSegments")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllSegments");
            List<Segment> segments = rows.Select(MapToSegment).ToList();

            return Ok(segments);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static Segment MapToSegment(Dictionary<string,object?> row) => new Segment
    {
        SegmentID = Convert.ToInt32(row["SegmentID"]),
        SegmentName = Convert.ToString(row["Segment"])?? string.Empty,
      
    };
  }
