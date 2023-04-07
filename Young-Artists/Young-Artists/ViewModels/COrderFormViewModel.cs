using System.ComponentModel;
using Young_Artists.Models;

namespace Young_Artists.ViewModel
{
    public class COrderFormViewModel
    {
        private OrderForm _OrderForm;
       /* private Commodity _Commodity;*/
        public OrderForm OrderForm { get { return _OrderForm; } 
                                     set { _OrderForm = value; }            
        }
        //public Commodity Commodity
        //{
        //    get { return _Commodity; }
        //    set { _Commodity = value; }
        //}
        public COrderFormViewModel()
        {
            _OrderForm = new OrderForm();
           // _Commodity = new Commodity();
        }


        public int Id
        {
            get { return _OrderForm.Id; }
            set { _OrderForm.Id = value; }
        }
       // public int Id { get; set; }
        [DisplayName("顧客ID ")]
        public int? NumberId
        {
            get { return _OrderForm.NumberId; }
            set { _OrderForm.NumberId = value; }
        }
        [DisplayName("商品ID ")]
        public int? CommodityId
        {
            get { return _OrderForm.CommodityId; }
            set { _OrderForm.CommodityId = value; }
        }
        [DisplayName("訂單時間 ")]
        public string? OrderTime
        {
            get { return _OrderForm.OrderTime; }
            set { _OrderForm.OrderTime = value; }
        }
        [DisplayName("訂單數量 ")]
        public int? QuantityOrder
        {
            get { return _OrderForm.QuantityOrder; }
            set { _OrderForm.QuantityOrder = value; }
        }
        [DisplayName("產品價格 ")]
        //public decimal? CommodityPrice
        //{
        //    get { return _Commodity.CommodityPrice; }
        //    set { _Commodity.CommodityPrice = value; }
        //}
        public decimal? CommdityPrice { get; set; }

        [DisplayName("商品上下架 ")]
        public bool? IsState
        {
            get { return _OrderForm.IsState; }
            set { _OrderForm.IsState = value; }
        }
        [DisplayName("商品名稱 ")]
        public string? CommodityName
        {
            get; set;
        }
        [DisplayName("商品名稱 ")]
        public string? CustomerName
        {
            get; set;
        }
        public int txtKeyword { get; set; }
        public int num
        {
            get { return (int)(_OrderForm.QuantityOrder*CommdityPrice); }
        }

    }
}
