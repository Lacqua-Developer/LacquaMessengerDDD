using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System.Text;

namespace MessageBroker.RabbitMq;

public class MessageQueueProducer : IMessageQueueProducer, IDisposable
{
    private readonly ConnectionFactory _connectionFactory;
    private readonly IOptions<MessageQueueOption> _options;
    private readonly IConnection _connection;
    private bool _disposedValue;
    private readonly ILogger<MessageQueueProducer> _logger;
    public IModel Channel { get; private set; }
    public MessageQueueOption Options => _options.Value;



    public MessageQueueProducer(ConnectionFactory connectionFactory, IOptions<MessageQueueOption> options, ILogger<MessageQueueProducer> logger)
    {
        try
        {
            _logger = logger;
            _connectionFactory = connectionFactory;
            _options = options;
            _connection = _connectionFactory.CreateConnection();
            Channel = _connection.CreateModel();

            _connection.CallbackException += (sender, args) =>
            {
                logger.LogError($"CallbackException: {args.Exception.Message}");
                logger.LogError($"RabbitConnectCallbackException: {args.Exception.Message}");
            };

        }
        catch (RabbitMQ.Client.Exceptions.ConnectFailureException connectEx)
        {
            // Erro específico de falha de conexão
            //logger.LogError($"Falha ao conectar ao RabbitMQ: {connectEx.Message}");
            logger.LogError($"Erro de Conexão: {connectEx.Message}");
            logger.LogError($"Stack Trace: {connectEx.StackTrace}");
        }
        catch (ArgumentException argEx)
        {
            // Erro relacionado a parâmetros inválidos
            //_logger.LogError($"Argumento inválido: {argEx.Message}");
            logger.LogError($"Erro de Argumento: {argEx.Message}");
            logger.LogError($"Stack Trace: {argEx.StackTrace}");
        }
        catch (Exception ex)
        {
            // Captura exceções gerais
            // _logger.LogError($"Erro geral ao conectar o Rabbit: {ex.Message}");
            logger.LogError($"Erro: {ex.Message}");
            logger.LogError($"Stack Trace: {ex.StackTrace}");
        }


    }



    public void PublishQueueMessage<T>(string queue, T message)
    {
        Channel.QueueDeclare(queue, exclusive: false, durable: true, autoDelete: false);

        var json = JsonConvert.SerializeObject(message);
        var body = Encoding.UTF8.GetBytes(json);

        Channel.BasicPublish(exchange: "", routingKey: queue, body: body);
    }
    public void PublishExchangeMessage<T>(string exchange, string routingKey, T message)
    {
        try
        {
            Channel.ConfirmSelect();

            // Eventos do canal (opcional para logs adicionais)
            Channel.CallbackException += (sender, args) =>
            {

                _logger.LogInformation($"CallbackException: {args.Exception.Message}");
            };
            Channel.FlowControl += (sender, args) =>
            {
                _logger.LogInformation("Controle de fluxo acionado.");
            };


            _logger.LogInformation($"Tentando Enviar o Rabbit fila: {routingKey}");
            var json = JsonConvert.SerializeObject(message);
            var body = Encoding.UTF8.GetBytes(json);

            // Uso da função para garantir a estrutura
            EnsureRabbitMQStructure(exchange, routingKey, routingKey);

            Channel.BasicPublish(exchange: exchange, routingKey: routingKey, body: body);

            // Aguarda a confirmação
            if (Channel.WaitForConfirms())
            {
                _logger.LogInformation("Mensagem foi confirmada pelo RabbitMQ.");

            }
            else
            {
                _logger.LogError("Erro ao confirmar o envio da mensagem.");
            }
        }
        catch (Exception ex)
        {
            _logger.LogError($"Erro ao Enviar o Rabbit fila: {routingKey}, erro: {ex.Message}");

            //logger.LogInformation($"Falha ao enviar mensagem! => '{ex.Message}'");
        }

    }

    // Declaração da estrutura (Exchange, Queue e Binding)
    private void EnsureRabbitMQStructure(string exchange, string queue, string routingKey)
    {
        
        // Declara o Exchange (se ainda não existir)
        Channel.ExchangeDeclare(exchange: exchange, type: "direct", durable: true, autoDelete: false);

        // Declara a Fila (se ainda não existir)
        Channel.QueueDeclare(queue: queue,
                             durable: false,
                             exclusive: false,
                             autoDelete: true,
                             arguments: null);

        // Liga a Fila ao Exchange com a routingKey
        Channel.QueueBind(queue: queue,
                          exchange: exchange,
                          routingKey: routingKey);
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


    public void Dispose()
    {
        // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
        Dispose(disposing: true);
        GC.SuppressFinalize(this);
    }

}
