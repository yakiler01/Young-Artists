using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Company
    {
        public int Id { get; set; }
        public string? CompanyId { get; set; }
        public string? CompanyName { get; set; }
        public string? CompanyPhone { get; set; }
        public string? CompanyAddress { get; set; }
        public string? CompanyEmail { get; set; }
        public bool? CompanyOnline { get; set; }
    }
}
