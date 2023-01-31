using System;
using System.Collections.Generic;

namespace Young_Artists.Models
{
    public partial class Administrator
    {
        public int AdministratorId { get; set; }
        public string? AdministratorAccount { get; set; }
        public string? AdministratorPassword { get; set; }
        public string? AdministratorCreatTimestamp { get; set; }
        public string? AdministratorUpdateTimestamp { get; set; }
    }
}
