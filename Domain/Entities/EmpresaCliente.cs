using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class EmpresaCliente
    {
        [Key]
        public int? IdEmpresa { get; set; }
        public string? Nome { get; set; }
        public string? LogoTipo { get; set; }
        public string? Instrucoes { get; set; }
    }
}
