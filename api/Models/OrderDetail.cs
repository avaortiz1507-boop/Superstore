public class OrderDetail
{
  public Order Order { get; set; } = new Order();

  public List<Product> Products { get; set; } = new List<Product>();
}