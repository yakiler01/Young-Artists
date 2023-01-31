using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists_Customers.Models
{
    public partial class Administrator
    {
        public int AdministratorId { get; set; }
        [DisplayName("管理員帳號")]
        public string? AdministratorAccount { get; set; }
        [DisplayName("管理員密碼")]
        public string? AdministratorPassword { get; set; }
        [DisplayName("資料建立時間")]
        public string? AdministratorCreatTimestamp { get; set; }
        [DisplayName("資料更新時間")]
        public string? AdministratorUpdateTimestamp { get; set; }
    }
}
