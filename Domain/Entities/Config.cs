using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Config : LacquaMessenger.Core.Entities.Base
    {
        [Key]
        public int IdConfig { get; set; }
        public string? Telefone { get; set; }
        public string? Senha { get; set; }
        public string? Apelido { get; set; }
        public bool? Desativado { get; set; }
        public bool? ChipLista { get; set; }
        public DateTime? DataEnvio { get; set; }
        public int? QtdeEnvio { get; set; }
        public bool? StatusConeccao { get; set; }
        public int? EquipeIdEquipe { get; set; }
    }
}
