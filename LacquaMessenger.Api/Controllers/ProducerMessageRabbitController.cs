using LacquaMessenger.Api.Model;
using MessageBroker.RabbitMq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LacquaMessenger.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProducerMessageRabbitController : ControllerBase
    {
        private readonly IMessageQueueProducer _producer;

        public ProducerMessageRabbitController(IMessageQueueProducer producer)
        {
            _producer = producer;
        }


        // GET: api/<ProducerMessageRabbitController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<ProducerMessageRabbitController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProducerMessageRabbitController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] MessageProducer value)
        {
            _producer.PublishExchangeMessage(value.Exchange, value.RoutingKey, value.Message);

            return await Task.FromResult(Ok());

        }

        // PUT api/<ProducerMessageRabbitController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProducerMessageRabbitController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
