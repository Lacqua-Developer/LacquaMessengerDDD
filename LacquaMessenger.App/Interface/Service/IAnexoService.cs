using LacquaMessenger.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.App.Interface.Service
{
    public interface IAnexoService : IServiceBase
    {
        /// <summary>
        /// Insere ou atualiza os dados do anexo.
        /// </summary>
        /// <param name="retPar">Objeto do tipo Anexo contendo os dados.</param>
        /// <returns>O objeto Anexo atualizado ou inserido.</returns>
        Anexo SetAnexos(Anexo retPar);

        /// <summary>
        /// Obtém os dados de um anexo.
        /// </summary>
        /// <param name="retPar">Objeto do tipo Anexo contendo os critérios de busca.</param>
        /// <returns>O objeto Anexo correspondente aos critérios de busca.</returns>
        Anexo GetAnexos(Anexo retPar);
    }
}
