using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Anexo
    {
        [Key]
        public int IdAnexo { get; set; }
        public int? ConversasIdconversa { get; set; }
        public string? Url { get; set; }
        public string? Chave { get; set; }
        public int? EmpresaClienteId { get; set; }
        public string? NomeArquivo { get; set; }
        public DateTime? DataEnvio { get; set; }
        public string? Tipo { get; set; }
    }
}
