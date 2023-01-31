using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Young_Artists_Customers.Models
{
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    //[MetadataType(typeof(UserMetadata))]

    public partial class Customer
    {
        
        public int CustomerId { get; set; }
        [DisplayName("姓名")]
        [Required(ErrorMessage ="姓名不可空白")]
        public string? CustomerName { get; set; }
        [DisplayName("電子郵件")]
        [Required(ErrorMessage = "Email格式有誤")]
        public string? CustomerEmail { get; set; }
        [StringLength(6,ErrorMessage = "長度至少為{1}個字元。", MinimumLength =6)]
        [DataType(DataType.Password)]
        [DisplayName("密碼")]
        public string? CustomerPassword { get; set; }
        [DisplayName("電話")]
        public string? CustomerPhone { get; set; }
        [DisplayName("居住區域")]
        public string? CustomerRegion { get; set; }
        [DisplayName("詳細地址")]
        [Required(ErrorMessage = "地址不可空白")]
        public string? CustomerAddress { get; set; }
        [DisplayName("生日")]
        public string? CustomerBirthDate { get; set; }
        [DisplayName("性別")]
        public string? CustomerGender { get; set; }
        [DisplayName("資料建立時間")]
        public string? CustomerCreatTimestamp { get; set; }        
        [DisplayName("資料更新時間")]
        public string? CustomerUpdateTimestamp { get; set; }
    }
}
