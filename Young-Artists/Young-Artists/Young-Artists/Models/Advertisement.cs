using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Advertisement
    {
        public int Id { get; set; }
        public int? AdvertisementId { get; set; }
        public int? AdvertisementType { get; set; }
        public string? AdvertisementName { get; set; }
        public string? AdvertisementSrc { get; set; }
        public string? AdvertisementAlt { get; set; }
        public string? AdvertisementHref { get; set; }
        public string? AdvertisementStartdate { get; set; }
        public string? AdvertisementEnddate { get; set; }
        public string? CompanyId { get; set; }
        public string? EventId { get; set; }
        public bool? AdvertisementOnline { get; set; }
    }
}
