using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AddressTypesController : ControllerBase
{
    private readonly IDatabaseService _db;

    public AddressTypesController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllAddressTypes")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllAddressTypes");
            List<AddressType> addressTypes = rows.Select(MapToAddressType).ToList();

            return Ok(addressTypes);
        }
        catch(Exception ex)
        {
            return StatusCode(500, $"An error occurred while processing your request. {ex.Message}");
        } 
      }
         private static AddressType MapToAddressType(Dictionary<string,object?> row) => new AddressType
    {
        AddressTypeID = Convert.ToInt32(row["AddressTypeID"]),
        AddressTypeName = Convert.ToString(row["AddressType"])?? string.Empty,
      
    };
  }