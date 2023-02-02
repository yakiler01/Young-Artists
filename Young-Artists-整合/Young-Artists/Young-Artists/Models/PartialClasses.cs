using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Young_Artists.Models
{
    [ModelMetadataTypeAttribute(typeof(CustomerMetadata))]
    public partial class Customer
    {
    }

    [ModelMetadataTypeAttribute(typeof(AdministratorMetadata))]
    public partial class Administrator
    {
    }
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
    [ModelMetadataTypeAttribute(typeof(EventMetadata))]
    public partial class Event
    {
    }
    [ModelMetadataTypeAttribute(typeof(EventLocationMetadata))]
    public partial class EventLocation
    {
    }
    [ModelMetadataTypeAttribute(typeof(EventTypeMetadata))]
    public partial class EventType
    {
    }
    [ModelMetadataTypeAttribute(typeof(TicketOrderMetadata))]
    public partial class TicketOrder
    {
    }
    [ModelMetadataTypeAttribute(typeof(TicketOrderDetailMetadata))]
    public partial class TicketOrderDetail
    {
    }
    [ModelMetadataTypeAttribute(typeof(SeatStockMetadata))]
    public partial class SeatStock
    {
    }
}
