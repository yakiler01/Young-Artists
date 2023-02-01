using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Young_Artists.Models
{  
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

}

   


