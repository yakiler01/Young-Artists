using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;


namespace Young_Artists.Models
{
    [ModelMetadataTypeAttribute(typeof(AdvertisementMetadata))]
    public partial class Advertisement
    {
    }

    [ModelMetadataTypeAttribute(typeof(CompanyMetadata))]
    public partial class Company
    {

    }
    [ModelMetadataTypeAttribute(typeof(ContactPersonMetadata))]
    public partial class ContactPerson
    {

    }
}
