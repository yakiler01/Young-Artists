using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModle;


namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]

    public class DetailsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public DetailsController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/Details
        [HttpGet]
        public async  Task<IEnumerable<DetailsViewModle>> GetDetails()
        {
            var EventDetail = from d in _context.Details
                             join e in _context.Event on d.EventId equals e.EventId
                             select new DetailsViewModle
                             {
                                 DetailsId = d.DetailsId,
                                 Eventtime = d.Eventtime,
                                 EventId = d.EventId,
                                 State = d.State,
                                 Reason = d.Reason,
                                 EventImage = e.EventImage,
                                 EventName = e.EventName,
                                 EventInfo = e.EventInfo,
                                 CompanyId = e.CompanyId,
                                 EventSellStartTimestamp = e.EventSellStartTimestamp,
                                 EventSellEndTimestamp = e.EventSellEndTimestamp,
                                 EventStartTimestamp = e.EventStartTimestamp,
                                 EventEndTimestamp = e.EventEndTimestamp,
                                 EventTypeId = e.EventTypeId,
                                 EventLocationId = e.EventLocationId,
                                 EventIsstate = e.EventIsstate
                             };

            return await EventDetail.ToListAsync();

        }
        //return _context.Details.Select(D => new Details {
        //    DetailsId=D.DetailsId,
        //    EventId=D.EventId,
        //    Eventtime=D.Eventtime,
        //    Reason=D.Reason,
        //    State=D.State,
        //});
        // GET: api/Details/5
        [HttpGet("{id}")]
        public async Task<IEnumerable<DetailsViewModle>> GetDetails(int id)
        {
            //var details2 = await _context.OrderForm
            //    .Where(d=> d.NumberId==id)
            //    .Join(
            //    _context.Details,
            //    details => details.Id,
            //    eventdtails => eventdtails.EventId,
            //    (details, eventdtails) =>new DetailsViewModle {
            //        EventImage = eventdtails.eve 


            //    })

            var details = await (from d in _context.Details
                                 join e in _context.Event on d.EventId equals e.EventId
                                 where d.EventId == id
                                 select new DetailsViewModle
                                 {
                                     DetailsId = d.DetailsId,
                                     Eventtime = d.Eventtime,
                                     EventName = e.EventName,
                                     EventImage = e.EventImage,
                                     State = d.State,
                                     Reason = d.Reason,
                                     EventInfo = e.EventInfo,
                                     EventEndTimestamp = e.EventEndTimestamp,
                                     EventSellStartTimestamp = e.EventSellStartTimestamp,
                                     
                                 }).ToListAsync();

            return details;
        }

        // PUT: api/Details/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDetails(int id, Details details)
        {
            if (id != details.DetailsId)
            {
                return BadRequest();
            }

            _context.Entry(details).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DetailsExists(id))
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

        // POST: api/Details
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Details>> PostDetails(Details details)
        {
            _context.Details.Add(details);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDetails", new { id = details.DetailsId }, details);
        }

        // DELETE: api/Details/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDetails(int id)
        {
            var details = await _context.Details.FindAsync(id);
            if (details == null)
            {
                return NotFound();
            }

            _context.Details.Remove(details);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DetailsExists(int id)
        {
            return _context.Details.Any(e => e.DetailsId == id);
        }
    }
}
