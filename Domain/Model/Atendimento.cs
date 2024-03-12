using LacquaMessenger.Domain.Entities;

namespace LacquaMessenger.Domain.Models
{
    public class Atendimento
    {
        public Contato Contato { get; set; }
        public Sessao Sessao { get; set; }
        public Usuario Usuario { get; set; }
        public Conversa[] Conversa { get; set; }
        public Campanha Campanha { get; set; }
        public StatusAtendimento StatusAtendimeto { get; set; }
    }
}
