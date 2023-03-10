using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Young_Artists.Models
{
    public partial class YoungArtistsContext : DbContext
    {
        public YoungArtistsContext()
        {
        }

        public YoungArtistsContext(DbContextOptions<YoungArtistsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Administrator> Administrators { get; set; } = null!;
        public virtual DbSet<Advertisement> Advertisements { get; set; } = null!;
        public virtual DbSet<Announcement> Announcements { get; set; } = null!;
        public virtual DbSet<Commodity> Commodities { get; set; } = null!;
        public virtual DbSet<Company> Companies { get; set; } = null!;
        public virtual DbSet<ContactPerson> ContactPeople { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Detail> Details { get; set; } = null!;
        public virtual DbSet<EvaluationForm> EvaluationForms { get; set; } = null!;
        public virtual DbSet<Event> Events { get; set; } = null!;
        public virtual DbSet<EventCollect> EventCollects { get; set; } = null!;
        public virtual DbSet<EventLocation> EventLocations { get; set; } = null!;
        public virtual DbSet<EventType> EventTypes { get; set; } = null!;
        public virtual DbSet<OrderForm> OrderForms { get; set; } = null!;
        public virtual DbSet<OrderMain> OrderMains { get; set; } = null!;
        public virtual DbSet<Seat> Seats { get; set; } = null!;
        public virtual DbSet<SeatPrice> SeatPrices { get; set; } = null!;
        public virtual DbSet<SeatStock> SeatStocks { get; set; } = null!;
        public virtual DbSet<TicketOrder> TicketOrders { get; set; } = null!;
        public virtual DbSet<TicketOrderDetail> TicketOrderDetails { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=Young-Artists;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Administrator>(entity =>
            {
                entity.ToTable("administrators");

                entity.Property(e => e.AdministratorId).HasColumnName("administrator_id");

                entity.Property(e => e.AdministratorAccount)
                    .HasMaxLength(50)
                    .HasColumnName("administrator_account");

                entity.Property(e => e.AdministratorCreatTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("administrator_creat_timestamp");

                entity.Property(e => e.AdministratorPassword)
                    .HasMaxLength(50)
                    .HasColumnName("administrator_password");

                entity.Property(e => e.AdministratorUpdateTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("administrator_update_timestamp");
            });

            modelBuilder.Entity<Advertisement>(entity =>
            {
                entity.ToTable("advertisement");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AdvertisementAlt)
                    .HasMaxLength(100)
                    .HasColumnName("advertisement_alt")
                    .IsFixedLength();

                entity.Property(e => e.AdvertisementEnddate)
                    .HasMaxLength(50)
                    .HasColumnName("advertisement_enddate");

                entity.Property(e => e.AdvertisementHref)
                    .HasMaxLength(100)
                    .HasColumnName("advertisement_href")
                    .IsFixedLength();

                entity.Property(e => e.AdvertisementId).HasColumnName("advertisement_id");

                entity.Property(e => e.AdvertisementName)
                    .HasMaxLength(50)
                    .HasColumnName("advertisement_name");

                entity.Property(e => e.AdvertisementOnline).HasColumnName("advertisement_online");

                entity.Property(e => e.AdvertisementSrc)
                    .HasMaxLength(100)
                    .HasColumnName("advertisement_src")
                    .IsFixedLength();

                entity.Property(e => e.AdvertisementStartdate)
                    .HasMaxLength(50)
                    .HasColumnName("advertisement_startdate");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.EventId).HasColumnName("event_id");
            });

            modelBuilder.Entity<Announcement>(entity =>
            {
                entity.HasKey(e => e.Aid);

                entity.ToTable("announcement");

                entity.Property(e => e.Aid).HasColumnName("aid");

                entity.Property(e => e.AnnouncementType)
                    .HasMaxLength(20)
                    .HasColumnName("announcement_type");

                entity.Property(e => e.Content)
                    .HasMaxLength(500)
                    .HasColumnName("content");

                entity.Property(e => e.ContentTime)
                    .HasMaxLength(50)
                    .HasColumnName("content_time");

                entity.Property(e => e.ContentTitle)
                    .HasMaxLength(50)
                    .HasColumnName("content_title");

                entity.Property(e => e.DetailsId)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("details_id")
                    .IsFixedLength();
            });

            modelBuilder.Entity<Commodity>(entity =>
            {
                entity.ToTable("commodity");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CommodityClassification)
                    .HasMaxLength(50)
                    .HasColumnName("commodity_Classification");

                entity.Property(e => e.CommodityImage)
                    .HasMaxLength(50)
                    .HasColumnName("commodity_image");

                entity.Property(e => e.CommodityName)
                    .HasMaxLength(50)
                    .HasColumnName("commodity_name");

                entity.Property(e => e.CommodityNarrative)
                    .HasMaxLength(500)
                    .HasColumnName("commodity_narrative");

                entity.Property(e => e.CommodityNum).HasColumnName("commodity_num");

                entity.Property(e => e.CommodityPrice)
                    .HasColumnType("money")
                    .HasColumnName("commodity_price");

                entity.Property(e => e.CommodityStart)
                    .HasMaxLength(50)
                    .HasColumnName("commodity_start");

                entity.Property(e => e.CommodityState).HasColumnName("commodity_state");
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.ToTable("company");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CompanyAddress)
                    .HasMaxLength(50)
                    .HasColumnName("company_address")
                    .IsFixedLength();

                entity.Property(e => e.CompanyEmail)
                    .HasMaxLength(50)
                    .HasColumnName("company_email")
                    .IsFixedLength();

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.CompanyName)
                    .HasMaxLength(50)
                    .HasColumnName("company_name")
                    .IsFixedLength();

                entity.Property(e => e.CompanyOnline).HasColumnName("company_online");

                entity.Property(e => e.CompanyPhone)
                    .HasMaxLength(50)
                    .HasColumnName("company_phone")
                    .IsFixedLength();
            });

            modelBuilder.Entity<ContactPerson>(entity =>
            {
                entity.ToTable("contactPerson");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.ContactpersonEmail)
                    .HasMaxLength(50)
                    .HasColumnName("contactperson_email")
                    .IsFixedLength();

                entity.Property(e => e.ContactpersonName)
                    .HasMaxLength(50)
                    .HasColumnName("contactperson_name")
                    .IsFixedLength();

                entity.Property(e => e.ContactpersonOnline).HasColumnName("contactperson_online");

                entity.Property(e => e.ContactpersonPhone)
                    .HasMaxLength(50)
                    .HasColumnName("contactperson_phone")
                    .IsFixedLength();

                entity.Property(e => e.ContactpersonTitle)
                    .HasMaxLength(50)
                    .HasColumnName("contactperson_title")
                    .IsFixedLength();
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("customers");

                entity.Property(e => e.CustomerId).HasColumnName("customer_id");

                entity.Property(e => e.CustomerAddress)
                    .HasMaxLength(100)
                    .HasColumnName("customer_address");

                entity.Property(e => e.CustomerBirthDate)
                    .HasMaxLength(20)
                    .HasColumnName("customer_birth_date");

                entity.Property(e => e.CustomerCreatTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("customer_creat_timestamp");

                entity.Property(e => e.CustomerEmail)
                    .HasMaxLength(50)
                    .HasColumnName("customer_email");

                entity.Property(e => e.CustomerGender)
                    .HasMaxLength(10)
                    .HasColumnName("customer_gender");

                entity.Property(e => e.CustomerName)
                    .HasMaxLength(50)
                    .HasColumnName("customer_name");

                entity.Property(e => e.CustomerPassword)
                    .HasMaxLength(50)
                    .HasColumnName("customer_password");

                entity.Property(e => e.CustomerPhone)
                    .HasMaxLength(50)
                    .HasColumnName("customer_phone");

                entity.Property(e => e.CustomerRegion)
                    .HasMaxLength(30)
                    .HasColumnName("customer_region");

                entity.Property(e => e.CustomerUpdateTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("customer_update_timestamp");
            });

            modelBuilder.Entity<Detail>(entity =>
            {
                entity.HasKey(e => e.DetailsId);

                entity.ToTable("details");

                entity.Property(e => e.DetailsId).HasColumnName("details_id");

                entity.Property(e => e.EventId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("event_id")
                    .IsFixedLength();

                entity.Property(e => e.Eventtime)
                    .HasMaxLength(50)
                    .HasColumnName("eventtime");

                entity.Property(e => e.Reason)
                    .HasMaxLength(500)
                    .HasColumnName("reason");

                entity.Property(e => e.State)
                    .HasMaxLength(20)
                    .HasColumnName("state");
            });

            modelBuilder.Entity<EvaluationForm>(entity =>
            {
                entity.ToTable("evaluation_form");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CommodityId).HasColumnName("commodity_id");

                entity.Property(e => e.EvaluationTime)
                    .HasMaxLength(50)
                    .HasColumnName("evaluation_time");

                entity.Property(e => e.Isstate).HasColumnName("isstate");

                entity.Property(e => e.Rate)
                    .HasColumnName("rate");

                entity.Property(e => e.NumberId).HasColumnName("number_id");
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.ToTable("event");

                entity.Property(e => e.EventId).HasColumnName("event_id");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.EventEndTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("event_end_timestamp");

                entity.Property(e => e.EventImage)
                    .HasMaxLength(50)
                    .HasColumnName("event_image");

                entity.Property(e => e.EventInfo).HasColumnName("event_info");

                entity.Property(e => e.EventIsstate).HasColumnName("event_isstate");

                entity.Property(e => e.EventLocationId).HasColumnName("event_location_id");

                entity.Property(e => e.EventName)
                    .HasMaxLength(50)
                    .HasColumnName("event_name");

                entity.Property(e => e.EventSellEndTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("event_sell_end_timestamp");

                entity.Property(e => e.EventSellStartTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("event_sell_start_timestamp");

                entity.Property(e => e.EventStartTimestamp)
                    .HasMaxLength(50)
                    .HasColumnName("event_start_timestamp");

                entity.Property(e => e.EventTypeId).HasColumnName("event_type_id");
            });

            modelBuilder.Entity<EventCollect>(entity =>
            {
                entity.ToTable("event_collect");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.CustomerId).HasColumnName("customer_id");

                entity.Property(e => e.EventId).HasColumnName("event_id");
            });

            modelBuilder.Entity<EventLocation>(entity =>
            {
                entity.ToTable("event_location");

                entity.Property(e => e.EventLocationId).HasColumnName("event_location_id");

                entity.Property(e => e.EventLocationAddress)
                    .HasMaxLength(50)
                    .HasColumnName("event_location_address");

                entity.Property(e => e.EventLocationImage)
                    .HasMaxLength(50)
                    .HasColumnName("event_location_image");

                entity.Property(e => e.EventLocationInfo).HasColumnName("event_location_info");

                entity.Property(e => e.EventLocationIsstate).HasColumnName("event_location_isstate");

                entity.Property(e => e.EventLocationName)
                    .HasMaxLength(50)
                    .HasColumnName("event_location_name");
            });

            modelBuilder.Entity<EventType>(entity =>
            {
                entity.ToTable("event_type");

                entity.Property(e => e.EventTypeId).HasColumnName("event_type_id");

                entity.Property(e => e.EventTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("event_type_name");
            });

            modelBuilder.Entity<OrderForm>(entity =>
            {
                entity.ToTable("order_form");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CommodityId).HasColumnName("commodity_id");

                entity.Property(e => e.IsState).HasColumnName("isState");

                entity.Property(e => e.IsCart).HasColumnName("isCart");

                entity.Property(e => e.NumberId).HasColumnName("number_id");

                entity.Property(e => e.OrderTime)
                    .HasMaxLength(50)
                    .HasColumnName("order_time");

                entity.Property(e => e.QuantityOrder).HasColumnName("quantity_order");
            });

            modelBuilder.Entity<OrderMain>(entity =>
            {
                entity.ToTable("order_main");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.MemberId).HasColumnName("member_id");

                entity.Property(e => e.OrderForm).HasColumnName("order_form");

                entity.Property(e => e.ShoppingId).HasColumnName("shopping_id");
            });

            modelBuilder.Entity<Seat>(entity =>
            {
                entity.ToTable("seat");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Area)
                    .HasMaxLength(50)
                    .HasColumnName("area");

                entity.Property(e => e.EventId).HasColumnName("event_id");

                entity.Property(e => e.IsAvailable).HasColumnName("is_available");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");

                entity.Property(e => e.SeatId).HasColumnName("seat_id");
            });

            modelBuilder.Entity<SeatPrice>(entity =>
            {
                entity.HasKey(e => e.SeatTypeId)
                    .HasName("PK_座位價格");

                entity.ToTable("seat_price");

                entity.Property(e => e.SeatTypeId).HasColumnName("seat_type_id");

                entity.Property(e => e.SeatPrice1).HasColumnName("seat_price");
            });

            modelBuilder.Entity<SeatStock>(entity =>
            {
                entity.ToTable("seat_stock");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Area)
                    .HasMaxLength(50)
                    .HasColumnName("area");

                entity.Property(e => e.EventId).HasColumnName("event_id");

                entity.Property(e => e.IsAvailable).HasColumnName("is_available");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.Sold).HasColumnName("sold");

                entity.Property(e => e.Stock).HasColumnName("stock");
            });

            modelBuilder.Entity<TicketOrder>(entity =>
            {
                entity.ToTable("ticket_order");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CustomerId).HasColumnName("customer_id");

                entity.Property(e => e.OrderCreateTimestamp)
                    .HasMaxLength(100)
                    .HasColumnName("order_create_timestamp");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.OrderState).HasColumnName("order_state");

                entity.Property(e => e.OrderTotalPrice)
                    .HasColumnType("money")
                    .HasColumnName("order_total_price");

                entity.Property(e => e.OrderUpdateId).HasColumnName("order_update_id");

                entity.Property(e => e.OrderUpdateTimestamp)
                    .HasMaxLength(100)
                    .HasColumnName("order_update_timestamp");
            });

            modelBuilder.Entity<TicketOrderDetail>(entity =>
            {
                entity.ToTable("ticket_order_detail");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Area)
                    .HasMaxLength(50)
                    .HasColumnName("area");

                entity.Property(e => e.CustomerId).HasColumnName("customer_id");

                entity.Property(e => e.EventId).HasColumnName("event_id");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.SeatId).HasColumnName("seat_id");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
