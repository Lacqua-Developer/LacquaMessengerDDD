using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Ofensa
    {
        [Key]
        public int Id { get; set; }
        public string? Palavra { get; set; }
        public bool? Composta { get; set; }
    }
}
