using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class OpccaoLista : Base
    {
 

        public OpccaoLista()
        { }



        public int ListaId { get; set; }
        public int Ordem { get; set; }
        public string Opcao { get; set; }

        public Lista Lista { get; set; }
    }
}
