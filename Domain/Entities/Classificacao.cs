using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Classificacao
    {
        [Key]
        public int IdClas { get; set; }
        public string? Nome { get; set; }
        public int? Retorno { get; set; }
        public int? Ordem { get; set; }
        public int? Peso { get; set; }
    }
}
