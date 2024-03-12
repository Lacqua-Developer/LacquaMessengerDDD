using System;
using LacquaMessenger.Core.Entities;
using LacquaMessenger.Domain.Models;

namespace LacquaMessenger.Domain.Entities
{
    public class Conversa : Base
    {
        public Conversa() { }

        public Conversa(int IdContato, int origem)
        {
            ContadoId = IdContato;
            Origem = origem;
        }

        public Conversa(int IdConversaPar)
        {
            Id = IdConversaPar;
        }

        public Conversa(int idconvesa, string idConversaWhats, bool recebido)
        {
            Id = idconvesa;
            IdConversaWhats = idConversaWhats;
            Recebido = recebido;
        }


        public int UsuarioId { get; set; }
        public int ContadoId { get; set; }
        public int ConfigId { get; set; }
        public int Origem { get; set; }
        public string IdConversaWhats { get; set; }
        public string Sentido { get; set; }
        public string Destino { get; set; }
        public bool Recebido { get; set; }
        public bool Lido { get; set; }
        public bool Enviado { get; set; }
        public DateTime Data { get; set; }
        public string Mensagem { get; set; }
        public int dias { get; set; }

        public Usuario Usuario { get; set; }
        public Contato Contato { get; set; }
        public Config Config { get; set; }
        
 

    }
}
