using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AddressesController : ControllerBase
{
  [HttpGet(Name = "GetAddresses")]
    public IActionResult Get()
    {
        return Ok(new List<Address>
        {
           new Address
            {
                AddressID = 1,
                AddressLine1 = "123 Main St",
                City = "Anytown",
                StateID = 1,
                State = "StateName",
                PostalCode = 12345,
                CountryID = 1,
                Country = "CountryName",
                RegionID = 1,
                Region = "RegionName",
                AddressTypeID = 1,
                AddressType = "Home",
                CustomerID = 1
            },
            new Address
            {
                AddressID = 2,
                AddressLine1 = "456 Elm St",
                City = "Othertown",
                StateID = 2,
                State = "StateName2",
                PostalCode = 67890,
                CountryID = 2,
                Country = "CountryName2",
                RegionID = 2,
                Region = "RegionName2",
                AddressTypeID = 2,
                AddressType = "Work",
                CustomerID = 2
            }
        });
    }
}
  