using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Core.Security;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LacquaMessenger.Domain.UseCases;

namespace LacquaMessenger.App.Security
{
    public class Auth
    {
        private readonly IUseCase<Usuario> _useCase;

        public Auth(IUseCase<Usuario> useCase)
        {
            _useCase = useCase;
        }
        public Usuario Authenticate(string? username, string? password) {
            var SenhaCrypt =  Crypto.Encrypt(password);
            bool ret = false;

            try
            {
               var usr =  _useCase.Get().Where(l => l.Login == username && l.Senha == SenhaCrypt).FirstOrDefault();
               if (usr != null) { 
                    usr.TokenLogin =  TokenHelper.CreateToken(usr.IdUsr, usr.NomeUsuario,0, usr.Permissao);
                    usr.Logado = true;
                    _useCase.Update(usr);

                    //Limpa o retorno da Senha
                    usr.Senha = "";
                    return usr;
                }
            }
            catch (Exception ex)
            {

                //throw new Exception(ex.Message);

                //throw new Exception(ex.Message);
                var log = new Log();
                log.Tipo = "autentica";
                log.Data = DateTime.Now;
                log.Mensagem = ex.Message + ex.StackTrace;
                Console.WriteLine(log);
                //var metLog = new LogService();
                //metLog.setLog(log);
            }
            finally
            {

            }

            return new Usuario { Logado = false };
        }
    }
}
