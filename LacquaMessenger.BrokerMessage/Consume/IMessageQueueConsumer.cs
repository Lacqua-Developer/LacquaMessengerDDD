using Microsoft.EntityFrameworkCore.Metadata;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.BrokerMessage
{
    public interface IMessageQueueConsumer : IDisposable
    {
        IModel Channel { get; }
        MessageQueueOption Options { get; }

        void ConsumeQueueMessages<T>(string queue, Action<T> messageHandler);

    }
}
