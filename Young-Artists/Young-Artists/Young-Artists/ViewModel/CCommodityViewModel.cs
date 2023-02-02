using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Young_Artists.Models;

namespace Young_Artists.ViewModel
{
    public class CCommodityViewModel
    {
        private Commodity _commodity;

        public Commodity Commodity
        {
            get { return _commodity; }
            set { _commodity = value; }
        }
        public CCommodityViewModel()
        {
            _commodity = new Commodity();
        }
        [DisplayName("商品編號 ")]
        public int Id 
        { 
            get { return _commodity.Id;}
            set { _commodity.Id = value;}
        }
        ///^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[`~!@#$%^&*()_\-+=<>.?:"{}].*).{6,20}$/
        //@"/^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[`~!@#$%^&*()_\-+=<>.?:""{}].*).$/"
        //[RegularExpression(@"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[`~!@#$%^&*()_\-+=<>.?:""{}].*)$", ErrorMessage = "必須包含英數字、特殊字元")]
        [DisplayName("商品名稱 ")]
        public string? CommodityName {
            get { return _commodity.CommodityName; }
            set { _commodity.CommodityName = value; }
        }

        [DisplayName("商品敘述 ")]
        public string? CommodityNarrative {
            get { return _commodity.CommodityNarrative; }
            set { _commodity.CommodityNarrative = value; }
        }

        [DisplayName("商品庫存 ")]
        public int? CommodityNum {
            get { return _commodity.CommodityNum; }
            set { _commodity.CommodityNum = value; }
        }

        [DisplayName("商品價格 ")]
        public decimal? CommodityPrice {
            get { return _commodity.CommodityPrice; }
            set { _commodity.CommodityPrice = value; }
        }

        [DisplayName("商品圖片 ")]
        public string? CommodityImage {
            get { return _commodity.CommodityImage; }
            set { _commodity.CommodityImage = value; }
        }

        [DisplayName("商品上架時間 ")]
        public string? CommodityStart {
            get { return _commodity.CommodityStart; }
            set { _commodity.CommodityStart = value; }
        }

        [DisplayName("商品分類 ")]
        public string? CommodityClassification {
            get { return _commodity.CommodityClassification; }
            set { _commodity.CommodityClassification = value; }
        }

        [DisplayName("商品上下架 ")]
        public bool? CommodityState {
            get { return _commodity.CommodityState; }
            set { _commodity.CommodityState = value; }
        }
        public IFormFile photo{get;set;}
    }
}
