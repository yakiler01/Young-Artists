using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class SeatState
    {
        public int Id { get; set; }
        public string? EventId { get; set; }
        public int? SeatTypeId { get; set; }
        public int? SeatCount { get; set; }
    }
}
