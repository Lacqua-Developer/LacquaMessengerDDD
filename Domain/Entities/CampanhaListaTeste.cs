using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class CampanhaListaTeste
    {
        [Key]
        public int? IdCampanha { get; set; }
        public int? IdListaTeste { get; set; }
    }
}
