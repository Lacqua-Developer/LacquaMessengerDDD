using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Parametro : Base
    {
        public Parametro() { }

        public string NomeDoc { get; set; }
        public string DigValidacao { get; set; }
        public int PosicaoValidacao { get; set; }
        public int QtdeDigitos { get; set; }
        public string PalavraTransf { get; set; }
        public int TempoMsg { get; set; }
        public int IdMensagemSaudacao { get; set; }
        public int IdMensagemErroValid { get; set; }
        public string Desistencia { get; set; }
        public string DDD { get; set; }
        public string Servidor { get; set; }
        public int porta { get; set; }
        public bool Debug { get; set; }
        public string ServidorFace { get; set; }
        public string WhatsBotSever { get; set; }
        public string WhatsBotPort { get; set; }
        public int CampanhaIdcampanha { get; set; }
        public string ServidorCaminho { get; set; }
        public string ServidorAnexos { get; set; }
        public string ApiGoogle { get; set; }

        public Mensagem MensagemSaudacao { get;  }
        public Mensagem MensagemErroValid { get;  }

    }


}
