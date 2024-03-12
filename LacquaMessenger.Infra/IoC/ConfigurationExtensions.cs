using LacquaMessenger.Domain.Repositories;
using Microsoft.Extensions.DependencyInjection;
using LacquaMessenger.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LacquaMessenger.Core.Entities;
using LacquaMessenger.Domain.Service;

namespace LacquaMessenger.Infra.IoC
{
    public static class ConfigurationExtensions 
    {
        public static IServiceCollection AddInfra<T>(this IServiceCollection services) where T : Base
        {
            // Registra a implementação do repositório e a interface
            services.AddScoped(typeof(IRepository<T>), typeof(Repository<T>));

            // Registra a implementação do serviço e a interface
            services.AddScoped(typeof(IService<T>), typeof(EntityService<T>));
            return services;
        }
    }
}
