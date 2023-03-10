using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;

namespace Young_Artist_Server.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class EvaluationFormsController : ControllerBase
    {
        private readonly YoungArtistsContext _context;

        public EvaluationFormsController(YoungArtistsContext context)
        {
            _context = context;
        }

        // GET: api/EvaluationForms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EvaluationForm>>> GetEvaluationForm()
        {
            return await _context.EvaluationForm.ToListAsync();
        }

        // GET: api/EvaluationForms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<EvaluationForm>> GetEvaluationForm(int id)
        {
            var evaluationForm = await _context.EvaluationForm.FindAsync(id);

            if (evaluationForm == null)
            {
                return NotFound();
            }

            return evaluationForm;
        }

        [HttpGet("commodity/{commodityId}")]
        public async Task<ActionResult<IEnumerable<EvaluationForm>>> GetEvaluationFormsByCommodityId(int commodityId)
        {
            var evaluationForms = await _context.EvaluationForm
                .Where(e => e.CommodityId == commodityId)
                .ToListAsync();

            if (evaluationForms == null || evaluationForms.Count == 0)
            {
                return NotFound();
            }

            return evaluationForms;
        }

        // PUT: api/EvaluationForms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEvaluationForm(int id, EvaluationForm evaluationForm)
        {
            if (id != evaluationForm.Id)
            {
                return BadRequest();
            }

            _context.Entry(evaluationForm).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EvaluationFormExists(id))
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

        // POST: api/EvaluationForms
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<EvaluationForm>> PostEvaluationForm(EvaluationForm evaluationForm)
        {
            _context.EvaluationForm.Add(evaluationForm);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEvaluationForm", new { id = evaluationForm.Id }, evaluationForm);
        }

        // DELETE: api/EvaluationForms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEvaluationForm(int id)
        {
            var evaluationForm = await _context.EvaluationForm.FindAsync(id);
            if (evaluationForm == null)
            {
                return NotFound();
            }

            _context.EvaluationForm.Remove(evaluationForm);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EvaluationFormExists(int id)
        {
            return _context.EvaluationForm.Any(e => e.Id == id);
        }
    }
}
