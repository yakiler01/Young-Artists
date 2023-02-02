using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class Commodity
    {
        public int Id { get; set; }
        [DisplayName("商品名稱 ")]
        public string? CommodityName { get; set; }
        [DisplayName("商品敘述 ")]
        public string? CommodityNarrative { get; set; }
        [DisplayName("商品庫存 ")]
        public int? CommodityNum { get; set; }
        [DisplayName("商品價格 ")]
        public decimal? CommodityPrice { get; set; }
        [DisplayName("商品圖片 ")]
        public string? CommodityImage { get; set; }
        [DisplayName("商品上架時間 ")]
        public string? CommodityStart { get; set; }
        [DisplayName("商品分類 ")]
        public string? CommodityClassification { get; set; }
        [DisplayName("商品上下架 ")]
        public bool? CommodityState { get; set; }
    }
}
