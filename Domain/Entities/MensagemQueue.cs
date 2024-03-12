using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class MensagemQueue : Base
    {
        public MensagemQueue() { }

        public MensagemQueue(int id, bool status, int conversa, DateTime dataenvio, int origem, bool erro, string mensagem)
        {
            Id = id;
            Status = status;
            ConversaIdconversa = conversa;
            DataEnvio = dataenvio;
            Origem = origem;
            Erro = erro;
            Mensagem = mensagem;

        }


        public bool Status { get; set; }
        public int ConversaIdconversa { get; set; }
        public DateTime DataEnvio { get; set; }
        public int Origem { get; set; }
        public Conversa Conversa { get; set; }
        public bool Erro { get; set; }
        public string Mensagem { get; set; }
        public int Tentativas { get; set; }
    }
}