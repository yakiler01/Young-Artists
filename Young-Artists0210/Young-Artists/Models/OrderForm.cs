using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public partial class OrderForm
    {
        public int Id { get; set; }

        [DisplayName("顧客ID")]
        public int? NumberId { get; set; }

        [DisplayName("商品ID")]
        public int? CommodityId { get; set; }
        [DisplayName("訂單時間")]
        public string? OrderTime { get; set; }
        [DisplayName("訂購數量")]
        public int? QuantityOrder { get; set; }
        [DisplayName("訂單狀態")]
        public bool? IsState { get; set; }
        [DisplayName("購物車狀態")]
        public bool? IsCart { get; set; }
    }
}
