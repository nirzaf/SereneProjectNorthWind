using Serenity.Services;

namespace SereneTemplate.Administration
{
    public class UserRoleListRequest : ServiceRequest
    {
        public int? UserID { get; set; }
    }
}