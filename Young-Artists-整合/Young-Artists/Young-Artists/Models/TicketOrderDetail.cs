using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class TicketOrderDetail
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public int? EventId { get; set; }
        public string? Area { get; set; }
        public int? SeatId { get; set; }
        public int? CustomerId { get; set; }
    }
}
