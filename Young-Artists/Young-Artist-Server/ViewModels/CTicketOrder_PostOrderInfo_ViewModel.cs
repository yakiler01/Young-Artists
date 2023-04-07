namespace Young_Artists_Server.ViewModels
{
	public class CTicketOrder_PostOrderInfo_ViewModel
	{
		public List<COrderInfoViewModel>? OrderInfo { get; set; }
		public int? OrderPrice { get; set; }
		public int? EventId { get; set;}
		public int? CustomerId { get; set;}
	}
}
