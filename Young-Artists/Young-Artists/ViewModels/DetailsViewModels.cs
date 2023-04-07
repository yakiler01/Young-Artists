using System.ComponentModel;

namespace Young_Artists.ViewModels
{
    public class DetailsViewModels
    {
        public int DetailsId { get; set; }
        [DisplayName("原活動時間")]
        public string Eventtime { get; set; }
        public int? EventId { get; set; }
        [DisplayName("現在狀態")]
        public string State { get; set; }
        [DisplayName("詳細資訊")]
        public string Reason { get; set; }
        public string EventImage { get; set; }
        public string EventName { get; set; }
        [DisplayName("活動名稱")]
        public string EventInfo { get; set; }
        public int? CompanyId { get; set; }
        public string EventSellStartTimestamp { get; set; }
        public string EventSellEndTimestamp { get; set; }
        public string EventStartTimestamp { get; set; }
        public string EventEndTimestamp { get; set; }
        public int? EventTypeId { get; set; }
        public int? EventLocationId { get; set; }
        public bool? EventIsstate { get; set; }
    }
}
