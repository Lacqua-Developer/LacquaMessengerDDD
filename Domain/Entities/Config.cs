using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class Config : Base
    {
        public Config()
        { }

        public Config( string _Telefone, string _Senha, string _Apelido, bool _Desabilitado,
                       bool _ChipLista, DateTime _DataEnvio, int _QtdeEnvio, bool _StatusConeccao, string _TelFormat)
        {


            Telefone = _Telefone;
            Senha = _Senha;
            Apelido = _Apelido;
            Desabilitado = Desabilitado;
            ChipLista = _ChipLista;
            DataEnvio = _DataEnvio;
            QtdeEnvio = _QtdeEnvio;
            StatusConeccao = _StatusConeccao;
            TelFormat = _TelFormat;


        }

     
        public string Telefone { get; set; }
        public string Senha { get; set; }
        public string Apelido { get; set; }
        public bool Desabilitado { get; set; }
        public bool ChipLista { get; set; }
        public DateTime DataEnvio { get; set; }
        public int QtdeEnvio { get; set; }
        public bool StatusConeccao { get; set; }
        public string TelFormat { get; set; }


    }
}
