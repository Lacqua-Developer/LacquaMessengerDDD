using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Entities
{
    public class Tipos
    {
        [Key]
        public int IdTipo { get; set; }
        public string? Referencia { get; set; }
        public string? Valor { get; set; }
        public string? Descricao { get; set; }
    }
}
