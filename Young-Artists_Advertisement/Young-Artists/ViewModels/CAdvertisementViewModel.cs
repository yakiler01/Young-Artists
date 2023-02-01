using System.ComponentModel.DataAnnotations;
using Young_Artists.Models;
using System.ComponentModel;

namespace Young_Artists.ViewModels
{
    public class CAdvertisementViewModel
    {
        private Advertisement _advertisement;

        public Advertisement advertisement { get { return _advertisement; } set { _advertisement = value; } }
        public CAdvertisementViewModel()
        {
            _advertisement = new Advertisement();
        }
       
        public int Id { get { return _advertisement.Id; } set { _advertisement.Id = value; } }
       
        [DisplayName("廣告代碼")]
        public int? AdvertisementId { get {return _advertisement.AdvertisementId; } set {_advertisement.AdvertisementId=value; } }

        [DisplayName("廣告名稱")]
        public string? AdvertisementName { get { return _advertisement.AdvertisementName; } set { _advertisement.AdvertisementName = value; } }

        [DisplayName("圖片來源")]
        public string? AdvertisementSrc { get { return _advertisement.AdvertisementSrc; } set { _advertisement.AdvertisementSrc = value; } }

        [DisplayName("廣告說明文字")]
        public string? AdvertisementAlt { get { return _advertisement.AdvertisementAlt; } set { _advertisement.AdvertisementAlt = value; } }

        [DisplayName("點擊連結")]
        public string? AdvertisementHref { get { return _advertisement.AdvertisementHref; } set { _advertisement.AdvertisementHref = value; } }

        [DisplayName("輪播起始日")]
        public string? AdvertisementStartdate { get { return _advertisement.AdvertisementStartdate; } set { _advertisement.AdvertisementStartdate = value; } }

        [DisplayName("廣告輪結束日")]
        public string? AdvertisementEnddate { get { return _advertisement.AdvertisementEnddate; } set { _advertisement.AdvertisementEnddate = value; } }

        [DisplayName("廠商ID")]
        public int? CompanyId { get { return _advertisement.CompanyId; } set { _advertisement.CompanyId = value; } }

        [DisplayName("活動ID")]
        public int? EventId { get { return _advertisement.EventId; } set { _advertisement.EventId = value; } }

        [DisplayName("上下架")]
        public bool? AdvertisementOnline { get { return _advertisement.AdvertisementOnline; } set { _advertisement.AdvertisementOnline = value; } }

        //廣告圖片
        public IFormFile photo { get; set; }
    }

}

    

