using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Event
    {
        public int EventId { get; set; }
        public string? EventImage { get; set; }
        public int? CompanyId { get; set; }
        public string? EventSellStart { get; set; }
        public string? EventSellEnd { get; set; }
        public string? EventStart { get; set; }
        public string? EventEnd { get; set; }
        public string? EventTypeId { get; set; }
        public string? EventLocationId { get; set; }
        public bool? EventIsstate { get; set; }
    }
}
