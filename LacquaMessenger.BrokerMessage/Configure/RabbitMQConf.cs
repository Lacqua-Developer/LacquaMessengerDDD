using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using RabbitMQ.Client;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using Microsoft.Extensions.Configuration;


namespace LacquaMessenger.BrokerMessage.Configure
{
    public class RabbitMQConf
    {
        private readonly private readonly IConfiguration _configuration;
        public MessageQueueOption options { get; private set; } = new MessageQueueOption();
        public RabbitMQConf()
        {



            options.HostName = ConfigurationManager.AppSettings["HostName"].ToString();
            options.UserName = ConfigurationManager.AppSettings["UserName"].ToString();
            options.Password = ConfigurationManager.AppSettings["Password"].ToString();
            options.SSL = ConfigurationManager.AppSettings["SSL"].ToString().ToLower() == "true";
            options.Port = CommonLib.Util.ConvertType.ConvInt(ConfigurationManager.AppSettings["Port"].ToString());
            options.ClientCertPAth = ConfigurationManager.AppSettings["ClientCertPAth"].ToString();
            options.clientKeyPath = ConfigurationManager.AppSettings["clientKeyPath"].ToString();
            options.VirtualHost = ConfigurationManager.AppSettings["VirtualHost"].ToString();

            if (!File.Exists(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, options.ClientCertPAth)))
            {
               CommonLib.Util.Write.Log($"Certificado não encontrado em {Path.Combine(AppDomain.CurrentDomain.BaseDirectory, options.ClientCertPAth)}");
                
                throw new Exception("Arquivos de certificados não encontrado!");
            }


        }

        public ConnectionFactory FactorMessageQueueRabbitMq()
        {

            ConnectionFactory factory = new ConnectionFactory();
            CommonLib.Util.Write.Log($"**************************");
            CommonLib.Util.Write.Log($"Conecção Rabbit");
            CommonLib.Util.Write.Log($"HostName = {options.HostName}");
            CommonLib.Util.Write.Log($"Port = {options.Port}");
            CommonLib.Util.Write.Log($"UserName = {options.UserName}");
            CommonLib.Util.Write.Log($"Password = {options.Password}");
            CommonLib.Util.Write.Log($"VirtualHost = {options.VirtualHost}");
            CommonLib.Util.Write.Log($"*****************************");


            if (options.SSL)
            {
                var f = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory);
                if (!File.Exists( Path.Combine(AppDomain.CurrentDomain.BaseDirectory,  options.ClientCertPAth)))
                {
                    throw new Exception($"Arquivos de certificados não encontrado! {Path.Combine(AppDomain.CurrentDomain.BaseDirectory, options.ClientCertPAth)}");

                }

                //if (!Common.Utils.TelnetChecker.IsPortOpen(options.Value.HostName, options.Value.Port, 300))
                //{
                //    throw new Exception("Servidor Rabbit não respondendo!");

                //}

                var clientCert = new X509Certificate2(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, options.ClientCertPAth)); 
                factory = new ConnectionFactory()
                {
                    HostName = options.HostName,
                    Port = options.Port,
                    UserName = options.UserName,
                    Password = options.Password,
                    VirtualHost = options.VirtualHost,
                    Ssl = new SslOption
                    {
                        Enabled = true,
                        ServerName = options.HostName,
                        Certs = new X509Certificate2Collection { clientCert },
                        AcceptablePolicyErrors =SslPolicyErrors.RemoteCertificateNameMismatch | SslPolicyErrors.RemoteCertificateChainErrors // Ajuste conforme necessário
                    }
                };
            }
            else
            {
                factory = new ConnectionFactory()
                {
                    HostName = options.HostName,
                    Port = options.Port,
                    UserName = options.UserName,
                    Password = options.Password,
                    VirtualHost = options.VirtualHost,

                };
            }

            return factory;


        }
    }
}




