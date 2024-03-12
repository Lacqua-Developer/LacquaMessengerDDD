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

            
            
            // connect to postgres with connection string from app settings
            //options.UseNpgsql(Configuration.GetConnectionString("WebApiDatabase"));
        }




        public DbSet<Anexo> anexos { get; set; }
        public DbSet<Campanha> campanhas { get; set; }
        public DbSet<ChatMenssagem> chatMenssagems {  get; set; }  
        public DbSet<Config> configs { get; set; }
        public DbSet<Contato> contatos { get; set; }
        public DbSet<Conversa> conversas { get; set; }
        public DbSet<EmpresaCliente> empresaClientes { get; set; }
        public DbSet<FluxoAtendimento> fluxoAtendimentos { get; set; }
        public DbSet<HistoricoCampanha> historicoCampanhas { get; set; }
        public DbSet<Lista> listas { get; set; }
        public DbSet<ListaChat> listaChats { get; set; }
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
                        .HasKey(a => a.Id);

            modelBuilder.Entity<Campanha>()
                        .ToTable("Campanhas")
                        .HasKey(c => c.Id);

            modelBuilder.Entity<ChatMenssagem>()
                        .ToTable("ChatMenssagems")
                        .HasKey(c => c.Id);

            modelBuilder.Entity<Config>()
                        .ToTable("Configs")
                        .HasKey(c => c.Id);

            modelBuilder.Entity<Contato>()
                        .ToTable("Contatos")
                        .HasKey(c => c.Id);

            modelBuilder.Entity<Conversa>()
                        .ToTable("Conversas")
                        .HasKey(c => c.Id);

            modelBuilder.Entity<EmpresaCliente>()
                        .ToTable("EmpresaClientes")
                        .HasKey(e => e.Id);

            modelBuilder.Entity<FluxoAtendimento>()
                        .ToTable("FluxoAtendimentos")
                        .HasKey(f => f.Id);



            modelBuilder.Entity<Lista>()
                        .ToTable("Listas")
                        .HasKey(e => e.Id);
 
            modelBuilder.Entity<ListaChat>()
                        .ToTable("ListaChats")
                        .HasKey(l => l.Id);

            modelBuilder.Entity<Log>()
                        .ToTable("Logs")
                        .HasKey(l => l.Id);

            modelBuilder.Entity<Mensagem>()
                        .ToTable("Mensagens")
                        .HasKey(m => m.Id);


            modelBuilder.Entity<MensagemQueue>()
                        .ToTable("MensagemQueues")
                        .HasKey(m => m.Id);

            modelBuilder.Entity<Ofensa>()
                        .ToTable("Ofensas")
                        .HasKey(o => o.Id);

            modelBuilder.Entity<OpccaoLista>()
                        .ToTable("OpccaoListas")
                        .HasKey(o => o.Id);

            modelBuilder.Entity<Parametro>()
                        .ToTable("Parametros")
                        .HasKey(p => p.Id);

            modelBuilder.Entity<Servico>()
                        .ToTable("Servicos")
                        .HasKey(s => s.Id);

            modelBuilder.Entity<Sessao>()
                        .ToTable("Sessaos")
                        .HasKey(s => s.Id);

            modelBuilder.Entity<Tipos>()
                        .ToTable("Tipos")
                        .HasKey(t => t.Id);

            modelBuilder.Entity<Usuario>()
                        .ToTable("Usuarios")
                        .HasKey(u => u.Id);

            modelBuilder.Entity<Sessao>(entity =>
            {
                entity.ToTable("Sessao");

                entity.HasKey(s => s.Id);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)
                entity.HasOne(s => s.Contato)
                    .WithMany()
                    .HasForeignKey(s => s.ContatoId)
                    .OnDelete(DeleteBehavior.NoAction);

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Usuario)
                    .WithMany()
                    .HasForeignKey(s => s.UsuarioId)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Conversa)
                    .WithMany()
                    .HasForeignKey(s => s.ConversaId)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Config)
                    .WithMany()
                    .HasForeignKey(s => s.ConfigId)
                    .OnDelete(DeleteBehavior.NoAction); ;
            });

            modelBuilder.Entity<HistoricoCampanha>(entity =>
            {
                entity.ToTable("HistoricoCampanhas");

                entity.HasKey(s => s.Id);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)
                entity.HasOne(s => s.Campanha)
                    .WithMany()
                    .HasForeignKey(s => s.CampanhaId)
                    .OnDelete(DeleteBehavior.NoAction);

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Contato)
                    .WithMany()
                    .HasForeignKey(s => s.ContatoId)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Conversa)
                    .WithMany()
                    .HasForeignKey(s => s.ConversaId)
                    .OnDelete(DeleteBehavior.NoAction); ;
            });


            modelBuilder.Entity<Parametro>(entity =>
            {
                entity.ToTable("Parametro");

                entity.HasKey(s => s.Id);


                // Relacionamento com Mensagem (FluxoDestinoEsperado)
                entity.HasOne(s => s.MensagemSaudacao)
                    .WithMany()
                    .HasForeignKey(s => s.IdMensagemSaudacao)
                    .OnDelete(DeleteBehavior.NoAction);

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.MensagemErroValid)
                    .WithMany()
                    .HasForeignKey(s => s.IdMensagemErroValid)
                    .OnDelete(DeleteBehavior.NoAction); ;
            });


            modelBuilder.Entity<StatusAtendimento>(entity =>
            {
                entity.ToTable("StatusAtendimentos");

                entity.HasKey(s => s.Id);

                // Relacionamento com Mensagem (FluxoDestinoEsperado)
                entity.HasOne(s => s.Campanha)
                    .WithMany()
                    .HasForeignKey(s => s.CampanhaId)
                    .OnDelete(DeleteBehavior.NoAction);

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Contato)
                    .WithMany()
                    .HasForeignKey(s => s.ContatoId)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com Mensagem (FluxoDestinoInesperado)
                entity.HasOne(s => s.Conversa)
                    .WithMany()
                    .HasForeignKey(s => s.ConversaId)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com FluxoAtendimento (FluxoDestinoEsperado)
                entity.HasOne(s => s.FluxoDestinoEsperado)
                    .WithMany()
                    .HasForeignKey(s => s.IdFluxoDestinoEsperado)
                    .OnDelete(DeleteBehavior.NoAction); ;

                // Relacionamento com FluxoAtendimento (FluxoDestinoInesperado)
                entity.HasOne(s => s.FluxoDestinoInesperado)
                    .WithMany()
                    .HasForeignKey(s => s.IdFluxoDestinoInesperado)
                    .OnDelete(DeleteBehavior.NoAction); 

                // Relacionamento com FluxoAtendimento (FluxoDesistencia)
                entity.HasOne(s => s.FluxoDesistencia)
                    .WithMany()
                    .HasForeignKey(s => s.IdFluxoDesistencia)
                    .OnDelete(DeleteBehavior.NoAction); 

                // Relacionamento com FluxoAtendimento (FluxoOfensa)
                entity.HasOne(s => s.FluxoOfensa)
                    .WithMany()
                    .HasForeignKey(s => s.IdFluxoOfensa)
                    .OnDelete(DeleteBehavior.NoAction); 
            });


            modelBuilder.Entity<Usuario>().HasData(
                new Usuario
                {
                    Id = 1,
                    NomeUsuario="Administrador",
                    Nome = "Admin",
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
