using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class OrderMain
    {
        public int Id { get; set; }
        public int? ShoppingId { get; set; }
        public int? OrderForm { get; set; }
        public int? MemberId { get; set; }
    }
}
