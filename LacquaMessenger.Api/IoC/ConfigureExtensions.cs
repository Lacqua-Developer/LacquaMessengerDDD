
using LacquaMessenger.Core;
using LacquaMessenger.Infra;
using MessageBroker.RabbitMq;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using RabbitMQ.Client;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using LacquaMessenger.Common.Extensions;



namespace LacquaMessenger.Api.IoC
{
    public static class ConfigurationExtensions
    {
        public static IServiceCollection AddJwt(this IServiceCollection services)
        {
            var key = Encoding.UTF8.GetBytes(ConfigCore.GetValue("Security:JwtKey"));

            services.AddAuthentication(_ =>
            {
                _.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                _.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

            return services;
        }

        public static IServiceCollection AddPresenter(this IServiceCollection services)
        {
            string env = "Production";

#if DEBUG 
            env = "Development";
#endif

            IConfigurationRoot configuration = new ConfigurationBuilder()
                                                .AddJsonFile("appsettings.json",
                                                                optional: false,
                                                                reloadOnChange: true)
                                                .AddJsonFile($"appsettings.{env}.json",
                                                                optional: true,
            reloadOnChange: true)
            .Build();


            services.AddTransient<Presenter.IPresenter, Presenter.Presenter>();

            return services;
        }

        public static async Task ExecuteMigrations(this IServiceProvider serviceProvider)
        {
            var dbCtx = serviceProvider.GetRequiredService<Context>();
            await dbCtx.Database.MigrateAsync().ConfigureAwait(false);
        }

        public static void ConfigureOptions(this IServiceCollection services)
        {
            services.AddOptions();

            var configures = typeof(BaseConfigureOptions<>).Assembly
                .GetTypes()
                .Where(t => !t.IsAbstract)
                .Where(t => t .IsSubclassOfGenericClass(typeof(BaseConfigureOptions<>)))
                .ToList();

            foreach (var configure in configures)
                services.ConfigureOptions(configure);
        }

        public static void AddServiceMessageQueueRabbitMq(this IServiceCollection services)
        {
            services.AddLogging();

            // Configurar ConnectionFactory como Singleton
            services.AddSingleton(sp =>
            {
                var options = sp.GetRequiredService<IOptions<MessageQueueOption>>();
                return CreateConnectionFactory(options.Value);
            });

            // Registrar MessageQueueProducer
            services.AddScoped<IMessageQueueProducer, MessageQueueProducer>();

            // Registrar MessageQueueConsumer
            services.AddScoped<IMessageQueueConsumer, MessageQueueConsumer>();
        }

        private static ConnectionFactory CreateConnectionFactory(MessageQueueOption options)
        {


            if (options.SSL)
            {
                if (!File.Exists(options.ClientCertPAth))
                    throw new Exception("Arquivos de certificados não encontrado!");
                
                if (!CommonLib.Util.TelnetChecker.IsPortOpen(options.HostName, options.Port, 300))
                    throw new Exception("Servidor Rabbit não respondendo!");

                var clientCert = new X509Certificate2(options.ClientCertPAth);
                return new ConnectionFactory
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
                        AcceptablePolicyErrors = SslPolicyErrors.RemoteCertificateNameMismatch | SslPolicyErrors.RemoteCertificateChainErrors
                    }
                };
            }

            return new ConnectionFactory
            {
                HostName = options.HostName,
                Port = options.Port,
                UserName = options.UserName,
                Password = options.Password,
                VirtualHost = options.VirtualHost
            };
        }

    }

    public class MessageQueueOptionConfigure : BaseConfigureOptions<MessageQueueOption>
    {
        private readonly IConfiguration _configuration;

        public MessageQueueOptionConfigure(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public override void Configure(MessageQueueOption options)
        {
            _configuration.GetSection("RabbitMq").Bind(options);
        }
    }

    public abstract class BaseConfigureOptions<TOptions> : IConfigureOptions<TOptions> where TOptions : class
    {
        public abstract void Configure(TOptions options);
    }


}