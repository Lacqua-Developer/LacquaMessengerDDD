using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Parametro
    {
        [Key]
        public int IdParametro { get; set; }
        public string? NomeDoc { get; set; }
        public string? DigValidacao { get; set; }
        public int? PosicaoValidacao { get; set; }
        public int? QtdeDigitos { get; set; }
        public string? PalavraTransf { get; set; }
        public int? TempoMsg { get; set; }
        public int? MensagemSaudacao { get; set; }
        public int? MensagemErroValid { get; set; }
        public string? Desistencia { get; set; }
        public string? Ddd { get; set; }
        public string? Servidor { get; set; }
        public int? Porta { get; set; }
        public bool? Debug { get; set; }
        public int? QtdeLista { get; set; }
        public int? CampanhaIdCampanha { get; set; }
        public string? ServidorFace { get; set; }
        public string? WhatsBotSever { get; set; }
        public string? WhatsBotPort { get; set; }
        public string? ServidorAnexos { get; set; }
        public string? ServidorCaminho { get; set; }
        public string? ApiGoogle { get; set; }


    }
}
