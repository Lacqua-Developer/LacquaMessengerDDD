using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Mensagem : Base
    {

        public Mensagem() { }
        public Mensagem(int id) { Id = id; }

        public string NomeMensagem { get; set; }
        public int Tipo { get; set; }
        public string Texto { get; set; }
        public Tipos TipoMensagem { set; get; }
    }


}
