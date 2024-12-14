using LacquaMessenger.Domain.Entities;
using static LacquaMessenger.App.Service.ContatoService;

namespace LacquaMessenger.App.Interface.Service
{
    public interface IContatoService : IServiceBase
    {


        Task<List<Contato>> getContatosLight(Contato retPar, int idUsr = -1);

        Task<List<Contato>> getContatoConversa(int Idcontato);

        Task<List<Contato>> getContatos_chave(string chave);

        Task<List<Contato>> getContatos(Contato retPar, int idUsr = -1);

        Task<List<Contato>> getContatosLista(int idUsr, int idCampanha);

        Task<Contato> getLiscaContato(Contato contato, int idCampanha);

        Task<bool> IniciaSessao(int IdSessao, int IdUsr);

        Task<List<Contato>> getContatosSessaot(int idUsr);

        Task<List<Contato>> getContatosUsrLight(int idUsr);

        Task<List<Contato>> getContatosSessao(int idUsr);

        Task< List<Contato>> getContatosUsr(int idUsr);

        Task<Contato> getContato(int idC, string telefone, int idUsr = -1);

        Task<Contato> setContato(Contato ret);

        Task<int> setProfile(Contato ret);

       
    }
}
