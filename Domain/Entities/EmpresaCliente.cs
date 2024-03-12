using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class EmpresaCliente :Base
    {
        public EmpresaCliente() { }

        public string Nome { get; set; }
        public string Logotipo { get; set; }
        public string Instrucoes { get; set; }

    }
}