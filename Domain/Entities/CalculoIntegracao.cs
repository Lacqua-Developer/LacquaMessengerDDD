using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class CalculoIntegracao
    {
        [Key]
        public int IdCalc { get; set; }
        public int? IntegracaoIntegracao { get; set; }
        public int? Parcelas { get; set; }
        public decimal? Desconto { get; set; }
        public DateTime? Vencimento { get; set; }
    }
}
