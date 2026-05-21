using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RegionsController : ControllerBase
{
    private readonly IDatabaseService _db;

    public RegionsController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllRegions")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllRegions");
            List<Region> regions = rows.Select(MapToRegion).ToList();

            return Ok(regions);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static Region MapToRegion(Dictionary<string,object?> row) => new Region
    {
        RegionID = Convert.ToInt32(row["RegionID"]),
        RegionName = Convert.ToString(row["Region"])?? string.Empty,
      
    };
  }
