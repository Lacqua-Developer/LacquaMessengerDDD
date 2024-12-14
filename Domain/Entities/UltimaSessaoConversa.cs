using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class UltimaSessaoConversa
    {
        [Key]
        public int IdContato { get; set; }
        public int? IdConversa { get; set; }
        public int? IdSession { get; set; }
    }
}
