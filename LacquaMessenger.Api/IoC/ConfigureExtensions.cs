using AutoMapper;
using LacquaMessenger.Core;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;


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



    }
}