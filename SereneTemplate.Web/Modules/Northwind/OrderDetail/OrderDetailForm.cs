﻿using Serenity.ComponentModel;
using System;

namespace SereneTemplate.Northwind.Forms
{
    [FormScript("Northwind.OrderDetail")]
    [BasedOnRow(typeof(Entities.OrderDetailRow), CheckNames = true)]
    public class OrderDetailForm
    {
        public Int32 ProductID { get; set; }
        public Decimal UnitPrice { get; set; }
        public Int32 Quantity { get; set; }
        public Double Discount { get; set; }
    }
}