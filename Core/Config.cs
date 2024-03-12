using Microsoft.Extensions.Configuration;

namespace LacquaMessenger.Core
{
    public class ConfigCore
    {
        static IConfigurationRoot CurrentConfiguration { get; set; }

        static ConfigCore()
        {
            var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");

            var builder = new ConfigurationBuilder()
                        .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                        .AddJsonFile("appsettings.json", false, true)
                        .AddJsonFile($"appsettings.{env}.json", optional: true)
                        .AddEnvironmentVariables();

            CurrentConfiguration = builder.Build();
        }
        public static string DefaultConnectionString => CurrentConfiguration.GetConnectionString("Default");


        public static string GetValue(string key) => CurrentConfiguration.GetValue<string>(key);
        public static T GetValue<T>(string key) => CurrentConfiguration.GetValue<T>(key);
    }
}
