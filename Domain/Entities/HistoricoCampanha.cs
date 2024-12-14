using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class HistoricoCampanha
    {
        [Key]
        public int IdHistoricoCampanha { get; set; }
        public int? CampanhaIdCampanha { get; set; }
        public int? ContatoIdContato { get; set; }
        public int? ConversaIdConversa { get; set; }
        public int? ListaIdLista { get; set; }
        public int? SessaoIdSessao { get; set; }
        public int? IdEnvioLista { get; set; }
    }
}
