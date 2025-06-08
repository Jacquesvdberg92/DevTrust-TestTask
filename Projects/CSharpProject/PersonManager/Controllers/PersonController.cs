using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PersonManager.Models;

namespace PersonManager.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PersonController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PersonController(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Saves a single person to the database.
        /// </summary>
        /// <param name="person">The person to save.</param>
        /// <returns>The created person with status 201, or error status.</returns>
        [HttpPost]
        public async Task<IActionResult> SavePerson([FromBody] Person person)
        {
            try
            {
                _context.Persons.Add(person);
                await _context.SaveChangesAsync();
                return CreatedAtAction(nameof(GetPerson), new { id = person.Id }, person);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error: " + ex.Message);
            }
        }

        /// <summary>
        /// Saves multiple persons to the database in bulk.
        /// </summary>
        /// <param name="persons">The list of persons to save.</param>
        /// <returns>Status 200 with saved persons, or error status.</returns>
        [HttpPost("bulk")]
        public async Task<IActionResult> SavePersons([FromBody] List<Person> persons)
        {
            if (persons == null || persons.Count == 0)
                return BadRequest("No persons provided.");

            try
            {
                _context.Persons.AddRange(persons);
                await _context.SaveChangesAsync();
                return Ok(persons);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error: " + ex.Message);
            }
        }

        /// <summary>
        /// Deletes a person and their address (if not referenced elsewhere) by ID.
        /// </summary>
        /// <param name="id">The ID of the person to delete.</param>
        /// <returns>Status 204 if deleted, 404 if not found.</returns>
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePerson(long id)
        {
            var person = await _context.Persons.Include(p => p.Address).FirstOrDefaultAsync(p => p.Id == id);
            if (person == null)
                return NotFound();

            // Remove the address if it exists and is not referenced by other persons
            if (person.Address != null)
            {
                _context.Addresses.Remove(person.Address);
            }

            _context.Persons.Remove(person);
            await _context.SaveChangesAsync();
            return NoContent();
        }

        /// <summary>
        /// Gets a person by ID, including their address.
        /// </summary>
        /// <param name="id">The ID of the person.</param>
        /// <returns>The person if found, or 404 if not found.</returns>
        [HttpGet("{id}")]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
            var person = await _context.Persons.Include(p => p.Address).FirstOrDefaultAsync(p => p.Id == id);
            if (person == null) return NotFound();
            return person;
        }

        /// <summary>
        /// Queries persons by optional first name, last name, and city.
        /// </summary>
        /// <param name="request">The query parameters.</param>
        /// <returns>List of persons matching the query.</returns>
        [HttpPost("query")]
        public async Task<ActionResult<IEnumerable<Person>>> QueryPersons([FromBody] GetAllRequest request)
        {
            var query = _context.Persons.Include(p => p.Address).AsQueryable();

            if (!string.IsNullOrWhiteSpace(request.FirstName))
                query = query.Where(p => p.FirstName.Contains(request.FirstName));

            if (!string.IsNullOrWhiteSpace(request.LastName))
                query = query.Where(p => p.LastName.Contains(request.LastName));

            if (!string.IsNullOrWhiteSpace(request.City))
                query = query.Where(p => p.Address.City.Contains(request.City));

            var result = await query.ToListAsync();
            return Ok(result);
        }

    }
}
