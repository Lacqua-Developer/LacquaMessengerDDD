
using RabbitMQ.Client;

namespace MessageBroker.RabbitMq;

public interface IMessageQueueProducer : IDisposable
{
    IModel Channel { get; }
    MessageQueueOption Options { get; }

    bool PublishExchangeMessage<T>(string exchange, string routingKey, T message);
    void PublishQueueMessage<T>(string queue,  T message);

}
