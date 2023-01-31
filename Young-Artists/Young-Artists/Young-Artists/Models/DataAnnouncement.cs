using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class DataAnnouncement
    {
        public int AnnouncementId { get; set; }
        public string? ContentTitle { get; set; }
        public string? Concent { get; set; }
        public string? ContentDatetime { get; set; }
        public string? AnnouncementType { get; set; }
        public string? DetaoledId { get; set; }
    }
}
