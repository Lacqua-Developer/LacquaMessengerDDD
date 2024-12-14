using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Relatorio
    {
        [Key] 
        public int IdRelatorio { get; set; }
        public string? Nome { get; set; }
        public int? Permissao { get; set; }
        public DateTime? DataCriacao { get; set; }
        public string? Query { get; set; }
        public bool? Toolbar { get; set; }
        public bool? Desativado { get; set; }
    }
}
