using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class EnvioListum
    {
        [Key]
        public int IdEnvio { get; set; }
        public int? CampanhaIdCampanha { get; set; }
        public DateTime? DataCriacao { get; set; }
        public DateTime? DataEnvio { get; set; }
        public string? UsuarioIdUsuario { get; set; }
        public DateTime? DataTermino { get; set; }
    }
}
