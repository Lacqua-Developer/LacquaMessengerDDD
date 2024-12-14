using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Domain.UseCases;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LacquaMessenger.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class ConfigController : ControllerBase
    {
        private readonly IUseCase<Config> _useCase;

        public ConfigController(IUseCase<Config> useCase)
        {
            _useCase = useCase;
        }

    
        // GET: api/<ConfigController>
        [HttpGet]
        public IEnumerable<Config> Get()
        {
            return _useCase.Get();
        }

        //// GET api/<ConfigController>/5
        //[HttpGet("{id}")]
        //public Config Get(int id)
        //{
        //    return _useCase.Get(id);
        //}

        // POST api/<ConfigController>
        [HttpPost]
        public void Post([FromBody] Config value)
        {
            _useCase.Add(value);
        }

        // PUT api/<ConfigController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Config value)
        {
            _useCase.AddOrUpdate(value);
        }

        //// DELETE api/<ConfigController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //    _useCase.Delete(id);
        //}
    }
}
