using LacquaMessenger.Api.IoC;
using LacquaMessenger.App;
using LacquaMessenger.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Microsoft.SqlServer.Management.SqlParser.Metadata;
using System.Configuration;
using System.Reflection;
using System.Text.Json.Serialization;


var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddJwt();
builder.Services.AddServiceMessageQueueRabbitMq();
builder.Services.ConfigureOptions();
builder.Services.AddUseCase<Config>();
builder.Services.AddUseCase<Usuario>();
builder.Services.AddInfra<Contato>();



builder.Services.AddSwaggerGen(_ =>
{
    var versionApi = Assembly.GetEntryAssembly().GetCustomAttribute<AssemblyInformationalVersionAttribute>().InformationalVersion;

    string empresa = builder.Configuration.GetValue<string>("TitleProject");

    _.SwaggerDoc("v1",
       new OpenApiInfo
       {
           Title = empresa,
           Version = "v1",
           Description = $"Documentação da API {empresa} - Versão {versionApi}"
       }
   );

    _.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
    Enter 'Bearer' [space] and then your token in the text input below.
    \r\n\r\nExample: 'Bearer 12345abcdef'",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });

    _.AddSecurityRequirement(new OpenApiSecurityRequirement() {
        {
            new OpenApiSecurityScheme {
                Reference = new OpenApiReference {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                },
                Scheme = "oauth2",
                Name = "Bearer",
                In = ParameterLocation.Header,
            },
            new List<string>()
        }
    });
});


builder.WebHost.ConfigureAppConfiguration((context, configuration) =>
{
    configuration
        .SetBasePath(AppContext.BaseDirectory)
        .AddJsonFile("appsettings.json")
        .AddJsonFile($"appsettings.{context.HostingEnvironment.EnvironmentName}.json", optional: true)
        .AddEnvironmentVariables("API_");
});

builder.WebHost.ConfigureServices((webHost, services) =>
{
    services.AddSingleton(webHost.Configuration);
    // Add services to the container.
    services.AddControllers()
        .AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());
        });

    services.AddRouting(options => options.LowercaseUrls = true);

    services.AddCors(options =>
    {
        options.AddPolicy("CorsPolicy", builder =>
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader());
    });
    services.AddHttpContextAccessor();

});



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("CorsPolicy");

app.UseHttpsRedirection();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

using (var scope = app.Services.CreateScope())
{
    AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
    await scope.ServiceProvider.ExecuteMigrations().ConfigureAwait(false);
}

app.Run();
