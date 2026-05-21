using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CountriesController : ControllerBase
{
    private readonly IDatabaseService _db;

    public CountriesController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllCountries")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllCountries");
            List<Country> countries = rows.Select(MapToCountry).ToList();

            return Ok(countries);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static Country MapToCountry(Dictionary<string,object?> row) => new Country
    {
        CountryID = Convert.ToInt32(row["CountryID"]),
        CountryName = Convert.ToString(row["Country"])?? string.Empty,
        Latitude= Convert.ToDecimal(row["Latitude"]),
        Longitude= Convert.ToDecimal(row["Longitude"]),
        Name = Convert.ToString(row["Name"])?? string.Empty,
       
      
    };
  }