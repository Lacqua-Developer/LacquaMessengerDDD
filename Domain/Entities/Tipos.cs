using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Tipos : Base
    {
        public Tipos() { }

        public TiposReferencia Referencia { get; set; }
        public string Valor { get; set; }
        public string Descricao { get; set; }
    }

    public enum TiposReferencia
    {
        TipoMensagem,
        TipoFluxo
    }
}
