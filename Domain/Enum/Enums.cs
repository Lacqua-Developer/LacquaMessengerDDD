using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Enum
{
    public enum TipoMensagem
    {
        Informacao = 1,
        Validacao = 2,
        Confirmacao = 3,
        Saida = 4,
        Erro = 5
    }

    public enum TipoFluxo
    {
        Informacao = 1,
        Validacao = 2,
        Confirmacao = 3,
        Questionamento = 4,
        Opcoes = 5,
        Transfere = 6
    }

    public enum TipoPermissao
    {
        Administrador = 1,
        Supervisor = 2,
        Operador = 3
    }

    public enum TipoOrigem
    {
        WhatsApp = 1
    }
}
