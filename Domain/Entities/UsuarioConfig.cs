using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class UsuarioConfig
    {
        [Key]
        public int IdUsr { get; set; }
        [Key]
        public int IdConfig { get; set; }
    }
}
