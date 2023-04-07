using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;
namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class EventsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;
        public EventsController(YoungArtistsContext context)
        {
            _context = context;
        }
        [HttpGet("TypeId/{TypeId}")]
        public async Task<IEnumerable<EventViewModel>> GetEventType(int TypeId)
        {
            var data = await (from e in _context.Event
                              join c in _context.Company on e.CompanyId equals c.CompanyId
                              join et in _context.EventType on e.EventTypeId equals et.EventTypeId
                              join el in _context.EventLocation on e.EventLocationId equals el.EventLocationId
                              where e.EventTypeId == TypeId && e.EventIsstate == true
                              select new
                              {
                                  Event = e,
                                  Company = c,
                                  EventType = et,
                                  EventLocation = el
                              }).ToListAsync();
            return data.Select(x => new EventViewModel
            {
                EventId = x.Event.EventId,
                EventImage = x.Event.EventImage,
                EventName = x.Event.EventName,
                EventInfo = x.Event.EventInfo,
                EventSellStartTimestamp = x.Event.EventSellStartTimestamp,
                EventSellEndTimestamp = x.Event.EventSellEndTimestamp,
                EventStartTimestamp = x.Event.EventStartTimestamp,
                EventEndTimestamp = x.Event.EventEndTimestamp,
                EventIsstate = x.Event.EventIsstate,
                EventTypeId = x.Event.EventTypeId,
                EventTypeName = x.EventType.EventTypeName,
                EventLocationId = x.Event.EventLocationId,
                EventLocationName = x.EventLocation.EventLocationName,
                EventLocationImage = x.EventLocation.EventLocationImage,
                EventLocationInfo = x.EventLocation.EventLocationInfo,
                EventLocationAddress = x.EventLocation.EventLocationAddress,
                CompanyId = x.Event.CompanyId,
                CompanyName = x.Company.CompanyName,
            });
        }

        [HttpGet("KeyWord/{KeyWord}")]
        public async Task<IEnumerable<EventViewModel>> GetEventCard(string KeyWord)
        {
            var data = await (from e in _context.Event
                              join c in _context.Company on e.CompanyId equals c.CompanyId
                              join et in _context.EventType on e.EventTypeId equals et.EventTypeId
                              join el in _context.EventLocation on e.EventLocationId equals el.EventLocationId
                              where( EF.Functions.Like(e.EventName, $"%{KeyWord}%")
                                  || EF.Functions.Like(et.EventTypeName, $"%{KeyWord}%")
                                  || EF.Functions.Like(e.EventInfo, $"%{KeyWord}%"))
                                  && e.EventIsstate == true
                              select new
                              {
                                  Event = e,
                                  Company = c,
                                  EventType = et,
                                  EventLocation = el
                              }).ToListAsync();
            return data.Select(x => new EventViewModel
            {
                EventId = x.Event.EventId,
                EventImage = x.Event.EventImage,
                EventName = x.Event.EventName,
                EventInfo = x.Event.EventInfo,
                EventSellStartTimestamp = x.Event.EventSellStartTimestamp,
                EventSellEndTimestamp = x.Event.EventSellEndTimestamp,
                EventStartTimestamp = x.Event.EventStartTimestamp,
                EventEndTimestamp = x.Event.EventEndTimestamp,
                EventIsstate = x.Event.EventIsstate,
                EventTypeId = x.Event.EventTypeId,
                EventTypeName = x.EventType.EventTypeName,
                EventLocationId = x.Event.EventLocationId,
                EventLocationName = x.EventLocation.EventLocationName,
                EventLocationImage = x.EventLocation.EventLocationImage,
                EventLocationInfo = x.EventLocation.EventLocationInfo,
                EventLocationAddress = x.EventLocation.EventLocationAddress,
                CompanyId = x.Event.CompanyId,
                CompanyName = x.Company.CompanyName,
            });
        }
        [HttpGet("Id/{Id}")]
        public async Task<IEnumerable<EventViewModel>> GetEvent(int Id)
        {
            var data = await (from e in _context.Event
                              join c in _context.Company on e.CompanyId equals c.CompanyId
                              join et in _context.EventType on e.EventTypeId equals et.EventTypeId
                              join el in _context.EventLocation on e.EventLocationId equals el.EventLocationId
                              where e.EventId==Id && e.EventIsstate == true
                              select new
                              {
                                  Event = e,
                                  Company = c,
                                  EventType = et,
                                  EventLocation = el
                              }).ToListAsync();
            return data.Select(x => new EventViewModel
            {
                EventId = x.Event.EventId,
                EventImage = x.Event.EventImage,
                EventName = x.Event.EventName,
                EventInfo = x.Event.EventInfo,
                EventSellStartTimestamp = x.Event.EventSellStartTimestamp,
                EventSellEndTimestamp = x.Event.EventSellEndTimestamp,
                EventStartTimestamp = x.Event.EventStartTimestamp,
                EventEndTimestamp = x.Event.EventEndTimestamp,
                EventIsstate = x.Event.EventIsstate,
                EventTypeId = x.Event.EventTypeId,
                EventTypeName = x.EventType.EventTypeName,
                EventLocationId = x.Event.EventLocationId,
                EventLocationName = x.EventLocation.EventLocationName,
                EventLocationImage = x.EventLocation.EventLocationImage,
                EventLocationInfo = x.EventLocation.EventLocationInfo,
                EventLocationAddress = x.EventLocation.EventLocationAddress,
                CompanyId = x.Event.CompanyId,
                CompanyName = x.Company.CompanyName,
            });
        }

        // GET: api/Events/5
        [HttpGet]
        public async Task<IEnumerable<EventViewModel>> GetEvent()
        {
            var data = await (from e in _context.Event
                              join c in _context.Company on e.CompanyId equals c.CompanyId
                              join et in _context.EventType on e.EventTypeId equals et.EventTypeId
                              join el in _context.EventLocation on e.EventLocationId equals el.EventLocationId
                              where  e.EventIsstate == true
                              select new
                              {
                                  Event = e,
                                  Company = c,
                                  EventType = et,
                                  EventLocation = el
                              }).ToListAsync();
            return data.Select(x => new EventViewModel
            {
                EventId=x.Event.EventId,
                EventImage = x.Event.EventImage,
                EventName = x.Event.EventName,
                EventInfo = x.Event.EventInfo,
                EventSellStartTimestamp=x.Event.EventSellStartTimestamp,
                EventSellEndTimestamp=x.Event.EventSellEndTimestamp,
                EventStartTimestamp=x.Event.EventStartTimestamp,
                EventEndTimestamp =x.Event.EventEndTimestamp,
                EventIsstate=x.Event.EventIsstate,
                EventTypeId = x.Event.EventTypeId,
                EventTypeName = x.EventType.EventTypeName,
                EventLocationId = x.Event.EventLocationId,
                EventLocationName = x.EventLocation.EventLocationName,
                EventLocationImage=x.EventLocation.EventLocationImage,
                EventLocationInfo =x.EventLocation.EventLocationInfo,
                EventLocationAddress =x.EventLocation.EventLocationAddress,
                CompanyId = x.Event.CompanyId,
                CompanyName = x.Company.CompanyName,
            });

        }

        // PUT: api/Events/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEvent(int id, Event @event)
        {
            if (id != @event.EventId)
            {
                return BadRequest();
            }

            _context.Entry(@event).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EventExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Events
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Event>> PostEvent(Event @event)
        {
            _context.Event.Add(@event);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEvent", new { id = @event.EventId }, @event);
        }

        // DELETE: api/Events/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEvent(int id)
        {
            var @event = await _context.Event.FindAsync(id);
            if (@event == null)
            {
                return NotFound();
            }

            _context.Event.Remove(@event);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EventExists(int id)
        {
            return _context.Event.Any(e => e.EventId == id);
        }
    }
}
