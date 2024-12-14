using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Usuario : LacquaMessenger.Core.Entities.Base
    {
        [Key]
        public int IdUsr { get; set; }
        public string? NomeUsuario { get; set; }
        public string? IdExterno { get; set; }
        public int? Permissao { get; set; }
        public string? Senha { get; set; }
        public string? Email { get; set; }
        public string? Login { get; set; }
        public bool? Status { get; set; }
        public string? Celular { get; set; }
        public string? Confirmacao { get; set; }
        public int? ConfigIdConfig { get; set; }
        public bool? Logado { get; set; }
        public string? TokenLogin { get; set; }
    }
}
