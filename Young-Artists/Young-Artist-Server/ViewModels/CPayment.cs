﻿namespace Young_Artist_Server.ViewModels
{
	public class CPayment
	{
		public string OrderId { get; set; }
		//public string ChannelID { get; set; }
		//public string MerchantID { get; set; }
		//public string MerchantOrderNo { get; set; }
		public string ItemDesc { get; set; }
		public string Amt { get; set; }
		//public string ExpireDate { get; set; }
		//public string ReturnURL { get; set; }
		//public string CustomerURL { get; set; }
		//public string NotifyURL { get; set; }
		//public string ClientBackURL { get; set; }
		public string Email { get; set; }
        public int eventId { get; set; }
        //public string PayOption { get; set; }
    }
}
