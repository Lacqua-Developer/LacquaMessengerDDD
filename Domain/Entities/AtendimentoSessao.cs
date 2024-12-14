using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class AtendimentoSessao
    {
        [Key]
        public int IdAtendimentoSessao { get; set; }
        public int? SessaoIdSessao { get; set; }
        public int? ConversaIdConversa { get; set; }

    }
}
