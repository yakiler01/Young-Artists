using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using Young_Artists.Models;

namespace Young_Artists.ViewModels
{
	public class SeatStockViewModel
	{
		private SeatStock _SeatStock;
		public SeatStockViewModel()
		{
			_SeatStock = new SeatStock();
		}
		public SeatStock st { get { return _SeatStock; } set { _SeatStock = value; } }

		public int Id { get { return _SeatStock.Id; } set { _SeatStock.Id = value; } }
		[Display(Name = "活動id")]
		public int EventId { get { return _SeatStock.EventId; } set { _SeatStock.EventId = value; } }
		[Display(Name = "座位分區")]
		public string? Area { get { return _SeatStock.Area; } set { _SeatStock.Area = value; } }
		[Display(Name = "數量")]
		public int? Quantity { get { return _SeatStock.Quantity; } set { _SeatStock.Quantity = value; } }
		[Display(Name = "座位庫存")]
		public int? Stock { get { return _SeatStock.Stock; } set { _SeatStock.Stock = value; } }
		[Display(Name = "販售數量")]
		public int? Sold { get { return _SeatStock.Sold; } set { _SeatStock.Sold = value; } }
		[Display(Name = "座位價錢")]
		public decimal? Price { get { return _SeatStock.Price; } set { _SeatStock.Price = value; } }
		[Display(Name = "座位是否能購買")]
		public bool? IsAvailable { get { return _SeatStock.IsAvailable; } set { _SeatStock.IsAvailable = value; } }
	}
}
