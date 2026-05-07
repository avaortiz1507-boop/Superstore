using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IDatabaseService _db;

    public ProductsController(IDatabaseService db)
    {
        _db = db;
    }

    [HttpGet(Name = "GetAllProducts")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetAllProducts");

            List<Product> products = rows.Select(MapToProduct).ToList();
            return Ok(products);
        }
        catch
        {
            return StatusCode(500, "An error occurred while processing your request.");
        }
    }

    private static Product MapToProduct(Dictionary<string,object?> row) => new Product
    {
        ProductID = Convert.ToInt32(row["ProductID"]),
        ProductName = Convert.ToString(row["ProductName"])?? string.Empty,
        CategoryID = Convert.ToInt32(row["CategoryID"]),
        SubCategoryID = Convert.ToInt32(row["SubCategoryID"]),
        Category = Convert.ToString(row["Category"]) ?? string.Empty,
        SubCategory = Convert.ToString(row["SubCategory"]) ?? string.Empty,
        UnitPrice = Convert.ToDecimal(row["UnitPrice"]),
        Quantity = Convert.ToInt32(row["Quantity"])
    };
}