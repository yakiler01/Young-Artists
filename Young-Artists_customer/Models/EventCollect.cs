using System;
using System.Collections.Generic;

namespace Young_Artists_Customers.Models
{
    public partial class EventCollect
    {
        public int Id { get; set; }
        public int? EventId { get; set; }
        public int? CustomerId { get; set; }
    }
}
