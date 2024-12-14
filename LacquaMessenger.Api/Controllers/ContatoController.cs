using LacquaMessenger.App.Service;
using LacquaMessenger.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LacquaMessenger.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContatoController : ControllerBase
    {
        private readonly ContatoService _contatoService;

        public ContatoController(ContatoService contatoService)
        {
            _contatoService = contatoService;

        }
        // GET: api/<ContatoController>
        [HttpGet]
        public async Task<List<Contato>> Get()
        {
            return await _contatoService.GetContatosAsync(new Domain.Entities.Contato { IdContato = 2290 });
        }

        // GET api/<ContatoController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ContatoController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ContatoController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ContatoController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
