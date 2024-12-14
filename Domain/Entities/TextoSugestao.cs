using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class TextoSugestao
    {
        [Key]
        public int IdSugest { get; set; }
        public string? Texto { get; set; }
        public int? ConfigIdConfig { get; set; }
        public string? Nome { get; set; }
    }
}
