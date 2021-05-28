﻿using SereneTemplate.Northwind.Entities;
using Serenity.ComponentModel;
using Serenity.Data;
using Serenity.Web;

namespace SereneTemplate.Northwind.Lookups
{
    [LookupScript]
    public class CustomerCityLookup : RowLookupScript<Entities.CustomerRow>
    {
        public CustomerCityLookup(ISqlConnections sqlConnections)
            : base(sqlConnections)
        {
            IdField = TextField = CustomerRow.Fields.City.PropertyName;
        }

        protected override void PrepareQuery(SqlQuery query)
        {
            var fld = Entities.CustomerRow.Fields;
            query.Distinct(true)
                .Select(fld.Country)
                .Select(fld.City)
                .Where(
                    new Criteria(fld.Country) != "" &
                    new Criteria(fld.Country).IsNotNull() &
                    new Criteria(fld.City) != "" &
                    new Criteria(fld.City).IsNotNull());
        }

        protected override void ApplyOrder(SqlQuery query)
        {
        }
    }
}