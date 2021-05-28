﻿using Serenity.ComponentModel;
using System;

namespace SereneTemplate.Northwind.Forms
{
    [FormScript("Northwind.Supplier")]
    [BasedOnRow(typeof(Entities.SupplierRow), CheckNames = true)]
    public class SupplierForm
    {
        public String CompanyName { get; set; }
        public String ContactName { get; set; }
        public String ContactTitle { get; set; }
        public String Address { get; set; }
        public String Region { get; set; }
        public String PostalCode { get; set; }
        public String Country { get; set; }
        public String City { get; set; }
        public String Phone { get; set; }
        public String Fax { get; set; }
        public String HomePage { get; set; }
    }
}