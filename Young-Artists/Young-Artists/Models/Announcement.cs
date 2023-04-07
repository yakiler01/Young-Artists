using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class Announcement
    {
        public int Aid { get; set; }
        [DisplayName("公告類型")]
        public string? AnnouncementType{ get; set; }
        [DisplayName("公告標題")]
        public string? ContentTitle{ get; set;}
        [DisplayName("公告時間")]
        public string? ContentTime{ get; set;}
        [DisplayName("內容")]
        public string? Content { get; set;}
        [DisplayName("詳細資訊")]
        public string? DetailsId{ get; set;}
    }
}
