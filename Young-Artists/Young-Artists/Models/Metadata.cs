using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Young_Artists.Models
{
    public class CustomerMetadata
    {

        public int CustomerId { get; set; }
        [DisplayName("姓名")]
        [Required(ErrorMessage = "姓名不可空白")]
        public string? CustomerName { get; set; }
        [DisplayName("電子郵件")]
        [EmailAddress]
        [Required(ErrorMessage = "Email不可空白")]
        public string? CustomerEmail { get; set; }
        //[StringLength(10, ErrorMessage = "請輸入6~10個字元", MinimumLength = 6)]
        [RegularExpression(@"^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[`~!@#$%^&*()_\-+=<>.?:""{}].*).{6,20}$", ErrorMessage = "必須包含英數字、特殊字元")]
        //[Required(ErrorMessage = "密碼不可空白")]
        [DataType(DataType.Password)]
        [PasswordPropertyText]
        [DisplayName("密碼")]
        public string? CustomerPassword { get; set; }
        [DisplayName("手機號碼")]
        [Phone]
        [StringLength(12, ErrorMessage = "請輸入正確手機號碼", MinimumLength = 12)]
        [Required(ErrorMessage = "手機號碼不可空白")]
        public string? CustomerPhone { get; set; }
        [DisplayName("居住區域")]
        [Required(ErrorMessage = "請選擇居住區域")]
        public string? CustomerRegion { get; set; }
        [DisplayName("詳細地址")]
        [Required(ErrorMessage = "地址不可空白")]
        public string? CustomerAddress { get; set; }
        [DisplayName("生日")]
        [DataType(DataType.Date)]
        //string date = DateTime.Today.ToString();
        //[Range(typeof(DateTime), "1900-01-01", date,
        //ErrorMessage = "Value for {0} must be between {1} and {2}")]
        [Required(ErrorMessage = "請選擇生日日期")]
        public string? CustomerBirthDate { get; set; }
        [DisplayName("性別")]
        [Required(ErrorMessage = "請選擇性別")]
        public string? CustomerGender { get; set; }
        [DisplayName("資料建立時間")]
        public string? CustomerCreatTimestamp { get; set; }
        [DisplayName("資料更新時間")]
        public string? CustomerUpdateTimestamp { get; set; }
    }

    public class AdministratorMetadata
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
    public class AdvertisementMetadata
    {
        public int Id { get; set; }

        public int? AdvertisementId { get; set; }


        public string? AdvertisementName { get; set; }

        public string? AdvertisementSrc { get; set; }

        public string? AdvertisementAlt { get; set; }

        public string? AdvertisementHref { get; set; }

        public string? AdvertisementStartdate { get; set; }

        public string? AdvertisementEnddate { get; set; }

        public int? CompanyId { get; set; }

        public int? EventId { get; set; }

        public bool? AdvertisementOnline { get; set; }
    }
    public partial class CompanyMetadata
    {
        public int Id { get; set; }

        [DisplayName("廠商ID")]
        public int? CompanyId { get; set; }

        [DisplayName("廠商名稱")]
        public string? CompanyName { get; set; }

        [DisplayName("電話")]
        public string? CompanyPhone { get; set; }

        [DisplayName("地址")]
        public string? CompanyAddress { get; set; }

        [DisplayName("電子信箱")]
        public string? CompanyEmail { get; set; }

        [DisplayName("往來狀態")]
        public bool? CompanyOnline { get; set; }
    }
    public partial class ContactPersonMetadata
    {

        public int Id { get; set; }

        [DisplayName("姓名")]
        public string? ContactpersonName { get; set; }

        [DisplayName("職稱")]
        public string? ContactpersonTitle { get; set; }


        [DisplayName("電話")]
        public string? ContactpersonPhone { get; set; }


        [DisplayName("電子郵件")]
        public string? ContactpersonEmail { get; set; }


        [DisplayName("廠商ID")]
        public int? CompanyId { get; set; }


        [DisplayName("往來狀態")]
        public bool? ContactpersonOnline { get; set; }
    }
    public class EventMetadata
    {
        public int EventId { get; set; }
        [DisplayName("活動名稱")]
        public string? EventName { get; set; }
        [DisplayName("活動資訊")]
        public string? EventInfo { get; set; }
        [DisplayName("廠商id")]
        public int? CompanyId { get; set; }
        [DisplayName("開始售票時間")]
        public string? EventSellStartTimestamp { get; set; }
        [DisplayName("結束售票時間")]
        public string? EventSellEndTimestamp { get; set; }

        [DisplayName("活動開始時間")]
        public string? EventStartTimestamp { get; set; }
        [DisplayName("活動結束時間")]
        public string? EventEndTimestamp { get; set; }
        [DisplayName("活動種類id")]
        public int? EventTypeId { get; set; }
        [DisplayName("活動位置id")]
        public int? EventLocationId { get; set; }
        [DisplayName("活動上下架狀態")]
        public bool? EventIsstate { get; set; }

        [DisplayName("活動圖片")]
        public string? EventImage { get; set; }
        public IFormFile photo { get; set; }

    }
    public class EventLocationMetadata
    {

        public int EventLocationId { get; set; }
        [DisplayName("活動地點名稱")]
        public string? EventLocationName { get; set; }
        [DisplayName("活動地點資訊")]
        public string? EventLocationInfo { get; set; }
        [DisplayName("活動地點地址")]
        public string? EventLocationAddress { get; set; }
        [DisplayName("活動地點上下架狀態")]
        public bool? EventLocationIsstate { get; set; }

        [DisplayName("活動地點圖片")]
        public string? EventLocationImage { get; set; }
        public IFormFile photo { get; set; }

    }
    public class EventTypeMetadata
    {
        [DisplayName("活動種類ID")]
        public int EventTypeId { get; set; }
        [DisplayName("活動種類名稱")]
        public string? EventTypeName { get; set; }

    }
    public class SeatStockMetadata
    {
        public int Id { get; set; }
        [Display(Name = "活動id")]
        public int EventId { get; set; }
        [Display(Name = "座位分區")]
        public string? Area { get; set; }
        [Display(Name = "數量")]
        public int? Quantity { get; set; }
        [Display(Name = "座位庫存")]
        public int? Stock { get; set; }
        [Display(Name = "販售數量")]
        public int? Sold { get; set; }
        [Display(Name = "座位價錢")]
        public decimal? Price { get; set; }
        [Display(Name = "座位是否能購買")]
        public bool? IsAvailable { get; set; }

    }
    public class TicketOrderMetadata
    {
        public int Id { get; set; }
        [Display(Name = "訂單id")]
        public int? OrderId { get; set; }
        [Display(Name = "訂單總金額")]
        public decimal? OrderTotalPrice { get; set; }
        [Display(Name = "訂單建立時間")]
        public string? OrderCreateTimestamp { get; set; }
        [Display(Name = "訂單修改時間")]
        public string? OrderUpdateTimestamp { get; set; }
        [Display(Name = "訂單最後修改人id")]
        public int? OrderUpdateId { get; set; }
        [Display(Name = "訂單狀態")]
        public int? OrderState { get; set; }
        [DisplayName("會員id")]
        public int? CustomerId { get; set; }

    }
    public class TicketOrderDetailMetadata
    {
        public int Id { get; set; }
        [Display(Name = "訂單id")]
        public int? OrderId { get; set; }
        [Display(Name = "活動id")]
        public int? EventId { get; set; }
        [Display(Name = "座位分區")]
        public string? Area { get; set; }
        [Display(Name = "座位id")]
        public int? SeatId { get; set; }
        [Display(Name = "會員id")]
        public int? CustomerId { get; set; }

    }
}
