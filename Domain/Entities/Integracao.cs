using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Integracao
    {
        [Key]
        public int IdIntegracao { get; set; }
        public int? CampanhaIdCampanha { get; set; }
        public int? Tipo { get; set; }
        public string? Text { get; set; }
        public string? Usuario { get; set; }
        public string? Senha { get; set; }
        public string? Url { get; set; }
        public DateTime? PrimVencto { get; set; }
        public int? TipoBusca { get; set; }
    }
}
