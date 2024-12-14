using LacquaMessenger.App.Interface.Service;
using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Infra;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.App.Service
{
    public class AnexoService : ProcedureService<Anexo>, IAnexoService
    {
        public AnexoService(Context context) : base(context)
        {
        }

        public string ProcedureName =>"STP_TB_ANEXO";

        public Anexo GetAnexos(Anexo retPar)
        {
            throw new NotImplementedException();
        }

        public SqlParameter[] loadParameters(Contato prop, string acao, int usuario, int campanha = 0)
        {
            throw new NotImplementedException();
        }

        public Anexo SetAnexos(Anexo retPar)
        {
            throw new NotImplementedException();
        }

        protected override Anexo MapFromReader(DbDataReader reader)
        {
            throw new NotImplementedException();
        }
    }
}
