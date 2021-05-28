using Serenity.Services;

namespace SereneTemplate.Northwind
{
    public class OrderListRequest : ListRequest
    {
        public int? ProductID { get; set; }
    }
}