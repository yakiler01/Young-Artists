namespace Young_Artist_Server.ViewModels
{
    public class EventViewModel
    {
        public int EventId { get; set; }
        public string? EventImage { get; set; }
        public string? EventName { get; set; }
        public string? EventInfo { get; set; }
        public string? EventSellStartTimestamp { get; set; }
        public string? EventSellEndTimestamp { get; set; }
        public string? EventStartTimestamp { get; set; }
        public string? EventEndTimestamp { get; set; } 
        public bool? EventIsstate { get; set; }
        public int? EventTypeId { get; set; }
        public string? EventTypeName { get; set; }
        public int? EventLocationId { get; set; }
        public string? EventLocationName { get; set; }
        public string? EventLocationImage { get; set; }
        public string? EventLocationInfo { get; set; }
        public string? EventLocationAddress { get; set; }
        public int? CompanyId { get; set; }
        public string? CompanyName { get; set; }
    }
}

