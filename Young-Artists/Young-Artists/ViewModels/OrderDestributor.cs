using Young_Artists.Models;

namespace Young_Artists.ViewModels
{
    public class OrderDestributor
    {
        public Event _event;
        public TicketOrder _order;
        public SeatStock _stock;
        public TicketOrderDetail _ticket;
        public Customer _customers;
        public OrderDestributor()
        {
            _event = new Event();
            _order = new TicketOrder();
            _stock = new SeatStock();
            _ticket = new TicketOrderDetail();
            _customers = new Customer();
        }

        public int customer_id { get; set; }
        public int event_id { get; set; }
        public string area { get; set; }
        public int price { get; set; }
        public int? stock { get; set; }
        public int total_price { get; set; }
    }
}
