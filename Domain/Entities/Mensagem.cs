using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Mensagem
    {
        [Key]
        public int IdMensagem { get; set; }
        public string? NomeMensagem { get; set; }
        public int? Tipo { get; set; }
        public string? Texto { get; set; }

    }
}
