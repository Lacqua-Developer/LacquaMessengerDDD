using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Entities
{
    public class Lista
    {

        public Lista()
        { }

        public Lista(int _IdLista, int _CampanhaIdCampanha, string _Nome, string _Documento, string _NomeDocumento, string _Chave,
            string _Telefone, int _ContatoIdContato, string _UserWhatsApp, bool _Ativo, string _Status, int _ConversaIdConversa,
            bool _Desativado, int _IdUsuario, string _FacebookId, string _Email, string _Sexo)
        {
            IdLista = _IdLista;
            CampanhaIdCampanha = _CampanhaIdCampanha;
            Nome = _Nome;
            Documento = _Documento;
            NomeDocumento = _NomeDocumento;
            Chave = _Chave;
            Telefone = _Telefone;
            ContatoIdContato = _ContatoIdContato;
            UserWhatsApp = _UserWhatsApp;
            Ativo = _Ativo;
            Status = _Status;
            ConversaIdConversa = _ConversaIdConversa;
            Desativado = _Desativado;
            IdUsuario = _IdUsuario;
            FacebookId = _FacebookId;
            Email = _Email;
            Sexo = _Sexo;



        }

        [Key]
        public int IdLista { get; set; }
        public int CampanhaIdCampanha { get; set; }
        public string Nome { get; set; }
        public string Documento { get; set; }
        public string NomeDocumento { get; set; }
        public string Chave { get; set; }
        public string Telefone { get; set; }
        public int ContatoIdContato { get; set; }
        public string UserWhatsApp { get; set; }
        public bool Ativo { get; set; }
        public string Status { get; set; }
        public int ConversaIdConversa { get; set; }
        public bool Desativado { get; set; }
        public int IdUsuario { get; set; }
        public string FacebookId { get; set; }
        public string Email { get; set; }
        public string Sexo { get; set; }

        public string Anexo1 { get; set; }
        public string Anexo2 { get; set; }
        public string Anexo3 { get; set; }
        public string CodBarras { get; set; }
        public int IdEnvioLista { get; set; }
        public bool TelValidado { get; set; }
        public int integracao { get; set; }

        public bool enviado { get; set; }
        public DateTime DtEnvio { get; set; }

        public Conversa Conversa { get; set; }
        public Usuario usuario { set; get; }
        public OpccaoLista[] OpcaoLista { get; set; }

    }
}
