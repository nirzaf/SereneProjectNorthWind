﻿using Serenity.ComponentModel;
using System;
using System.ComponentModel;

namespace SereneTemplate.Northwind.Forms
{
    [ColumnsScript("Northwind.Territory")]
    [BasedOnRow(typeof(Entities.TerritoryRow), CheckNames = true)]
    public class TerritoryColumns
    {
        [EditLink, DisplayName("Db.Shared.RecordId"), Width(100)]
        public Int32 TerritoryID { get; set; }
        [EditLink, Width(200)]
        public String TerritoryDescription { get; set; }
        [EditLink(ItemType = "Northwind.Region", IdField = "RegionID"), Width(150)]
        [LookupEditor(typeof(Entities.RegionRow)), QuickFilter]
        public String RegionDescription { get; set; }
    }
}