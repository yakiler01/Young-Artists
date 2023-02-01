using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Order
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public string? OrderCreatTimestamp { get; set; }
        public string? OrderUpdateTimestamp { get; set; }
        public int? OrderUpdateId { get; set; }
        public int? OrderState { get; set; }
    }
}
