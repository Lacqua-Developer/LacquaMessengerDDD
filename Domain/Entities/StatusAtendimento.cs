using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class StatusAtendimento : Base
    {
        public StatusAtendimento() { }
 
        public int ContatoId { get; set; }
        public int ConversaId { get; set; }
        public int ListaId { get; set; }
        public int TipoFluxo { get; set; }
        public int FluxoOrigem { get; set; }
        public int IdFluxoDestinoEsperado { get; set; }
        public int IdFluxoDestinoInesperado { get; set; }
        public int IdFluxoDesistencia { get; set; }
        public int IdFluxoOfensa { get; set; }
        public string Resposta { get; set; }
        public string RespostaEsperada { get; set; }
        public bool Finalizado { get; set; }
        public string NomeCampanha { get; set; }
        public int CampanhaId { get; set; }
        public Campanha Campanha { get; set; }
        public Contato Contato { get; set; }
        public Conversa Conversa { get; set; }
        public FluxoAtendimento FluxoDestinoEsperado { get;  }
        public FluxoAtendimento FluxoDestinoInesperado { get;  }
        public FluxoAtendimento FluxoDesistencia { get;  }
        public FluxoAtendimento FluxoOfensa { get;  }
    }
}
