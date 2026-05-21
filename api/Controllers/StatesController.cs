using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class StatesController : ControllerBase
{
    private readonly IDatabaseService _db;

    public StatesController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllStates")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllStates");
            List<State> states = rows.Select(MapToState).ToList();

            return Ok(states);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static State MapToState(Dictionary<string,object?> row) => new State
    {
        StateID = Convert.ToInt32(row["StateID"]),
        StateName = Convert.ToString(row["State"])?? string.Empty,
        Latitude= Convert.ToDecimal(row["Latitude"]),
        Longitude= Convert.ToDecimal(row["Longitude"]),
        Name = Convert.ToString(row["Name"])?? string.Empty,
       
      
    };
  }