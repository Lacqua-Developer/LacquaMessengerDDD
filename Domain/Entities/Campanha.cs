using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Campanha
    {
        public Campanha()
        {

        }

        [Key]
        public int IdCampanha { get; set; }
        public string? NomeCampanha { get; set; }
        public DateTime? DataCriacao { get; set; }
        public DateTime? DataEnvio { get; set; }
        public DateTime? DataTermino { get; set; }
        public int? Integracao { get; set; }

    }
}
