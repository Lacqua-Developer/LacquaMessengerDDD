using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Servico :Base
    {
        public Servico()
        {

        }


        public string Nome { get; set; }
        public int Regra { get; set; }
        public string Site { get; set; }
        public string BancoDados { get; set; }
        public string Usuario { get; set; }
        public string Senha { get; set; }
        public string Token { get; set; }

    }
}