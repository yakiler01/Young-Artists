﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Young_Artist_Server.Models
{
    public partial class OrderForm
    {
        public int Id { get; set; }
        public int? NumberId { get; set; }
        public int? CommodityId { get; set; }
        public string OrderTime { get; set; }
        public int? QuantityOrder { get; set; }
        public bool? IsState { get; set; }
    }
}