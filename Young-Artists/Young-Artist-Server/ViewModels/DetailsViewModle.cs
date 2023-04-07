namespace Young_Artist_Server.ViewModle
{
    public class DetailsViewModle
    {
        public int DetailsId { get; set; }
        public string Eventtime { get; set; }
        public int? EventId { get; set; }
        public string State { get; set; }
        public string Reason { get; set; }
        public string EventImage { get; set; }
        public string EventName { get; set; }
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
