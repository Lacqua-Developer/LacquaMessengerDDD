using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Log
    {
        [Key]
        public int IdLog { get; set; }
        public DateTime? Data { get; set; }
        public string? Tipo { get; set; }
        public string? Mensagem { get; set; }
    }
}
