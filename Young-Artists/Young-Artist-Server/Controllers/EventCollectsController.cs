using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;

namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class EventCollectsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public EventCollectsController(YoungArtistsContext context)
        {
            _context = context;
        }
        // GET: api/EventCollects/5
        [HttpGet("customerid/{customerid}")]
        public async Task<IEnumerable<EventCollectViewModel>> GetEventCollect(int customerid)
        {
            var eventCollect = await (from ec in _context.EventCollect
                                      join e in _context.Event on ec.EventId equals e.EventId
                                      where ec.CustomerId == customerid && e.EventIsstate == true
                                      select new
                                      {
                                          Event = e,
                                          EventCollect = ec,

                                      }).ToListAsync();

            return eventCollect.Select(x => new EventCollectViewModel
            {
                Id = x.EventCollect.Id,
                EventId = x.EventCollect.EventId,
                CustomerId = x.EventCollect.CustomerId,
                EventIsstate = x.Event.EventIsstate,
            });
        }

        //GET: api/EventCollects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EventCollect>>> GetEventCollect()
        {
            return await _context.EventCollect.ToListAsync();
        }

        //POST: api/EventCollects
        //To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost("Collect")]
        public async Task<string> PostEventCollect(int customerid, int eventid)
        {
            var eventCollect = await (from ec in _context.EventCollect
                                      join e in _context.Event on ec.EventId equals e.EventId
                                      where ec.CustomerId == customerid && e.EventIsstate == true
                                      select new
                                      {
                                          Event = e,
                                          EventCollect = ec,

                                      }).ToListAsync();

            if (eventCollect.Any(ec => ec.EventCollect.CustomerId == customerid && ec.EventCollect.EventId == eventid))
            {
                return "已被收藏";
            }
            else
            {
                EventCollect ec = new EventCollect
                {
                    EventId = eventid,
                    CustomerId = customerid,
                };
                _context.EventCollect.Add(ec);
                await _context.SaveChangesAsync();
                return "收藏成功";
            }

        }

        //DELETE: api/EventCollects1/5
        [HttpDelete("Delete")]
        public async Task<IActionResult> DeleteEventCollect(int customerid, int eventid)
        {

            var eventCollect = await _context.EventCollect.FirstOrDefaultAsync(ec => ec.CustomerId == customerid && ec.EventId == eventid);
            if (eventCollect == null)
            {
                return NotFound();
            }

            _context.EventCollect.Remove(eventCollect);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EventCollectExists(int id)
        {
            return _context.EventCollect.Any(e => e.Id == id);
        }
    }
}
