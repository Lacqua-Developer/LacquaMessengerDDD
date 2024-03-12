using System;
using System.Linq;


namespace LacquaMessenger.Domain.Models
{
    public class WhatsUser
    {
        private string serverUrl;
        public string Nickname { get; set; }
        public string Jid { get; private set; }

        public WhatsUser(string jid, string srvUrl, string nickname = "")
        {
            this.Jid = jid;
            this.Nickname = nickname;
            this.serverUrl = srvUrl;
        }

        public static string GetJID(string target)
        {
            if (target.Length > 11)
            {
                target = target.TrimStart(new char[] { '+', '0' });
                if (!target.Contains('@'))
                {
                    //check if group message
                    if (target.Contains('-'))
                    {
                        //to group
                        target += "@g.us";
                    }
                    else
                    {
                        //to normal user
                        //target += "@" + WhatsConstants.WhatsAppServer;
                    }
                }
            }
            else
            {
                throw new Exception("Telefone com tamanho inválido, formato 55DDNNNNNNNNN");
            }
            return target;
        }

        public string GetFullJid()
        {
            return GetJID(this.Jid);
        }

        internal void SetServerUrl(string srvUrl)
        {
            this.serverUrl = srvUrl;
        }

        public override string ToString()
        {
            return this.GetFullJid();
        }
    }
}
