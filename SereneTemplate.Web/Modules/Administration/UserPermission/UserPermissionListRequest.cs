﻿using Serenity.Services;

namespace SereneTemplate.Administration
{
    public class UserPermissionListRequest : ServiceRequest
    {
        public int? UserID { get; set; }
        public string Module { get; set; }
        public string Submodule { get; set; }
    }
}