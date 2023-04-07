using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class Advertisement
    {
        public int Id { get; set; }

        [DisplayName("廣告代碼")]
        public int? AdvertisementId { get; set; }

        [DisplayName("廣告名稱")]
        public string? AdvertisementName { get; set; }


        [DisplayName("圖片來源")]
        public string? AdvertisementSrc { get; set; }
        [DisplayName("廣告說明文字")]
        public string? AdvertisementAlt { get; set; }
        [DisplayName("點擊連結")]
        public string? AdvertisementHref { get; set; }
        [DisplayName("輪播起始日")]
        public string? AdvertisementStartdate { get; set; }
        [DisplayName("廣告輪結束日")]
        public string? AdvertisementEnddate { get; set; }

        [DisplayName("廠商ID")]
        public int? CompanyId { get; set; }
        [DisplayName("活動ID")]
        public int? EventId { get; set; }
        [DisplayName("上下架")]
        public bool? AdvertisementOnline { get; set; }
    }
}
