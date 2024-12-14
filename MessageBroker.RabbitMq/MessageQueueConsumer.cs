using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System.Text;

namespace MessageBroker.RabbitMq;

public class MessageQueueConsumer : IMessageQueueConsumer, IDisposable
{
    private readonly ConnectionFactory _connectionFactory;
    private readonly IOptions<MessageQueueOption> _options;
    private readonly IConnection _connection;
    private bool _disposedValue;
    ILogger<MessageQueueConsumer> logger;

    public MessageQueueConsumer(ConnectionFactory connectionFactory, IOptions<MessageQueueOption> options, ILogger<MessageQueueConsumer> _logger)
    {
        try
        {
            _connectionFactory = connectionFactory;
            _options = options;
            _connection = _connectionFactory.CreateConnection();
            Channel = _connection.CreateModel();
            logger = _logger;
        }
        catch (Exception ex)
        {
            logger.LogError($"Erro ao conectar o Rabbit: {ex.Message}");
        }
    }

    public IModel Channel { get; }
    public MessageQueueOption Options => _options.Value;

    public void ConsumeQueueMessages<T>(string queue, Action<T> messageHandler)
    {
        Channel.QueueDeclare(queue, exclusive: false, durable: true, autoDelete: false);

        var consumer = new EventingBasicConsumer(Channel);
        consumer.Received += (model, ea) =>
        {
            var body = ea.Body.ToArray();
            var message = Encoding.UTF8.GetString(body);
            var deserializedMessage = JsonConvert.DeserializeObject<T>(message);

            try
            {
                messageHandler(deserializedMessage);
                Channel.BasicAck(ea.DeliveryTag, false);
            }
            catch (Exception ex)
            {
                logger.LogError($"Erro ao processar mensagem: {ex.Message}");
                // Implementar uma estratégia de reprocessamento ou dead-lettering
            }
        };

        Channel.BasicConsume(queue, false, consumer);
    }

    public void Dispose()
    {
        Dispose(true);
    }


    protected virtual void Dispose(bool disposing)
    {
        if (!_disposedValue)
        {
            if (disposing)
            {
                // TODO: dispose managed state (managed objects)
                _connection.Dispose();
                Channel.Dispose();
            }

            // TODO: free unmanaged resources (unmanaged objects) and override finalizer
            // TODO: set large fields to null
            _disposedValue = true;
        }
    }
    // ... restante do código de dispose semelhante ao MessageQueueProducer
}