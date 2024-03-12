using LacquaMessenger.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Entities
{
    public class ListaChat : Base
    {
        public ListaChat() { }  

        public int IdContato { get; set; }
        public int TipoChat { get; set; }
        public string NomeInformado { get; set; }
        public string Documento { get; set; }
        public string Telefone { get; set; }
        public string UserWhatsApp { get; set; }
        public string NomeRetornado { get; set; }
        public int QtdeNLido { get; set; }
        public string ImageProfile { get; set; }
        public int IdConfig { get; set; }
        public int UltimaMsg { get; set; }
        public string DataUltimaMsg { get; set; }
        public string UltimoAcesso { get; set; }
        public string Chip { get; set; }
        public string TelefoneChip { get; set; }
        public string Seguimento { get; set; }
        public string NomeUsuario { get; set; }
        public string StatusSessao { get; set; }
    }
}

