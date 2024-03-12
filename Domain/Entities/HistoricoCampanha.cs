using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class HistoricoCampanha : Base
    {
        public HistoricoCampanha() { }

        public int CampanhaId { get; set; }
        public int ContatoId { get; set; }
        public int ConversaId { get; set; }
        public int ListaId { get; set; }
        public int SessaoId { get; set; }

        public Contato Contato { get; set; }
        public Campanha Campanha { get; set;}
        public Conversa Conversa { get; set; }

    }
}
