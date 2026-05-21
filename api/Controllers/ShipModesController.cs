using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ShipModesController : ControllerBase
{
    private readonly IDatabaseService _db;

    public ShipModesController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllShipModes")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllShipModes");
            List<ShipMode> shipModes = rows.Select(MapToShipMode).ToList();

            return Ok(shipModes);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static ShipMode MapToShipMode(Dictionary<string,object?> row) => new ShipMode
    {
        ShipModeID = Convert.ToInt32(row["ShipModeID"]),
        ShipModeName = Convert.ToString(row["ShipMode"])?? string.Empty,
      
    };
  }
