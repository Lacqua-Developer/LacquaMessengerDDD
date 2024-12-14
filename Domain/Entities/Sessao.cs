using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class Sessao
    {
        public Sessao()
        {

        }

        [Key]
        public int IdSession { get; set; }
        public int? ContatoIdcontato { get; set; }
        public int? UsuarioIdUsuario { get; set; }
        public DateTime? DataCriacao { get; set; }
        public DateTime? DataAtendimento { get; set; }
        public DateTime? DataEncerramento { get; set; }
        public int? ConfigIdconfig { get; set; }
        public int? Origem { get; set; }
        public int? Classificacao { get; set; }
        public int? Motivo { get; set; }
        public string? Observacao { get; set; }

    }
}
