﻿using Serenity.ComponentModel;
using System;
using System.ComponentModel;

namespace SereneTemplate.Northwind.Columns
{
    [ColumnsScript("Northwind.Product")]
    [BasedOnRow(typeof(Entities.ProductRow), CheckNames = true)]
    public class ProductColumns
    {
        [EditLink, DisplayName("Db.Shared.RecordId"), AlignRight]
        public String ProductID { get; set; }
        [EditLink, Width(250)]
        public String ProductName { get; set; }
        [QuickFilter]
        public Boolean Discontinued { get; set; }
        [EditLink(ItemType = "Northwind.Supplier"), QuickFilter]
        public String SupplierCompanyName { get; set; }
        [EditLink(ItemType = "Northwind.Category"), Width(150), QuickFilter, QuickFilterOption("multiple", true)]
        public String CategoryName { get; set; }
        [Width(130)]
        public String QuantityPerUnit { get; set; }
        [Width(80), AlignRight]
        public Decimal UnitPrice { get; set; }
        [Width(80), AlignRight]
        public Int16 UnitsInStock { get; set; }
        [Width(80), AlignRight]
        public Int16 UnitsOnOrder { get; set; }
        [Width(80), AlignRight]
        public Int16 ReorderLevel { get; set; }
    }
}