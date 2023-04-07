using System.ComponentModel;

namespace Young_Artists.ViewModels
{
	public class TicketOrderKeywordViewModel
	{
		public string txtTicketOrderKeyword { get; set; }

		public int Id { get; set; }
		[DisplayName("訂單id")]
		public int? OrderId { get; set; }
		[DisplayName("訂單總金額")]
		public decimal? OrderTotalPrice { get; set; }
		[DisplayName("訂單建立時間")]
		public string? OrderCreateTimestamp { get; set; }
		[DisplayName("訂單修改時間")]
		public string? OrderUpdateTimestamp { get; set; }
		[DisplayName("訂單最後修改人id")]
		public int? OrderUpdateId { get; set; }
		[DisplayName("訂單狀態")]
		public int? OrderState { get; set; }
		[DisplayName("活動id")]
		public int? EventId { get; set; }
		[DisplayName("座位分區")]
		public string? Area { get; set; }
		[DisplayName("座位id")]
		public int? SeatId { get; set; }
		[DisplayName("會員id")]
        public int? CustomerId { get; set; }
    }
}
