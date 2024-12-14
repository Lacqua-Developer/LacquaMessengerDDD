using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class OpcaoListum
    {
        [Key]
        public int IdOpcaoLista { get; set; }
        public int? ListaIdlista { get; set; }
        public int? Ordem { get; set; }
        public string? Opcao { get; set; }

    }
}
