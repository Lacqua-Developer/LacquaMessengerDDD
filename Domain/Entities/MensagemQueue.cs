using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class MensagemQueue
    {
        [Key]
        public int IdQueue { get; set; }
        public bool? Status { get; set; }
        public int? ConversaIdconversa { get; set; }
        public DateTime? DataEnvio { get; set; }
        public int? Origem { get; set; }
        public DateTime? UltimaTentativa { get; set; }
        public bool? Erro { get; set; }
        public string? Mensagem { get; set; }
        public bool? Tentando { get; set; }
    }
}
