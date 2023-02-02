using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Customer
    {
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
