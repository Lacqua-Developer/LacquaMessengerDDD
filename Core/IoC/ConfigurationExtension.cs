using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Core.IoC
{
    public static class ConfigurationExtensions
    {
        public static IServiceCollection AddSharedServices(this IServiceCollection services, IConfiguration configuration)
        {
            //AppSettings _appSettings = configuration.Get<AppSettings>();
            //services.AddSingleton<IAppSettings, AppSettings>(x => _appSettings);

            //EmailSettings _emailSettings = configuration.GetSection("EmailSettings").Get<EmailSettings>();
            //services.AddSingleton<IEmailSettings, EmailSettings>(x => _emailSettings);

            //services.AddTransient<IEmailService, EmailService>();



                // Adicionar Mediator
                //services.AddMediatR(typeof(Startup)); // Substitua 'Startup' pela classe raiz do seu projeto
            

            return services;
        }
    }
}
