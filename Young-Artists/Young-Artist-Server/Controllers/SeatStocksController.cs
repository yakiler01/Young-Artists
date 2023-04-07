using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;

namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class SeatStocksController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public SeatStocksController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/SeatStocks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SeatStock>>> GetSeatStock()
        {
            return await _context.SeatStock.ToListAsync();
        }
        [HttpGet("EventId/{EventId}")]
        public async Task<IEnumerable<SeatStock>> GetSeatStockEventID(int EventId)
        {
        var data = from seatStock in _context.SeatStock
                    where seatStock.EventId == EventId
                    select seatStock;
            return data;
        }
        
        //GET: api/SeatStocks/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SeatStock>> GetSeatStock(int id)
        {
            var seatStock = await _context.SeatStock.FindAsync(id);

            if (seatStock == null)
            {
                return NotFound();
            }

            return seatStock;
        }

        // PUT: api/SeatStocks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSeatStock(int id, SeatStock seatStock)
        {
            if (id != seatStock.Id)
            {
                return BadRequest();
            }

            _context.Entry(seatStock).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SeatStockExists(id))
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

        // POST: api/SeatStocks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<SeatStock>> PostSeatStock(SeatStock seatStock)
        {
            _context.SeatStock.Add(seatStock);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSeatStock", new { id = seatStock.Id }, seatStock);
        }

        // DELETE: api/SeatStocks/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSeatStock(int id)
        {
            var seatStock = await _context.SeatStock.FindAsync(id);
            if (seatStock == null)
            {
                return NotFound();
            }

            _context.SeatStock.Remove(seatStock);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SeatStockExists(int id)
        {
            return _context.SeatStock.Any(e => e.Id == id);
        }
    }
}
