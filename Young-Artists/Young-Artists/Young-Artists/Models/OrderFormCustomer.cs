using System;
using System.Collections.Generic;
namespace Young_Artists.Models
{
    public class OrderFormCustomer
    {
        public int Id { get; set; }
        public int? NumberId { get; set; }
        public int? CommodityId { get; set; }
        public string? OrderTime { get; set; }
        public int? QuantityOrder { get; set; }
        public bool? IsState { get; set; }
        public int CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerEmail { get; set; }
        public string? CustomerPassword { get; set; }
        public string? CustomerPhone { get; set; }
        public string? CustomerRegion { get; set; }
        public string? CustomerAddress { get; set; }
        public string? CustomerBirthDate { get; set; }
        public string? CustomerGender { get; set; }
        public string? CustomerCreatTimestamp { get; set; }
        public string? CustomerUpdateTimestamp { get; set; }
    
}
}
