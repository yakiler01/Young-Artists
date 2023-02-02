using System;
using System.Collections.Generic;

namespace Young_Artists_Customers.Models
{
    public partial class ContactPerson
    {
        public int Id { get; set; }
        public string? ContactpersonName { get; set; }
        public string? ContactpersonTitle { get; set; }
        public string? ContactpersonPhone { get; set; }
        public string? ContactpersonEmail { get; set; }
        public string? CompanyId { get; set; }
        public bool? ContactpersonOnline { get; set; }
    }
}
