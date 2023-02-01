using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class OrderDetail
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public int? EvnetId { get; set; }
        public int? SeatId { get; set; }
        public int? CustomerId { get; set; }
    }
}
