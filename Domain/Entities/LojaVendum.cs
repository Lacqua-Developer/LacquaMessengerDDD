using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class LojaVendum
    {
        [Key]
        public string? CodigoFilial { get; set; }
        public int? Ticket { get; set; }
        public DateTime? DataVenda { get; set; }
        public decimal? ValorVenda { get; set; }
    }
}
