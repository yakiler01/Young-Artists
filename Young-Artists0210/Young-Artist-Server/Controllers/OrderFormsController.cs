using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;

namespace Young_Artist_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderFormsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public OrderFormsController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/OrderForms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderForm>>> GetOrderForm()
        {
            return await _context.OrderForm.ToListAsync();
        }

        // GET: api/OrderForms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderForm>> GetOrderForm(int id)
        {
            var orderForm = await _context.OrderForm.FindAsync(id);

            if (orderForm == null)
            {
                return NotFound();
            }

            return orderForm;
        }

        // PUT: api/OrderForms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrderForm(int id, OrderForm orderForm)
        {
            if (id != orderForm.Id)
            {
                return BadRequest();
            }

            _context.Entry(orderForm).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderFormExists(id))
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

        // POST: api/OrderForms
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OrderForm>> PostOrderForm(OrderForm orderForm)
        {
            _context.OrderForm.Add(orderForm);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOrderForm", new { id = orderForm.Id }, orderForm);
        }

        // DELETE: api/OrderForms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrderForm(int id)
        {
            var orderForm = await _context.OrderForm.FindAsync(id);
            if (orderForm == null)
            {
                return NotFound();
            }

            _context.OrderForm.Remove(orderForm);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OrderFormExists(int id)
        {
            return _context.OrderForm.Any(e => e.Id == id);
        }
    }
}
