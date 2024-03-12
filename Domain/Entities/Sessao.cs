using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class Sessao : Base    {
        public Sessao() { }

        public int ContatoId { get; set; }
        public int UsuarioId { get; set; }
        public DateTime DataCriacao { get; set; }
        public DateTime DataAtendimento { get; set; }
        public DateTime DataEncerramento { get; set; }
        public int ConversaId { get; set; }
        public int ConfigId { get; set; }
        public int QtdeNLido { get; set; }

        public Usuario Usuario { get; set; }
        public Contato Contato { get; set; }
        public Conversa Conversa { get; set; }
        public Config Config { get; set; }


    }
}
