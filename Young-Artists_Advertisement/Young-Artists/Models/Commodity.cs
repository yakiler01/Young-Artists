using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Commodity
    {
        public int Id { get; set; }
        public string? CommodityName { get; set; }
        public string? CommodityNarrative { get; set; }
        public int? CommodityNum { get; set; }
        public string? CommodityImage { get; set; }
        public string? CommodityStart { get; set; }
        public string? CommodityClassification { get; set; }
        public bool? CommodityState { get; set; }
    }
}
