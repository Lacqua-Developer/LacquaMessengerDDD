namespace MessageBroker.RabbitMq;

public class MessageQueueOption
{
    public string HostName { get; set; } = "";
    public int Port { get; set; }
    public string UserName { get; set; } = "";
    public string Password { get; set; } = "";
    public string VirtualHost { get; set; } = "";
    public Queues QueuesNames { get; set; } = new();
    public string ClientCertPAth { get; set; } = "";
    public string clientKeyPath { get; set; } = "";
    public bool SSL { get; set; }

    public class Queues
    {
        public string RioAgendaStatus { get; set; } = "";
        public string RioAgendaVinculoIdoso { get; set; } = "";
        public string AlertaCompromissoAtraso { get; set; } = "";
    }
}
