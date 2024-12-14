using LacquaMessenger.App.Interface.Service;
using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Infra;
using Microsoft.Data.SqlClient; // Use o provedor correto, dependendo do banco
using Microsoft.SqlServer.Management.SqlParser.Metadata;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using static LacquaMessenger.App.Service.ContatoService;

namespace LacquaMessenger.App.Service
{
    public class ContatoService : ProcedureService<Contato> , IContatoService
    {
        public string ProcedureName => "STP_TB_CONTATO";

        public class MsgCheck
        {
            public int Contatos_IdContato { get; set; }
            public int QtdeNLido { get; set; }
            public int UltimaMsg { get; set; }
            public DateTime DataUltimaMsg { get; set; }
        }


        public ContatoService(Context context) : base(context)
        {
        }

        public async Task<List<Contato>> GetContatosAsync(Contato retPar, int idUsr = -1)
        {
            SqlParameter[] parameters = loadParameters(retPar, "GET", idUsr);

            return await ExecuteProcedureListAsync(ProcedureName, parameters.ToArray());
        }

        protected override Contato MapFromReader(DbDataReader reader)
        {
            return DataReaderMapper.MapToClass<Contato>(reader);
        }
      

        private SqlParameter[] loadParameters(Contato prop, String acao, int usuario, int campanha = 0)
        {
            SqlParameter[] parametersList;
            parametersList = new SqlParameter[]
            {
                new SqlParameter("@TIPO_ACAO",acao),
                new SqlParameter("@ID",prop.IdContato),
                new SqlParameter("@NOME_INFORMADO", prop.NomeInformado),
                new SqlParameter("@DOCUMENTO", prop.Documento),
                new SqlParameter("@NOMEDOC", prop.NomeDoc),
                new SqlParameter("@CODIGO", prop.Codigo),
                new SqlParameter("@IDWHATSAPP", prop.IdWhatsApp),
                new SqlParameter("@TELEFONE", prop.Telefone),
                new SqlParameter("@USERWHATSAPP", prop.UserWhatsApp),
                new SqlParameter("@CLIENTEEXTERNO", prop.ClienteExterno),
                new SqlParameter("@CADASTRO", prop.Cadastro),
                new SqlParameter("@STATUS", prop.Status),
                new SqlParameter("@NOMERETORNADO", prop.NomeRetornado),
                new SqlParameter("@ULTACESSO", prop.UltimoAcesso),
                new SqlParameter("@IDUSUARIO",usuario),
                new SqlParameter("@IDCAMPANHA",campanha) ,
                new SqlParameter("@EMAIL",prop.Email) ,
                new SqlParameter("@FACEID",prop.FaceId) ,
                new SqlParameter("@FACERECIPENTID",prop.FaceRecipentId) ,
                new SqlParameter("@SEXO",prop.Sexo) ,
                new SqlParameter("@FACEMSGID",prop.FaceMsgId) ,
                new SqlParameter("@CAMPANHA_IDCAMPANHA",  campanha > 0 ? campanha : prop.CampanhaIdCampanha > 0 ? prop.CampanhaIdCampanha:  campanha),
                new SqlParameter("@ImageProfile",prop.ImageProfile),
                new SqlParameter("@IdConfig", prop.IdConfig)

            };
            return parametersList;



        }

        public async Task<List<Contato>> getContatosLight(Contato retPar, int idUsr = -1)
        {
            SqlParameter[] parameters = loadParameters(retPar, "GET", idUsr);

            return await ExecuteProcedureListAsync(ProcedureName, parameters.ToArray());
        }

        public async Task<List<Contato>> getContatoConversa(int Idcontato)
        {
            SqlParameter[] parameters = loadParameters(new Contato { IdContato = Idcontato }, "GET", -1);

            return await ExecuteProcedureListAsync(ProcedureName, parameters.ToArray());
        }

        public Task<List<Contato>> getContatos_chave(string chave)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatos(Contato retPar, int idUsr = -1)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatosLista(int idUsr, int idCampanha)
        {
            throw new NotImplementedException();
        }

        public Task<Contato> getLiscaContato(Contato contato, int idCampanha)
        {
            throw new NotImplementedException();
        }

        public Task<bool> IniciaSessao(int IdSessao, int IdUsr)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatosSessaot(int idUsr)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatosUsrLight(int idUsr)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatosSessao(int idUsr)
        {
            throw new NotImplementedException();
        }

        public Task<List<Contato>> getContatosUsr(int idUsr)
        {
            throw new NotImplementedException();
        }

        public Task<Contato> getContato(int idC, string telefone, int idUsr = -1)
        {
            throw new NotImplementedException();
        }

        public Task<Contato> setContato(Contato ret)
        {
            throw new NotImplementedException();
        }

        public Task<int> setProfile(Contato ret)
        {
            throw new NotImplementedException();
        }

        System.Data.SqlClient.SqlParameter[] IServiceBase.loadParameters(Contato prop, string acao, int usuario, int campanha)
        {
            throw new NotImplementedException();
        }
    }


    public class MsgCheckService : ProcedureService<MsgCheck>
    {
        private const string ProcedureName = "STP_TB_CONTATO";

        public MsgCheckService(Context context) : base(context) { }

        public async Task<MsgCheck> checkMsg(int Idusr, int tipo)
        {

            MsgCheck ret = new MsgCheck();
            string cons = "";

            try
            {
                switch (tipo)
                {
                    case 1:
                        cons = "CHECK-ESPERA";
                        break;
                    case 2:
                        cons = "CKECK-ATIVOS";
                        break;
                    case 3:
                        cons = "CHECK-CONTATOS";
                        break;
                    default:
                        cons = "CHECK-ESPERA";
                        break;
                }

                SqlParameter[] parameters = loadParameters(new Contato(), cons, Idusr);
                return await ExecuteProcedureAsync(ProcedureName, parameters);

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }

            return ret;
        }

        protected override MsgCheck MapFromReader(DbDataReader reader)
        {
            return new MsgCheck
            {
                Contatos_IdContato = reader.GetInt32(reader.GetOrdinal("Contatos_IdContato")),
                QtdeNLido = reader.GetInt32(reader.GetOrdinal("QtdeNLido")),
                UltimaMsg = reader.GetInt32(reader.GetOrdinal("UltimaMsg")),
                DataUltimaMsg = reader.GetDateTime(reader.GetOrdinal("DataUltimaMsg"))
            };
        }

        private SqlParameter[] loadParameters(Contato prop, String acao, int usuario, int campanha = 0)
        {
            SqlParameter[] parametersList;
            parametersList = new SqlParameter[]
            {
                new SqlParameter("@TIPO_ACAO",acao),
                new SqlParameter("@ID",prop.IdContato),
                new SqlParameter("@NOME_INFORMADO", prop.NomeInformado),
                new SqlParameter("@DOCUMENTO", prop.Documento),
                new SqlParameter("@NOMEDOC", prop.NomeDoc),
                new SqlParameter("@CODIGO", prop.Codigo),
                new SqlParameter("@IDWHATSAPP", prop.IdWhatsApp),
                new SqlParameter("@TELEFONE", prop.Telefone),
                new SqlParameter("@USERWHATSAPP", prop.UserWhatsApp),
                new SqlParameter("@CLIENTEEXTERNO", prop.ClienteExterno),
                new SqlParameter("@CADASTRO", prop.Cadastro),
                new SqlParameter("@STATUS", prop.Status),
                new SqlParameter("@NOMERETORNADO", prop.NomeRetornado),
                new SqlParameter("@ULTACESSO", prop.UltimoAcesso),
                new SqlParameter("@IDUSUARIO",usuario),
                new SqlParameter("@IDCAMPANHA",campanha) ,
                new SqlParameter("@EMAIL",prop.Email) ,
                new SqlParameter("@FACEID",prop.FaceId) ,
                new SqlParameter("@FACERECIPENTID",prop.FaceRecipentId) ,
                new SqlParameter("@SEXO",prop.Sexo) ,
                new SqlParameter("@FACEMSGID",prop.FaceMsgId) ,
                new SqlParameter("@CAMPANHA_IDCAMPANHA",  campanha > 0 ? campanha : prop.CampanhaIdCampanha > 0 ? prop.CampanhaIdCampanha:  campanha),
                new SqlParameter("@ImageProfile",prop.ImageProfile),
                new SqlParameter("@IdConfig", prop.IdConfig)

            };
            return parametersList;



        }
    }

    /*
    public class ContatoSevice
    {
       
        private readonly Context _context;
        private const string procedure = "STP_TB_CONTATO";
        clsComandoBanco da;
        string strConexao = ConfigurationManager.AppSettings["dbWhatsApp"].ToString();

        OpccaoLista opc = new OpccaoLista();

        public ContatoSevice( Context context )
        {
            da = new clsComandoBanco(strConexao);
            _context = context;

        }


        public async Task<MsgCheck> checkMsg(int Idusr, int tipo)
        {
           
            MsgCheck ret = new MsgCheck();
            string cons = "";

            try
            {
                switch (tipo)
                {
                    case 1:
                        cons = "CHECK-ESPERA";
                        break;
                    case 2:
                        cons = "CKECK-ATIVOS";
                        break;
                    case 3:
                        cons = "CHECK-CONTATOS";
                        break;
                    default:
                        cons = "CHECK-ESPERA";
                        break;
                }

                SqlParameter[] parameters = loadParameters(new Contato(), cons, Idusr);

                DataSet ds = da.ExecuteDataSet(procedure, parameters);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    ret = Share.MapToClass<MsgCheck>(dr);
                }
            }
            catch (Exception ex)
            {
                // throw new Exception(ex.Message);
                var log = new Log();
                log.Tipo = "GetContatoCheck";
                log.Data = DateTime.Now;
                log.Mensagem = ex.Message + ex.StackTrace;

                var metLog = new LogService();
                metLog.setLog(log);

            }
            finally
            {

            }

            return ret;
        }

        public async Task<List<Contato>> getContatosLight(Contato retPar, int idUsr = -1)
        {
            List<Contato> LstRet = new List<Contato>();

            try
            {

                SqlParameter[] parameters = loadParameters(retPar, "GET", idUsr);

                DataSet ds = da.ExecuteDataSet(procedure, parameters);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Contato ret = new Contato();
                    ret = Share.MapToClass<Contato>(dr);
                    ret.QtdeNLido = CommonLib.Util.ConvertType.ConvInt(dr["QtdeNLido"].ToString());

                    ret.Sessao = Share.MapToClass<Sessao>(dr);
                    ret.Sessao.Usuario = ret.Sessao != null
                                                    ? ret.Sessao.IdSession > 0
                                                          ? Share.MapToClass<Usuario>(dr)
                                                          : null
                                                    : null;
                    LstRet.Add(ret);
                }
            }
            catch (Exception ex)
            {
                // throw new Exception(ex.Message);
                var log = new Log();
                log.Tipo = "GetContato";
                log.Data = DateTime.Now;
                log.Mensagem = ex.Message + ex.StackTrace;

                var metLog = new LogService();
                metLog.setLog(log);

            }
            finally
            {

            }

            return LstRet.OrderByDescending(x => x.UltimaMsg).ToList<Contato>();
        }

     

        public async Task<bool> IniciaSessao(int IdSessao, int IdUsr)
        {
            var ss = new SessaoService();
            var s = new Sessao();
            s.IdSession = IdSessao;
            s.Usuario_IdUsuario = IdUsr;

            var sss = await ss.initSessao(s);

            return sss.Usuario_IdUsuario == IdUsr;
        }

        public List<Contato> getContatosSessaot(int idUsr)
        {
            List<Contato> LstRet = new List<Contato>();

            try
            {

                SqlParameter[] parameters = loadParameters(new Contato(), "GETCONTATO_SESSAO", idUsr);
                DataSet ds = da.ExecuteDataSet(procedure, parameters);
                StatusAtendimentoService st = new StatusAtendimentoService();
                OpcaoListaService opcServ = new OpcaoListaService();
                OpccaoLista opc = new OpccaoLista();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Contato ret = new Contato();
                    int id = 0;
                    int QtdeNLido = 0;
                    int.TryParse(dr["IdContato"].ToString(), out id);
                    DateTime dt = DateTime.MinValue;
                    ret = Share.MapToClass<Contato>(dr);

                    ret.Sessao = Share.MapToClass<Sessao>(dr);
                    ret.Sessao.Usuario = ret.Sessao != null
                                                    ? ret.Sessao.IdSession > 0
                                                          ? Share.MapToClass<Usuario>(dr)
                                                          : null
                                                    : null;
                    ret.IdContato = id;
                    ret.QtdeNLido = QtdeNLido;
                    ret.UltimoAcesso = dt;
                    LstRet.Add(ret);
                }
            }
            catch (Exception ex)
            {
                // throw new Exception(ex.Message);
                var log = new Log();
                log.Tipo = "GetContato_usr";
                log.Data = DateTime.Now;
                log.Mensagem = ex.Message + ex.StackTrace;

                var metLog = new LogService();
                metLog.setLog(log);

            }
            finally
            {

            }

            return LstRet;
        }


        public async Task<Contato> setContato(Contato ret)
        {
            var sessao = new Sessao();

            try
            {
                var sssev = new SessaoService();
                var opcServ = new OpcaoListaService();
                StatusAtendimentoService st = new StatusAtendimentoService();
                SqlParameter[] parameters = loadParameters(ret, "SALVA", -1);
                DataSet ds = da.ExecuteDataSet(procedure, parameters);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    int id = 0;
                    int.TryParse(dr["IdContato"].ToString(), out id);
                    sessao.Contato_Idcontato = id;
                    DateTime dt = DateTime.MinValue;
                    DateTime.TryParse(dr["UltimoAcesso"].ToString(), out dt);
                    ret = Share.MapToClass<Contato>(dr);
                    ret.Lista = Share.MapToClass<Lista>(dr);
                    ret.UltimoAcesso = dt;

                    var ccc = await sssev.getOpenSessao(sessao);
                    ret.Sessao = ccc.Where(x => x.Contato_Idcontato == id).FirstOrDefault();
                    var retSt = st.StatusAtendimentoAtivo(id);
                    if (retSt.FluxoDestinoEsperado != null)
                    {
                        ret.StatusAtendimento = retSt;
                        opc.ListaIdlista = ret.Lista.IdLista;
                        ret.OpcaoLista = opcServ.getOpccaoLista(opc).ToArray();
                    }

                }
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
                var log = new Log();
                log.Tipo = "GetContato-set";
                log.Data = DateTime.Now;
                log.Mensagem = ex.Message + Environment.NewLine + ex.StackTrace;

                var metLog = new LogService();
                metLog.setLog(log);

            }
            finally
            {

            }

            return ret;
        }

        

        private SqlParameter[] loadParameters(Contato prop, String acao, int usuario, int campanha = 0)
        {
            SqlParameter[] parametersList;
            parametersList = new SqlParameter[]
            {
                new SqlParameter("@TIPO_ACAO",acao),
                new SqlParameter("@ID",prop.IdContato),
                new SqlParameter("@NOME_INFORMADO", prop.NomeInformado),
                new SqlParameter("@DOCUMENTO", prop.Documento),
                new SqlParameter("@NOMEDOC", prop.NomeDoc),
                new SqlParameter("@CODIGO", prop.Codigo),
                new SqlParameter("@IDWHATSAPP", prop.IdWhatsApp),
                new SqlParameter("@TELEFONE", prop.Telefone),
                new SqlParameter("@USERWHATSAPP", prop.UserWhatsApp),
                new SqlParameter("@CLIENTEEXTERNO", prop.ClienteExterno),
                new SqlParameter("@CADASTRO", prop.Cadastro),
                new SqlParameter("@STATUS", prop.Status),
                new SqlParameter("@NOMERETORNADO", prop.NomeRetornado),
                new SqlParameter("@ULTACESSO", prop.UltimoAcesso),
                new SqlParameter("@IDUSUARIO",usuario),
                new SqlParameter("@IDCAMPANHA",campanha) ,
                new SqlParameter("@EMAIL",prop.Email) ,
                new SqlParameter("@FACEID",prop.FaceId) ,
                new SqlParameter("@FACERECIPENTID",prop.FaceRecipentId) ,
                new SqlParameter("@SEXO",prop.Sexo) ,
                new SqlParameter("@FACEMSGID",prop.FaceMsgId) ,
                 new SqlParameter("@CAMPANHA_IDCAMPANHA",  campanha > 0 ? campanha : prop.CampanhaIdCampanha > 0 ? prop.CampanhaIdCampanha:  campanha),
                new SqlParameter("@ImageProfile",prop.ImageProfile),
                new SqlParameter("@IdConfig", prop.IdConfig)

            };
            return parametersList;



        }
    }
    */
}