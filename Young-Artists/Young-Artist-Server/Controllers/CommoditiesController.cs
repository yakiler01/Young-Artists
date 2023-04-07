using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;
using Young_Artist_Server.ViewModels;


namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class CommoditiesController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public CommoditiesController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/Commodities
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Commodity>>> GetCommodity()
        {
            return await _context.Commodity.ToListAsync();
        }

        // GET: api/Commodities/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Commodity>> GetCommodity(int id)
        {
            var commodity = await _context.Commodity.FindAsync(id);

            if (commodity == null)
            {
                return NotFound();
            }

            return commodity;
        }

        // PUT: api/Commodities/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCommodity(int id, Commodity commodity)
        {
            if (id != commodity.Id)
            {
                return BadRequest();
            }

            _context.Entry(commodity).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CommodityExists(id))
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

        // POST: api/Commodities
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Commodity>> PostCommodity(Commodity commodity)
        {
            _context.Commodity.Add(commodity);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCommodity", new { id = commodity.Id }, commodity);
        }

        // DELETE: api/Commodities/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCommodity(int id)
        {
            var commodity = await _context.Commodity.FindAsync(id);
            if (commodity == null)
            {
                return NotFound();
            }

            _context.Commodity.Remove(commodity);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CommodityExists(int id)
        {
            return _context.Commodity.Any(e => e.Id == id);
        }

        [HttpGet("sort/{sortType}")]
        public async Task<ActionResult<IEnumerable<Commodity>>> GetSortedCommodities(string sortType)
        {
            IQueryable<Commodity> sortedCommodities = null;

            switch (sortType)
            {
                case "最新上架":

                    sortedCommodities = _context.Commodity.OrderBy(c => c.CommodityStart);
                    break;
                case "熱銷商品":
                    sortedCommodities = _context.Commodity.OrderByDescending(c => c.CommoditySale);
                    break;
                case "推薦商品":
                    sortedCommodities = _context.Commodity.OrderBy(c => c.CommoditySort);
                    break;
                case "價格高到低":
                    sortedCommodities = _context.Commodity.OrderByDescending(c => c.CommodityPrice);
                    break;
                case "價格低到高":
                    sortedCommodities = _context.Commodity.OrderBy(c => c.CommodityPrice);
                    break;
                default:
                    return BadRequest($"Unknown sort type: {sortType}");
            }

            if (sortedCommodities == null)
            {
                return NotFound();
            }

            var result = await sortedCommodities.ToListAsync();
            return result;
        }


    
}
}
