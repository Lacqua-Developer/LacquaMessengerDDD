using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class Contato : Base
    {
        public Contato()
        {

        }

        public Contato(int id)
        {
            Id = id;
        }


        public string NomeInformado { get; set; }
        public string Documento { get; set; }
        public string NomeDoc { get; set; }
        public string Codigo { get; set; }
        public string IdWhatsApp { get; set; }
        public string Telefone { get; set; }
        public string UserWhatsApp { get; set; }
        public string ClienteExterno { get; set; }
        public string Cadastro { get; set; }
        public string Status { get; set; }
        public string NomeRetornado { get; set; }
        public int QtdeNLido { get; set; }
        public string Email { get; set; }
        public string FaceId { get; set; }
        public string FaceRecipentId { get; set; }
        public string Sexo { get; set; }
        public string FaceMsgId { get; set; }
        public int CampanhaIdCampanha { get; set; }
        public string ImageProfile { get; set; }
        public int IdConfig { get; set; }
        public DateTime UltimoAcesso { get; set; }
        public Lista Lista { get; set; }


        public ICollection<OpccaoLista> OpcaoLista { get; }
        public ICollection<Conversa> Conversa { get; }
        // IdContato, NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status, NomeRetornado, UltimoAcesso, Email, FaceId, FaceRecipentId, Sexo, FaceMsgId

    }


}
