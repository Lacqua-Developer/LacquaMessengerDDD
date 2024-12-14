using LacquaMessenger.Core.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Contato : Base
    {


        [Key]
        public int IdContato { get; set; }
        public string? NomeInformado { get; set; }
        public string? Documento { get; set; }
        public string? NomeDoc { get; set; }
        public string? Codigo { get; set; }
        public string? IdWhatsApp { get; set; }
        public string? Telefone { get; set; }
        public string? UserWhatsApp { get; set; }
        public string? ClienteExterno { get; set; }
        public string? Cadastro { get; set; }
        public string? Status { get; set; }
        public string? NomeRetornado { get; set; }
        public DateTime? UltimoAcesso { get; set; }
        public string? Email { get; set; }
        public string? FaceId { get; set; }
        public string? FaceRecipentId { get; set; }
        public string? Sexo { get; set; }
        public string? FaceMsgId { get; set; }
        public string? ImageProfile { get; set; }
        public int? IdConfig { get; set; }
        public DateTime? DataAtualizacao { get; set; }
        public int CampanhaIdCampanha { get; set; }


    }
}
