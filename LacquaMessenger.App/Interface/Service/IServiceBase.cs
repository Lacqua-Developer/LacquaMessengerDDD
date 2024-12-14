using LacquaMessenger.Domain.Entities;
using System.Data.SqlClient;


namespace LacquaMessenger.App.Interface.Service
{
    
    public interface IServiceBase
    {
        string ProcedureName { get;   }
        SqlParameter[] loadParameters(Contato prop, String acao, int usuario, int campanha = 0);
    }
}
