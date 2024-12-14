using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Lacqua.RabbitMQService
{

    public class MessageQueueProducer : IMessageQueueProducer, IDisposable
    {
        private readonly ConnectionFactory _connectionFactory;
        private readonly MessageQueueOption _options;
        private readonly IConnection _connection;
        private bool _disposedValue;
        ILogger<MessageQueueProducer> _logger;

        public MessageQueueProducer(ConnectionFactory connectionFactory, MessageQueueOption options)
        {
            try
            {
                
                _connectionFactory = connectionFactory;
                _options = options;
               
                _connection = _connectionFactory.CreateConnection();
                _connection.CallbackException += (sender, args) =>
                {
                    CommonLib.Util.Write.Log($"CallbackException: {args.Exception.Message}");
                    CommonLib.Util.Write.Log($"RabbitConnectCallbackException: {args.Exception.Message}");
                };

               
                Channel = _connection.CreateModel();


            }
            catch (RabbitMQ.Client.Exceptions.ConnectFailureException connectEx)
            {
                // Erro específico de falha de conexão
                //logger.LogError($"Falha ao conectar ao RabbitMQ: {connectEx.Message}");
                CommonLib.Util.Write.Log($"Erro de Conexão: {connectEx.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {connectEx.StackTrace}");
            }
            catch (ArgumentException argEx)
            {
                // Erro relacionado a parâmetros inválidos
                //_logger.LogError($"Argumento inválido: {argEx.Message}");
                CommonLib.Util.Write.Log($"Erro de Argumento: {argEx.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {argEx.StackTrace}");
            }
            catch (Exception ex)
            {
                // Captura exceções gerais
                // _logger.LogError($"Erro geral ao conectar o Rabbit: {ex.Message}");
                CommonLib.Util.Write.Log($"Erro: {ex.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {ex.StackTrace}");
            }


        }

        public IModel Channel { get; }
        public MessageQueueOption Options => _options;

        public async Task<bool> PublishQueueMessage<T>(string queue, T message)
        {
            Channel.QueueDeclare(queue, exclusive: false, durable: true, autoDelete: false);

            var json = JsonConvert.SerializeObject(message);
            var body = Encoding.UTF8.GetBytes(json);

            Channel.BasicPublish(exchange: "", routingKey: queue, body: body);
            return true;
        }
        public async Task<bool> PublishExchangeMessage<T>(string exchange, string routingKey, T message)
        {
            try
            {
                if (Channel == null || !Channel.IsOpen)
                {
                    throw new InvalidOperationException("O canal RabbitMQ não está disponível ou foi fechado.");
                }

                Channel.ConfirmSelect();

                // Serializa a mensagem
                var json = JsonConvert.SerializeObject(message);
                var body = Encoding.UTF8.GetBytes(json);

                // Configura as propriedades da mensagem
                var properties = Channel.CreateBasicProperties();
                properties.ContentType = "application/json";
                properties.DeliveryMode = 2; // Persistente

                // Eventos do canal (opcional para logs adicionais)
                Channel.CallbackException += (sender, args) =>
                {
                    
                    CommonLib.Util.Write.Log($"CallbackException: {args.Exception.Message}");
                };
                Channel.FlowControl += (sender, args) =>
                {
                    CommonLib.Util.Write.Log("Controle de fluxo acionado.");
                };

                // Publica a mensagem
                await Task.Run(() =>
                {
                    CommonLib.Util.Write.Log("Mensagem enviada.");

                    // Uso da função para garantir a estrutura
                    EnsureRabbitMQStructure(exchange, routingKey, routingKey);

                    Channel.BasicPublish(exchange: exchange,
                        routingKey: routingKey,
                        mandatory: false,
                        basicProperties: properties,
                        body: body);
                    // Aguarda a confirmação
                    if (Channel.WaitForConfirms())
                    {
                       CommonLib.Util.Write.Log("Mensagem foi confirmada pelo RabbitMQ.");

                    }
                    else
                    {
                        CommonLib.Util.Write.Log("Erro ao confirmar o envio da mensagem.");
                    }
                    
                });
            }
            catch ( RabbitMQ.Client.Exceptions.BrokerUnreachableException ex)
            {
                // Log específico para erro de conexão com o broker
                CommonLib.Util.Write.Log($"Falha ao conectar ao RabbitMQ Broker: {ex.Message}");
            }
            catch (RabbitMQ.Client.Exceptions.AlreadyClosedException ex)
            {
                // Log para conexão já fechada
                CommonLib.Util.Write.Log($"O canal já foi fechado: {ex.Message}");
            }
            catch (Exception ex)
            {
                // Log para outras exceções
                CommonLib.Util.Write.Log($"Falha ao enviar mensagem! => '{ex.Message}'");
            }

            return false;
        }


        // Declaração da estrutura (Exchange, Queue e Binding)
        private void EnsureRabbitMQStructure(string exchange, string queue, string routingKey)
        {
            // Declara o Exchange (se ainda não existir)
            Channel.ExchangeDeclare(exchange: exchange, type: "direct", durable: true, autoDelete: false);

            // Declara a Fila (se ainda não existir)
            Channel.QueueDeclare(queue: queue,
                                 durable: true,
                                 exclusive: false,
                                 autoDelete: false,
                                 arguments: null);

            // Liga a Fila ao Exchange com a routingKey
            Channel.QueueBind(queue: queue,
                              exchange: exchange,
                              routingKey: routingKey);
        }

        private void Channel_CallbackException(object sender, global::RabbitMQ.Client.Events.CallbackExceptionEventArgs e)
        {
            CommonLib.Util.Write.Log(e.Exception.Message + Environment.NewLine + e.Exception.StackTrace);
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
}

/*
 using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Lacqua.RabbitMQService
{

    public class MessageQueueProducer : IMessageQueueProducer, IDisposable
    {
        private readonly ConnectionFactory _connectionFactory;
        private readonly MessageQueueOption _options;
        private readonly IConnection _connection;
        private bool _disposedValue;
        ILogger<MessageQueueProducer> _logger;

        public MessageQueueProducer(ConnectionFactory connectionFactory, MessageQueueOption options)
        {
            try
            {
                _connectionFactory = connectionFactory;
                _options = options;
               
                _connection = _connectionFactory.CreateConnection();
                _connection.CallbackException += (sender, args) =>
                {
                    CommonLib.Util.Write.Log($"CallbackException: {args.Exception.Message}");
                    CommonLib.Util.Write.Log($"RabbitConnectCallbackException: {args.Exception.Message}");
                };

               
                Channel = _connection.CreateModel();


            }
            catch (RabbitMQ.Client.Exceptions.ConnectFailureException connectEx)
            {
                // Erro específico de falha de conexão
                _logger.LogError($"Falha ao conectar ao RabbitMQ: {connectEx.Message}");
                CommonLib.Util.Write.Log($"Erro de Conexão: {connectEx.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {connectEx.StackTrace}");
            }
            catch (ArgumentException argEx)
            {
                // Erro relacionado a parâmetros inválidos
                _logger.LogError($"Argumento inválido: {argEx.Message}");
                CommonLib.Util.Write.Log($"Erro de Argumento: {argEx.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {argEx.StackTrace}");
            }
            catch (Exception ex)
            {
                // Captura exceções gerais
                _logger.LogError($"Erro geral ao conectar o Rabbit: {ex.Message}");
                CommonLib.Util.Write.Log($"Erro: {ex.Message}");
                CommonLib.Util.Write.Log($"Stack Trace: {ex.StackTrace}");
            }


        }

        public IModel Channel { get; }
        public MessageQueueOption Options => _options;

        public async Task<bool> PublishQueueMessage<T>(string queue, T message)
        {
            Channel.QueueDeclare(queue, exclusive: false, durable: true, autoDelete: false);

            var json = JsonConvert.SerializeObject(message);
            var body = Encoding.UTF8.GetBytes(json);

            Channel.BasicPublish(exchange: "", routingKey: queue, body: body);
            return true;
        }
        public async Task<bool> PublishExchangeMessage<T>(string exchange, string routingKey, T message)
        {
            try
            {
                if (Channel == null || !Channel.IsOpen)
                {
                    throw new InvalidOperationException("O canal RabbitMQ não está disponível ou foi fechado.");
                }

                Channel.ConfirmSelect();

                // Serializa a mensagem
                var json = JsonConvert.SerializeObject(message);
                var body = Encoding.UTF8.GetBytes(json);

                // Configura as propriedades da mensagem
                var properties = Channel.CreateBasicProperties();
                properties.ContentType = "application/json";
                properties.DeliveryMode = 2; // Persistente

                // Eventos do canal (opcional para logs adicionais)
                Channel.CallbackException += (sender, args) =>
                {
                    
                    CommonLib.Util.Write.Log($"CallbackException: {args.Exception.Message}");
                };
                Channel.FlowControl += (sender, args) =>
                {
                    CommonLib.Util.Write.Log("Controle de fluxo acionado.");
                };

                // Publica a mensagem
                await Task.Run(() =>
                {
                    CommonLib.Util.Write.Log("Mensagem enviada.");
                    Channel.BasicPublish(exchange: exchange,
                        routingKey: routingKey,
                        mandatory: false,
                        basicProperties: properties,
                        body: body);
                    // Aguarda a confirmação
                    if (Channel.WaitForConfirms())
                    {
                       CommonLib.Util.Write.Log("Mensagem foi confirmada pelo RabbitMQ.");

                    }
                    else
                    {
                        CommonLib.Util.Write.Log("Erro ao confirmar o envio da mensagem.");
                    }
                    
                });
            }
            catch ( RabbitMQ.Client.Exceptions.BrokerUnreachableException ex)
            {
                // Log específico para erro de conexão com o broker
                CommonLib.Util.Write.Log($"Falha ao conectar ao RabbitMQ Broker: {ex.Message}");
            }
            catch (RabbitMQ.Client.Exceptions.AlreadyClosedException ex)
            {
                // Log para conexão já fechada
                CommonLib.Util.Write.Log($"O canal já foi fechado: {ex.Message}");
            }
            catch (Exception ex)
            {
                // Log para outras exceções
                CommonLib.Util.Write.Log($"Falha ao enviar mensagem! => '{ex.Message}'");
            }

            return false;
        }




        private void Channel_CallbackException(object sender, global::RabbitMQ.Client.Events.CallbackExceptionEventArgs e)
        {
            CommonLib.Util.Write.Log(e.Exception.Message + Environment.NewLine + e.Exception.StackTrace);
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
}


 
 */