using Serenity.Services;
using System;

namespace SereneTemplate.BasicSamples
{
    public class CustomerGrossSalesListRequest : ListRequest
    {
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}