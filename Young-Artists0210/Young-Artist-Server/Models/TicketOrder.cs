﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Young_Artist_Server.Models
{
    public partial class TicketOrder
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public decimal? OrderTotalPrice { get; set; }
        public string OrderCreateTimestamp { get; set; }
        public string OrderUpdateTimestamp { get; set; }
        public int? OrderUpdateId { get; set; }
        public int? OrderState { get; set; }
        public int? CustomerId { get; set; }
    }
}