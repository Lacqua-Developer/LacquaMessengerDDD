using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class FluxoAtendimento
    {
        [Key]
        public int IdFluxoAtendimento { get; set; }
        public int CampanhaIdCampanha { get; set; }
        public int? Tipo { get; set; }
        public int? Ordem { get; set; }
        public int? IdMensagem { get; set; }
        public int? Condicao1 { get; set; }
        public int? Condicao2 { get; set; }
        public int? Saida { get; set; }
        public string? Chave { get; set; }
        public string? NomeFluxo { get; set; }
        public bool? Finalizado { get; set; }
        public int? Ofensa { get; set; }


    }
}
