namespace LacquaMessenger.Api.Model
{
    public class MessageProducer
    {
        public string? Exchange { get; set; } // tipo:Espera,
        public string? RoutingKey { get; set; }
        public string? Message { get; set; }
    }
}
