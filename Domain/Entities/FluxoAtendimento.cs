using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class FluxoAtendimento : Base
    {
        public FluxoAtendimento() { }
  
        public int CampanhaId { get; set; }
        public int Tipo { get; set; }
        public int Ordem { get; set; }
        public int MensagemId { get; set; }
        public int Condicao1 { get; set; }
        public int Condicao2 { get; set; }
        public int Saida { get; set; }
        public int Ofensa { get; set; }
        public string Chave { get; set; }
        public string NomeFluxo { get; set; }
        public bool Finalizado { get; set; }

        public Campanha Campanha { get; set; }
        public Mensagem Mensagem { get; set; }

    }
}
