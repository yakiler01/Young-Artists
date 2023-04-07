namespace Young_Artist_Server.ViewModels
{
    public class OrderFormCommodity
    {
        public int? Id { get; set; }
        public int? NumberId { get; set; }
        public int? CommodityId { get; set; }
        public string? OrderTime { get; set; }
        public int? QuantityOrder { get; set; }
        public bool? IsState { get; set; }
        public bool? IsCart { get; set; }

        public int? CommodityNum { get; set; }
        public decimal? CommodityPrice { get; set; }

        public string? CommodityName { get; set; }

        public string? CommodityImage { get; set; }
    }
}
