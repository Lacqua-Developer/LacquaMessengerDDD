using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Servico
    {
        [Key]
        public int IdServico { get; set; }
        public string? Nome { get; set; }
        public int? Regra { get; set; }
        public string? Site { get; set; }
        public string? BancoDados { get; set; }
        public string? Usuario { get; set; }
        public string? Senha { get; set; }
        public string? Token { get; set; }
    }
}
