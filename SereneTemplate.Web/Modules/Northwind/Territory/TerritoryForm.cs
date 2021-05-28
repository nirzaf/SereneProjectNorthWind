﻿using Serenity.ComponentModel;
using System;

namespace SereneTemplate.Northwind.Forms
{
    [FormScript("Northwind.Territory")]
    [BasedOnRow(typeof(Entities.TerritoryRow), CheckNames = true)]
    public class TerritoryForm
    {
        public String TerritoryID { get; set; }
        public String TerritoryDescription { get; set; }
        [LookupEditor(typeof(Entities.RegionRow))]
        public Int32 RegionID { get; set; }
    }
}