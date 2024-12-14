using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class StatusAtendimento
    {
        [Key]
        public int IdStatusAtendimento { get; set; }
        public int ContatoIdContato { get; set; }
        public int? ConversaIdconversa { get; set; }
        public int? TipoFluxo { get; set; }
        public int? FluxoOrigem { get; set; }
        public int? FluxoDestinoEsperado { get; set; }
        public int? FluxoDestinoInesperado { get; set; }
        public string? Resposta { get; set; }
        public string? RespostaEsperada { get; set; }
        public bool? Finalizado { get; set; }
        public int? IdLista { get; set; }
    }
}
