
using RabbitMQ.Client;
using System;
using System.Threading.Tasks;

namespace Lacqua.RabbitMQService
{

    public interface IMessageQueueProducer : IDisposable
    {
        IModel Channel { get; }
        MessageQueueOption Options { get; }

        Task<bool> PublishExchangeMessage<T>(string exchange, string routingKey, T message);
        Task<bool> PublishQueueMessage<T>(string queue, T message);

    }
}