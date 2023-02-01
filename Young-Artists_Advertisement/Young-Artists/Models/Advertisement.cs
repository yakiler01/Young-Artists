﻿using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class Advertisement
    {
        public int Id { get; set; }

   
        public int? AdvertisementId { get; set; }

     
        public string? AdvertisementName { get; set; }

       
        public string? AdvertisementSrc { get; set; }

        public string? AdvertisementAlt { get; set; }

        public string? AdvertisementHref { get; set; }

        public string? AdvertisementStartdate { get; set; }

        public string? AdvertisementEnddate { get; set; }

        public int? CompanyId { get; set; }

        public int? EventId { get; set; }

        public bool? AdvertisementOnline { get; set; }
    }
}
