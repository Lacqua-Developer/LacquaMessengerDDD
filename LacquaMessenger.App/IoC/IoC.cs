using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using LacquaMessenger.Domain.Repositories;
using LacquaMessenger.Infra;
using LacquaMessenger.Core.Entities;
using Microsoft.EntityFrameworkCore;
using LacquaMessenger.Domain.Service;
using LacquaMessenger.Domain.Models;
using LacquaMessenger.Core.UseCase;
using LacquaMessenger.Domain.UseCases;
namespace LacquaMessenger.App
{
    public static class IoC
    {

        public static IServiceCollection AddUseCase<T>(this IServiceCollection services) where T : Base
        {

            services.AddScoped<IUseCase<T>, UseCase<T>>();

            // Registra a implementação do repositório e a interface
            services.AddScoped<IRepository<T>, Repository<T>>();

            // Registra a implementação do serviço e a interface
            services.AddScoped<IService<T>, EntityService<T>>();

            services.AddScoped<Context>();
            return services;
        }

        public static IServiceCollection AddInfra<T>(this IServiceCollection services) where T : Base
        {
            // Registra a implementação do repositório e a interface
            services.AddScoped<IRepository<T>, Repository<T>>();

            // Registra a implementação do serviço e a interface
            services.AddScoped<IService<T>, EntityService<T>>();

            services.AddScoped<Context>();
            return services;
        }


    }
}
