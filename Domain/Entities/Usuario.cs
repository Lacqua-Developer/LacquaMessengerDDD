using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Usuario : Base
    {
        public Usuario()
        { }

        public string? NomeUsuario { get; set; }
        public string? Id_Externo { get; set; }
        public int? Permissao { get; set; }
        public string? Senha { get; set; }
        public string? Email { get; set; }
        public string? Login { get; set; }
        public bool? Status { get; set; }
        public string? Celular { get; set; }
        public string? Confirmacao { get; set; }
        public int? IdConfig { get; set; }
        public bool? Logado { get; set; }
        public string? TokenLogin { get; set; }


    }
}
