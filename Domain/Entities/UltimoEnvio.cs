using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class UltimoEnvio
    {
        [Key]
        public int? ContatoIdContato { get; set; }
        public int? IdEnvio { get; set; }
        public int? Idlista { get; set; }
    }
}
