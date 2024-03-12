using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Anexo : Base
    {
        public Anexo() { }
        public Anexo(int id, int idConversa, string urlAnexo, string Arquivo)
        {
            Id = id;
            ConversaId = idConversa;
            url = urlAnexo;
            NomeArquivo = Arquivo;

        }

        public int ConversaId { get; set; }
        public string url { get; set; }
        public string chave { get; set; }
        public int EmpresaCliente { get; set; }
        public string NomeArquivo { get; set; }

        public EmpresaCliente Empresa { get; set; }
        public Conversa Conversa { get; set; }

    }
}