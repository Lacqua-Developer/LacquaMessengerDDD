using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class Campanha : Base
    {

        public Campanha()
        { }

        public Campanha(int id)
        {
            Id = id;
        }


      
        public string NomeCampanha { get; set; }
        public DateTime DataCriacao { get; set; }
        public DateTime DataEnvio { get; set; }
        public DateTime DataTermino { get; set; }
        public int QtdeContact { get; set; }
        
        public string BancoDados { get; set; }

        public ICollection<Lista> Lista { get; }
        public ICollection<FluxoAtendimento> FluxoAtendimento { get; set; }

    }
}
