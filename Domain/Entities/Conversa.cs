using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Conversa
    {


        [Key]
        public int IdConversa { get; set; }
        public int UsuariosIdUsr { get; set; }
        public int? ContatosIdContato { get; set; }
        public string? IdConversaWhats { get; set; }
        public string? Sentido { get; set; }
        public string? Destino { get; set; }
        public bool? Recebido { get; set; }
        public bool? Lido { get; set; }
        public DateTime? Data { get; set; }
        public string? Mensagem { get; set; }
        public int? ConfigIdConfig { get; set; }
        public bool? Enviada { get; set; }
        public bool? LidoChat { get; set; }
        public int? Origem { get; set; }
        public int? Classificacao { get; set; }


    }
}
