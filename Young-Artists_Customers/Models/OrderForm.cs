using System;
using System.Collections.Generic;

namespace Young_Artists_Customers.Models
{
    public partial class OrderForm
    {
        public int Id { get; set; }
        public int? NumberId { get; set; }
        public int? CommodityId { get; set; }
        public string? OrderTime { get; set; }
        public int? QuantityOrder { get; set; }
        public bool? IsState { get; set; }
    }
}
