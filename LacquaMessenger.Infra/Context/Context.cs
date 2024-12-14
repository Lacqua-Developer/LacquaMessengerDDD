using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LacquaMessenger.Core;
using LacquaMessenger.Core.Security;
using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Domain.Model;
using LacquaMessenger.Domain.Models;
using LacquaMessenger.Domain.Service;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;

namespace LacquaMessenger.Infra
{
    public class Context : DbContext
    {
        protected readonly IConfiguration Configuration;

        private readonly DbConnection _dbConnection;

        public Context() 
        {
            Database.EnsureCreated();
        }
        public Context(string connectionString) : base(GetOptions())
        {

        }


        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            
            switch(LacquaMessenger.Core.ConfigCore.GetValue("db_engine"))
            {
                case "mock":
                    if(_dbConnection != null)
                    {
                        options.UseSqlServer(_dbConnection);
                    }
                    break;
                default:
                   // options.UseSqlServer(LacquaMessenger.Core.ConfigCore.DefaultConnectionString);
                    var mySqlConnectionStr = LacquaMessenger.Core.ConfigCore.DefaultConnectionString;

                    options.UseSqlServer(
                            mySqlConnectionStr,
                            options => options.EnableRetryOnFailure(
                                maxRetryCount: 5,
                                maxRetryDelay: System.TimeSpan.FromSeconds(30),
                                errorNumbersToAdd: null) );

                    break;
            }
        }




        public DbSet<Anexo> anexos { get; set; }
        public DbSet<Campanha> campanhas { get; set; }
        public DbSet<Config> configs { get; set; }
        public DbSet<Contato> contatos { get; set; }
        public DbSet<Conversa> conversas { get; set; }
        public DbSet<EmpresaCliente> empresaClientes { get; set; }
        public DbSet<FluxoAtendimento> fluxoAtendimentos { get; set; }
        public DbSet<HistoricoCampanha> historicoCampanhas { get; set; }
        public DbSet<Lista> listas { get; set; }
        public DbSet<Log> logs { get; set; }
        public DbSet<Mensagem> mensagens { get; set; }

        public DbSet<MensagemQueue> mensagemQueues { get; set; }
        public DbSet<Ofensa> ofensas { get; set; }
        public DbSet<OpccaoLista> opccaoListas { get; set; }
        public DbSet<Parametro> parametros { get; set; }
        public DbSet<Servico> servicos { get; set; }
        public DbSet<Sessao> sessaos { get; set; }
        public DbSet<StatusAtendimento> statusAtendimentos { get; set; }
        public DbSet<Tipos> tipos { get; set; }
        public DbSet<Usuario> usuarios { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            //modelBuilder.Ignore<Config>();

            modelBuilder.Entity<Anexo>()
                        .ToTable("Anexos")
                        .HasKey(a => a.IdAnexo);

            modelBuilder.Entity<Campanha>()
                        .ToTable("Campanhas")
                        .HasKey(c => c.IdCampanha);


            modelBuilder.Entity<Config>()
                        .ToTable("Configs")
                        .HasKey(c => c.IdConfig);

            modelBuilder.Entity<Contato>()
                        .ToTable("Contatos")
                        .HasKey(c => c.IdContato);

            modelBuilder.Entity<Conversa>()
                        .ToTable("Conversas")
                        .HasKey(c => c.IdConversa);

            modelBuilder.Entity<EmpresaCliente>()
                        .ToTable("EmpresaClientes")
                        .HasKey(e => e.IdEmpresa);

            modelBuilder.Entity<FluxoAtendimento>()
                        .ToTable("FluxoAtendimentos")
                        .HasKey(f => f.IdFluxoAtendimento);

            modelBuilder.Entity<Lista>()
                        .ToTable("Listas")
                        .HasKey(e => e.IdLista);
 

            modelBuilder.Entity<Log>()
                        .ToTable("Logs")
                        .HasKey(l => l.IdLog);

            modelBuilder.Entity<Mensagem>()
                        .ToTable("Mensagens")
                        .HasKey(m => m.IdMensagem);


            modelBuilder.Entity<MensagemQueue>()
                        .ToTable("MensagemQueues")
                        .HasKey(m => m.IdQueue);

            modelBuilder.Entity<Ofensa>()
                        .ToTable("Ofensas")
                        .HasKey(o => o.Id);

            modelBuilder.Entity<OpccaoLista>()
                        .ToTable("OpccaoListas")
                        .HasKey(o => o.IdOpcaoLista);

            modelBuilder.Entity<Parametro>()
                        .ToTable("Parametros")
                        .HasKey(p => p.IdParametro);

            modelBuilder.Entity<Servico>()
                        .ToTable("Servicos")
                        .HasKey(s => s.IdServico);

            modelBuilder.Entity<Sessao>()
                        .ToTable("Sessaos")
                        .HasKey(s => s.IdSession);

            modelBuilder.Entity<Tipos>()
                        .ToTable("Tipos")
                        .HasKey(t => t.IdTipo);

            modelBuilder.Entity<Usuario>()
                        .ToTable("Usuarios")
                        .HasKey(u => u.IdUsr);

            modelBuilder.Entity<Sessao>(entity =>
            {
                entity.ToTable("Sessao");

                entity.HasKey(s => s.IdSession);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)



            });

            modelBuilder.Entity<HistoricoCampanha>(entity =>
            {
                entity.ToTable("HistoricoCampanhas");

                entity.HasKey(s => s.IdHistoricoCampanha);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)

            });


            modelBuilder.Entity<Parametro>(entity =>
            {
                entity.ToTable("Parametro");

                entity.HasKey(s => s.IdParametro);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)

            });


            modelBuilder.Entity<StatusAtendimento>(entity =>
            {
                entity.ToTable("StatusAtendimentos");

                entity.HasKey(s => s.IdStatusAtendimento);

 
            });


            modelBuilder.Entity<Usuario>().HasData(
                new Usuario
                {
                    IdUsr = 1,
                    NomeUsuario="Administrador",
                    Login = "Admin",
                    Senha =  Crypto.Encrypt("102030") ,
                    Permissao = 2
                });

        }

        public static DbContextOptions<Context> GetOptions()
        {
            return new DbContextOptionsBuilder<Context>()
                .UseSqlServer(LacquaMessenger.Core.ConfigCore.DefaultConnectionString)
                .Options;
        }
    }


}
