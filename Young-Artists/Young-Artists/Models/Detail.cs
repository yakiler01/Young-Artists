using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class Detail
    {
        public int DetailsId{get; set;}
        [DisplayName("原活動時間")]
        public string? Eventtime{get; set;}
        [DisplayName("活動名稱")]
        public int? EventId{get; set;}
        [DisplayName("現在狀態")]
        public string? State{get; set;}
        [DisplayName("詳細資訊")]
        public string? Reason{get; set;}
    }
}
