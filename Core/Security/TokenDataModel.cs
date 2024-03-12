using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Core.Security
{
    public class TokenDataModel
    {
        public int? Id { get; set; }
        public string? Nome { get; set; }
        public int? IdCliente { get; set; }
        public int? TipoUsuario { get; set; }

    }
}
