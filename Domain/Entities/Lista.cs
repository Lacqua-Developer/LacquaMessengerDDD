using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Lista : Base
    {

        public Lista()
        { }

        public Lista(int _IdLista, int _CampanhaIdCampanha, string _Nome, string _Documento, string _NomeDocumento, string _Chave,
            string _Telefone, int _ContatoIdContato, string _UserWhatsApp, bool _Ativo, string _Status, int _ConversaIdConversa,
            bool _Desativado, int _IdUsuario, string _FacebookId, string _Email, string _Sexo)
        {
            Id = _IdLista;
            CampanhaId = _CampanhaIdCampanha;
            Nome = _Nome;
            Documento = _Documento;
            NomeDocumento = _NomeDocumento;
            Chave = _Chave;
            Telefone = _Telefone;
            ContatoId = _ContatoIdContato;
            UserWhatsApp = _UserWhatsApp;
            Ativo = _Ativo;
            Status = _Status;
            ConversaId = _ConversaIdConversa;
            Desativado = _Desativado;
            UsuarioId = _IdUsuario;
            FacebookId = _FacebookId;
            Email = _Email;
            Sexo = _Sexo;

        }





        public int CampanhaId { get; set; }
        public string Nome { get; set; }
        public string Documento { get; set; }
        public string NomeDocumento { get; set; }
        public string Chave { get; set; }
        public string Telefone { get; set; }
        public int ContatoId { get; set; }
        public string UserWhatsApp { get; set; }
        public bool Ativo { get; set; }
        public string Status { get; set; }
        public int ConversaId { get; set; }
        public bool Desativado { get; set; }
        public int UsuarioId { get; set; }
        public string FacebookId { get; set; }
        public string Email { get; set; }
        public string Sexo { get; set; }

        public string Anexo1 { get; set; }
        public string Anexo2 { get; set; }
        public string Anexo3 { get; set; }

        public string CodBarras { get; set; }


        public ICollection<Conversa> Conversa { get; set; }
        public Usuario usuario { set; get; }
        public ICollection<OpccaoLista> OpcaoLista { get; }

    }
}
