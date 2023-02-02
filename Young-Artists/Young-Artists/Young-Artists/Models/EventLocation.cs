using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class EventLocation
    {
        public int EventLocationId { get; set; }
        public string? EventLocationName { get; set; }
        public string? EventLocationInfo { get; set; }
        public string? EventLocationAddress { get; set; }
        public bool? EventLocationIsstate { get; set; }
    }
}
