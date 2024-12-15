USE [master]
GO
/****** Object:  Database [Chatbot361_DB]    Script Date: 05/11/2024 09:41:05 ******/

ALTER DATABASE [Chatbot361_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chatbot361_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chatbot361_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chatbot361_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chatbot361_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chatbot361_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chatbot361_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chatbot361_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Chatbot361_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chatbot361_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chatbot361_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chatbot361_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Chatbot361_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Chatbot361_DB', N'ON'
GO
USE [Chatbot361_DB]
GO
/****** Object:  User [LacquaMessenger]    Script Date: 05/11/2024 09:41:05 ******/
CREATE USER [LacquaMessenger] FOR LOGIN [LacquaMessenger] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [aspnetsig]    Script Date: 05/11/2024 09:41:05 ******/
CREATE USER [aspnetsig] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [LacquaMessenger]
GO
ALTER ROLE [db_owner] ADD MEMBER [aspnetsig]
GO
/****** Object:  UserDefinedFunction [dbo].[DATA_CHEIA]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[DATA_CHEIA]( @DH DATETIME )
RETURNS DATETIME
AS
BEGIN
  RETURN CONVERT(DATETIME,CONVERT(CHAR(10),@DH,103),103)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatPhoneNumber](@PhoneNo VARCHAR(20))
RETURNS VARCHAR(25)
AS
BEGIN
DECLARE @Formatted VARCHAR(25)=''
--select  [dbo].[fnFormatPhoneNumber](telefone), telefone from config
IF (LEN(@PhoneNo) > 11)
    SET @Formatted = '+' + left(@PhoneNo,2) + '('  + substring( @PhoneNo, 3,2) +')' + right(@PhoneNo, len(@PhoneNo) -4)
	-- LEFT(@PhoneNo, 3) + '-' + SUBSTRING(@PhoneNo, 4, 3) + '-' + SUBSTRING(@PhoneNo, 7, 4)

RETURN @Formatted
END

GO
/****** Object:  Table [dbo].[Anexos]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anexos](
	[IdAnexo] [int] IDENTITY(1,1) NOT NULL,
	[ConversasIdconversa] [int] NULL,
	[url] [varchar](255) NULL,
	[chave] [varchar](50) NULL,
	[EmpresaClienteId] [int] NULL,
	[NomeArquivo] [varchar](255) NULL,
	[DataEnvio] [datetime] NULL,
	[Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_Anexos] PRIMARY KEY CLUSTERED 
(
	[IdAnexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtendimentoSessao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AtendimentoSessao](
	[IdAtendimentoSessao] [int] IDENTITY(1,1) NOT NULL,
	[Sessao_IdSessao] [int] NULL,
	[Conversa_idConversa] [int] NULL,
 CONSTRAINT [PK_AtendimentoSessao] PRIMARY KEY CLUSTERED 
(
	[IdAtendimentoSessao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CalculoIntegracao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalculoIntegracao](
	[IdCalc] [int] IDENTITY(1,1) NOT NULL,
	[Integracao_integracao] [int] NULL,
	[Parcelas] [int] NULL,
	[Desconto] [decimal](10, 4) NULL,
	[Vencimento] [datetime] NULL,
 CONSTRAINT [PK_CalculoIntegracao] PRIMARY KEY CLUSTERED 
(
	[IdCalc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campanha]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Campanha](
	[IdCampanha] [int] IDENTITY(1,1) NOT NULL,
	[NomeCampanha] [varchar](50) NULL,
	[DataCriacao] [datetime] NULL,
	[DataEnvio] [datetime] NULL,
	[DataTermino] [datetime] NULL,
	[Integracao] [int] NULL,
 CONSTRAINT [PK_Campanha] PRIMARY KEY CLUSTERED 
(
	[IdCampanha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CampanhaListaTeste]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampanhaListaTeste](
	[IdCampanha] [int] NULL,
	[IdListaTeste] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classificacao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classificacao](
	[idClas] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](10) NULL,
	[Retorno] [int] NULL,
	[Ordem] [int] NULL,
	[Peso] [int] NULL,
 CONSTRAINT [PK_Classificacao] PRIMARY KEY CLUSTERED 
(
	[idClas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Config](
	[IdConfig] [int] IDENTITY(1,1) NOT NULL,
	[Telefone] [varchar](50) NULL,
	[Senha] [varchar](50) NULL,
	[Apelido] [varchar](50) NULL,
	[Desativado] [bit] NULL,
	[ChipLista] [bit] NULL,
	[DataEnvio] [date] NULL,
	[QtdeEnvio] [int] NULL,
	[StatusConeccao] [bit] NULL CONSTRAINT [DF_Config_StatusConeccao]  DEFAULT ((0)),
	[EquipeIdEquipe] [int] NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[IdConfig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contatos]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contatos](
	[IdContato] [int] IDENTITY(1,1) NOT NULL,
	[NomeInformado] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[NomeDoc] [varchar](50) NULL,
	[Codigo] [varchar](50) NULL,
	[IdWhatsApp] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[UserWhatsApp] [varchar](200) NULL,
	[ClienteExterno] [varchar](50) NULL,
	[Cadastro] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[NomeRetornado] [varchar](50) NULL,
	[UltimoAcesso] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[FaceId] [varchar](50) NULL,
	[FaceRecipentId] [varchar](50) NULL,
	[Sexo] [varchar](50) NULL,
	[FaceMsgId] [varchar](50) NULL,
	[ImageProfile] [varchar](max) NULL,
	[IdConfig] [int] NULL,
	[DataAtualizacao] [datetime] NULL,
 CONSTRAINT [PK_UserWhats] PRIMARY KEY CLUSTERED 
(
	[IdContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conversas]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conversas](
	[IdConversa] [int] IDENTITY(1,1) NOT NULL,
	[Usuarios_IdUsr] [int] NOT NULL,
	[Contatos_IdContato] [int] NULL,
	[IdConversaWhats] [varchar](50) NULL,
	[Sentido] [varchar](10) NULL,
	[Destino] [varchar](50) NULL,
	[Recebido] [bit] NULL CONSTRAINT [DF_Conversas_Recebido]  DEFAULT ((0)),
	[Lido] [bit] NULL CONSTRAINT [DF_Conversas_Lido]  DEFAULT ((0)),
	[Data] [datetime] NULL,
	[Mensagem] [nvarchar](max) NULL,
	[Config_IdConfig] [int] NULL,
	[Enviada] [bit] NULL CONSTRAINT [DF_Conversas_Enviada]  DEFAULT ((0)),
	[LidoChat] [bit] NULL CONSTRAINT [DF_Conversas_LidoChat]  DEFAULT ((0)),
	[Origem] [int] NULL,
	[Classificacao] [int] NULL CONSTRAINT [DF_Conversas_Classificacao]  DEFAULT ((1)),
 CONSTRAINT [PK_Conversas] PRIMARY KEY CLUSTERED 
(
	[IdConversa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpresaCliente]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpresaCliente](
	[IdEmpresa] [int] NULL,
	[Nome] [varchar](50) NULL,
	[LogoTipo] [varchar](50) NULL,
	[Instrucoes] [varchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnvioLista]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvioLista](
	[IdEnvio] [int] IDENTITY(1,1) NOT NULL,
	[CampanhaIdCampanha] [int] NULL,
	[DataCriacao] [datetime] NULL,
	[DataEnvio] [datetime] NULL,
	[UsuarioIdUsuario] [nchar](10) NULL,
	[DataTermino] [datetime] NULL,
 CONSTRAINT [PK_EnvioLista] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FluxoAtendimento]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FluxoAtendimento](
	[IdFluxoAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[CampanhaIdCampanha] [int] NOT NULL,
	[Tipo] [int] NULL,
	[Ordem] [int] NULL,
	[IdMensagem] [int] NULL,
	[Condicao1] [int] NULL,
	[Condicao2] [int] NULL,
	[Saida] [int] NULL,
	[Chave] [varchar](50) NULL,
	[NomeFluxo] [varchar](50) NULL,
	[Finalizado] [bit] NULL,
	[Ofensa] [int] NULL,
 CONSTRAINT [PK_FluxoAtendimento] PRIMARY KEY CLUSTERED 
(
	[IdFluxoAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistoricoCampanha]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoCampanha](
	[IdHistoricoCampanha] [int] IDENTITY(1,1) NOT NULL,
	[CampanhaIdCampanha] [int] NULL,
	[ContatoIdContato] [int] NULL,
	[ConversaIdConversa] [int] NULL,
	[ListaIdLista] [int] NULL,
	[Sessao_idSessao] [int] NULL,
	[IdEnvioLista] [int] NULL,
 CONSTRAINT [PK_HistoricoSessao] PRIMARY KEY CLUSTERED 
(
	[IdHistoricoCampanha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Integracao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Integracao](
	[IdIntegracao] [int] IDENTITY(1,1) NOT NULL,
	[Campanha_IdCampanha] [int] NULL,
	[Tipo] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Senha] [nvarchar](50) NULL,
	[url] [nvarchar](max) NULL,
	[PrimVencto] [datetime] NULL,
	[TipoBusca] [int] NULL,
 CONSTRAINT [PK_Integracao] PRIMARY KEY CLUSTERED 
(
	[IdIntegracao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lista]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lista](
	[IdLista] [int] IDENTITY(1,1) NOT NULL,
	[CampanhaIdCampanha] [int] NULL,
	[Nome] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[NomeDocumento] [varchar](50) NULL,
	[Chave] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[ContatoIdContato] [int] NULL,
	[UserWhatsApp] [varchar](50) NULL,
	[Ativo] [bit] NULL,
	[Status] [varchar](50) NULL,
	[ConversaIdConvera] [int] NULL,
	[Desativado] [bit] NULL,
	[UsuarioIdUsuario] [int] NULL,
	[FacebookId] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Sexo] [varchar](max) NULL,
	[Anexo1] [varchar](max) NULL,
	[Anexo2] [varchar](max) NULL,
	[Anexo3] [varchar](max) NULL,
	[CodBarras] [varchar](max) NULL,
	[IdEnvioLista] [int] NULL,
	[enviado] [bit] NULL,
	[DtEnvio] [datetime] NULL,
 CONSTRAINT [PK_Lista] PRIMARY KEY CLUSTERED 
(
	[IdLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaTeste]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaTeste](
	[IdListaTeste] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Telefone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_ListaTeste] PRIMARY KEY CLUSTERED 
(
	[IdListaTeste] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[Data] [datetime] NULL,
	[Tipo] [varchar](50) NULL,
	[Mensagem] [text] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loja_venda]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loja_venda](
	[CODIGO_FILIAL] [varchar](255) NULL,
	[TICKET] [int] NULL,
	[DATA_VENDA] [datetime] NULL,
	[VALOR_VENDA] [decimal](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensagem](
	[IdMensagem] [int] IDENTITY(1,1) NOT NULL,
	[NomeMensagem] [varchar](50) NULL,
	[Tipo] [int] NULL,
	[Texto] [ntext] NULL,
 CONSTRAINT [PK_Mensagem] PRIMARY KEY CLUSTERED 
(
	[IdMensagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MensagemQueue]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MensagemQueue](
	[IdQueue] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NULL,
	[ConversaIdconversa] [int] NULL,
	[DataEnvio] [datetime] NULL,
	[Origem] [int] NULL,
	[UltimaTentativa] [datetime] NULL,
	[erro] [bit] NULL,
	[Mensagem] [varchar](50) NULL,
	[Tentando] [bit] NULL,
 CONSTRAINT [PK_MensagemQueue] PRIMARY KEY CLUSTERED 
(
	[IdQueue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ofensa]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ofensa](
	[id] [int] NOT NULL,
	[palavra] [varchar](150) NULL,
	[composta] [bit] NULL,
 CONSTRAINT [PK_ofensa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OpcaoLista]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpcaoLista](
	[IdOpcaoLista] [int] IDENTITY(1,1) NOT NULL,
	[ListaIdlista] [int] NULL,
	[Ordem] [int] NULL,
	[Opcao] [varchar](150) NULL,
 CONSTRAINT [PK_OpcaoLista] PRIMARY KEY CLUSTERED 
(
	[IdOpcaoLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametro](
	[IdParametro] [int] NOT NULL,
	[NomeDoc] [varchar](50) NULL,
	[DigValidacao] [varchar](50) NULL,
	[PosicaoValidacao] [int] NULL,
	[QtdeDigitos] [int] NULL,
	[PalavraTransf] [varchar](50) NULL,
	[TempoMsg] [int] NULL,
	[MensagemSaudacao] [int] NULL,
	[MensagemErroValid] [int] NULL,
	[Desistencia] [varchar](50) NULL,
	[DDD] [varchar](255) NULL,
	[Servidor] [varchar](50) NULL,
	[Porta] [int] NULL,
	[Debug] [bit] NULL,
	[QtdeLista] [int] NULL,
	[Campanha_idCampanha] [int] NULL,
	[ServidorFace] [varchar](max) NULL,
	[WhatsBotSever] [varchar](max) NULL,
	[WhatsBotPort] [varchar](max) NULL,
	[ServidorAnexos] [varchar](max) NULL,
	[ServidorCaminho] [varchar](max) NULL,
	[ApiGoogle] [varchar](max) NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relatorios]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relatorios](
	[IdRelatorio] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Permissao] [int] NULL,
	[DataCriacao] [datetime] NULL,
	[Query] [ntext] NULL,
	[Toolbar] [bit] NULL,
	[Desativado] [bit] NULL CONSTRAINT [DF_Relatorios_Ativo]  DEFAULT ((0)),
 CONSTRAINT [PK_Relatorios] PRIMARY KEY CLUSTERED 
(
	[IdRelatorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RetornoAck]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RetornoAck](
	[IdAck] [int] IDENTITY(1,1) NOT NULL,
	[FromMe] [bit] NULL,
	[Remote] [varchar](max) NULL,
	[Id] [varchar](max) NULL,
	[Serialized] [varchar](max) NULL,
	[Body] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
	[T] [bigint] NULL,
	[NotifyName] [varchar](max) NULL,
	[_From] [varchar](max) NULL,
	[_To] [varchar](max) NULL,
	[Self] [varchar](max) NULL,
	[Ack] [varchar](max) NULL,
	[Invis] [bit] NULL,
	[IsNewMsg] [bit] NULL,
	[Star] [bit] NULL,
	[RecvFresh] [bit] NULL,
	[IsFromTemplate] [bit] NULL,
	[IsVcardOverMmsDocument] [bit] NULL,
	[IsForwarded] [bit] NULL,
	[EphemeralStartTimestamp] [bigint] NULL,
 CONSTRAINT [PK_RetornoAck] PRIMARY KEY CLUSTERED 
(
	[IdAck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servico]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servico](
	[IdServico] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Regra] [int] NULL,
	[Site] [varchar](255) NULL,
	[BancoDados] [varchar](255) NULL,
	[Usuario] [varchar](255) NULL,
	[Senha] [varchar](255) NULL,
	[Token] [varchar](255) NULL,
 CONSTRAINT [PK_Servico] PRIMARY KEY CLUSTERED 
(
	[IdServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessao](
	[IdSession] [int] IDENTITY(1,1) NOT NULL,
	[Contato_Idcontato] [int] NULL,
	[Usuario_IdUsuario] [int] NULL,
	[DataCriacao] [datetime] NULL,
	[DataAtendimento] [datetime] NULL,
	[DataEncerramento] [datetime] NULL,
	[Config_idconfig] [int] NULL,
	[Origem] [int] NULL CONSTRAINT [DF_Sessao_Origem]  DEFAULT ((0)),
	[Classificacao] [int] NULL CONSTRAINT [DF_Sessao_Classificacao]  DEFAULT ((1)),
	[Motivo] [int] NULL,
 CONSTRAINT [PK_Sessao] PRIMARY KEY CLUSTERED 
(
	[IdSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusAtendimento]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusAtendimento](
	[IdStatusAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[ContatoIdContato] [int] NOT NULL,
	[ConversaIdconversa] [int] NULL,
	[TipoFluxo] [int] NULL,
	[Fluxo_Origem] [int] NULL,
	[Fluxo_DestinoEsperado] [int] NULL,
	[Fluxo_DestinoInesperado] [int] NULL,
	[Resposta] [varchar](255) NULL,
	[RespostaEsperada] [varchar](255) NULL,
	[Finalizado] [bit] NULL,
	[IdLista] [int] NULL,
 CONSTRAINT [PK_StatusAtendimento] PRIMARY KEY CLUSTERED 
(
	[IdStatusAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TextoSugestao]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextoSugestao](
	[idSugest] [int] IDENTITY(1,1) NOT NULL,
	[Texto] [nvarchar](max) NULL,
	[Config_IdConfig] [int] NULL,
	[Nome] [nvarchar](50) NULL,
 CONSTRAINT [PK_TextoSugestao] PRIMARY KEY CLUSTERED 
(
	[idSugest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipos](
	[IdTipo] [int] IDENTITY(1,1) NOT NULL,
	[Referencia] [varchar](50) NULL,
	[Valor] [varchar](50) NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_Tipos] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpcontatos]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmpcontatos](
	[id] [int] NULL,
	[IdContato] [int] NOT NULL,
	[NomeInformado] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[NomeDoc] [varchar](50) NULL,
	[Codigo] [varchar](50) NULL,
	[IdWhatsApp] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[UserWhatsApp] [varchar](200) NULL,
	[ClienteExterno] [varchar](50) NULL,
	[Cadastro] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[NomeRetornado] [varchar](50) NULL,
	[UltimoAcesso] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[FaceId] [varchar](50) NULL,
	[FaceRecipentId] [varchar](50) NULL,
	[Sexo] [varchar](50) NULL,
	[FaceMsgId] [varchar](50) NULL,
	[ImageProfile] [varchar](max) NULL,
	[IdConfig] [int] NULL,
	[DataAtualizacao] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpContatosDpl]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmpContatosDpl](
	[telefone] [varchar](8) NULL,
	[id] [int] NULL,
	[qtde] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tracer]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracer](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[Duration] [bigint] NULL,
	[SPID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[ObjectType] [int] NULL,
	[LoginName] [nvarchar](128) NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioConfig]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioConfig](
	[IdUsr] [int] NOT NULL,
	[IdConfig] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioConfig] PRIMARY KEY CLUSTERED 
(
	[IdUsr] ASC,
	[IdConfig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsr] [int] IDENTITY(1,1) NOT NULL,
	[NomeUsuario] [varchar](50) NULL,
	[Id_Externo] [varchar](50) NULL,
	[Permissao] [int] NULL,
	[Senha] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Celular] [varchar](50) NULL,
	[Confirmacao] [varchar](50) NULL,
	[ConfigIdConfig] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xconfig]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xconfig](
	[IdConfig] [int] IDENTITY(1,1) NOT NULL,
	[Telefone] [varchar](50) NULL,
	[Senha] [varchar](50) NULL,
	[Apelido] [varchar](50) NULL,
	[Desativado] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[UltimaSessaoConversa]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UltimaSessaoConversa]

as

select 
c.IdContato,
max (cv.IdConversa)IdConversa,
MAX (s.IdSession)IdSession
from Contatos c
inner join Sessao s on s.Contato_Idcontato = c.IdContato
inner join Conversas cv on cv.Contatos_IdContato = c.IdContato 
group by c.IdContato

GO
/****** Object:  View [dbo].[vw_OrdenacaoContatos]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_OrdenacaoContatos]

as 

select 
c.IdContato,

cv.IdConversa IdConversa,

cv.Data DataConversa,

s.IdSession IdSession,

s.DataCriacao DataCriacao,

case	when s.datacriacao > cv.Data then s.datacriacao else cv.data ENd UltimaData

from Contatos c
inner join UltimaSessaoConversa usc on usc.idcontato = c.IdContato
inner join Sessao s on s.IdSession = usc.IdSession 
inner join Conversas cv on cv.IdConversa = usc.Idconversa

GO
/****** Object:  View [dbo].[VW_QTDENLIDA]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[VW_QTDENLIDA]
AS
select  c.Contatos_IdContato ,
        count( distinct c1.IdConversa) QtdeNLido,
        max(c.IdConversa) UltimaMsg, 
	    --isnull(max([UltimaData]),max(c.Daxta)) DataUltimaMsg
		max(c.Data) DataUltimaMsg
from conversas C WITH (NOLOCK) 
	left join Conversas c1 WITH (nolock) on c.IdConversa=c1.IdConversa and  c1.sentido in ('entrada','transf') and c1.LidoChat=0 
	--left join vw_OrdenacaoContatos v WITH (nolock) on v.IdContato = c.Contatos_IdContato
	--left join VW_ULTIMA_SESSAO vs with (nolock) on vs.Contato_Idcontato = c.Contatos_IdContato
--where  c.Contatos_IdContato = 1318
group by  c.Contatos_IdContato
GO
/****** Object:  View [dbo].[vw_UsuariosClientesNaoLidas]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_UsuariosClientesNaoLidas]

as

select distinct 
s.Usuario_IdUsuario,
u.NomeUsuario,
(select count (distinct s1.IdSession) from Sessao s1  
 where s.Usuario_IdUsuario = s1.Usuario_IdUsuario and s1.DataEncerramento is null) 'Ativos Geral',

 (select count (distinct qnl.Contatos_IdContato) from VW_QTDENLIDA qnl
inner join Contatos c on c.IdContato = qnl.Contatos_IdContato
inner join UltimaSessaoConversa us on us.IdContato = qnl.Contatos_IdContato
inner join Sessao s1 on s1.IdSession = us.IdSession
where QtdeNLido > 0
and s1.DataEncerramento is null
and s.Usuario_IdUsuario = s1.Usuario_IdUsuario
group by s1.Usuario_IdUsuario) 'NaoLidas'

from Usuarios u

left join Sessao s on s.Usuario_IdUsuario = u.IdUsr
--where s.DataCriacao >= CONVERT (date, CURRENT_TIMESTAMP)

group by s.Usuario_IdUsuario, u.nomeusuario,s.Usuario_IdUsuario, s.Contato_Idcontato
having (select count (distinct s1.IdSession) from Sessao s1  
 where s.Usuario_IdUsuario = s1.Usuario_IdUsuario and s1.DataEncerramento is null) >0

 --order by 2 desc

GO
/****** Object:  View [dbo].[UltimoEnvio]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[UltimoEnvio]
as

        SELECT  l.ContatoIdContato,  MAX(IdEnvioLista) idEnvio, max(idlista) idlista
		FROM lista l 
		group by l.ContatoIdContato

GO
/****** Object:  View [dbo].[VW_CochaoPreventivo]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_CochaoPreventivo]
as
select distinct
                c.NM_NOME NOME,
				c.NU_CPF_CNPJ CPF,
                c.id_cliente EC,
                GETDATE() DT_PARCELA,
                0 VL_PARCELA1,
               '00000000' DT_REAL
from easycollector.dbo.tb_cliente c(nolock)         
	--left join easycollector.dbo.VW_ACORDOS_ATIVOS at (nolock)  on at.id_cliente = c.id_cliente
	left join easycollector.dbo.TB_CLIENTE_ACAO ca (nolock) on ca.id_cliente = c.ID_CLIENTE                    
where ca.id_cliente not in (select id_cliente from  easycollector.dbo.TB_CLIENTE_ACAO (nolock) where id_acao
in (158,127,149,23,127,152,169,171) and DT_ACAO >= GETDATE () - 3 )
and c.ID_CEDENTE in (1,4)                             

GO
/****** Object:  View [dbo].[VW_ULTIMA_SESSAO]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_ULTIMA_SESSAO]
AS

SELECT  Contato_Idcontato, MAX(IdSession) IdSession
FROM SESSAO
GROUP BY Contato_Idcontato

GO
/****** Object:  View [dbo].[VW_ULTIMACONVERSA]    Script Date: 05/11/2024 09:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_ULTIMACONVERSA]
AS

SELECT [Contatos_IdContato], MAX(idconversa) id
FROM Conversas
GROUP BY [Contatos_IdContato]

GO
SET IDENTITY_INSERT [dbo].[Anexos] ON 

GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (12, 20580, NULL, N'CmVRgosT', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\1IfvQa7D.png', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (13, 20582, NULL, N'ssjZAdXT', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\ssjZAdXT.png', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (14, 20583, NULL, N'jW5GGlnR', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\jW5GGlnR.jpeg', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (15, 20584, NULL, N'IapNWP53', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\IapNWP53.jpeg', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (16, 20585, NULL, N'N6JYLSun', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\N6JYLSun.png', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (17, 20590, NULL, N'2cjvSMTZ', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\2cjvSMTZ.pdf', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (18, 20591, NULL, N'I862yxX8', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\I862yxX8.pdf', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (19, 20592, NULL, N'zMgDRYOM', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\zMgDRYOM.mp4', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (20, 20593, NULL, N'shxQ9n4b', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\shxQ9n4b.mp4', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (21, 20594, NULL, N'xTJMcivi', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\xTJMcivi.mp4', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (22, 20595, NULL, N'K1h7NAYN', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\K1h7NAYN.mp4', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (23, 20605, NULL, N'ydzPUSPL', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\ydzPUSPL.pdf', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (24, 20606, NULL, N'bOtiOzbV', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\bOtiOzbV.pdf', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (25, 20607, NULL, N'0l6MzNMc', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\0l6MzNMc.pdf', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (26, 20608, NULL, N'pcnQowLI', 0, N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage\pcnQowLI.png', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (27, 21729, N'', NULL, 0, N'  logo_white_background1rpevypo.jpg ', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (28, 21773, N'C:\Users\arybe\Source\Repos\LacquaNet\Chatbot361_DB.api\upload\5511963191922\2592530807593228.ogg', NULL, 0, N'C:\Users\arybe\Source\Repos\LacquaNet\Chatbot361_DB.api\upload\5511963191922\2592530807593228.ogg', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (29, 21775, N'C:\Users\arybe\Source\Repos\LacquaNet\Chatbot361_DB.api\upload\5511963191922\976033717377037.jpeg', NULL, 0, N'976033717377037.jpeg', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (30, 21777, N'C:\Users\arybe\Source\Repos\LacquaNet\Chatbot361_DB.api\upload\5511963191922\976033717377037.jpeg', NULL, 0, N'976033717377037.jpeg', NULL, NULL)
GO
INSERT [dbo].[Anexos] ([IdAnexo], [ConversasIdconversa], [url], [chave], [EmpresaClienteId], [NomeArquivo], [DataEnvio], [Tipo]) VALUES (31, 21779, N'C:\Users\arybe\Source\Repos\LacquaNet\Chatbot361_DB.api\upload\5511963191922\976033717377037.jpeg', NULL, 0, N'976033717377037.jpeg', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Anexos] OFF
GO
SET IDENTITY_INSERT [dbo].[Campanha] ON 

GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (1, N'Campanha Inicial', CAST(N'2017-11-20 09:08:08.307' AS DateTime), CAST(N'2017-11-20 09:08:08.307' AS DateTime), CAST(N'2099-01-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (7, N'Campanha teste Ary', CAST(N'2015-09-25 16:29:08.363' AS DateTime), NULL, CAST(N'2020-09-30 12:57:41.000' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (12, N'Teste Ferreira', CAST(N'2015-09-28 11:55:19.363' AS DateTime), NULL, CAST(N'2015-11-28 12:57:41.067' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (13, N'Teste Envios 28-09', CAST(N'2015-09-28 17:25:21.407' AS DateTime), NULL, CAST(N'2015-11-28 12:57:41.067' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (15, N'Campanha funs', CAST(N'2015-09-28 17:41:18.500' AS DateTime), NULL, CAST(N'2015-11-28 12:57:41.067' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (18, N'Teste Campanha publicitaria', CAST(N'2015-10-07 11:16:38.387' AS DateTime), NULL, CAST(N'2015-11-28 12:57:41.067' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (20, N'ID FACEBOOK', CAST(N'2017-11-23 14:47:35.787' AS DateTime), NULL, CAST(N'2017-11-28 14:43:44.000' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (21, N'BV Veiculos', CAST(N'2017-12-20 11:07:27.930' AS DateTime), NULL, CAST(N'2017-12-20 10:59:15.060' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (22, N'Restante da Campanha BV', CAST(N'2018-01-05 15:49:35.550' AS DateTime), NULL, CAST(N'2018-01-05 15:32:21.410' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (23, N'CLA Bradesco', CAST(N'2020-10-09 10:57:14.040' AS DateTime), NULL, CAST(N'2029-10-09 10:56:39.870' AS DateTime), NULL)
GO
INSERT [dbo].[Campanha] ([IdCampanha], [NomeCampanha], [DataCriacao], [DataEnvio], [DataTermino], [Integracao]) VALUES (24, N'TesteImportacaoLead1', CAST(N'2020-11-08 07:30:45.063' AS DateTime), NULL, CAST(N'2029-10-09 10:56:39.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Campanha] OFF
GO
SET IDENTITY_INSERT [dbo].[Config] ON 

GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (1, N'5511954513303', N'8wpR27CHJ/LpFp1SZjZf/Ksn6MY=', N'Lacqua Sistema', 1, 0, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (2, N'5511957381241', N'Ay1hVmBV3feNQeXYncrQGPM9UJI=', N'Consulcred', 1, 0, CAST(N'2015-10-13' AS Date), 11, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (5, N'5511957381236', N'p3aeBLpfdyBR5KXjz0LHWt+gfog=', N'Consulcred', 1, 0, CAST(N'2015-10-13' AS Date), 11, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (6, N'5511942099821', N'4xC0W/JI5FORTVICa8QbbZh0V00=', N'Consulcred', 1, 1, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (7, N'5511975104453', N'es17S0rwp/7aJyRVWnEnTK2sJMQ=', N'Consulcred', 1, 0, CAST(N'2015-10-13' AS Date), 11, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (8, N'5511963191922', N'NUtCn6ktyDGZDwM8PKM8wSHmB2O60=', N'Lacqua Sistemas', 1, 0, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (9, N'5511974897764', N'o8sfTe7bMstRDBtFVN++se/6w64=', N'Ary', 1, 1, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (10, N'5511965720117', N'XJg+GkNS2icQS8Qe3B0PUeob5jk=', N'Teste', 1, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (11, N'5511932344657', NULL, N'WZ', 0, 1, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Config] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado], [ChipLista], [DataEnvio], [QtdeEnvio], [StatusConeccao], [EquipeIdEquipe]) VALUES (12, N'551148581164', N'', N'LacquaPromotora', 0, NULL, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Contatos] ON 

GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2253, N'Adalgisa', NULL, NULL, NULL, N'5511987776003@c.us', N'5511987776003', NULL, NULL, NULL, NULL, N'Adalgisa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2254, N'Adelice', NULL, NULL, NULL, N'5511940338806@c.us', N'5511940338806', NULL, NULL, NULL, NULL, N'Adelice', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2255, N'Adriana', NULL, NULL, NULL, N'5511963980581@c.us', N'5511963980581', NULL, NULL, NULL, NULL, N'Adriana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2256, N'Adriana', NULL, NULL, NULL, N'5516981830009@c.us', N'5516981830009', NULL, NULL, NULL, NULL, N'Adriana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2257, N'Adriana', NULL, NULL, NULL, N'5511982992355@c.us', N'5511982992355', NULL, NULL, NULL, NULL, N'Adriana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2258, N'Adriana', NULL, NULL, NULL, N'5511998255711@c.us', N'5511998255711', NULL, NULL, NULL, NULL, N'Adriana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2259, N'Aleksandra', NULL, NULL, NULL, N'5511992301594@c.us', N'5511992301594', NULL, NULL, NULL, NULL, N'Aleksandra', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2260, N'Alessandra', NULL, NULL, NULL, N'5511980838763@c.us', N'5511980838763', NULL, NULL, NULL, NULL, N'Alessandra', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2261, N'Alexandra', NULL, NULL, NULL, N'5511972800832@c.us', N'5511972800832', NULL, NULL, NULL, NULL, N'Alexandra', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2262, N'Alexandre', NULL, NULL, NULL, N'5511984774036@c.us', N'5511984774036', NULL, NULL, NULL, NULL, N'Alexandre', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2263, N'Alexandre Lima', NULL, NULL, NULL, N'5511996883858@c.us', N'5511996883858', NULL, NULL, NULL, NULL, N'Alexandre Lima', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/74491635_533304180621370_4845131012638005909_n.jpg?oh=f0e8442e59a30488b485d51e290263b1&oe=5F9752B4', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2264, N'Alexandre Zucareli', NULL, NULL, NULL, N'5511945436562@c.us', N'5511945436562', NULL, NULL, NULL, NULL, N'Alexandre Zucareli', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2265, N'Aline', NULL, NULL, NULL, N'5511974237156@c.us', N'5511974237156', NULL, NULL, NULL, NULL, N'Aline', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2266, N'Aline', NULL, NULL, NULL, N'5511991293838@c.us', N'5511991293838', NULL, NULL, NULL, NULL, N'Aline', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2267, N'Aline', NULL, NULL, NULL, N'5511982828071@c.us', N'5511982828071', NULL, NULL, NULL, NULL, N'Aline', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2268, N'Almir', NULL, NULL, NULL, N'5511997046811@c.us', N'5511997046811', NULL, NULL, NULL, NULL, N'Almir', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2269, N'Almir', NULL, NULL, NULL, N'556581299760@c.us', N'556581299760', NULL, NULL, NULL, NULL, N'Almir', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2270, N'Amanda', NULL, NULL, NULL, N'5511962584061@c.us', N'5511962584061', NULL, NULL, NULL, NULL, N'Amanda', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2271, N'Amanda', NULL, NULL, NULL, N'5511999156166@c.us', N'5511999156166', NULL, NULL, NULL, NULL, N'Amanda', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2272, N'Ana Caroline', NULL, NULL, NULL, N'5517997457643@c.us', N'5517997457643', NULL, NULL, NULL, NULL, N'Ana Caroline', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2273, N'Ana Cristina', NULL, NULL, NULL, N'5511967344520@c.us', N'5511967344520', NULL, NULL, NULL, NULL, N'Ana Cristina', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2274, N'Ana Whitaker', NULL, NULL, NULL, N'5511970660792@c.us', N'5511970660792', NULL, NULL, NULL, NULL, N'Ana Whitaker', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2275, N'André', NULL, NULL, NULL, N'5511991317282@c.us', N'5511991317282', NULL, NULL, NULL, NULL, N'André', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2276, N'Andre', NULL, NULL, NULL, N'5511986770818@c.us', N'5511986770818', NULL, NULL, NULL, NULL, N'Andre', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2277, N'André Luis', NULL, NULL, NULL, N'5511987045720@c.us', N'5511987045720', NULL, NULL, NULL, NULL, N'André Luis', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2278, N'Andre Luiz', NULL, NULL, NULL, N'5511995348484@c.us', N'5511995348484', NULL, NULL, NULL, NULL, N'Andre Luiz', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2279, N'Andrea', NULL, NULL, NULL, N'5511954857442@c.us', N'5511954857442', NULL, NULL, NULL, NULL, N'Andrea', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2280, N'Andrea', NULL, NULL, NULL, N'5511998465900@c.us', N'5511998465900', NULL, NULL, NULL, NULL, N'Andrea', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2281, N'Andrea', NULL, NULL, NULL, N'5511953438615@c.us', N'5511953438615', NULL, NULL, NULL, NULL, N'Andrea', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2282, N'Andreia', NULL, NULL, NULL, N'5511951296626@c.us', N'5511951296626', NULL, NULL, NULL, NULL, N'Andreia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2283, N'Andressa', NULL, NULL, NULL, N'5511976255663@c.us', N'5511976255663', NULL, NULL, NULL, NULL, N'Andressa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2284, N'Andreza', NULL, NULL, NULL, N'5511974513222@c.us', N'5511974513222', NULL, NULL, NULL, NULL, N'Andreza', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2285, N'Antonio', NULL, NULL, NULL, N'5511981381295@c.us', N'5511981381295', NULL, NULL, NULL, NULL, N'Antonio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2286, N'Antônio Tome', NULL, NULL, NULL, N'559180175972@c.us', N'559180175972', NULL, NULL, NULL, NULL, N'Antônio Tome', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2287, N'Antunes', NULL, NULL, NULL, N'5511999780133@c.us', N'5511999780133', NULL, NULL, NULL, NULL, N'Antunes', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2288, N'Ar Conserto', NULL, NULL, NULL, N'5511953282190@c.us', N'5511953282190', NULL, NULL, NULL, NULL, N'Ar Conserto', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2289, N'Ariovaldo 11 97661-3470', NULL, NULL, NULL, N'5511976613470@c.us', N'5511976613470', NULL, NULL, NULL, NULL, N'Ariovaldo 11 97661-3470', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2290, N'Ary', NULL, NULL, NULL, N'5511963191922@c.us', N'5511963191922', NULL, NULL, NULL, NULL, N'Ary', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/119853213_358041125567636_2336869820978640009_n.jpg?oh=d3e8214ab9543e931b4af058093685cb&oe=5F97B689', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2291, N'Beth', NULL, NULL, NULL, N'5511947515348@c.us', N'5511947515348', NULL, NULL, NULL, NULL, N'Beth', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2292, N'Breno', NULL, NULL, NULL, N'5511989263396@c.us', N'5511989263396', NULL, NULL, NULL, NULL, N'Breno', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2293, N'Bruno', NULL, NULL, NULL, N'5511983054597@c.us', N'5511983054597', NULL, NULL, NULL, NULL, N'Bruno', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2294, N'Caíque Melo', NULL, NULL, NULL, N'5511948175806@c.us', N'5511948175806', NULL, NULL, NULL, NULL, N'Caíque Melo', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/118751415_455485705622419_7372050704366889640_n.jpg?oh=758bcb1f76f3ccb7e12d9e90f215a9d9&oe=5F97527B', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2295, N'Call center', NULL, NULL, NULL, N'5511947310291-1602106309@g.us', N'5511947310291', NULL, NULL, NULL, NULL, N'Call center', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2296, N'Camila', NULL, NULL, NULL, N'5511945526962@c.us', N'5511945526962', NULL, NULL, NULL, NULL, N'Camila', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2297, N'Camila Munaretto', NULL, NULL, NULL, N'5511994626663@c.us', N'5511994626663', NULL, NULL, NULL, NULL, N'Camila Munaretto', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2298, N'Carlos', NULL, NULL, NULL, N'5511950654488@c.us', N'5511950654488', NULL, NULL, NULL, NULL, N'Carlos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2299, N'Carlos', NULL, NULL, NULL, N'5511997780864@c.us', N'5511997780864', NULL, NULL, NULL, NULL, N'Carlos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2300, N'Carlos Leite', NULL, NULL, NULL, N'5511970898735@c.us', N'5511970898735', NULL, NULL, NULL, NULL, N'Carlos Leite', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2301, N'Carol', NULL, NULL, NULL, N'5511983718097@c.us', N'5511983718097', NULL, NULL, NULL, NULL, N'Carol', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2302, N'Casmurro', NULL, NULL, NULL, N'5511951281138@c.us', N'5511951281138', NULL, NULL, NULL, NULL, N'Casmurro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2303, N'Cassia', NULL, NULL, NULL, N'5511952459017@c.us', N'5511952459017', NULL, NULL, NULL, NULL, N'Cassia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2304, N'Cel Wp', NULL, NULL, NULL, N'5511932434657@c.us', N'5511932434657', NULL, NULL, NULL, NULL, N'Cel Wp', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2305, N'Cesar', NULL, NULL, NULL, N'5511958815822@c.us', N'5511958815822', NULL, NULL, NULL, NULL, N'Cesar', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2306, N'CHRIS CANHEMA', NULL, NULL, NULL, N'5511994795781@c.us', N'5511994795781', NULL, NULL, NULL, NULL, N'CHRIS CANHEMA', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2307, N'Claudia', NULL, NULL, NULL, N'5511947293679@c.us', N'5511947293679', NULL, NULL, NULL, NULL, N'Claudia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2308, N'Claudio', NULL, NULL, NULL, N'5511989844576@c.us', N'5511989844576', NULL, NULL, NULL, NULL, N'Claudio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2309, N'Cláudio Brião', NULL, NULL, NULL, N'5511948391942@c.us', N'5511948391942', NULL, NULL, NULL, NULL, N'Cláudio Brião', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2310, N'Comercial', NULL, NULL, NULL, N'5511952406213@c.us', N'5511952406213', NULL, NULL, NULL, NULL, N'Comercial', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2311, N'Cris', NULL, NULL, NULL, N'5511995302566@c.us', N'5511995302566', NULL, NULL, NULL, NULL, N'Cris', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2312, N'Cristian', NULL, NULL, NULL, N'5511944484987@c.us', N'5511944484987', NULL, NULL, NULL, NULL, N'Cristian', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2313, N'Cristina', NULL, NULL, NULL, N'5511930016619@c.us', N'5511930016619', NULL, NULL, NULL, NULL, N'Cristina', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2314, N'Daiana Vitorino', NULL, NULL, NULL, N'5511954338572@c.us', N'5511954338572', NULL, NULL, NULL, NULL, N'Daiana Vitorino', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2315, N'Daniel', NULL, NULL, NULL, N'5511987286860@c.us', N'5511987286860', NULL, NULL, NULL, NULL, N'Daniel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2316, N'Daniel', NULL, NULL, NULL, N'5511991280476@c.us', N'5511991280476', NULL, NULL, NULL, NULL, N'Daniel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2317, N'Daniela', NULL, NULL, NULL, N'5511997915307@c.us', N'5511997915307', NULL, NULL, NULL, NULL, N'Daniela', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2318, N'Davi Antunes', NULL, NULL, NULL, N'5511948110273@c.us', N'5511948110273', NULL, NULL, NULL, NULL, N'Davi Antunes', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2319, N'Denis', NULL, NULL, NULL, N'5511951386527@c.us', N'5511951386527', NULL, NULL, NULL, NULL, N'Denis', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2320, N'Dentista', NULL, NULL, NULL, N'5511997061015@c.us', N'5511997061015', NULL, NULL, NULL, NULL, N'Dentista', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2321, N'Douglas', NULL, NULL, NULL, N'5511976644813@c.us', N'5511976644813', NULL, NULL, NULL, NULL, N'Douglas', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2322, N'Dr Danilo Chistofaro Locação Wp', NULL, NULL, NULL, N'5511966297979@c.us', N'5511966297979', NULL, NULL, NULL, NULL, N'Dr Danilo Chistofaro Locação Wp', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2323, N'Dr Willian Wpaulista Locação', NULL, NULL, NULL, N'5511991350806@c.us', N'5511991350806', NULL, NULL, NULL, NULL, N'Dr Willian Wpaulista Locação', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2324, N'Ederson ( Luci Atendeu)', NULL, NULL, NULL, N'5511993207551@c.us', N'5511993207551', NULL, NULL, NULL, NULL, N'Ederson ( Luci Atendeu)', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2325, N'Eduardo', NULL, NULL, NULL, N'5511986776510@c.us', N'5511986776510', NULL, NULL, NULL, NULL, N'Eduardo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2326, N'Elaine', NULL, NULL, NULL, N'5511995629970@c.us', N'5511995629970', NULL, NULL, NULL, NULL, N'Elaine', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2327, N'Elaine', NULL, NULL, NULL, N'5511995768650@c.us', N'5511995768650', NULL, NULL, NULL, NULL, N'Elaine', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2328, N'Elder', NULL, NULL, NULL, N'5511963862537@c.us', N'5511963862537', NULL, NULL, NULL, NULL, N'Elder', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2329, N'Emerson', NULL, NULL, NULL, N'5511947581289@c.us', N'5511947581289', NULL, NULL, NULL, NULL, N'Emerson', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2330, N'Erick', NULL, NULL, NULL, N'5511967689400@c.us', N'5511967689400', NULL, NULL, NULL, NULL, N'Erick', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2331, N'Erika', NULL, NULL, NULL, N'5511981853740@c.us', N'5511981853740', NULL, NULL, NULL, NULL, N'Erika', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2332, N'Eunice', NULL, NULL, NULL, N'5511974524844@c.us', N'5511974524844', NULL, NULL, NULL, NULL, N'Eunice', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2333, N'Eunice', NULL, NULL, NULL, N'5511997655243@c.us', N'5511997655243', NULL, NULL, NULL, NULL, N'Eunice', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2334, N'Everton', NULL, NULL, NULL, N'5511987492516@c.us', N'5511987492516', NULL, NULL, NULL, NULL, N'Everton', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2335, N'FABI WZARZUR', NULL, NULL, NULL, N'5511982403643@c.us', N'5511982403643', NULL, NULL, NULL, NULL, N'FABI WZARZUR', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2336, N'Fabio', NULL, NULL, NULL, N'5511995157041@c.us', N'5511995157041', NULL, NULL, NULL, NULL, N'Fabio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2337, N'Fabio', NULL, NULL, NULL, N'5511951236626@c.us', N'5511951236626', NULL, NULL, NULL, NULL, N'Fabio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2338, N'Fabio', NULL, NULL, NULL, N'5511999018382@c.us', N'5511999018382', NULL, NULL, NULL, NULL, N'Fabio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2339, N'Fabio', NULL, NULL, NULL, N'5511941283066@c.us', N'5511941283066', NULL, NULL, NULL, NULL, N'Fabio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2340, N'Fagner', NULL, NULL, NULL, N'5511975590215@c.us', N'5511975590215', NULL, NULL, NULL, NULL, N'Fagner', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2341, N'Fatima', NULL, NULL, NULL, N'5511976992141@c.us', N'5511976992141', NULL, NULL, NULL, NULL, N'Fatima', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2342, N'Fatima', NULL, NULL, NULL, N'5511947176050@c.us', N'5511947176050', NULL, NULL, NULL, NULL, N'Fatima', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2343, N'Fatima', NULL, NULL, NULL, N'5511996295137@c.us', N'5511996295137', NULL, NULL, NULL, NULL, N'Fatima', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2344, N'Felipe', NULL, NULL, NULL, N'5511948638276@c.us', N'5511948638276', NULL, NULL, NULL, NULL, N'Felipe', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2345, N'Felipe', NULL, NULL, NULL, N'5511981261006@c.us', N'5511981261006', NULL, NULL, NULL, NULL, N'Felipe', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2346, N'Felipe Santos', NULL, NULL, NULL, N'5511980861044@c.us', N'5511980861044', NULL, NULL, NULL, NULL, N'Felipe Santos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2347, N'Fernanda Barbato', NULL, NULL, NULL, N'5511982775354@c.us', N'5511982775354', NULL, NULL, NULL, NULL, N'Fernanda Barbato', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2348, N'Fernandinho', NULL, NULL, NULL, N'5511982221078@c.us', N'5511982221078', NULL, NULL, NULL, NULL, N'Fernandinho', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2349, N'Fernando', NULL, NULL, NULL, N'5511973740262@c.us', N'5511973740262', NULL, NULL, NULL, NULL, N'Fernando', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2350, N'Filipe Oliveira', NULL, NULL, NULL, N'5511957403089@c.us', N'5511957403089', NULL, NULL, NULL, NULL, N'Filipe Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/62081697_479510702810382_283891389735895040_n.jpg?oh=0cfb8b060febc02468a2bc0bf84b5356&oe=5F97AEB4', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2351, N'Flavia', NULL, NULL, NULL, N'5511984134797@c.us', N'5511984134797', NULL, NULL, NULL, NULL, N'Flavia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2352, N'Flavia', NULL, NULL, NULL, N'5511982714769@c.us', N'5511982714769', NULL, NULL, NULL, NULL, N'Flavia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2353, N'Flávia', NULL, NULL, NULL, N'5511971621430@c.us', N'5511971621430', NULL, NULL, NULL, NULL, N'Flávia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2354, N'Francisco', NULL, NULL, NULL, N'5511972999180@c.us', N'5511972999180', NULL, NULL, NULL, NULL, N'Francisco', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2355, N'Gabriel', NULL, NULL, NULL, N'5511994775111@c.us', N'5511994775111', NULL, NULL, NULL, NULL, N'Gabriel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2356, N'Gabriel', NULL, NULL, NULL, N'5511973100022@c.us', N'5511973100022', NULL, NULL, NULL, NULL, N'Gabriel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2357, N'Gabriel', NULL, NULL, NULL, N'556191192509@c.us', N'556191192509', NULL, NULL, NULL, NULL, N'Gabriel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2358, N'Gabriel', NULL, NULL, NULL, N'5511977107358@c.us', N'5511977107358', NULL, NULL, NULL, NULL, N'Gabriel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2359, N'Giovanna', NULL, NULL, NULL, N'5511994359624@c.us', N'5511994359624', NULL, NULL, NULL, NULL, N'Giovanna', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2360, N'Gizella', NULL, NULL, NULL, N'5511980118582@c.us', N'5511980118582', NULL, NULL, NULL, NULL, N'Gizella', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2361, N'Grazi Wz', NULL, NULL, NULL, N'5511982152878@c.us', N'5511982152878', NULL, NULL, NULL, NULL, N'Grazi Wz', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/119750377_375181346826534_6384707475033343705_n.jpg?oh=d75e9190835b9ce32278795e5cb34c9c&oe=5F96EF6D', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2362, N'Gueda', NULL, NULL, NULL, N'5511992000950@c.us', N'5511992000950', NULL, NULL, NULL, NULL, N'Gueda', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2363, N'Guilherme', NULL, NULL, NULL, N'5511953865594@c.us', N'5511953865594', NULL, NULL, NULL, NULL, N'Guilherme', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2364, N'Guilherme', NULL, NULL, NULL, N'5511992758012@c.us', N'5511992758012', NULL, NULL, NULL, NULL, N'Guilherme', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2365, N'Guixa', NULL, NULL, NULL, N'556193162475@c.us', N'556193162475', NULL, NULL, NULL, NULL, N'Guixa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2366, N'Gustavo', NULL, NULL, NULL, N'5511973467841@c.us', N'5511973467841', NULL, NULL, NULL, NULL, N'Gustavo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2367, N'Heber Pereira', NULL, NULL, NULL, N'5511960904879@c.us', N'5511960904879', NULL, NULL, NULL, NULL, N'Heber Pereira', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2368, N'Hélcio W Paulista', NULL, NULL, NULL, N'5511983274331@c.us', N'5511983274331', NULL, NULL, NULL, NULL, N'Hélcio W Paulista', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2369, N'Henri', NULL, NULL, NULL, N'5511975823969@c.us', N'5511975823969', NULL, NULL, NULL, NULL, N'Henri', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2370, N'Henrique', NULL, NULL, NULL, N'5511966305227@c.us', N'5511966305227', NULL, NULL, NULL, NULL, N'Henrique', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2371, N'Hindaya', NULL, NULL, NULL, N'5511985188923@c.us', N'5511985188923', NULL, NULL, NULL, NULL, N'Hindaya', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2372, N'Ilzeliro', NULL, NULL, NULL, N'5511994143841@c.us', N'5511994143841', NULL, NULL, NULL, NULL, N'Ilzeliro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2373, N'Ione', NULL, NULL, NULL, N'5511952809324@c.us', N'5511952809324', NULL, NULL, NULL, NULL, N'Ione', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2374, N'Isabelle', NULL, NULL, NULL, N'5511976530476@c.us', N'5511976530476', NULL, NULL, NULL, NULL, N'Isabelle', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2375, N'ivolete', NULL, NULL, NULL, N'5511996206786@c.us', N'5511996206786', NULL, NULL, NULL, NULL, N'ivolete', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2376, N'-Jorge Correio', NULL, NULL, NULL, N'5511987722994@c.us', N'5511987722994', NULL, NULL, NULL, NULL, N'-Jorge Correio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2377, N'Jair', NULL, NULL, NULL, N'5511995458216@c.us', N'5511995458216', NULL, NULL, NULL, NULL, N'Jair', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2378, N'Janaina', NULL, NULL, NULL, N'5511969421397@c.us', N'5511969421397', NULL, NULL, NULL, NULL, N'Janaina', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2379, N'Janete 11 99701-6782', NULL, NULL, NULL, N'5511997016782@c.us', N'5511997016782', NULL, NULL, NULL, NULL, N'Janete 11 99701-6782', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2380, N'Jardeson Antunes', NULL, NULL, NULL, N'5511984979506@c.us', N'5511984979506', NULL, NULL, NULL, NULL, N'Jardeson Antunes', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/71485992_142738783701231_8453319888410090513_n.jpg?oh=fdbc7d7678a336dd4827824fa36a2e38&oe=5F970203', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2381, N'Jayme Corretor', NULL, NULL, NULL, N'5511945423939@c.us', N'5511945423939', NULL, NULL, NULL, NULL, N'Jayme Corretor', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/56341700_267743590846684_4941864854827827200_n.jpg?oh=ff542d56c5f14dd91dc19fb41e27e1e1&oe=5F96F7DD', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2382, N'Jefferson', NULL, NULL, NULL, N'5511984076410@c.us', N'5511984076410', NULL, NULL, NULL, NULL, N'Jefferson', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2383, N'Jefferson 11 97411-4534', NULL, NULL, NULL, N'5511974114534@c.us', N'5511974114534', NULL, NULL, NULL, NULL, N'Jefferson 11 97411-4534', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2384, N'Jennifer', NULL, NULL, NULL, N'5511958579768@c.us', N'5511958579768', NULL, NULL, NULL, NULL, N'Jennifer', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2385, N'Jessica', NULL, NULL, NULL, N'5511979898376@c.us', N'5511979898376', NULL, NULL, NULL, NULL, N'Jessica', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2386, N'Jesus', NULL, NULL, NULL, N'5511984655288@c.us', N'5511984655288', NULL, NULL, NULL, NULL, N'Jesus', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2387, N'João', NULL, NULL, NULL, N'5511994891360@c.us', N'5511994891360', NULL, NULL, NULL, NULL, N'João', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2388, N'João', NULL, NULL, NULL, N'5511997187338@c.us', N'5511997187338', NULL, NULL, NULL, NULL, N'João', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2389, N'João Alexandro', NULL, NULL, NULL, N'5511973876385@c.us', N'5511973876385', NULL, NULL, NULL, NULL, N'João Alexandro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2390, N'João P', NULL, NULL, NULL, N'5511992182709@c.us', N'5511992182709', NULL, NULL, NULL, NULL, N'João P', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2391, N'João Paulo', NULL, NULL, NULL, N'5511985243002@c.us', N'5511985243002', NULL, NULL, NULL, NULL, N'João Paulo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2392, N'Joel', NULL, NULL, NULL, N'5511954999480@c.us', N'5511954999480', NULL, NULL, NULL, NULL, N'Joel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2393, N'Jorge', NULL, NULL, NULL, N'5511998081865@c.us', N'5511998081865', NULL, NULL, NULL, NULL, N'Jorge', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2394, N'Jose', NULL, NULL, NULL, N'5511948172859@c.us', N'5511948172859', NULL, NULL, NULL, NULL, N'Jose', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2395, N'José Corretor', NULL, NULL, NULL, N'5511972651069@c.us', N'5511972651069', NULL, NULL, NULL, NULL, N'José Corretor', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2396, N'Josefa', NULL, NULL, NULL, N'558197679852@c.us', N'558197679852', NULL, NULL, NULL, NULL, N'Josefa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2397, N'Josemary', NULL, NULL, NULL, N'555185307889@c.us', N'555185307889', NULL, NULL, NULL, NULL, N'Josemary', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2398, N'Juliana', NULL, NULL, NULL, N'5511967990710@c.us', N'5511967990710', NULL, NULL, NULL, NULL, N'Juliana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2399, N'Julio', NULL, NULL, NULL, N'5511988456980@c.us', N'5511988456980', NULL, NULL, NULL, NULL, N'Julio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2400, N'Julio Cesar', NULL, NULL, NULL, N'5511973411471@c.us', N'5511973411471', NULL, NULL, NULL, NULL, N'Julio Cesar', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2401, N'Junior', NULL, NULL, NULL, N'5511992174821@c.us', N'5511992174821', NULL, NULL, NULL, NULL, N'Junior', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2402, N'Júnior Zambrota', NULL, NULL, NULL, N'5511947345671@c.us', N'5511947345671', NULL, NULL, NULL, NULL, N'Júnior Zambrota', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2403, N'Karina', NULL, NULL, NULL, N'5511940873863@c.us', N'5511940873863', NULL, NULL, NULL, NULL, N'Karina', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2404, N'Karina/ Locação Wpaulista', NULL, NULL, NULL, N'5511996325521@c.us', N'5511996325521', NULL, NULL, NULL, NULL, N'Karina/ Locação Wpaulista', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2405, N'Katia', NULL, NULL, NULL, N'5511999766921@c.us', N'5511999766921', NULL, NULL, NULL, NULL, N'Katia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2406, N'Kelly Teles', NULL, NULL, NULL, N'5511982687465@c.us', N'5511982687465', NULL, NULL, NULL, NULL, N'Kelly Teles', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/118545862_360740354933745_2858756417841785725_n.jpg?oh=74521a2c036ec5e94496fe652a855e35&oe=5F96D8DD', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2407, N'Kleber Queroz', NULL, NULL, NULL, N'5511981987181@c.us', N'5511981987181', NULL, NULL, NULL, NULL, N'Kleber Queroz', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2408, N'Leandro', NULL, NULL, NULL, N'5511991872622@c.us', N'5511991872622', NULL, NULL, NULL, NULL, N'Leandro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2409, N'Leandro', NULL, NULL, NULL, N'5511981276510@c.us', N'5511981276510', NULL, NULL, NULL, NULL, N'Leandro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2410, N'Leandro Segala', NULL, NULL, NULL, N'5511984477102@c.us', N'5511984477102', NULL, NULL, NULL, NULL, N'Leandro Segala', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2411, N'Leila', NULL, NULL, NULL, N'5511960610015@c.us', N'5511960610015', NULL, NULL, NULL, NULL, N'Leila', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2412, N'Lesine', NULL, NULL, NULL, N'554199070678@c.us', N'554199070678', NULL, NULL, NULL, NULL, N'Lesine', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2413, N'Letícia', NULL, NULL, NULL, N'5511967002103@c.us', N'5511967002103', NULL, NULL, NULL, NULL, N'Letícia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2414, N'Lili Menezes', NULL, NULL, NULL, N'5511954511502@c.us', N'5511954511502', NULL, NULL, NULL, NULL, N'Lili Menezes', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2415, N'Lilian', NULL, NULL, NULL, N'5511972507887@c.us', N'5511972507887', NULL, NULL, NULL, NULL, N'Lilian', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2416, N'Lorena Santos', NULL, NULL, NULL, N'5511991377032@c.us', N'5511991377032', NULL, NULL, NULL, NULL, N'Lorena Santos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2417, N'Lu', NULL, NULL, NULL, N'5511940865790@c.us', N'5511940865790', NULL, NULL, NULL, NULL, N'Lu', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2418, N'Luan', NULL, NULL, NULL, N'5511953846206@c.us', N'5511953846206', NULL, NULL, NULL, NULL, N'Luan', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2419, N'Luana', NULL, NULL, NULL, N'5511952860487@c.us', N'5511952860487', NULL, NULL, NULL, NULL, N'Luana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2420, N'Luana Corretora', NULL, NULL, NULL, N'5513996488361@c.us', N'5513996488361', NULL, NULL, NULL, NULL, N'Luana Corretora', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2421, N'Lucas', NULL, NULL, NULL, N'5511991656631@c.us', N'5511991656631', NULL, NULL, NULL, NULL, N'Lucas', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2422, N'Lucas Oliveira E Lays', NULL, NULL, NULL, N'5511996167412@c.us', N'5511996167412', NULL, NULL, NULL, NULL, N'Lucas Oliveira E Lays', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2423, N'Luci Bevi', NULL, NULL, NULL, N'5511998542548@c.us', N'5511998542548', NULL, NULL, NULL, NULL, N'Luci Bevi', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/120576456_180416820237416_3663276320214624224_n.jpg?oh=251b4cdf7cf016259871ed74201e97d0&oe=5F97ABBB', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2424, N'Luciana', NULL, NULL, NULL, N'5511947310291@c.us', N'5511947310291', NULL, NULL, NULL, NULL, N'Luciana', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/57561312_655990284831146_8496037402794524672_n.jpg?oh=2870573d8509a62d38d89116f3ec94e4&oe=5F96E806', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2425, N'Luciano', NULL, NULL, NULL, N'5511995948175@c.us', N'5511995948175', NULL, NULL, NULL, NULL, N'Luciano', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2426, N'Lucila', NULL, NULL, NULL, N'5511971017353@c.us', N'5511971017353', NULL, NULL, NULL, NULL, N'Lucila', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2427, N'Lucy', NULL, NULL, NULL, N'5511947266300@c.us', N'5511947266300', NULL, NULL, NULL, NULL, N'Lucy', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2428, N'Luis', NULL, NULL, NULL, N'5511966662133@c.us', N'5511966662133', NULL, NULL, NULL, NULL, N'Luis', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2429, N'Luiz', NULL, NULL, NULL, N'5511971729887@c.us', N'5511971729887', NULL, NULL, NULL, NULL, N'Luiz', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2430, N'Magali', NULL, NULL, NULL, N'5511940177466@c.us', N'5511940177466', NULL, NULL, NULL, NULL, N'Magali', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2431, N'Manu', NULL, NULL, NULL, N'5511980727290@c.us', N'5511980727290', NULL, NULL, NULL, NULL, N'Manu', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2432, N'Mara', NULL, NULL, NULL, N'5511999424142@c.us', N'5511999424142', NULL, NULL, NULL, NULL, N'Mara', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2433, N'Marcelo', NULL, NULL, NULL, N'5511969125166@c.us', N'5511969125166', NULL, NULL, NULL, NULL, N'Marcelo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2434, N'Marcelo', NULL, NULL, NULL, N'5511975724440@c.us', N'5511975724440', NULL, NULL, NULL, NULL, N'Marcelo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2435, N'Marcelo', NULL, NULL, NULL, N'5511985325428@c.us', N'5511985325428', NULL, NULL, NULL, NULL, N'Marcelo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2436, N'Marcelo', NULL, NULL, NULL, N'5511991864957@c.us', N'5511991864957', NULL, NULL, NULL, NULL, N'Marcelo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2437, N'Marcia', NULL, NULL, NULL, N'5511982765301@c.us', N'5511982765301', NULL, NULL, NULL, NULL, N'Marcia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2438, N'Márcia Pigioni', NULL, NULL, NULL, N'5511983552176@c.us', N'5511983552176', NULL, NULL, NULL, NULL, N'Márcia Pigioni', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2439, N'Márcio Santos', NULL, NULL, NULL, N'5511949538876@c.us', N'5511949538876', NULL, NULL, NULL, NULL, N'Márcio Santos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2440, N'Marcos Monteiro', NULL, NULL, NULL, N'5511991910082@c.us', N'5511991910082', NULL, NULL, NULL, NULL, N'Marcos Monteiro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2441, N'Marcos Vinicios', NULL, NULL, NULL, N'5511970453532@c.us', N'5511970453532', NULL, NULL, NULL, NULL, N'Marcos Vinicios', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2442, N'Marcus Vinicios', NULL, NULL, NULL, N'5511994141234@c.us', N'5511994141234', NULL, NULL, NULL, NULL, N'Marcus Vinicios', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2443, N'Margarida', NULL, NULL, NULL, N'5511958541112@c.us', N'5511958541112', NULL, NULL, NULL, NULL, N'Margarida', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2444, N'Maria Lopez', NULL, NULL, NULL, N'5511971373267@c.us', N'5511971373267', NULL, NULL, NULL, NULL, N'Maria Lopez', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2445, N'Marilea', NULL, NULL, NULL, N'5511982244050@c.us', N'5511982244050', NULL, NULL, NULL, NULL, N'Marilea', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2446, N'Marilene', NULL, NULL, NULL, N'5511947209665@c.us', N'5511947209665', NULL, NULL, NULL, NULL, N'Marilene', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2447, N'Marilsa', NULL, NULL, NULL, N'5511971400616@c.us', N'5511971400616', NULL, NULL, NULL, NULL, N'Marilsa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2448, N'Marilu', NULL, NULL, NULL, N'5511991795236@c.us', N'5511991795236', NULL, NULL, NULL, NULL, N'Marilu', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2449, N'Mario Okuhara Locação WP', NULL, NULL, NULL, N'5511953188682@c.us', N'5511953188682', NULL, NULL, NULL, NULL, N'Mario Okuhara Locação WP', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2450, N'Marlan', NULL, NULL, NULL, N'5511974501747@c.us', N'5511974501747', NULL, NULL, NULL, NULL, N'Marlan', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2451, N'Marlon Tadeu', NULL, NULL, NULL, N'5511954796840@c.us', N'5511954796840', NULL, NULL, NULL, NULL, N'Marlon Tadeu', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/119176855_1316784595329675_6921398229894424320_n.jpg?oh=bacfd68a1cda1b34dbe473370521f212&oe=5F979CEF', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2452, N'Marta', NULL, NULL, NULL, N'5511967750159@c.us', N'5511967750159', NULL, NULL, NULL, NULL, N'Marta', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2453, N'Matheus', NULL, NULL, NULL, N'5511994974011@c.us', N'5511994974011', NULL, NULL, NULL, NULL, N'Matheus', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2454, N'Matheus Maia', NULL, NULL, NULL, N'5511985668506@c.us', N'5511985668506', NULL, NULL, NULL, NULL, N'Matheus Maia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2455, N'Mayara', NULL, NULL, NULL, N'5511970322582@c.us', N'5511970322582', NULL, NULL, NULL, NULL, N'Mayara', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2456, N'Meg', NULL, NULL, NULL, N'5511950536889@c.us', N'5511950536889', NULL, NULL, NULL, NULL, N'Meg', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2457, N'Michel', NULL, NULL, NULL, N'5511954855924@c.us', N'5511954855924', NULL, NULL, NULL, NULL, N'Michel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2458, N'Michel', NULL, NULL, NULL, N'5511973663578@c.us', N'5511973663578', NULL, NULL, NULL, NULL, N'Michel', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2459, N'Milena', NULL, NULL, NULL, N'5511938011577@c.us', N'5511938011577', NULL, NULL, NULL, NULL, N'Milena', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2460, N'Mirela', NULL, NULL, NULL, N'5511968292639@c.us', N'5511968292639', NULL, NULL, NULL, NULL, N'Mirela', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2461, N'Monicky', NULL, NULL, NULL, N'5511980105328@c.us', N'5511980105328', NULL, NULL, NULL, NULL, N'Monicky', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2462, N'Murilo', NULL, NULL, NULL, N'5514981691286@c.us', N'5514981691286', NULL, NULL, NULL, NULL, N'Murilo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2463, N'Myrellla', NULL, NULL, NULL, N'5511982454950@c.us', N'5511982454950', NULL, NULL, NULL, NULL, N'Myrellla', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2464, N'Naiana', NULL, NULL, NULL, N'5519982228495@c.us', N'5519982228495', NULL, NULL, NULL, NULL, N'Naiana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2465, N'Natalia', NULL, NULL, NULL, N'5511965017493@c.us', N'5511965017493', NULL, NULL, NULL, NULL, N'Natalia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2466, N'Natalia', NULL, NULL, NULL, N'5511998398112@c.us', N'5511998398112', NULL, NULL, NULL, NULL, N'Natalia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2467, N'Natália', NULL, NULL, NULL, N'5512991853724@c.us', N'5512991853724', NULL, NULL, NULL, NULL, N'Natália', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2468, N'Natalie Pinheiro', NULL, NULL, NULL, N'5511980670113@c.us', N'5511980670113', NULL, NULL, NULL, NULL, N'Natalie Pinheiro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2469, N'Nathalie', NULL, NULL, NULL, N'5511982369512@c.us', N'5511982369512', NULL, NULL, NULL, NULL, N'Nathalie', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2470, N'Nelson', NULL, NULL, NULL, N'5511986413144@c.us', N'5511986413144', NULL, NULL, NULL, NULL, N'Nelson', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2471, N'Odair', NULL, NULL, NULL, N'5511945941117@c.us', N'5511945941117', NULL, NULL, NULL, NULL, N'Odair', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2472, N'Patrícia', NULL, NULL, NULL, N'5511947783636@c.us', N'5511947783636', NULL, NULL, NULL, NULL, N'Patrícia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2473, N'Patrícia', NULL, NULL, NULL, N'5511972329884@c.us', N'5511972329884', NULL, NULL, NULL, NULL, N'Patrícia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2474, N'Patrícia', NULL, NULL, NULL, N'5511930072878@c.us', N'5511930072878', NULL, NULL, NULL, NULL, N'Patrícia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2475, N'Paula Salao', NULL, NULL, NULL, N'5511982476376@c.us', N'5511982476376', NULL, NULL, NULL, NULL, N'Paula Salao', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2476, N'Paulo', NULL, NULL, NULL, N'5511973134551@c.us', N'5511973134551', NULL, NULL, NULL, NULL, N'Paulo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2477, N'Paulo', NULL, NULL, NULL, N'5511941625249@c.us', N'5511941625249', NULL, NULL, NULL, NULL, N'Paulo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2478, N'Pedro', NULL, NULL, NULL, N'5511985459777@c.us', N'5511985459777', NULL, NULL, NULL, NULL, N'Pedro', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/121777169_201668218014369_8762108214273001585_n.jpg?oh=e7b6f052dd713c305d902ce8175e6dc5&oe=5F97CA80', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2479, N'Pertter', NULL, NULL, NULL, N'5511958281235@c.us', N'5511958281235', NULL, NULL, NULL, NULL, N'Pertter', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2480, N'Pollyana', NULL, NULL, NULL, N'5511989063294@c.us', N'5511989063294', NULL, NULL, NULL, NULL, N'Pollyana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2481, N'Priscila', NULL, NULL, NULL, N'5511961442209@c.us', N'5511961442209', NULL, NULL, NULL, NULL, N'Priscila', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2482, N'Rafael', NULL, NULL, NULL, N'5511947341975@c.us', N'5511947341975', NULL, NULL, NULL, NULL, N'Rafael', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2483, N'Rafael', NULL, NULL, NULL, N'5511982649315@c.us', N'5511982649315', NULL, NULL, NULL, NULL, N'Rafael', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2484, N'Rafael Vivo', NULL, NULL, NULL, N'5511981715215@c.us', N'5511981715215', NULL, NULL, NULL, NULL, N'Rafael Vivo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2485, N'Rafaella Aires', NULL, NULL, NULL, N'5511984827304@c.us', N'5511984827304', NULL, NULL, NULL, NULL, N'Rafaella Aires', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/55964578_388503231992453_5670154449096540160_n.jpg?oh=df62062793d3234af9fac657fa27fc90&oe=5F97DA95', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2486, N'Raymundo', NULL, NULL, NULL, N'5511960334145@c.us', N'5511960334145', NULL, NULL, NULL, NULL, N'Raymundo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2487, N'Regina', NULL, NULL, NULL, N'5511991047268@c.us', N'5511991047268', NULL, NULL, NULL, NULL, N'Regina', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2488, N'Renato', NULL, NULL, NULL, N'5511971969605@c.us', N'5511971969605', NULL, NULL, NULL, NULL, N'Renato', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2489, N'Renato Portela', NULL, NULL, NULL, N'5511982158979@c.us', N'5511982158979', NULL, NULL, NULL, NULL, N'Renato Portela', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2490, N'Ricardo Veiga', NULL, NULL, NULL, N'5511977384244@c.us', N'5511977384244', NULL, NULL, NULL, NULL, N'Ricardo Veiga', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2491, N'Richard', NULL, NULL, NULL, N'5511988362728@c.us', N'5511988362728', NULL, NULL, NULL, NULL, N'Richard', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2492, N'Rick', NULL, NULL, NULL, N'5511982764142@c.us', N'5511982764142', NULL, NULL, NULL, NULL, N'Rick', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2493, N'Robson', NULL, NULL, NULL, N'5511941602368@c.us', N'5511941602368', NULL, NULL, NULL, NULL, N'Robson', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2494, N'Rogerio', NULL, NULL, NULL, N'5511947324706@c.us', N'5511947324706', NULL, NULL, NULL, NULL, N'Rogerio', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2495, N'Romulo', NULL, NULL, NULL, N'5511980662308@c.us', N'5511980662308', NULL, NULL, NULL, NULL, N'Romulo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2496, N'Ronaldo', NULL, NULL, NULL, N'5511974641402@c.us', N'5511974641402', NULL, NULL, NULL, NULL, N'Ronaldo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2497, N'Ronaldo', NULL, NULL, NULL, N'5511947342924@c.us', N'5511947342924', NULL, NULL, NULL, NULL, N'Ronaldo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2498, N'Ronaldo', NULL, NULL, NULL, N'5511968206059@c.us', N'5511968206059', NULL, NULL, NULL, NULL, N'Ronaldo', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2499, N'Ronan', NULL, NULL, NULL, N'5511998551046@c.us', N'5511998551046', NULL, NULL, NULL, NULL, N'Ronan', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2500, N'Rondinelli', NULL, NULL, NULL, N'5511970149800@c.us', N'5511970149800', NULL, NULL, NULL, NULL, N'Rondinelli', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2501, N'Rosângela', NULL, NULL, NULL, N'5511984812264@c.us', N'5511984812264', NULL, NULL, NULL, NULL, N'Rosângela', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2502, N'Rose', NULL, NULL, NULL, N'5511963952110@c.us', N'5511963952110', NULL, NULL, NULL, NULL, N'Rose', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2503, N'Rosiana', NULL, NULL, NULL, N'5511997905027@c.us', N'5511997905027', NULL, NULL, NULL, NULL, N'Rosiana', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2504, N'Rubens', NULL, NULL, NULL, N'5511950373116@c.us', N'5511950373116', NULL, NULL, NULL, NULL, N'Rubens', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2505, N'Samira Ribeiro', NULL, NULL, NULL, N'5511968396819@c.us', N'5511968396819', NULL, NULL, NULL, NULL, N'Samira Ribeiro', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2506, N'Sandra Franco', NULL, NULL, NULL, N'5511981310281@c.us', N'5511981310281', NULL, NULL, NULL, NULL, N'Sandra Franco', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2507, N'Sandra Lira Xavier', NULL, NULL, NULL, N'5511961390652@c.us', N'5511961390652', NULL, NULL, NULL, NULL, N'Sandra Lira Xavier', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2508, N'Santiago', NULL, NULL, NULL, N'5511983760789@c.us', N'5511983760789', NULL, NULL, NULL, NULL, N'Santiago', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2509, N'Sebastian Slamovitz', NULL, NULL, NULL, N'5511985551997@c.us', N'5511985551997', NULL, NULL, NULL, NULL, N'Sebastian Slamovitz', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2510, N'Sheyla', NULL, NULL, NULL, N'5511998348668@c.us', N'5511998348668', NULL, NULL, NULL, NULL, N'Sheyla', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2511, N'Silas', NULL, NULL, NULL, N'5511963171088@c.us', N'5511963171088', NULL, NULL, NULL, NULL, N'Silas', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2512, N'Silvia', NULL, NULL, NULL, N'5511973066247@c.us', N'5511973066247', NULL, NULL, NULL, NULL, N'Silvia', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2513, N'Simony', NULL, NULL, NULL, N'5511985570541@c.us', N'5511985570541', NULL, NULL, NULL, NULL, N'Simony', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2514, N'Sirlene', NULL, NULL, NULL, N'5511982882432@c.us', N'5511982882432', NULL, NULL, NULL, NULL, N'Sirlene', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2515, N'Socorro Veiga', NULL, NULL, NULL, N'5511979872899@c.us', N'5511979872899', NULL, NULL, NULL, NULL, N'Socorro Veiga', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2516, N'Sônia WZ', NULL, NULL, NULL, N'5511994307381@c.us', N'5511994307381', NULL, NULL, NULL, NULL, N'Sônia WZ', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2517, N'Sucineide', NULL, NULL, NULL, N'5511997568579@c.us', N'5511997568579', NULL, NULL, NULL, NULL, N'Sucineide', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2518, N'Suelene', NULL, NULL, NULL, N'5511953414510@c.us', N'5511953414510', NULL, NULL, NULL, NULL, N'Suelene', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2519, N'Tadeu Locação', NULL, NULL, NULL, N'5511981683076@c.us', N'5511981683076', NULL, NULL, NULL, NULL, N'Tadeu Locação', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2520, N'Tanaka', NULL, NULL, NULL, N'5511989914923@c.us', N'5511989914923', NULL, NULL, NULL, NULL, N'Tanaka', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2521, N'Tania', NULL, NULL, NULL, N'5511999126185@c.us', N'5511999126185', NULL, NULL, NULL, NULL, N'Tania', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2522, N'Tereza', NULL, NULL, NULL, N'5511995057654@c.us', N'5511995057654', NULL, NULL, NULL, NULL, N'Tereza', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2523, N'Thaís', NULL, NULL, NULL, N'5511998971916@c.us', N'5511998971916', NULL, NULL, NULL, NULL, N'Thaís', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2524, N'Thalita', NULL, NULL, NULL, N'5511959937855@c.us', N'5511959937855', NULL, NULL, NULL, NULL, N'Thalita', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2525, N'Thalita', NULL, NULL, NULL, N'5511997190794@c.us', N'5511997190794', NULL, NULL, NULL, NULL, N'Thalita', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2526, N'Thamiris', NULL, NULL, NULL, N'5511994374949@c.us', N'5511994374949', NULL, NULL, NULL, NULL, N'Thamiris', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2527, N'Thaty', NULL, NULL, NULL, N'5511996827883@c.us', N'5511996827883', NULL, NULL, NULL, NULL, N'Thaty', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2528, N'Thiago', NULL, NULL, NULL, N'5511999629003@c.us', N'5511999629003', NULL, NULL, NULL, NULL, N'Thiago', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2529, N'Tiara', NULL, NULL, NULL, N'5511991552418@c.us', N'5511991552418', NULL, NULL, NULL, NULL, N'Tiara', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2530, N'Tuany Kaori Nakama', NULL, NULL, NULL, N'5511973314308@c.us', N'5511973314308', NULL, NULL, NULL, NULL, N'Tuany Kaori Nakama', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2531, N'Turin', NULL, NULL, NULL, N'5511947140587@c.us', N'5511947140587', NULL, NULL, NULL, NULL, N'Turin', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/56153818_995661733958324_5455862871248338944_n.jpg?oh=b2c6fbee309d4beb8246536de81b850b&oe=5F97EE36', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2532, N'Uilquer', NULL, NULL, NULL, N'5511982657424@c.us', N'5511982657424', NULL, NULL, NULL, NULL, N'Uilquer', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2533, N'Valéria', NULL, NULL, NULL, N'5511984263626@c.us', N'5511984263626', NULL, NULL, NULL, NULL, N'Valéria', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2534, N'Vanessa', NULL, NULL, NULL, N'5511997603436@c.us', N'5511997603436', NULL, NULL, NULL, NULL, N'Vanessa', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2535, N'Vanessa Santos', NULL, NULL, NULL, N'5511962688911@c.us', N'5511962688911', NULL, NULL, NULL, NULL, N'Vanessa Santos', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2536, N'Vania', NULL, NULL, NULL, N'5511953532484@c.us', N'5511953532484', NULL, NULL, NULL, NULL, N'Vania', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2537, N'Vanice', NULL, NULL, NULL, N'5511975638211@c.us', N'5511975638211', NULL, NULL, NULL, NULL, N'Vanice', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2538, N'Vera', NULL, NULL, NULL, N'5511959202046@c.us', N'5511959202046', NULL, NULL, NULL, NULL, N'Vera', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2539, N'Vicent Coelho', NULL, NULL, NULL, N'5511979629123@c.us', N'5511979629123', NULL, NULL, NULL, NULL, N'Vicent Coelho', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2540, N'Victor', NULL, NULL, NULL, N'5511947425699@c.us', N'5511947425699', NULL, NULL, NULL, NULL, N'Victor', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2541, N'Vinícius', NULL, NULL, NULL, N'5511985279521@c.us', N'5511985279521', NULL, NULL, NULL, NULL, N'Vinícius', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2542, N'Vinícius Soares Luchi', NULL, NULL, NULL, N'5515991731275@c.us', N'5515991731275', NULL, NULL, NULL, NULL, N'Vinícius Soares Luchi', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2543, N'Walkiria', NULL, NULL, NULL, N'5511984508366@c.us', N'5511984508366', NULL, NULL, NULL, NULL, N'Walkiria', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2544, N'Washington', NULL, NULL, NULL, N'5511960640303@c.us', N'5511960640303', NULL, NULL, NULL, NULL, N'Washington', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2545, N'Wesley', NULL, NULL, NULL, N'5511958664795@c.us', N'5511958664795', NULL, NULL, NULL, NULL, N'Wesley', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2546, N'William Chalegra', NULL, NULL, NULL, N'5511995942262@c.us', N'5511995942262', NULL, NULL, NULL, NULL, N'William Chalegra', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2547, N'Willian', NULL, NULL, NULL, N'5511977867615@c.us', N'5511977867615', NULL, NULL, NULL, NULL, N'Willian', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2548, N'Wilson', NULL, NULL, NULL, N'5511981918454@c.us', N'5511981918454', NULL, NULL, NULL, NULL, N'Wilson', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2549, N'+1 (786) 683-1016', NULL, NULL, NULL, N'17866831016@c.us', N'17866831016', NULL, NULL, NULL, NULL, N'+1 (786) 683-1016', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2550, N'+55 11 3199-5786', NULL, NULL, NULL, N'551131995786@c.us', N'551131995786', NULL, NULL, NULL, NULL, N'+55 11 3199-5786', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2551, N'+55 11 94036-4965', NULL, NULL, NULL, N'5511940364965@c.us', N'5511940364965', NULL, NULL, NULL, NULL, N'+55 11 94036-4965', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2552, N'+55 11 94218-3325', NULL, NULL, NULL, N'5511942183325@c.us', N'5511942183325', NULL, NULL, NULL, NULL, N'+55 11 94218-3325', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2553, N'+55 11 94383-5272', NULL, NULL, NULL, N'5511943835272@c.us', N'5511943835272', NULL, NULL, NULL, NULL, N'+55 11 94383-5272', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2554, N'+55 11 94685-4324', NULL, NULL, NULL, N'5511946854324@c.us', N'5511946854324', NULL, NULL, NULL, NULL, N'+55 11 94685-4324', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2555, N'+55 11 94747-7525', NULL, NULL, NULL, N'5511947477525@c.us', N'5511947477525', NULL, NULL, NULL, NULL, N'+55 11 94747-7525', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2556, N'+55 11 94789-5458', NULL, NULL, NULL, N'5511947895458@c.us', N'5511947895458', NULL, NULL, NULL, NULL, N'+55 11 94789-5458', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2557, N'+55 11 95288-0268', NULL, NULL, NULL, N'5511952880268@c.us', N'5511952880268', NULL, NULL, NULL, NULL, N'+55 11 95288-0268', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2558, N'+55 11 95948-4448', NULL, NULL, NULL, N'5511959484448@c.us', N'5511959484448', NULL, NULL, NULL, NULL, N'+55 11 95948-4448', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2559, N'+55 11 95988-0375', NULL, NULL, NULL, N'5511959880375@c.us', N'5511959880375', NULL, NULL, NULL, NULL, N'+55 11 95988-0375', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2560, N'+55 11 96074-7739', NULL, NULL, NULL, N'5511960747739@c.us', N'5511960747739', NULL, NULL, NULL, NULL, N'+55 11 96074-7739', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2561, N'+55 11 96248-7211', NULL, NULL, NULL, N'5511962487211@c.us', N'5511962487211', NULL, NULL, NULL, NULL, N'+55 11 96248-7211', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2562, N'+55 11 96427-1937', NULL, NULL, NULL, N'5511964271937@c.us', N'5511964271937', NULL, NULL, NULL, NULL, N'+55 11 96427-1937', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2563, N'+55 11 96532-4052', NULL, NULL, NULL, N'5511965324052@c.us', N'5511965324052', NULL, NULL, NULL, NULL, N'+55 11 96532-4052', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2564, N'+55 11 97119-6997', NULL, NULL, NULL, N'5511971196997@c.us', N'5511971196997', NULL, NULL, NULL, NULL, N'+55 11 97119-6997', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2565, N'+55 11 97250-3979', NULL, NULL, NULL, N'5511972503979@c.us', N'5511972503979', NULL, NULL, NULL, NULL, N'+55 11 97250-3979', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2566, N'+55 11 97614-2569', NULL, NULL, NULL, N'5511976142569@c.us', N'5511976142569', NULL, NULL, NULL, NULL, N'+55 11 97614-2569', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2567, N'+55 11 97662-9123', NULL, NULL, NULL, N'5511976629123@c.us', N'5511976629123', NULL, NULL, NULL, NULL, N'+55 11 97662-9123', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2568, N'+55 11 97684-6370', NULL, NULL, NULL, N'5511976846370@c.us', N'5511976846370', NULL, NULL, NULL, NULL, N'+55 11 97684-6370', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2569, N'+55 11 97738-1563', NULL, NULL, NULL, N'5511977381563@c.us', N'5511977381563', NULL, NULL, NULL, NULL, N'+55 11 97738-1563', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2570, N'+55 11 97959-1079', NULL, NULL, NULL, N'5511979591079@c.us', N'5511979591079', NULL, NULL, NULL, NULL, N'+55 11 97959-1079', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2571, N'+55 11 98138-6308', NULL, NULL, NULL, N'5511981386308@c.us', N'5511981386308', NULL, NULL, NULL, NULL, N'+55 11 98138-6308', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2572, N'+55 11 98187-0509', NULL, NULL, NULL, N'5511981870509@c.us', N'5511981870509', NULL, NULL, NULL, NULL, N'+55 11 98187-0509', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2573, N'+55 11 98249-6539', NULL, NULL, NULL, N'5511982496539@c.us', N'5511982496539', NULL, NULL, NULL, NULL, N'+55 11 98249-6539', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2574, N'+55 11 98281-8922', NULL, NULL, NULL, N'5511982818922@c.us', N'5511982818922', NULL, NULL, NULL, NULL, N'+55 11 98281-8922', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2575, N'+55 11 98295-7264', NULL, NULL, NULL, N'5511982957264@c.us', N'5511982957264', NULL, NULL, NULL, NULL, N'+55 11 98295-7264', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2576, N'+55 11 98302-7977', NULL, NULL, NULL, N'5511983027977@c.us', N'5511983027977', NULL, NULL, NULL, NULL, N'+55 11 98302-7977', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2577, N'+55 11 98465-1853', NULL, NULL, NULL, N'5511984651853@c.us', N'5511984651853', NULL, NULL, NULL, NULL, N'+55 11 98465-1853', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2578, N'+55 11 98621-7506', NULL, NULL, NULL, N'5511986217506@c.us', N'5511986217506', NULL, NULL, NULL, NULL, N'+55 11 98621-7506', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2579, N'+55 11 98784-9034', NULL, NULL, NULL, N'5511987849034@c.us', N'5511987849034', NULL, NULL, NULL, NULL, N'+55 11 98784-9034', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2580, N'+55 11 98830-0533', NULL, NULL, NULL, N'5511988300533@c.us', N'5511988300533', NULL, NULL, NULL, NULL, N'+55 11 98830-0533', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2581, N'+55 11 98932-0837', NULL, NULL, NULL, N'5511989320837@c.us', N'5511989320837', NULL, NULL, NULL, NULL, N'+55 11 98932-0837', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2582, N'+55 11 99218-6277', NULL, NULL, NULL, N'5511992186277@c.us', N'5511992186277', NULL, NULL, NULL, NULL, N'+55 11 99218-6277', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2583, N'+55 11 99260-3401', NULL, NULL, NULL, N'5511992603401@c.us', N'5511992603401', NULL, NULL, NULL, NULL, N'+55 11 99260-3401', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2584, N'+55 11 99460-2733', NULL, NULL, NULL, N'5511994602733@c.us', N'5511994602733', NULL, NULL, NULL, NULL, N'+55 11 99460-2733', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2585, N'+55 11 99923-0692', NULL, NULL, NULL, N'5511999230692@c.us', N'5511999230692', NULL, NULL, NULL, NULL, N'+55 11 99923-0692', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2586, N'+55 12 98101-7424', NULL, NULL, NULL, N'5512981017424@c.us', N'5512981017424', NULL, NULL, NULL, NULL, N'+55 12 98101-7424', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2587, N'+55 63 9260-6156', NULL, NULL, NULL, N'556392606156@c.us', N'556392606156', NULL, NULL, NULL, NULL, N'+55 63 9260-6156', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2588, N'+55 77 8106-1690', NULL, NULL, NULL, N'557781061690@c.us', N'557781061690', NULL, NULL, NULL, NULL, N'+55 77 8106-1690', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2589, N'', NULL, NULL, NULL, N'status@broadcast', N'status', NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2590, N'Você', NULL, NULL, NULL, N'551123913805@c.us', N'551123913805', NULL, NULL, NULL, NULL, N'Você', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/95089627_666950010548608_8080281844265284372_n.jpg?oh=7516079fd7f3b111f57c9333c3cf431c&oe=5F980222', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2591, NULL, NULL, NULL, NULL, N'false_5511947310291@c.us_3A41FF9F9ED0ABDC0C0C', N'5511947310291', N'5511947310291@c.us', NULL, N'WhatsApp', NULL, N'Luciana Barbosa', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/57561312_655990284831146_8496037402794524672_n.jpg?oh=2870573d8509a62d38d89116f3ec94e4&oe=5F96E806', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2592, NULL, NULL, NULL, NULL, N'false_5511972651069@c.us_4E0F84A385D13975C587E963A', N'5511972651069', N'5511972651069@c.us', NULL, N'WhatsApp', NULL, N'551123913805', NULL, NULL, NULL, NULL, NULL, NULL, N'https://pps.whatsapp.net/v/t61.24694-24/56424353_425491138282010_4590560826645020672_n.jpg?oh=b9682e4c758de4e2335b1830b27f9083&oe=5F97B190', 0, NULL)
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2594, N'5511963191922', NULL, NULL, NULL, N'5511963191922', N'5511963191922', N'5511963191922', N'63191922', N'whatsapp', NULL, N'Ary Bevilaqua', NULL, NULL, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIDdFQTFFODQ1RkMy', N'5511947658244', NULL, NULL, N'', 0, CAST(N'2024-05-14 09:08:34.000' AS DateTime))
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2595, N'16315551181', NULL, NULL, NULL, N'16315551181', N'16315551181', N'16315551181', N'15551181', N'whatsapp', NULL, N'test user name', NULL, NULL, NULL, NULL, NULL, NULL, N'', 0, CAST(N'2024-03-18 16:56:39.967' AS DateTime))
GO
INSERT [dbo].[Contatos] ([IdContato], [NomeInformado], [Documento], [NomeDoc], [Codigo], [IdWhatsApp], [Telefone], [UserWhatsApp], [ClienteExterno], [Cadastro], [Status], [NomeRetornado], [UltimoAcesso], [Email], [FaceId], [FaceRecipentId], [Sexo], [FaceMsgId], [ImageProfile], [IdConfig], [DataAtualizacao]) VALUES (2593, N'Teste1', N'', NULL, N'', NULL, N'11999999991', N'Teste1', NULL, NULL, NULL, N'Teste1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL)
GO
SET IDENTITY_INSERT [dbo].[Contatos] OFF
GO
SET IDENTITY_INSERT [dbo].[Conversas] ON 

GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21729, 1, 0, NULL, N'Saida', N'Chat', 0, 0, CAST(N'2020-12-17 22:35:19.397' AS DateTime), N'   ', 1, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21728, 1, 0, NULL, N'Saida', N'Chat', 0, 0, CAST(N'2020-12-17 12:00:24.220' AS DateTime), N'   ', 1, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21727, 1, 0, NULL, N'Saida', N'Chat', 0, 0, CAST(N'2020-12-17 11:58:14.967' AS DateTime), N'   ', 1, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20790, 1, 2253, N'false_5511987776003@c.us_489DAF39E3E017973A24F0E9F', N'Entrada', NULL, 0, 0, CAST(N'2020-08-30 20:59:51.000' AS DateTime), N'Oi ??\nTudo bm com vc???', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20788, 1, 2253, N'false_5511987776003@c.us_EC10FBB8A82ADC23740F3C1E2', N'Entrada', NULL, 0, 0, CAST(N'2020-08-30 20:59:50.000' AS DateTime), N'Vc pode fazer o seu pedido ?? até 31/08/20 e a gente combina a entrega ????????????? ????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20789, 1, 2253, N'false_5511987776003@c.us_8E0965077295F59F60E5616E8', N'Entrada', NULL, 0, 0, CAST(N'2020-08-30 20:59:50.000' AS DateTime), N'Você já conhece a nova Revista Natura Interativa? \n\nNela você já pode escolher os seus produtos, fechar a compra e me enviar por aqui mesmo. \nRápido e prático. \nQualquer dúvida estou a disposição! \n\n*Acesse o link e confira* ??\nhttps://viewer.ipaper.io/natura-cosmeticos-sa/br/2020/14brasil/pt-br/revista/ciclo-14nedh/', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20785, 1, 2253, N'false_5511987776003@c.us_78A6FEFAE59B75C3FA001F235', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 02:35:32.000' AS DateTime), N'Oie??\nDá uma olhada nessas promoções ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20786, 1, 2253, N'false_5511987776003@c.us_A852304821DB7A3D444CFF85A', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 02:35:32.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20787, 1, 2253, N'false_5511987776003@c.us_3D995419AC705AC65083DD81C', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 02:35:32.000' AS DateTime), N'Pedidos até  22/07\nEntregas a combinar ??????????????????????????????????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20784, 1, 2253, N'false_5511987776003@c.us_AA05B66A7F1D4A1CFB1534645', N'Entrada', NULL, 0, 0, CAST(N'2020-05-30 19:46:15.000' AS DateTime), N'Pedidos até dia 15/06', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20783, 1, 2253, N'false_5511987776003@c.us_09A0898FE342AF0AB2C982AC6', N'Entrada', NULL, 0, 0, CAST(N'2020-05-30 19:46:14.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20782, 1, 2253, N'false_5511987776003@c.us_46E1641DA48A0F3854D83CF02', N'Entrada', NULL, 0, 0, CAST(N'2020-03-29 18:58:19.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20781, 1, 2253, N'false_5511987776003@c.us_8354385B615E624CB3A95D8DE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 21:13:33.000' AS DateTime), N'Vou olhar e nos falamos depois', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20780, 1, 2253, N'false_5511987776003@c.us_90A7D1C76003A00ADC40249A0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 21:12:12.000' AS DateTime), N'Obrigada pela atenção', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20793, 1, 2258, N'false_5511998255711@c.us_3A48B2467BFDB287F1AE', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:30:49.000' AS DateTime), N'Esse valor é negociável??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20792, 1, 2258, N'false_5511998255711@c.us_3A22EFA97A6B984DEBE7', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:20:44.000' AS DateTime), N'E vc pode me enviar a planta do apartamento??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20791, 1, 2258, N'false_5511998255711@c.us_3A3CF5FBA8B098CE72D6', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:20:01.000' AS DateTime), N'Qual o valor da unidade ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20797, 1, 2259, N'false_5511992301594@c.us_20D56DB3C4EBAE208452DBF42', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 14:40:51.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20796, 1, 2259, N'false_5511992301594@c.us_85B6743A924FBE09B9AD7AFA7', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 14:40:14.000' AS DateTime), N'Gostaria sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20795, 1, 2259, N'false_5511992301594@c.us_01490F9564F74C7685CFFBE4E', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:43:18.000' AS DateTime), N'Meu email pessoal', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20794, 1, 2259, N'false_5511992301594@c.us_42078B2222F36AD03E3F6151A', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:42:56.000' AS DateTime), N'Mande para www.aleksandrasp@gmail.com', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20798, 1, 2263, N'false_5511996883858@c.us_4FC3ECC9F8078D4EC4FE44518', N'Entrada', NULL, 0, 0, CAST(N'2020-10-02 16:13:16.000' AS DateTime), N'Obrigado,  mas o valor está fora do meu orçamento... para investimento,  procuro apto até 300 k', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20800, 1, 2266, N'false_5511991293838@c.us_5E6BBED10B2669AA0980', N'Entrada', NULL, 0, 0, CAST(N'2019-12-09 13:02:56.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20799, 1, 2266, N'false_5511991293838@c.us_3AE2CD2E5E8787A9B1B5', N'Entrada', NULL, 0, 0, CAST(N'2019-12-09 13:02:29.000' AS DateTime), N'Oi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20847, 1, 2268, N'false_5511997046811@c.us_2AA312DC541F759604DDD82CA', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 22:15:52.000' AS DateTime), N'Obrigado pela atenção de qq forma', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20846, 1, 2268, N'false_5511997046811@c.us_A49FC5CBC52B64FD9180715D8', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 22:15:36.000' AS DateTime), N'Ta certo,', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20845, 1, 2268, N'false_5511997046811@c.us_6AFAD458DD4E3832C3B7EC3C5', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:24:26.000' AS DateTime), N'Nao da para mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20844, 1, 2268, N'false_5511997046811@c.us_77844617BD7EECD2CBE783068', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:24:18.000' AS DateTime), N'Muito caro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20843, 1, 2268, N'false_5511997046811@c.us_40DEAAA69F65FA8F0700D500A', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:24:15.000' AS DateTime), N'Uaaauuu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20842, 1, 2268, N'false_5511997046811@c.us_61F1D3715E3CD6ABF0BF4BC42', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:24:12.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20841, 1, 2268, N'false_5511997046811@c.us_31257D204628621C6CAB37B76', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 20:22:55.000' AS DateTime), N'video', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20840, 1, 2268, N'false_5511997046811@c.us_A10E845EE010FDB3161DA486B', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 20:22:04.000' AS DateTime), N'Qria um acima do 15', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20839, 1, 2268, N'false_5511997046811@c.us_5A497C9BBB087E63240C0B9B8', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 20:21:51.000' AS DateTime), N'Muito baixo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20838, 1, 2268, N'false_5511997046811@c.us_05399AA6A396E3495BD0613C9', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 20:19:42.000' AS DateTime), N'revoked', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20837, 1, 2268, N'false_5511997046811@c.us_1996FC87E4B0DBA241FB3BC09', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 17:35:18.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20836, 1, 2268, N'false_5511997046811@c.us_03D4FC8C79E579EE6227F0D86', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 16:30:40.000' AS DateTime), N'Tem fotos?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20835, 1, 2268, N'false_5511997046811@c.us_5D54C7288320093887C537014', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 16:30:19.000' AS DateTime), N'Qual andar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20834, 1, 2268, N'false_5511997046811@c.us_8C1C2DC8819E23EC00D89FE3C', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 16:30:12.000' AS DateTime), N'Boa tarde !', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20833, 1, 2268, N'false_5511997046811@c.us_E02ED371391511D876E169BF1', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 17:50:14.000' AS DateTime), N'Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20832, 1, 2268, N'false_5511997046811@c.us_3F819E28700F2D9286FAEF0CB', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 17:50:10.000' AS DateTime), N'Ta bem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20831, 1, 2268, N'false_5511997046811@c.us_6FE44AD6E8CB5BE17821816D7', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 17:09:51.000' AS DateTime), N'Que pena, esta alto pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20830, 1, 2268, N'false_5511997046811@c.us_E63A861EAAFB71D38F62A4E16', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:19:29.000' AS DateTime), N'Locação', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20829, 1, 2268, N'false_5511997046811@c.us_CE52C4EE4342A5F24A9347588', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:19:24.000' AS DateTime), N'Locaçãi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20828, 1, 2268, N'false_5511997046811@c.us_97C252DE5B7ACF286A0CC29D7', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 15:48:59.000' AS DateTime), N'Ok, te aguardo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20827, 1, 2268, N'false_5511997046811@c.us_DC435FA9844F3459CF3592AA3', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 12:45:02.000' AS DateTime), N'Aluguei o apartamento que eu iria vender. Por acaso vc tem algum no Ed. Brasil com vista para 9 de julho ou area de laser em andar alto?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20826, 1, 2268, N'false_5511997046811@c.us_8EF901D3D161C38EA96871D12', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 12:44:04.000' AS DateTime), N'Bom dia Luci!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20825, 1, 2268, N'false_5511997046811@c.us_DB70B8889B87C7DF21C3F34F6', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 20:26:22.000' AS DateTime), N'Ainda nao, preciso vender o meu...e esse lado virado para paulista tem muito sol', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20824, 1, 2268, N'false_5511997046811@c.us_0ECA5E7CE92B493500E4469AF', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 20:18:10.000' AS DateTime), N'Obrigado pelas informações', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20823, 1, 2268, N'false_5511997046811@c.us_3C3BE612FBDA91FF7FC80E915', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 20:17:58.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20822, 1, 2268, N'false_5511997046811@c.us_0286490D387B9A170050860BC', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:36:56.000' AS DateTime), N'50 ou 52', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20821, 1, 2268, N'false_5511997046811@c.us_4A24860FF6FC59219DEDB58F3', N'Entrada', NULL, 0, 0, CAST(N'2020-01-25 19:12:55.000' AS DateTime), N'Por acaso vc tem alguma unidade em andar alto com a fachada para 9 de julho?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20820, 1, 2268, N'false_5511997046811@c.us_12765541C617B9324DD4D7F26', N'Entrada', NULL, 0, 0, CAST(N'2020-01-25 19:12:22.000' AS DateTime), N'Boa tarde Luci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20819, 1, 2268, N'false_5511997046811@c.us_DFA25000D86654C8DE6F76458', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:25:34.000' AS DateTime), N'Bom dia !', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20818, 1, 2268, N'false_5511997046811@c.us_A4539CA09F9E048209C15CF02', N'Entrada', NULL, 0, 0, CAST(N'2019-12-19 19:38:59.000' AS DateTime), N'Boa tarde Luci !\n\nGrato pelas informações', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20809, 1, 2269, N'false_556581299760@c.us_250763E87B6C880DE6A1D8E977', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 14:47:59.000' AS DateTime), N'Nenhuma', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20808, 1, 2269, N'false_556581299760@c.us_02B46BBA16287847BBE40858A5', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:10:51.000' AS DateTime), N'Obg! Tem planta baixa?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20804, 1, 2270, N'false_5511962584061@c.us_BBA66A0B44B30857D19591ADC', N'Entrada', NULL, 0, 0, CAST(N'2020-02-12 14:43:50.000' AS DateTime), N'Me disseram que entrariam em contato comigo por mensagem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20803, 1, 2270, N'false_5511962584061@c.us_D0BE72F3471BDCE833551F3C6', N'Entrada', NULL, 0, 0, CAST(N'2020-02-12 14:29:23.000' AS DateTime), N'Me ligaram nesse número', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20802, 1, 2270, N'false_5511962584061@c.us_396584E03F0D773BA2FD5B947', N'Entrada', NULL, 0, 0, CAST(N'2020-02-12 14:28:57.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20801, 1, 2270, N'false_5511962584061@c.us_D4951457431A2328F5D1575BF', N'Entrada', NULL, 0, 0, CAST(N'2020-02-12 14:28:54.000' AS DateTime), N'Oi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20807, 1, 2271, N'false_5511999156166@c.us_5AAC47EF93CC8FBBAA623CA3D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-30 14:02:08.000' AS DateTime), N'Obrigado pela atenção', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20806, 1, 2271, N'false_5511999156166@c.us_5601D7F7F01A3F030B99CE0E8', N'Entrada', NULL, 0, 0, CAST(N'2020-01-30 14:02:03.000' AS DateTime), N'Não consigo comprar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20805, 1, 2271, N'false_5511999156166@c.us_3EB09BEE843202DD7CD3', N'Entrada', NULL, 0, 0, CAST(N'2020-01-29 18:44:01.000' AS DateTime), N'a partir de qual valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20810, 1, 2274, N'false_5511970660792@c.us_3AD838B11129CB515793', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 19:06:20.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20814, 1, 2275, N'false_5511991317282@c.us_24AA92D963B7CD228B977DBE9', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 13:38:52.000' AS DateTime), N'Ok. Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20813, 1, 2275, N'false_5511991317282@c.us_3DE5D137224D5AE84AAA5AC86', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 13:34:22.000' AS DateTime), N'Gostaria de saber unidades e valores', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20812, 1, 2275, N'false_5511991317282@c.us_2491ACE8F5149E1735086D5E4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 13:34:14.000' AS DateTime), N'Tenho conhecidos que moram lá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20811, 1, 2275, N'false_5511991317282@c.us_E23433C215E9790B28B4F20C7', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 13:34:05.000' AS DateTime), N'Eu conheço o empreendimento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20816, 1, 2278, N'false_5511995348484@c.us_8819AA5B94AABFEA330EC6ED5', N'Entrada', NULL, 0, 0, CAST(N'2020-07-24 15:24:29.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20815, 1, 2278, N'false_5511995348484@c.us_20EF8F42BEEC9F5870778C901', N'Entrada', NULL, 0, 0, CAST(N'2020-07-24 14:53:40.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20817, 1, 2280, N'false_5511998465900@c.us_57F27BC142C6C6EF0EC637E3C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:30:36.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20858, 1, 2281, N'false_5511953438615@c.us_3A7FF9EE15E96515BD6C', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:32:25.000' AS DateTime), N'Desculpe', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20857, 1, 2281, N'false_5511953438615@c.us_3ABAF100C1E7E6BA3D92', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:32:24.000' AS DateTime), N'É q não sabia se era o mesmo,', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20856, 1, 2281, N'false_5511953438615@c.us_3ABCCA17281145030089', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:32:16.000' AS DateTime), N'Eu, na vdd eu já havia recebido', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20855, 1, 2281, N'false_5511953438615@c.us_3ADFE61806109B1B2132', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:32:00.000' AS DateTime), N'Oi, já recebi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20854, 1, 2281, N'false_5511953438615@c.us_3AB17C6597A112602761', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 18:04:02.000' AS DateTime), N'Oi, não!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20853, 1, 2281, N'false_5511953438615@c.us_3AEB2D4112106BC592FC', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 18:13:17.000' AS DateTime), N'Qual plano q vc tem de compra ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20852, 1, 2281, N'false_5511953438615@c.us_3AFF011F8DF36F431938', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:23:06.000' AS DateTime), N'Oie , na bela vista .. quais informações por favor ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20851, 1, 2281, N'false_5511953438615@c.us_3A72F84FCAB0FB061D6A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 21:12:29.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20850, 1, 2281, N'false_5511953438615@c.us_3AF4CB34A70067A0BD1F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 21:06:40.000' AS DateTime), N'Verdade ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20849, 1, 2281, N'false_5511953438615@c.us_3AA7C47B68C410329457', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 21:00:44.000' AS DateTime), N'Ah certo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20848, 1, 2281, N'false_5511953438615@c.us_3ADBF18B2CBDA3A31CE0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 20:49:53.000' AS DateTime), N'Oie , houve um tempo em q eu fui no edifício Brasil, há mais de um ano, mas n recordo de ter combinado algo! ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20861, 1, 2283, N'false_5511976255663@c.us_3A1044E8581CB3F1481D', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:27:41.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20860, 1, 2283, N'false_5511976255663@c.us_3A3A8591020425000D07', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:24:03.000' AS DateTime), N'Não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20859, 1, 2283, N'false_5511976255663@c.us_3AF366796B4CF0177200', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 22:32:48.000' AS DateTime), N'Boa noite', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20865, 1, 2284, N'false_5511974513222@c.us_3A97EB29AE4E9A5C1461', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 15:53:31.000' AS DateTime), N'Pode sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20864, 1, 2284, N'false_5511974513222@c.us_3AF5C75694C62EFCEEAD', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 15:52:43.000' AS DateTime), N'?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20863, 1, 2284, N'false_5511974513222@c.us_3A8A373B97E60BC90175', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 15:52:42.000' AS DateTime), N'Consegue me mandar a tabela de preço dos studios', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20862, 1, 2284, N'false_5511974513222@c.us_3AE0A62C9EEA6187DF27', N'Entrada', NULL, 0, 0, CAST(N'2020-06-21 22:07:14.000' AS DateTime), N'Onde fica localizado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20870, 1, 2286, N'false_559180175972@c.us_3481195CDA2C9A03D221B43B16', N'Entrada', NULL, 0, 0, CAST(N'2020-07-15 17:34:33.000' AS DateTime), N'Amiga, por gentileza me mande fotos dste empreendimento.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20869, 1, 2286, N'false_559180175972@c.us_D47434C856534D1A25A794E5A4', N'Entrada', NULL, 0, 0, CAST(N'2020-07-15 13:35:00.000' AS DateTime), N'Ok te ligo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20868, 1, 2286, N'false_559180175972@c.us_6229A4DF4C885B5A5EAA595EA9', N'Entrada', NULL, 0, 0, CAST(N'2020-07-15 13:24:20.000' AS DateTime), N'Qual o tamanho.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20867, 1, 2286, N'false_559180175972@c.us_4D79F9EE43503A17CB552D546D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 22:36:19.000' AS DateTime), N'Qual o valores.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20866, 1, 2286, N'false_559180175972@c.us_2E3D1EF5EE8E46E3E894AA7BA9', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 18:08:20.000' AS DateTime), N'Ok , pode enviar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20873, 1, 2287, N'false_5511999780133@c.us_80E4284DF7CC558D6C41FB8C4', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 16:03:02.000' AS DateTime), N'??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20872, 1, 2287, N'false_5511999780133@c.us_0E98F0BA991E989950EECF98D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 17:49:36.000' AS DateTime), N'????????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20871, 1, 2287, N'false_5511999780133@c.us_3918989B9FCA24C8E3D22F6DF', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 17:41:31.000' AS DateTime), N'Boa tarde. Recebi, tem como fazer uma simulação de preços com uma entrada de duzentos mil reais quanto fica as prestações', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20886, 1, 2288, N'false_5511953282190@c.us_3A89672D4C50CE87789C', N'Entrada', NULL, 0, 0, CAST(N'2020-08-10 13:37:59.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20885, 1, 2288, N'false_5511953282190@c.us_3A55C184DC5B16B5F9F7', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:31:01.000' AS DateTime), N'Dentro desse horário estarei aí', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20884, 1, 2288, N'false_5511953282190@c.us_3A367AA3C952AB502F52', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:30:54.000' AS DateTime), N'Certo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20883, 1, 2288, N'false_5511953282190@c.us_3A520FF40CE2CD37E18E', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:30:32.000' AS DateTime), N'Período da tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20882, 1, 2288, N'false_5511953282190@c.us_3A239856561578860293', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:30:28.000' AS DateTime), N'A quem devo procurar ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20881, 1, 2288, N'false_5511953282190@c.us_3A3375B74909E3616C40', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:30:19.000' AS DateTime), N'Então combinado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20880, 1, 2288, N'false_5511953282190@c.us_3A8C1974C90D1EB49474', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:30:04.000' AS DateTime), N'Bom posso ir na segunda feira', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20879, 1, 2288, N'false_5511953282190@c.us_3A644D8430DB1EBD5976', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:29:57.000' AS DateTime), N'Ah entendi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20878, 1, 2288, N'false_5511953282190@c.us_3AEA5D4C1787E3FB2A9E', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:28:29.000' AS DateTime), N'O que ocorre lá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20877, 1, 2288, N'false_5511953282190@c.us_3A292959D9B09673361E', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:28:21.000' AS DateTime), N'Certo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20876, 1, 2288, N'false_5511953282190@c.us_3A74C50AECD4C9515F11', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:27:44.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20875, 1, 2288, N'false_5511953282190@c.us_3AFBB67C7FA6FAD6DB20', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:27:15.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20874, 1, 2288, N'false_5511953282190@c.us_3A2F3F20624B0541098C', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 16:27:05.000' AS DateTime), N'A Top Climatização Morumbi, agradece o seu contato. Como podemos ajudar você?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20925, 1, 2293, N'false_5511983054597@c.us_3A0B90FEC96BAEC470A2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:37:40.000' AS DateTime), N'E depois ir visitar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20924, 1, 2293, N'false_5511983054597@c.us_3A86B1705ADFFEA6114F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:37:35.000' AS DateTime), N'Preço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20923, 1, 2293, N'false_5511983054597@c.us_3A8D304EEF4B44FECFEE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:37:28.000' AS DateTime), N'Queria ver por aqui primeiro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20922, 1, 2293, N'false_5511983054597@c.us_3A210094FC1173ECFE3C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:37:21.000' AS DateTime), N'To meio enrolado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20921, 1, 2293, N'false_5511983054597@c.us_3A209F6C2C16184D7C6F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:35:23.000' AS DateTime), N'Pode sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20920, 1, 2293, N'false_5511983054597@c.us_3A7549640F5D429B7E68', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:28:22.000' AS DateTime), N'Lindo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20919, 1, 2293, N'false_5511983054597@c.us_3A56F0014C44FA9DB070', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:28:07.000' AS DateTime), N'Qual a faixa de preço?!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20918, 1, 2293, N'false_5511983054597@c.us_3AF3989A58E05E0A2D61', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:23:21.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20917, 1, 2293, N'false_5511983054597@c.us_3AF1900ADA37DF8AF478', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:21:40.000' AS DateTime), N'Sabe me informar!?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20916, 1, 2293, N'false_5511983054597@c.us_3A16D5F0A2C03C281E47', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:21:34.000' AS DateTime), N'Fica qual local do Tatuapé', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20915, 1, 2293, N'false_5511983054597@c.us_3AE01C51F31A357F0735', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:21:23.000' AS DateTime), N'Tem fotos do decorado!?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20914, 1, 2293, N'false_5511983054597@c.us_3A4F1DAA1D6BA56997FD', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:21:10.000' AS DateTime), N'Esse empreendimento está pronto!?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20913, 1, 2293, N'false_5511983054597@c.us_3AF40ADDA1C04F57FD5F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:21:01.000' AS DateTime), N'Boa tardr', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20888, 1, 2294, N'false_5511948175806@c.us_3AFE535B4AFE6D9F654D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 16:58:14.000' AS DateTime), N'Entendi, obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20887, 1, 2294, N'false_5511948175806@c.us_3ABB33695A7C9D169D91', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 14:52:35.000' AS DateTime), N'Bom dia, qual é o valor do imóvel?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20912, 1, 2295, N'false_5511947310291-1602106309@g.us_3A32014854E106', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 12:24:42.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20911, 1, 2295, N'false_5511947310291-1602106309@g.us_3A7A1DA6FD1022', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 12:24:39.000' AS DateTime), N'Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20910, 1, 2295, N'false_5511947310291-1602106309@g.us_DF359FB057D1AC', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:55:34.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20909, 1, 2295, N'false_5511947310291-1602106309@g.us_3AF63841D48961', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:41:55.000' AS DateTime), N'Tem sim, amanhã vou lá no call center conversar com a Lúcia e o Ary', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20908, 1, 2295, N'false_5511947310291-1602106309@g.us_3AEE1BBC0FB61F', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:41:27.000' AS DateTime), N'Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20907, 1, 2295, N'false_5511947310291-1602106309@g.us_D837226F772052', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:18:26.000' AS DateTime), N'Precisa saber do relatório do call center', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20906, 1, 2295, N'false_5511947310291-1602106309@g.us_2DA6415B1ADDD6', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:18:04.000' AS DateTime), N'Lu hoje tem reunião?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20905, 1, 2295, N'false_5511947310291-1602106309@g.us_8DF62C92B42AEB', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:17:45.000' AS DateTime), N'Quem esta falando?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20904, 1, 2295, N'false_5511947310291-1602106309@g.us_B085295FEFB939', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:17:33.000' AS DateTime), N'Bom dia,', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20903, 1, 2295, N'false_5511947310291-1602106309@g.us_3ACAB8403ED63D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 12:43:50.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20902, 1, 2295, N'false_5511947310291-1602106309@g.us_186A64114D777D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 12:42:58.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20901, 1, 2295, N'false_5511947310291-1602106309@g.us_3C21E4C9A0A36A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:38:13.000' AS DateTime), N'ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20900, 1, 2295, N'false_5511947310291-1602106309@g.us_3A5CEFE7D6E80D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:38:07.000' AS DateTime), N'Ops. Pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20899, 1, 2295, N'false_5511947310291-1602106309@g.us_3A9A72F068B659', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:37:57.000' AS DateTime), N'Envia pra o relatório para saber os atendimentos.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20898, 1, 2295, N'false_5511947310291-1602106309@g.us_196188550E3154', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:37:24.000' AS DateTime), N'também não...estou implantando um sistema.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20897, 1, 2295, N'false_5511947310291-1602106309@g.us_3AD07A2CE3B903', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:36:49.000' AS DateTime), N'Pois preciso bater uns casos com você que à agência mandou no e-mail mkt.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20896, 1, 2295, N'false_5511947310291-1602106309@g.us_3A04BE88B22BBF', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:36:12.000' AS DateTime), N'Amanhã você vai estar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20895, 1, 2295, N'false_5511947310291-1602106309@g.us_13C1B79148750A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:35:51.000' AS DateTime), N'estarei no Costa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20894, 1, 2295, N'false_5511947310291-1602106309@g.us_5071EFDADFB192', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:35:41.000' AS DateTime), N'eu não estarei mas a Luci  vai', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20892, 1, 2295, N'false_5511947310291-1602106309@g.us_3A4EF77477F535', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:35:08.000' AS DateTime), N'tudo bem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20893, 1, 2295, N'false_5511947310291-1602106309@g.us_3A74F56772F6BD', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:35:08.000' AS DateTime), N'Na sexta feira, vou ir até o WPaulista, vcs vão estar lá?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20891, 1, 2295, N'false_5511947310291-1602106309@g.us_3A5A73E9B35E44', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:34:22.000' AS DateTime), N'Estou criando este grupo pois o outro está o Leandro.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20890, 1, 2295, N'false_5511947310291-1602106309@g.us_3A2FF296F4B272', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:32:06.000' AS DateTime), N'Tudo bem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20889, 1, 2295, N'false_5511947310291-1602106309@g.us_3AC22275A27F60', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 21:32:01.000' AS DateTime), N'Boa noite!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20930, 1, 2296, N'false_5511945526962@c.us_3AB395FFCB9A64B235F2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:07:09.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20929, 1, 2296, N'false_5511945526962@c.us_3A8A173BED091CA7A22B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:07:08.000' AS DateTime), N'Ah tá bem fora do meu orçamento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20928, 1, 2296, N'false_5511945526962@c.us_3A7ABD0D6E9575FCA65F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:11:08.000' AS DateTime), N'Favor aguardar meu retorno de viagem, neste caso', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20927, 1, 2296, N'false_5511945526962@c.us_3A36C0E18251B64341D2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:11:01.000' AS DateTime), N'Por enquanto ainda não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20926, 1, 2296, N'false_5511945526962@c.us_3A7FB18E099EBA2834D1', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:09:49.000' AS DateTime), N'Qual o valor do Ap de 2 dorms?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20934, 1, 2302, N'false_5511951281138@c.us_36FD9A21B74E67D0EED27F704', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:37:49.000' AS DateTime), N'Mas no momento estou sem ter como investir. A pandemia já deixa minha empresa há 120 dias sem poder fazer um evento.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20933, 1, 2302, N'false_5511951281138@c.us_131C28A35B4D2F3E2C8EC6141', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:37:27.000' AS DateTime), N'Meu prédio dos sonhos.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20932, 1, 2302, N'false_5511951281138@c.us_A42CA3CEB8279C07A9692EF44', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:17:45.000' AS DateTime), N'Bom dia, tudo e vc?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20931, 1, 2302, N'false_5511951281138@c.us_54820CD355A7165DB4344A9FA', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:17:32.000' AS DateTime), N'Está', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20973, 1, 2306, N'false_5511994795781@c.us_3A9908E4A51240A21AB0', N'Entrada', NULL, 0, 0, CAST(N'2020-09-29 13:15:31.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20970, 1, 2306, N'false_5511994795781@c.us_3A4A9B9F35CC82CEA923', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 13:08:20.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20971, 1, 2306, N'false_5511994795781@c.us_3A3A0B857D4975D34557', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 13:08:20.000' AS DateTime), N'dados para depósito', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20972, 1, 2306, N'false_5511994795781@c.us_3A20BEBFCD90AD8AF14D', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 13:08:20.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20969, 1, 2306, N'false_5511994795781@c.us_3A427CB1D1D83AACCE1C', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 11:50:43.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20968, 1, 2306, N'false_5511994795781@c.us_3AE01AD0F52ABAD6E92F', N'Entrada', NULL, 0, 0, CAST(N'2020-09-05 13:47:06.000' AS DateTime), N'Simmm tinha 198 acho', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20967, 1, 2306, N'false_5511994795781@c.us_3A36D5A372A019DA4843', N'Entrada', NULL, 0, 0, CAST(N'2020-09-04 17:15:44.000' AS DateTime), N'Okkkk', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20966, 1, 2306, N'false_5511994795781@c.us_3A5C63ED0463C1B9105F', N'Entrada', NULL, 0, 0, CAST(N'2020-09-04 15:37:40.000' AS DateTime), N'Ok ele passa após o almoço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20965, 1, 2306, N'false_5511994795781@c.us_3AA737165A180EFA7D1E', N'Entrada', NULL, 0, 0, CAST(N'2020-09-04 15:32:00.000' AS DateTime), N'Vou verificar com o transporte', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20964, 1, 2306, N'false_5511994795781@c.us_3AD1481EF8B9607F7DD4', N'Entrada', NULL, 0, 0, CAST(N'2020-09-03 17:05:03.000' AS DateTime), N'Okk sem problemas!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20963, 1, 2306, N'false_5511994795781@c.us_3A45395E295D70969A09', N'Entrada', NULL, 0, 0, CAST(N'2020-08-31 13:27:15.000' AS DateTime), N'Ok só chamar !!!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20962, 1, 2306, N'false_5511994795781@c.us_3AD8E9A47E9AA0FB1F50', N'Entrada', NULL, 0, 0, CAST(N'2020-08-31 13:26:54.000' AS DateTime), N'Sim estamos !!!Sem maiores problemas', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20961, 1, 2306, N'false_5511994795781@c.us_3AB36315E69E76F1205D', N'Entrada', NULL, 0, 0, CAST(N'2020-08-31 13:13:09.000' AS DateTime), N'Oi Luci!!!Tudo e vcs ???O Correio não parou... somente 17% do efetivo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20960, 1, 2306, N'false_5511994795781@c.us_3AF74A9909B3800A2DF5', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 14:58:54.000' AS DateTime), N'Ok já vou enviar a fatura desses envios', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20959, 1, 2306, N'false_5511994795781@c.us_3A4714728750E8E0F193', N'Entrada', NULL, 0, 0, CAST(N'2020-07-28 18:10:04.000' AS DateTime), N'Temos mais envios ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20958, 1, 2306, N'false_5511994795781@c.us_3A81CD85D6FC5CCB0F29', N'Entrada', NULL, 0, 0, CAST(N'2020-07-28 18:09:55.000' AS DateTime), N'Luci tudo certo?????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20957, 1, 2306, N'false_5511994795781@c.us_3A36A35B320B7FE2F594', N'Entrada', NULL, 0, 0, CAST(N'2020-07-24 15:12:01.000' AS DateTime), N'Até 8 dias', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20956, 1, 2306, N'false_5511994795781@c.us_3A34E6E2E1ADF11EA430', N'Entrada', NULL, 0, 0, CAST(N'2020-07-24 15:11:40.000' AS DateTime), N'Tudo e vc ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20955, 1, 2306, N'false_5511994795781@c.us_3A83A036A66C33A488C6', N'Entrada', NULL, 0, 0, CAST(N'2020-07-22 18:43:28.000' AS DateTime), N'Ok já vou verificar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20954, 1, 2306, N'false_5511994795781@c.us_3AB8727A267500806125', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:29:40.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20953, 1, 2306, N'false_5511994795781@c.us_3A6DAC8B74AADF74CA40', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:28:07.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20952, 1, 2306, N'false_5511994795781@c.us_3AE4CEBD9F9A0EE95257', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:27:47.000' AS DateTime), N'Amanhã às 10:00?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20951, 1, 2306, N'false_5511994795781@c.us_3ABEA0755CB0B30FA448', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:27:29.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20950, 1, 2306, N'false_5511994795781@c.us_3ADC2B89C1BC01DE48E7', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:27:24.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20949, 1, 2306, N'false_5511994795781@c.us_3ADDE00E2003AD391AD2', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:26:36.000' AS DateTime), N'Luci a coleta vai passar aí após o almoço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20948, 1, 2306, N'false_5511994795781@c.us_3AE544BF80E921EEF731', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 13:23:06.000' AS DateTime), N'Bom diaaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20947, 1, 2306, N'false_5511994795781@c.us_3A5EAE668D21BF57146C', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 21:25:51.000' AS DateTime), N'Sim já enviou obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20946, 1, 2306, N'false_5511994795781@c.us_3A306321EFC8FA21031C', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 19:49:01.000' AS DateTime), N'Luci ainda não recebi....sem cadastro não consigo coleta', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20945, 1, 2306, N'false_5511994795781@c.us_3ACA5F388758F061E78F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 18:23:13.000' AS DateTime), N'Acabei de solicitar preciso disso pra poder agendar a retirada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20944, 1, 2306, N'false_5511994795781@c.us_3AF21A204A77A500D871', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 18:06:25.000' AS DateTime), N'Luci preciso dos dados da Empresa para faturar , o prazo de pagamento é de 7 dias', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20943, 1, 2306, N'false_5511994795781@c.us_3A14B9CB4FD95AF243D0', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 15:36:34.000' AS DateTime), N'Okkk já enviei mensagem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20942, 1, 2306, N'false_5511994795781@c.us_3AC39FAF39A9BBD88ED7', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 15:32:51.000' AS DateTime), N'Ok pode me ligar !!!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20941, 1, 2306, N'false_5511994795781@c.us_3AC131A260D540D17A94', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 13:15:36.000' AS DateTime), N'Bom dia !!pode me ligar ?Estou tentando falar com vc é não consigo tem um celular?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20935, 1, 2308, N'false_5511989844576@c.us_3EB0D5A3585943BD767E', N'Entrada', NULL, 0, 0, CAST(N'2020-02-20 16:44:31.000' AS DateTime), N'OBRIGADO', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20936, 1, 2308, N'false_5511989844576@c.us_3EB0FAF0D962AAA90FDB', N'Entrada', NULL, 0, 0, CAST(N'2020-02-20 16:44:31.000' AS DateTime), N'Veja se consegueenviar por aqui prospecto, tá ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20937, 1, 2309, N'false_5511948391942@c.us_3AF90B0B1B48A7E21290', N'Entrada', NULL, 0, 0, CAST(N'2020-01-10 16:28:16.000' AS DateTime), N'Gratidão, Luci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20938, 1, 2312, N'false_5511944484987@c.us_3A8E87360FE58C09B935', N'Entrada', NULL, 0, 0, CAST(N'2020-02-13 18:35:27.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20940, 1, 2315, N'false_5511987286860@c.us_D1C1D2E30046EF823D5D539F9', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:17:59.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20939, 1, 2315, N'false_5511987286860@c.us_40A2F254E4870968C463E4CDB', N'Entrada', NULL, 0, 0, CAST(N'2019-12-10 19:44:33.000' AS DateTime), N'Boa tarde, me ligou?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20986, 1, 2321, N'false_5511976644813@c.us_DA4C0A49F1A31F4D732FF4B4E', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 18:44:54.000' AS DateTime), N'Bom dia, estava. Mas já encontrei obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20985, 1, 2321, N'false_5511976644813@c.us_3EB0E722710162260E85', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 19:17:26.000' AS DateTime), N'OK, obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20984, 1, 2321, N'false_5511976644813@c.us_3EB017C7DF1FE55D7C65', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 19:15:48.000' AS DateTime), N'Perfeito, por favor apenas um. Porque se não ficam dezenas me ligando é muito ruim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20983, 1, 2321, N'false_5511976644813@c.us_3EB07D4D7CEC914C976C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 18:50:35.000' AS DateTime), N'Olá Luci, boa tarde! Queria informações de unidades disponíveis. Valores e condições diretamente com a construtora, quanto temos que pagar à vista e o saldo que pode ser financiado direto com a construtora também.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20975, 1, 2322, N'false_5511966297979@c.us_3EB01D114E78F6A85C28', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 15:04:49.000' AS DateTime), N'Obrigado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20974, 1, 2322, N'false_5511966297979@c.us_3EB038C6505A1759D2FE', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 15:03:46.000' AS DateTime), N'Bom dia. Já sim, obrigado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20982, 1, 2323, N'false_5511991350806@c.us_3AEB5028E3AF2EC71B65', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 14:48:35.000' AS DateTime), N'Entrou sim, falei com ela. Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20981, 1, 2323, N'false_5511991350806@c.us_3AB34636E4D721414ED2', N'Entrada', NULL, 0, 0, CAST(N'2020-03-03 13:57:12.000' AS DateTime), N'Não entraram em contato não Luci... eu aguardo, sem problemas.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20980, 1, 2323, N'false_5511991350806@c.us_3AC4BDD791F424C20FDF', N'Entrada', NULL, 0, 0, CAST(N'2020-03-02 16:25:18.000' AS DateTime), N'Olá, obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20979, 1, 2324, N'false_5511993207551@c.us_3EB03B92D45EF4C984F2', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 17:45:46.000' AS DateTime), N'Obrigado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20978, 1, 2324, N'false_5511993207551@c.us_3EB0C42D7CC13AD4D9AA', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 16:32:05.000' AS DateTime), N'Não.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20977, 1, 2324, N'false_5511993207551@c.us_3AA1BD3047E734412D3C', N'Entrada', NULL, 0, 0, CAST(N'2020-02-05 18:03:38.000' AS DateTime), N'Se tiver o valor do IPTU e Condomínio, agradeço.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20976, 1, 2324, N'false_5511993207551@c.us_3A2AF31F857AA4786213', N'Entrada', NULL, 0, 0, CAST(N'2020-02-05 18:03:08.000' AS DateTime), N'Sim, recebi o material e a indicação do valor por m2.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20989, 1, 2328, N'false_5511963862537@c.us_3EB0999809A2410EF826', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 16:08:54.000' AS DateTime), N'opa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20988, 1, 2328, N'false_5511963862537@c.us_45B4BEC41D4F5A503A99DEBE9', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:49:25.000' AS DateTime), N'Teria alguma opção', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20987, 1, 2328, N'false_5511963862537@c.us_2A0E75E56947B1C7DD7F8D3A9', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:47:46.000' AS DateTime), N'Opa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20991, 1, 2329, N'false_5511947581289@c.us_39D9D49604A4B96598BDC29C0', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:15:32.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20990, 1, 2329, N'false_5511947581289@c.us_4190E6D58E2BB8DF74669258E', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 15:14:38.000' AS DateTime), N'Olá agradecemos seu contato. Como podemos ajudar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20994, 1, 2331, N'false_5511981853740@c.us_953FD00D1B460EBF98FD5F3A4', N'Entrada', NULL, 0, 0, CAST(N'2019-12-16 21:14:14.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20993, 1, 2331, N'false_5511981853740@c.us_684C77D2888DD98234C8B60B8', N'Entrada', NULL, 0, 0, CAST(N'2019-12-16 21:08:57.000' AS DateTime), N'Qual o valor do m2?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20992, 1, 2331, N'false_5511981853740@c.us_17F031DEA3171F6D6043F4F0A', N'Entrada', NULL, 0, 0, CAST(N'2019-12-16 21:07:05.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20999, 1, 2336, N'false_5511995157041@c.us_3AF03BCAB434EC5240F4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:43:43.000' AS DateTime), N'Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20998, 1, 2336, N'false_5511995157041@c.us_3A848898AA8C63FB4E64', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:43:30.000' AS DateTime), N'Não precisa. Era só curiosidade.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20997, 1, 2336, N'false_5511995157041@c.us_3A631E496D49E57ED360', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:14:37.000' AS DateTime), N'Qual o valor do condomínio ?!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20996, 1, 2336, N'false_5511995157041@c.us_3A163D15ACE28AAF23C4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:41:55.000' AS DateTime), N'Qual o valor do imóvel ?!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (20995, 1, 2336, N'false_5511995157041@c.us_3A2EF410A2BCBAE0A6BA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:41:48.000' AS DateTime), N'Pode sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21003, 1, 2340, N'false_5511975590215@c.us_45F389BA226606B1C385B0D63', N'Entrada', NULL, 0, 0, CAST(N'2019-12-02 18:10:48.000' AS DateTime), N'Mas ele valor está acima do que havia planejado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21002, 1, 2340, N'false_5511975590215@c.us_A6D18EB9FC69C2CE34CA2F6AD', N'Entrada', NULL, 0, 0, CAST(N'2019-12-02 18:10:26.000' AS DateTime), N'Ainda não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21001, 1, 2340, N'false_5511975590215@c.us_92A579FD42F2DF20100766E4E', N'Entrada', NULL, 0, 0, CAST(N'2019-12-02 17:55:04.000' AS DateTime), N'Qual o valor do Studio de 50m²', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21000, 1, 2340, N'false_5511975590215@c.us_76EA641930A84EF4F7F9D2D43', N'Entrada', NULL, 0, 0, CAST(N'2019-12-02 17:53:45.000' AS DateTime), N'Olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21012, 1, 2342, N'false_5511947176050@c.us_4ABA231870A055430DBBC8D9F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 16:23:13.000' AS DateTime), N'Sim, já estou conversando com ele Lu, depois eu te falo o que deu...', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21011, 1, 2342, N'false_5511947176050@c.us_0BD0846FF6E10E9E4DD94250D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 15:14:32.000' AS DateTime), N'Lu, já estou tratando com ele. Ele trabalha aí no prédio?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21010, 1, 2342, N'false_5511947176050@c.us_5B1A51EA561CFDEC1AD5B7217', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 14:46:01.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21009, 1, 2342, N'false_5511947176050@c.us_DA984D084AAB1B62C1D5EAE7B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:41:16.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21008, 1, 2342, N'false_5511947176050@c.us_1360D86B6FCD6F84E9177EF53', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:40:56.000' AS DateTime), N'Vou ligar pra ele', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21007, 1, 2342, N'false_5511947176050@c.us_56FE475A31DB6A8181265AF57', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:40:32.000' AS DateTime), N'Tá bom querida, obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21006, 1, 2342, N'false_5511947176050@c.us_9CFDDF8D0403F23C0FCEA6636', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:20:28.000' AS DateTime), N'Oi Lu, o Hélcio tinha uma de 40mts aí, não sei se já alugou. Conosco não tem nenhuma', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21005, 1, 2342, N'false_5511947176050@c.us_878C0F3A0F1013CF68C5069FE', N'Entrada', NULL, 0, 0, CAST(N'2020-07-24 13:50:01.000' AS DateTime), N'??????????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21004, 1, 2342, N'false_5511947176050@c.us_5BF8F043606FBE4F0BD3FB4BE', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:51:12.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21022, 1, 2344, N'false_5511948638276@c.us_3EB0B3CBAB1A2203FB32', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:08:18.000' AS DateTime), N'Tem que dá entrada?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21021, 1, 2344, N'false_5511948638276@c.us_3EB00C3E68BFE52EAF4A', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:03:19.000' AS DateTime), N'Formas de pagamento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21020, 1, 2344, N'false_5511948638276@c.us_3EB000F7A8106C7992CD', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:03:17.000' AS DateTime), N'preço?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21019, 1, 2344, N'false_5511948638276@c.us_3EB04DD1E12D4C91418E', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:02:52.000' AS DateTime), N'No financiamento direto com a incorportadora, como dá para fazer?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21018, 1, 2344, N'false_5511948638276@c.us_3EB06DE7EEF0FC908131', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:58:19.000' AS DateTime), N'vc tem as plantas?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21017, 1, 2344, N'false_5511948638276@c.us_3EB0E0137C1A8FE85343', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:56:51.000' AS DateTime), N'A partir disso marcamos a visita', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21016, 1, 2344, N'false_5511948638276@c.us_3EB00CCA7433257DAA88', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:56:40.000' AS DateTime), N'Queria também a planta', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21015, 1, 2344, N'false_5511948638276@c.us_3EB0A0698A0BEA481798', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:56:30.000' AS DateTime), N'Isso, preciso dos valores', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21014, 1, 2344, N'false_5511948638276@c.us_3EB044FA715FA2B58454', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:52:47.000' AS DateTime), N'Quais os disponíveis e valores', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21013, 1, 2344, N'false_5511948638276@c.us_3EB07445E924A734F333', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:51:52.000' AS DateTime), N'Luci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21028, 1, 2345, N'false_5511981261006@c.us_F4F43AEFC24B468663899B1A0', N'Entrada', NULL, 0, 0, CAST(N'2020-02-20 19:36:11.000' AS DateTime), N'Procuro na zona sul', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21027, 1, 2345, N'false_5511981261006@c.us_8433B2305B44DDA95D1C17114', N'Entrada', NULL, 0, 0, CAST(N'2020-02-20 19:36:06.000' AS DateTime), N'Não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21026, 1, 2345, N'false_5511981261006@c.us_3EB04ED9B432DEE1B334', N'Entrada', NULL, 0, 0, CAST(N'2020-02-19 20:58:46.000' AS DateTime), N'desculpa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21025, 1, 2345, N'false_5511981261006@c.us_3EB0F468DBAF84E22B4A', N'Entrada', NULL, 0, 0, CAST(N'2020-02-19 20:58:43.000' AS DateTime), N'busco valores de ate 250.000', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21024, 1, 2345, N'false_5511981261006@c.us_414442540E0C6ED4755AD24CC', N'Entrada', NULL, 0, 0, CAST(N'2020-02-19 14:55:39.000' AS DateTime), N'Tudo ótimo e com vc?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21023, 1, 2345, N'false_5511981261006@c.us_140914E7C7905CF0F42ACF5AB', N'Entrada', NULL, 0, 0, CAST(N'2020-02-18 22:20:27.000' AS DateTime), N'Qual valor q está saindo?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21029, 1, 2347, N'false_5511982775354@c.us_3AA41B47675FE6BCA7C9', N'Entrada', NULL, 0, 0, CAST(N'2020-03-17 16:18:13.000' AS DateTime), N'Vamos ter q esperar pra voltar a olhar os apto\nBoa parte do nosso dinheiro está em ações. Preciso esperar passar essa baixa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21031, 1, 2351, N'false_5511984134797@c.us_2285566DFA4CE77D7BD79F745', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:28:18.000' AS DateTime), N'??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21030, 1, 2351, N'false_5511984134797@c.us_B7DCF0CC4925486B9DD4C2977', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 21:21:35.000' AS DateTime), N'Não...', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21032, 1, 2354, N'false_5511972999180@c.us_3A3EBD4168D1A6DAC480', N'Entrada', NULL, 0, 0, CAST(N'2019-12-20 12:18:13.000' AS DateTime), N'Obrigado, tomara q eu compre, no momento, as vagas estao magérrimas pois minha comissao nao entrou mas fique sussa pois se entrar, falo com vcs sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21034, 1, 2358, N'false_5511977107358@c.us_EF9E7694B834CF0405B1EC9B3', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 19:31:58.000' AS DateTime), N'Qual o valor do m²?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21033, 1, 2358, N'false_5511977107358@c.us_F8F8D033BF7A9326094E6C320', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 19:31:41.000' AS DateTime), N'Kkkkk', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21040, 1, 2361, N'false_5511982152878@c.us_3AD5B9A06E3E14FE38ADC4D67', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:06:59.000' AS DateTime), N'Lu, de cabeça eu não sei todas. Da uma perguntada para o Turim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21037, 1, 2361, N'false_5511982152878@c.us_7DF838A5DC58A9E1013CC2858', N'Entrada', NULL, 0, 0, CAST(N'2020-07-23 14:09:26.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21038, 1, 2361, N'false_5511982152878@c.us_B93CCF98C86B7B54587503C02', N'Entrada', NULL, 0, 0, CAST(N'2020-07-23 14:09:26.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21039, 1, 2361, N'false_5511982152878@c.us_45D84D9C8E78E9B318449BACA', N'Entrada', NULL, 0, 0, CAST(N'2020-07-23 14:09:26.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21036, 1, 2362, N'false_5511992000950@c.us_3AAD20C886A9A1B67394', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:44:55.000' AS DateTime), N'Sim falou ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21035, 1, 2362, N'false_5511992000950@c.us_3A751418A37DDA5D2B8B', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 15:06:19.000' AS DateTime), N'Qual o preço \nQuando vocês entregam', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21044, 1, 2365, N'false_556193162475@c.us_AF0F49AE742FDD035CEE7E6580', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 19:31:45.000' AS DateTime), N'Gostaria de saber os valores e quais as formas de financiamento vcs trabalham', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21043, 1, 2365, N'false_556193162475@c.us_4E386B9978E4DFA982B3DC099F', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 19:31:14.000' AS DateTime), N'Gostei bastante do projeto', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21042, 1, 2365, N'false_556193162475@c.us_2C0F3B2C8927807F1F379BADBF', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 19:31:02.000' AS DateTime), N'Olhei sim, esqueci de dar um retorno', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21041, 1, 2365, N'false_556193162475@c.us_44C040A8F3931F5B1D61C26F7D', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 19:29:31.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21049, 1, 2370, N'false_5511966305227@c.us_3A155004548EDEFDE0A0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:41:12.000' AS DateTime), N'Igualmente', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21048, 1, 2370, N'false_5511966305227@c.us_3ACE4517050D607D092E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:40:26.000' AS DateTime), N'Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21047, 1, 2370, N'false_5511966305227@c.us_3A28C4D4A6FA016B5FAE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:27:36.000' AS DateTime), N'Claro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21046, 1, 2370, N'false_5511966305227@c.us_3AFBCB863676B4F9ED0E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:19:08.000' AS DateTime), N'Tenho 350 mil somente', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21045, 1, 2370, N'false_5511966305227@c.us_3A292C58F5EAE5D62A17', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:19:00.000' AS DateTime), N'Bom dia! Acho que este está fora do que consigo pagar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21050, 1, 2373, N'false_5511952809324@c.us_8437C07B517282FD274B4A6F8', N'Entrada', NULL, 0, 0, CAST(N'2019-12-13 15:30:28.000' AS DateTime), N'Pode', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21051, 1, 2374, N'false_5511976530476@c.us_9EEE81DBA35A61FDABFEC243B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 14:43:55.000' AS DateTime), N'Bom dia, qual o valor do empreendimento ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21053, 1, 2377, N'false_5511995458216@c.us_3EB07952137588BCBC66', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:11:02.000' AS DateTime), N'Sim pode enviar. Analisarei e nos falamos.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21052, 1, 2377, N'false_5511995458216@c.us_3EB00429CF1F949144D2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:09:40.000' AS DateTime), N'boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21055, 1, 2379, N'false_5511997016782@c.us_B0B1D40012D0A55E4478660FE', N'Entrada', NULL, 0, 0, CAST(N'2020-07-28 13:42:11.000' AS DateTime), N'Não,  preciso vender o meu primeiro.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21054, 1, 2379, N'false_5511997016782@c.us_141828E938FA4815043570914', N'Entrada', NULL, 0, 0, CAST(N'2020-06-24 19:21:10.000' AS DateTime), N'Boa tarde.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21061, 1, 2381, N'false_5511945423939@c.us_BB005FE5E7E00EE66A5D2A4E8', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 16:57:58.000' AS DateTime), N'Ok! Tem muitos do Brasil', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21060, 1, 2381, N'false_5511945423939@c.us_87113C9796141C31B6BC63535', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 15:47:19.000' AS DateTime), N'Tem do Ed Brasil é WP tem muitos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21059, 1, 2381, N'false_5511945423939@c.us_04F6CAC1CB32DDDF9344BFC61', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 14:48:39.000' AS DateTime), N'Tem dos 2', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21058, 1, 2381, N'false_5511945423939@c.us_BEA113E8AA8DF96187C42F4A4', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 13:50:36.000' AS DateTime), N'Tem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21057, 1, 2381, N'false_5511945423939@c.us_4810EEAB33113EB274D22EBDF', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 13:45:33.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21056, 1, 2381, N'false_5511945423939@c.us_F5FC19D9AE91F6C127C6DF274', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 16:33:35.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21063, 1, 2383, N'false_5511974114534@c.us_3EB0ADDFC0D24F0ED573', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 18:33:11.000' AS DateTime), N'nao tenho interesse já visitei a unidade, mas estou considerando outras opcoes', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21062, 1, 2383, N'false_5511974114534@c.us_3AE3C9B180587DDFE7FB', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 22:28:28.000' AS DateTime), N'Oi Gracielle, eu visitei sim esse imóvel. Mas estou considerando outras opções.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21075, 1, 2384, N'false_5511958579768@c.us_F573A1D6389964344819EB778', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:12:46.000' AS DateTime), N'Pode passar sim...\nEu aceito até 70mil mais eu só posso dar entrada de 1000reail e parcela de  600 por mês', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21074, 1, 2384, N'false_5511958579768@c.us_28357E2C28E33B1F2B791ED1D', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:02:54.000' AS DateTime), N'O máximo 20mil', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21073, 1, 2384, N'false_5511958579768@c.us_2DEFBCA8B80A8D929E023D0EA', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:02:09.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21072, 1, 2384, N'false_5511958579768@c.us_F46692F5748A4922350165C7B', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:00:04.000' AS DateTime), N'Bela vista não.\nItaqua', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21071, 1, 2384, N'false_5511958579768@c.us_0CB81CF66FECE0C10AA4295BD', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 19:36:52.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21070, 1, 2384, N'false_5511958579768@c.us_1FF5FB65D44CF63D047260E01', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 19:36:42.000' AS DateTime), N'Oi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21069, 1, 2384, N'false_5511958579768@c.us_A51DF437A1649AC73ABA58C4F', N'Entrada', NULL, 0, 0, CAST(N'2020-02-11 14:53:50.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21068, 1, 2384, N'false_5511958579768@c.us_B027E9BD438A76F298E2698F0', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 23:16:28.000' AS DateTime), N'Como funciona este departamento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21067, 1, 2384, N'false_5511958579768@c.us_EAFE9AE7DBAC0F2D4DAADB4C2', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 19:02:56.000' AS DateTime), N'Que empresa é essa? Me ligou hoje mas caiu a ligação', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21066, 1, 2384, N'false_5511958579768@c.us_D10FB219E80E0B4C65C69C607', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 19:00:15.000' AS DateTime), N'Oi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21084, 1, 2385, N'false_5511979898376@c.us_3AC8FDABFA6638D92DD8', N'Entrada', NULL, 0, 0, CAST(N'2020-01-29 16:17:25.000' AS DateTime), N'Boa tarde!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21083, 1, 2385, N'false_5511979898376@c.us_3AE3381D0BE325129AA5', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:37:05.000' AS DateTime), N'Tem a planta?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21082, 1, 2385, N'false_5511979898376@c.us_3A63E6F7F7ADF4FEE52C', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 14:54:08.000' AS DateTime), N'Ok!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21081, 1, 2385, N'false_5511979898376@c.us_3ADE31EC5AFBCE25393A', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 21:23:21.000' AS DateTime), N'Quanto está o metro quadrado?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21080, 1, 2385, N'false_5511979898376@c.us_3AA945BC60FC4EED1F01', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 21:23:14.000' AS DateTime), N'Vou dar uma olhada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21079, 1, 2385, N'false_5511979898376@c.us_3A2B4771FE21E80BB2E8', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 16:46:27.000' AS DateTime), N'Não, procuro empreendimentos perto de estação do metrô, de preferência na linha verde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21078, 1, 2385, N'false_5511979898376@c.us_3A45E75E482AAB4208C7', N'Entrada', NULL, 0, 0, CAST(N'2020-01-17 19:03:27.000' AS DateTime), N'Está muito caro para meu bolso de proletariado Gracielle rsrsrs', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21077, 1, 2385, N'false_5511979898376@c.us_3ABF160FED3AC66B7D7D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-17 18:54:11.000' AS DateTime), N'Gracielle no pdf não tem o valor do metro quadrado, vc tem essa informação pra me passar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21065, 1, 2386, N'false_5511984655288@c.us_444AC120EE801F1A2426FCD66', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:59:01.000' AS DateTime), N'Oi! Entendeu o que leu?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21064, 1, 2386, N'false_5511984655288@c.us_4219EEF8D96D13246A05A31C7', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:58:40.000' AS DateTime), N'Bom dia! É melhor primeiro acontecer a reportagem que liguei pedindo nas emissoras de TV sobre o banco Itaú me ressarcir o valor de 18 bilhões e 900 milhões que falaram que eu vou ser ressarcido das folhas de cheques que usaram a minha assinatura no tempo aproximado de 10 anos...', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21076, 1, 2387, N'false_5511994891360@c.us_AF4E0CC03889170ABC88378F9', N'Entrada', NULL, 0, 0, CAST(N'2020-01-22 14:08:55.000' AS DateTime), N'Graciele, Valor???', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21088, 1, 2396, N'false_558197679852@c.us_745B5C3610AC063906ECA091DE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 22:59:00.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21087, 1, 2396, N'false_558197679852@c.us_24B9278FAB094241237D30DC7D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:46:36.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21086, 1, 2396, N'false_558197679852@c.us_54B2A741E10D6916B6E7B5EEFA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-23 15:46:55.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21085, 1, 2396, N'false_558197679852@c.us_B490691E5B530BDEC6BCBD535D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:42:47.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21091, 1, 2398, N'false_5511967990710@c.us_AB30B22C2923E17791F554EB9', N'Entrada', NULL, 0, 0, CAST(N'2020-01-16 16:55:03.000' AS DateTime), N'Quantos metros?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21090, 1, 2398, N'false_5511967990710@c.us_7C0C8CE618E96CD15DEC7E744', N'Entrada', NULL, 0, 0, CAST(N'2020-01-16 16:54:42.000' AS DateTime), N'Boa tarde!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21089, 1, 2398, N'false_5511967990710@c.us_1DC93A249BCF195A78D160471', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 21:34:45.000' AS DateTime), N'Ok obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21099, 1, 2402, N'false_5511947345671@c.us_3A68658C6A4FA1D318DE', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 14:04:24.000' AS DateTime), N'Bom dia!!???', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21098, 1, 2402, N'false_5511947345671@c.us_3A61CDCC12E4812351E9', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 14:59:59.000' AS DateTime), N'Blz, assim que der vamos sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21097, 1, 2402, N'false_5511947345671@c.us_3A5AD817762BF4F712E1', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 14:24:16.000' AS DateTime), N'Hj vou conversar com a minha mulher, mais sera que a construtora abaixa bastante esse valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21096, 1, 2402, N'false_5511947345671@c.us_3A2DE520C8402AEB0FC8', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 19:38:55.000' AS DateTime), N'Muito top mesmo!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21095, 1, 2402, N'false_5511947345671@c.us_3ABACC76C393AEA94910', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:56:16.000' AS DateTime), N'Ate uns 600, 650 no máximo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21094, 1, 2402, N'false_5511947345671@c.us_3AE5D25642FB13166E2D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:54:36.000' AS DateTime), N'Vixx maria bem alto esse valor pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21093, 1, 2402, N'false_5511947345671@c.us_3A7AFEB9F5B0E969B248', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:16:52.000' AS DateTime), N'Qual é o valor do apto?? Tem fotos dele?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21092, 1, 2402, N'false_5511947345671@c.us_3AD2991F9BCD93F32F31', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:16:40.000' AS DateTime), N'Boa tarde.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21107, 1, 2403, N'false_5511940873863@c.us_3A00888A956CD40AE2E3', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:54:19.000' AS DateTime), N'Okay', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21106, 1, 2403, N'false_5511940873863@c.us_3A46B05699D24F787903', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:52:57.000' AS DateTime), N'Qual o valor da cobertura ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21105, 1, 2403, N'false_5511940873863@c.us_3A3BBBFEF193E8882A99', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:51:22.000' AS DateTime), N'Qual o maior metragem que vocês tem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21104, 1, 2403, N'false_5511940873863@c.us_3A9FE5ADCE7594CB22FD', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:30:33.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21103, 1, 2403, N'false_5511940873863@c.us_3A269B4169C5503DAF52', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:19:23.000' AS DateTime), N'Sobre a cobertura , gostaria de saber valor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21102, 1, 2403, N'false_5511940873863@c.us_3A9EC121FA478F69A1B7', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:19:10.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21101, 1, 2403, N'false_5511940873863@c.us_3ADB3CC5F6F9058F3F43', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 17:05:52.000' AS DateTime), N'E a cobertura ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21100, 1, 2403, N'false_5511940873863@c.us_3AAD11937617657B15EF', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 16:10:34.000' AS DateTime), N'Thalita boa tarde , está a partir de quanto?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21111, 1, 2406, N'false_5511982687465@c.us_CAB0F5B32B3D58DF2B41B20E2', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 14:22:59.000' AS DateTime), N'Preciso ter uma noção de parcela e qnto tá o condomínio', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21110, 1, 2406, N'false_5511982687465@c.us_DC8B4A65A0ADFB4C52BA68B4A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 14:22:46.000' AS DateTime), N'Tenho 110.000 pra dar de entrada já com tdo doc será que dá?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21109, 1, 2406, N'false_5511982687465@c.us_995E684022E784A3FA76D3FEA', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 14:22:22.000' AS DateTime), N'Qnto tá e se eu consigo financiar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21108, 1, 2406, N'false_5511982687465@c.us_B519F2C807AC78BF50CD19BFC', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 14:22:06.000' AS DateTime), N'Luci eu adorei não tinha visto esse ainda.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21113, 1, 2407, N'false_5511981987181@c.us_3A9A4A990B1A0C85AEFA', N'Entrada', NULL, 0, 0, CAST(N'2020-01-13 17:50:10.000' AS DateTime), N'Ok obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21112, 1, 2407, N'false_5511981987181@c.us_3A0CA6E816E51EA009DD', N'Entrada', NULL, 0, 0, CAST(N'2020-01-13 17:47:00.000' AS DateTime), N'Qual o valor do de 50m?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21115, 1, 2410, N'false_5511984477102@c.us_3A5400662BB47FF37E9E', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:34:14.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21114, 1, 2410, N'false_5511984477102@c.us_3A601D6D9BB1232D72E7', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:34:13.000' AS DateTime), N'Olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21118, 1, 2415, N'false_5511972507887@c.us_3AA7836EDED31FB9DAD0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:56:39.000' AS DateTime), N'Obg', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21117, 1, 2415, N'false_5511972507887@c.us_3AA10B7FB54F35D11220', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:56:36.000' AS DateTime), N'Eu já comprei Imovel', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21116, 1, 2415, N'false_5511972507887@c.us_3A665C66D0323E26287B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:56:28.000' AS DateTime), N'Olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21130, 1, 2416, N'false_5511991377032@c.us_267F96273BFAB4E2A14E2732F', N'Entrada', NULL, 0, 0, CAST(N'2020-03-11 22:34:51.000' AS DateTime), N'Tatuapé, carrão e Belém. De preferência perto de metrô', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21129, 1, 2416, N'false_5511991377032@c.us_22456F89AA129071A4D8D3EE3', N'Entrada', NULL, 0, 0, CAST(N'2020-03-10 17:57:20.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21128, 1, 2416, N'false_5511991377032@c.us_D79A40271D393F3CD83135F1D', N'Entrada', NULL, 0, 0, CAST(N'2020-03-10 17:57:16.000' AS DateTime), N'Por esse valor, não tenho interesse', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21127, 1, 2416, N'false_5511991377032@c.us_857E92076E0A3E599B744DC47', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:47:32.000' AS DateTime), N'Quem é a construtora?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21126, 1, 2416, N'false_5511991377032@c.us_17618D4FECC4A2BD524BF43A1', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:47:23.000' AS DateTime), N'Qual a forma de pagamento?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21125, 1, 2416, N'false_5511991377032@c.us_80869CCA44480C084EF585F16', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:47:16.000' AS DateTime), N'Tem vaga de garagem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21124, 1, 2416, N'false_5511991377032@c.us_AD5B7D30739A5A24C59EFA952', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:46:53.000' AS DateTime), N'São 2 ou 3 dormitórios?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21123, 1, 2416, N'false_5511991377032@c.us_DD7EC2A6603C8E6AE33FF0F4B', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:46:39.000' AS DateTime), N'Tem planta das unidades?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21122, 1, 2416, N'false_5511991377032@c.us_EB2D28D6E6AD71A58257D9C23', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:45:01.000' AS DateTime), N'Qual o valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21121, 1, 2416, N'false_5511991377032@c.us_D824AAC8255279E6172A655BD', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:44:44.000' AS DateTime), N'Esse empreendimento está pronto?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21120, 1, 2416, N'false_5511991377032@c.us_04B792D38117C253F25B096AC', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:44:30.000' AS DateTime), N'Tudo bem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21119, 1, 2416, N'false_5511991377032@c.us_BE5271D6ECE089CBED0F1BDEE', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 21:44:27.000' AS DateTime), N'Oi Graciele', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21132, 1, 2420, N'false_5513996488361@c.us_BD04DEF875DF330C339D7936F', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 16:42:28.000' AS DateTime), N'Ola', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21131, 1, 2420, N'false_5513996488361@c.us_6330EAFAEA9A9DF8CDF66885E', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 16:42:21.000' AS DateTime), N'Olá meu nome é Luana ??????  sou Corretora ????, obrigado pelo contato, essa mensagem é automática, assim que possível retornarei. Em que posso te auxiliar ? Por favor deixe seu nome e um resumo sobre o assunto, agradeço desde já. ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21136, 1, 2422, N'false_5511996167412@c.us_D39C731FEE00BDB44BB622BA0', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:59:17.000' AS DateTime), N'Eu que agradeço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21135, 1, 2422, N'false_5511996167412@c.us_CBB61645FB1C189D9C3B87EFD', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:49:15.000' AS DateTime), N'Grazi, eu tinha falado com ela ano passado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21134, 1, 2422, N'false_5511996167412@c.us_F037804FF084E107009DAFB5D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 18:10:11.000' AS DateTime), N'Boa tarde! Eu dei uma olhada esse fim de semana, estou analisando com minha esposa a compra da unidade', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21133, 1, 2422, N'false_5511996167412@c.us_3110252BCDBFF6F48B90EB4DE', N'Entrada', NULL, 0, 0, CAST(N'2020-01-13 19:36:57.000' AS DateTime), N'Boa tarde!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21140, 1, 2423, N'false_5511998542548@c.us_34AD8649A0ED7D4244EC51B85', N'Entrada', NULL, 0, 0, CAST(N'2020-08-25 16:57:41.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21139, 1, 2423, N'false_5511998542548@c.us_6FA680AFACB5DA1C0AB44874C', N'Entrada', NULL, 0, 0, CAST(N'2020-07-19 18:45:26.000' AS DateTime), N'video', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21138, 1, 2423, N'false_5511998542548@c.us_EF8B5A7016B47E905E6E8097D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:01:17.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21137, 1, 2423, N'false_5511998542548@c.us_A0E7C4421B0F764DBFD4E9864', N'Entrada', NULL, 0, 0, CAST(N'2020-06-03 15:54:54.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21448, 1, 2424, N'false_5511947310291@c.us_3AF3F5B048A3FC17ABDC', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 22:08:54.000' AS DateTime), N'Para poder entregar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21447, 1, 2424, N'false_5511947310291@c.us_3A41D1CF6FC83B0FCEF6', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 22:08:46.000' AS DateTime), N'Os corretores vão etiquetar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21446, 1, 2424, N'false_5511947310291@c.us_3A8D9AE943E0FF537B4D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 22:08:34.000' AS DateTime), N'Tem que grampear na frente', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21445, 1, 2424, N'false_5511947310291@c.us_3A3B7FECBBBC160C5D93', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 22:08:22.000' AS DateTime), N'Estes são juntos com os folhetos que será entregue', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21444, 1, 2424, N'false_5511947310291@c.us_3ACEBA9E5B4101F0D5D5', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:33:58.000' AS DateTime), N'Deixei com o Sandro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21443, 1, 2424, N'false_5511947310291@c.us_3AF82F01B5A4D37F0120', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:16:14.000' AS DateTime), N'Tudo parado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21442, 1, 2424, N'false_5511947310291@c.us_3A8FDFF1725F740FF5D5', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:16:05.000' AS DateTime), N'Estou a caminho', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21441, 1, 2424, N'false_5511947310291@c.us_3AB93C6770FB71C649DD', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:15:37.000' AS DateTime), N'Estou tentando chegar ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21440, 1, 2424, N'false_5511947310291@c.us_3AD28B0BA8F2204C7826', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:15:21.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21439, 1, 2424, N'false_5511947310291@c.us_3ACDE30FBA638324D040', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 16:15:08.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21438, 1, 2424, N'false_5511947310291@c.us_3AE688D7912C3EBB1137', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 15:53:58.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21437, 1, 2424, N'false_5511947310291@c.us_3A451861BADD9B62ED88', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 15:44:26.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21436, 1, 2424, N'false_5511947310291@c.us_3A0A7D4539F95648794C', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 15:44:01.000' AS DateTime), N'Desculpa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21435, 1, 2424, N'false_5511947310291@c.us_3AC6D34163CE07291699', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 15:38:22.000' AS DateTime), N'Estou indo aí', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21434, 1, 2424, N'false_5511947310291@c.us_3A485DB19558F782535A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 15:31:12.000' AS DateTime), N'11.991240582 só de segunda opção', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21433, 1, 2424, N'false_5511947310291@c.us_3A914599DFCD250DC620', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 14:08:23.000' AS DateTime), N'Também', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21432, 1, 2424, N'false_5511947310291@c.us_3ADE3DEE1D1743CC0A8D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 14:08:02.000' AS DateTime), N'Pode sim, seria bom colocar o meu telefone abaixo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21431, 1, 2424, N'false_5511947310291@c.us_3EB087176D28588DEA37', N'Entrada', NULL, 0, 0, CAST(N'2020-10-21 20:23:18.000' AS DateTime), N'recebi agora', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21430, 1, 2424, N'false_5511947310291@c.us_3EB0E83398FA595035D8', N'Entrada', NULL, 0, 0, CAST(N'2020-10-21 20:15:37.000' AS DateTime), N'isso', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21429, 1, 2424, N'false_5511947310291@c.us_3EB067C65486170BF709', N'Entrada', NULL, 0, 0, CAST(N'2020-10-21 20:13:54.000' AS DateTime), N'não chegou pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21428, 1, 2424, N'false_5511947310291@c.us_3AA9433CC62240D4C7EB', N'Entrada', NULL, 0, 0, CAST(N'2020-10-21 14:04:20.000' AS DateTime), N'Vou ver', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21427, 1, 2424, N'false_5511947310291@c.us_3EB0C483EB6E3ECEEAC2', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 17:25:02.000' AS DateTime), N'amanhãs as 12:30 deixo lá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21426, 1, 2424, N'false_5511947310291@c.us_3EB03A6A3BD8039DD557', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 17:24:50.000' AS DateTime), N'Lú fiz o caminho errado ?? vim para o escritório', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21425, 1, 2424, N'false_5511947310291@c.us_3A643FB4DEB008C9B18F', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 12:25:10.000' AS DateTime), N'??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21424, 1, 2424, N'false_5511947310291@c.us_3A4D7484AE80724DAD2A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-20 12:25:06.000' AS DateTime), N'Vou deixar os convites hoje para grampear', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21423, 1, 2424, N'false_5511947310291@c.us_3A3B3801E4270A7D4E9A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 15:43:41.000' AS DateTime), N'Vou olhar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21422, 1, 2424, N'false_5511947310291@c.us_3A5110A5E575201A84A6', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 15:43:35.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21421, 1, 2424, N'false_5511947310291@c.us_3A6BF94D566A322CD5CE', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:47:47.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21420, 1, 2424, N'false_5511947310291@c.us_3A54BCAEF3E3819BD81E', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:44:37.000' AS DateTime), N'Umas 12 ou 13 h', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21419, 1, 2424, N'false_5511947310291@c.us_3A46A012A5BAD9660915', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:44:23.000' AS DateTime), N'Tenho dentista e vou logo após', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21418, 1, 2424, N'false_5511947310291@c.us_3A42B9EA321DA26814BD', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:42:42.000' AS DateTime), N'Pode sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21417, 1, 2424, N'false_5511947310291@c.us_3A100416D1F16F099D4D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:41:01.000' AS DateTime), N'Vou aí amanhã', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21416, 1, 2424, N'false_5511947310291@c.us_3A70317F318A2ECDC7A6', N'Entrada', NULL, 0, 0, CAST(N'2020-10-13 13:40:53.000' AS DateTime), N'Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21415, 1, 2424, N'false_5511947310291@c.us_3EB0EF33E1A5D19FE8A0', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 20:29:12.000' AS DateTime), N'segue a carta: A W Zarzur, convida você a conhecer nossos OFFICES de 37m² a 361m² na região do Paraíso, próximo a Av. Paulista e fácil acesso as principais vias de São Paulo, entre duas estações de Metrô (Vergueiro / São Joaquim) e ao lado de grandes centros médicos, hospitais e fóruns.\n\nTudo isso pensado para seu melhor negócio, comodidade e segurança. Venha conhecer nossa sala modelo de 61m², aprecie nossa vista com delicioso café, temos um amplo estacionamento com valet para você e seus clientes.\n\nImóvel pronto para seu investimento seguro e excelente oportunidade de negócio, agende sua visita agora mesmo em nossa central ou utilize nosso whatsapp para mais informações.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21414, 1, 2424, N'false_5511947310291@c.us_3EB0B38350872DD49084', N'Entrada', NULL, 0, 0, CAST(N'2020-10-07 20:28:57.000' AS DateTime), N'Lucia, Boa tarde! tudo bem? conversando com a Sônia e Fabiane, mudamos a carta e o e-mail para enviar para os clientes. quero saber se na sexta vocês vão ficar por aí?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21413, 1, 2424, N'false_5511947310291@c.us_3A1F5657C6A03C969CD0', N'Entrada', NULL, 0, 0, CAST(N'2020-09-29 14:08:40.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21412, 1, 2424, N'false_5511947310291@c.us_3A865B9716665D419794', N'Entrada', NULL, 0, 0, CAST(N'2020-09-29 14:08:36.000' AS DateTime), N'Estou ficando sem bateria', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21411, 1, 2424, N'false_5511947310291@c.us_3A82EC1D621FFDC87E27', N'Entrada', NULL, 0, 0, CAST(N'2020-09-29 14:08:27.000' AS DateTime), N'Já falo com vc', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21410, 1, 2424, N'false_5511947310291@c.us_3A1CC07A80805EE05653', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 13:34:28.000' AS DateTime), N'Já passei para pagamento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21409, 1, 2424, N'false_5511947310291@c.us_3A0B6E3598C95226CB30', N'Entrada', NULL, 0, 0, CAST(N'2020-09-25 13:34:19.000' AS DateTime), N'Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21408, 1, 2424, N'false_5511947310291@c.us_3A09DC47CCC6075D045E', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 13:55:12.000' AS DateTime), N'Ok vou mandar fazer', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21407, 1, 2424, N'false_5511947310291@c.us_3A24BCC70FA257AC23A9', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 13:53:23.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21406, 1, 2424, N'false_5511947310291@c.us_3EB0FD75158462D0A9E7', N'Entrada', NULL, 0, 0, CAST(N'2020-08-20 18:19:04.000' AS DateTime), N'lembra que conversamos sobre o caso aqui do escritório que as coisas não estavam boas, então realmente não está mesmo, então até saber ao certo o que irá acontecer temos que nos unir, a Sônia falou que está tentando segurar os serviços até Dezembro, porém pode ser que acabe antes, então estou abrindo com você que tudo pode acontecer e nos preparar se caso aconteça  algo para não ficarmos sem renda.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21405, 1, 2424, N'false_5511947310291@c.us_3EB01A5D32BB8D6EF847', N'Entrada', NULL, 0, 0, CAST(N'2020-08-20 18:13:24.000' AS DateTime), N'Olá! Lu está melhor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21404, 1, 2424, N'false_5511947310291@c.us_3A96399B0D1B88CDF355', N'Entrada', NULL, 0, 0, CAST(N'2020-08-20 13:43:37.000' AS DateTime), N'Se cuida', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21403, 1, 2424, N'false_5511947310291@c.us_3A2DE049FB3CB4E34F40', N'Entrada', NULL, 0, 0, CAST(N'2020-08-20 13:37:24.000' AS DateTime), N'Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21402, 1, 2424, N'false_5511947310291@c.us_3A1361FE97EFF7484A5E', N'Entrada', NULL, 0, 0, CAST(N'2020-08-20 13:36:51.000' AS DateTime), N'Está', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21401, 1, 2424, N'false_5511947310291@c.us_3A82E1E18090205D7150', N'Entrada', NULL, 0, 0, CAST(N'2020-08-18 12:52:21.000' AS DateTime), N'Bjs', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21400, 1, 2424, N'false_5511947310291@c.us_3A2EDE397A1D7F882386', N'Entrada', NULL, 0, 0, CAST(N'2020-08-18 12:52:19.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21399, 1, 2424, N'false_5511947310291@c.us_3A34CF49AA9C06D90B95', N'Entrada', NULL, 0, 0, CAST(N'2020-08-18 12:41:04.000' AS DateTime), N'Vou pegar na gráfica hoje', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21398, 1, 2424, N'false_5511947310291@c.us_3AF3F6012B751859A0EC', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 15:38:46.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21397, 1, 2424, N'false_5511947310291@c.us_3A7A35877D1F7BB023A9', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 15:37:57.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21396, 1, 2424, N'false_5511947310291@c.us_3A64A64B22ED47B2AE75', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 15:06:25.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21395, 1, 2424, N'false_5511947310291@c.us_3A53E540C37768A272B1', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 15:02:11.000' AS DateTime), N'Amanhã passo na kalunga', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21394, 1, 2424, N'false_5511947310291@c.us_3AEE403F72DEF151FEC9', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 15:01:55.000' AS DateTime), N'Só os envelopes?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21393, 1, 2424, N'false_5511947310291@c.us_3A3B3FFEF7586EA668D4', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 13:00:22.000' AS DateTime), N'Ok ! Bom diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21392, 1, 2424, N'false_5511947310291@c.us_3A4D6E523717274A2F5E', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:32:36.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21391, 1, 2424, N'false_5511947310291@c.us_3AC8FBA3ECE0C57140E6', N'Entrada', NULL, 0, 0, CAST(N'2020-07-21 12:29:53.000' AS DateTime), N'Rua Manuel da Nóbrega, 435 apto 32 B \nCentro diadema \nCEP 09910-720', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21390, 1, 2424, N'false_5511947310291@c.us_3AFAD9B2E97BE913B06B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-15 13:10:34.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21389, 1, 2424, N'false_5511947310291@c.us_3EB0DB38CA05C8AD16A9', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 16:57:14.000' AS DateTime), N'ótimo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21388, 1, 2424, N'false_5511947310291@c.us_3A49BE4B40A4344886CC', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:03:56.000' AS DateTime), N'Amanhã vou ficar aí com vcs', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21387, 1, 2424, N'false_5511947310291@c.us_3AD6F25CC765EAD5F31C', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:03:44.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21386, 1, 2424, N'false_5511947310291@c.us_3A45ED735F82547E7244', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:03:33.000' AS DateTime), N'Passa para o Turim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21385, 1, 2424, N'false_5511947310291@c.us_3EB0CAD7B17B9CF8A97D', N'Entrada', NULL, 0, 0, CAST(N'2020-04-30 13:41:22.000' AS DateTime), N'bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21384, 1, 2424, N'false_5511947310291@c.us_3EB049F8B491295FDC80', N'Entrada', NULL, 0, 0, CAST(N'2020-04-30 13:41:15.000' AS DateTime), N'mas não está no anapro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21383, 1, 2424, N'false_5511947310291@c.us_3EB0FEEEB90D25D9B71F', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:01:54.000' AS DateTime), N'bjs', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21382, 1, 2424, N'false_5511947310291@c.us_3EB020B2C9BD7D116005', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:01:46.000' AS DateTime), N'a Fátima encerrou em janeiro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21381, 1, 2424, N'false_5511947310291@c.us_3EB0C85196D81BDA8D43', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:01:26.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21380, 1, 2424, N'false_5511947310291@c.us_3EB09C5E991AD6E8CFB4', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:01:20.000' AS DateTime), N'enviei para o Turim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21379, 1, 2424, N'false_5511947310291@c.us_3EB0D0F4FB204E22B9ED', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 21:00:44.000' AS DateTime), N'tinha e foi para o senhor José', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21378, 1, 2424, N'false_5511947310291@c.us_3EB0A3E3755B127EDADA', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 20:58:54.000' AS DateTime), N'era atendimento da Fatima antes', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21377, 1, 2424, N'false_5511947310291@c.us_3EB0A9A9C925D1177F86', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 20:58:45.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21376, 1, 2424, N'false_5511947310291@c.us_3EB07C5BC445AFDE291B', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 20:57:34.000' AS DateTime), N'porém não tem o dinheiro suficiente', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21375, 1, 2424, N'false_5511947310291@c.us_3EB073F69BB26B1DC259', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 20:56:40.000' AS DateTime), N'a Gueda já foi atendido', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21374, 1, 2424, N'false_5511947310291@c.us_3EB06BAC64008BDA9EBF', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 18:38:45.000' AS DateTime), N'não chegou os contatos pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21373, 1, 2424, N'false_5511947310291@c.us_3EB0CB6BE093DB1A2176', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 17:35:33.000' AS DateTime), N'a partir de 750mil, fala que só o corretor passa, assim amarra o cliente novamente', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21372, 1, 2424, N'false_5511947310291@c.us_3EB03C3647F445E16E2C', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 17:00:47.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21371, 1, 2424, N'false_5511947310291@c.us_3AE18A350B8C130F2043', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 16:47:01.000' AS DateTime), N'Não a Fabiane vai', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21370, 1, 2424, N'false_5511947310291@c.us_3AD929396CEAB8D44359', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 16:44:46.000' AS DateTime), N'Vou olhar mas não vi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21369, 1, 2424, N'false_5511947310291@c.us_3A0D381D059D7BA6EC94', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 16:43:57.000' AS DateTime), N'Tudo é vc?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21368, 1, 2424, N'false_5511947310291@c.us_3A3F05BD218C3B5D26FF', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 16:43:49.000' AS DateTime), N'Oie', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21367, 1, 2424, N'false_5511947310291@c.us_3ABC159AB7CD185CB9DE', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:31:23.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21366, 1, 2424, N'false_5511947310291@c.us_3AE9B10ED31410CEE2F5', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:02:38.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21365, 1, 2424, N'false_5511947310291@c.us_3AFAD5802FEDAD5D2435', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 12:52:18.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21364, 1, 2424, N'false_5511947310291@c.us_3A800847F7AC95573E12', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 12:52:11.000' AS DateTime), N'Tá bom, bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21363, 1, 2424, N'false_5511947310291@c.us_3EB07361CF4D312EDE2C', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 18:01:38.000' AS DateTime), N'?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21362, 1, 2424, N'false_5511947310291@c.us_3EB020AF0959954395DB', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 18:01:37.000' AS DateTime), N'vc enviou no anapro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21361, 1, 2424, N'false_5511947310291@c.us_3A386A50E4FC8B011CEB', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:33:15.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21360, 1, 2424, N'false_5511947310291@c.us_3A351A4B87A5C9BF32F4', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:31:46.000' AS DateTime), N'Querem retorno?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21359, 1, 2424, N'false_5511947310291@c.us_3AFA03626084FAD5022B', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:31:34.000' AS DateTime), N'Qual o produto', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21358, 1, 2424, N'false_5511947310291@c.us_3A898309C315AD223DCC', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:31:27.000' AS DateTime), N'Oie', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21357, 1, 2424, N'false_5511947310291@c.us_3EB0B53F7A27326523D4', N'Entrada', NULL, 0, 0, CAST(N'2020-04-02 17:38:12.000' AS DateTime), N'sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21356, 1, 2424, N'false_5511947310291@c.us_3EB0BB7DF03C4803B707', N'Entrada', NULL, 0, 0, CAST(N'2020-04-02 16:53:13.000' AS DateTime), N'recebi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21355, 1, 2424, N'false_5511947310291@c.us_3EB029F7540A8A9B8A7E', N'Entrada', NULL, 0, 0, CAST(N'2020-04-02 16:52:03.000' AS DateTime), N'boa tarde!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21354, 1, 2424, N'false_5511947310291@c.us_3EB03B488A9AFF571702', N'Entrada', NULL, 0, 0, CAST(N'2020-04-02 16:52:00.000' AS DateTime), N'olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21353, 1, 2424, N'false_5511947310291@c.us_3EB0C22F9815A5C6AC13', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 18:26:17.000' AS DateTime), N'ok! obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21352, 1, 2424, N'false_5511947310291@c.us_3EB022995AA1FCCEAAC9', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 17:59:39.000' AS DateTime), N'sim, já enviei', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21351, 1, 2424, N'false_5511947310291@c.us_3A940FD1BE80049D054E', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 14:22:12.000' AS DateTime), N'Já te ligo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21350, 1, 2424, N'false_5511947310291@c.us_3AB924BA491D2121C31B', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 14:21:44.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21349, 1, 2424, N'false_5511947310291@c.us_3AF3BAB936B9EE3426A8', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 19:53:46.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21348, 1, 2424, N'false_5511947310291@c.us_3A52DCF91E07B2F3AB45', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:55:27.000' AS DateTime), N'Kkkk', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21347, 1, 2424, N'false_5511947310291@c.us_3AB5D2960A617F1E68EF', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:53:30.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21346, 1, 2424, N'false_5511947310291@c.us_3AD41D25B609E54A6C9C', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:53:27.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21345, 1, 2424, N'false_5511947310291@c.us_3A4E87F95C388CF80FC3', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:00:31.000' AS DateTime), N'Pode enviar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21344, 1, 2424, N'false_5511947310291@c.us_3A7D826CB076C6D548BB', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:00:25.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21343, 1, 2424, N'false_5511947310291@c.us_3EB054516E5D87566BCC', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:14:18.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21341, 1, 2424, N'false_5511947310291@c.us_3EB088598A1309B00E19', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:14:17.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21342, 1, 2424, N'false_5511947310291@c.us_3EB0D3A2DD2426FE5173', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:14:17.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21340, 1, 2424, N'false_5511947310291@c.us_3EB0780B9CEB1FD61D0E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:30:12.000' AS DateTime), N'não pode passar preços', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21339, 1, 2424, N'false_5511947310291@c.us_3EB05E68CFAF496AA05A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:30:00.000' AS DateTime), N'ou pego o contato e passa para o Turim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21338, 1, 2424, N'false_5511947310291@c.us_3EB0B1DD8BFF7887B571', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:29:46.000' AS DateTime), N'Tenta marcar uma visita', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21336, 1, 2424, N'false_5511947310291@c.us_3EB067463975D356E3B0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:07.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21337, 1, 2424, N'false_5511947310291@c.us_3EB07E7D3A0DD70920C9', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:07.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21333, 1, 2424, N'false_5511947310291@c.us_3EB03DF73756E49C1FAA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:06.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21334, 1, 2424, N'false_5511947310291@c.us_3EB0F73B76613F4D4527', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:06.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21335, 1, 2424, N'false_5511947310291@c.us_3EB09863321D4A5815AF', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:06.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21329, 1, 2424, N'false_5511947310291@c.us_3EB0CF8795027FEBE87B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:05.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21330, 1, 2424, N'false_5511947310291@c.us_3EB0054E8E4B67B7F67A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:05.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21331, 1, 2424, N'false_5511947310291@c.us_3EB0F1C5D3E22714E528', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:05.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21332, 1, 2424, N'false_5511947310291@c.us_3EB04F177F1E0643CC71', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:05.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21327, 1, 2424, N'false_5511947310291@c.us_3EB04FD2C2236836BE2C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:04.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21328, 1, 2424, N'false_5511947310291@c.us_3EB0F079F5B7B5C3AE7D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:26:04.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21326, 1, 2424, N'false_5511947310291@c.us_3EB0BB937432A3F6863A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:55:23.000' AS DateTime), N'que bom', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21325, 1, 2424, N'false_5511947310291@c.us_3EB0230EB212510901F4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:55:17.000' AS DateTime), N'por enquanto', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21324, 1, 2424, N'false_5511947310291@c.us_3EB021F80F251B5BF2F8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:55:11.000' AS DateTime), N'pode enviar este', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21323, 1, 2424, N'false_5511947310291@c.us_3EB0254A0A2C36B21387', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:53:14.000' AS DateTime), N'o Book vou mudar a Sônia não gostou, mas enquanto altero pode enviar este', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21322, 1, 2424, N'false_5511947310291@c.us_3EB0589E4C14FBF735D6', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:52:47.000' AS DateTime), N'Então, Só Incluir o que escrevi, no começo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21321, 1, 2424, N'false_5511947310291@c.us_3EB06820908411AD2A5D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 15:49:49.000' AS DateTime), N'Boa Tarde! Rosângela, tudo bem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21320, 1, 2424, N'false_5511947310291@c.us_3EB08AC8DA66A793E52C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-19 20:02:53.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21319, 1, 2424, N'false_5511947310291@c.us_3EB04446EAA7E11C9888', N'Entrada', NULL, 0, 0, CAST(N'2019-11-19 18:19:04.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21318, 1, 2424, N'false_5511947310291@c.us_3EB0F25C17EB47E0C8A1', N'Entrada', NULL, 0, 0, CAST(N'2019-11-19 16:07:03.000' AS DateTime), N'e vc', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21316, 1, 2424, N'false_5511947310291@c.us_3EB0CC4FD20A24F6FC4C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-19 16:07:02.000' AS DateTime), N'olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21317, 1, 2424, N'false_5511947310291@c.us_3EB0214DFD75F01F55B0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-19 16:07:02.000' AS DateTime), N'tudo bem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21143, 1, 2430, N'false_5511940177466@c.us_86BA1ED4336270C6E39054593', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 15:35:09.000' AS DateTime), N'Obrigada esse valor e alto para mim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21142, 1, 2430, N'false_5511940177466@c.us_E5BF1AD44F08F5B9F4BD85112', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 15:19:20.000' AS DateTime), N'Qual o valor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21141, 1, 2430, N'false_5511940177466@c.us_63EF6EFCA0D8D50BCB62E4144', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 15:19:04.000' AS DateTime), N'O de 50 mts  quadrado  são quantos quartos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21144, 1, 2431, N'false_5511980727290@c.us_3A8038AB877E5EE96495', N'Entrada', NULL, 0, 0, CAST(N'2020-02-12 19:14:22.000' AS DateTime), N'Qual valor ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21156, 1, 2432, N'false_5511999424142@c.us_3A8B14B652A7DD47064A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:24:12.000' AS DateTime), N'Legal...\nObrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21155, 1, 2432, N'false_5511999424142@c.us_3A16A3B69BA0807708FE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:13:27.000' AS DateTime), N'Prazo, qual prazo do parcelamento com a construtora?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21154, 1, 2432, N'false_5511999424142@c.us_3A33FCBAE0CD7708E093', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:12:13.000' AS DateTime), N'Te ligo então', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21153, 1, 2432, N'false_5511999424142@c.us_3AEB4B2E6AA4A142B1F8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:10:03.000' AS DateTime), N'Com a construtora?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21152, 1, 2432, N'false_5511999424142@c.us_3A722143F5653C15B766', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:09:43.000' AS DateTime), N'Só mais uma coisa...\nSabe me dizer se tem alguma forma de parcelamento?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21151, 1, 2432, N'false_5511999424142@c.us_3A143ADF129C5C0CB61F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:09:07.000' AS DateTime), N'Vou avaliar e te retorno \nObrigado ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21150, 1, 2432, N'false_5511999424142@c.us_3ABCAD8235743418015A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:07:05.000' AS DateTime), N'Vou procurar o nome dele', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21149, 1, 2432, N'false_5511999424142@c.us_3ADBB84E64FC93608F8E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 20:03:33.000' AS DateTime), N'Há pouco tempo atrás outro corretor havia me falado em R$750.000,00 , aumentou?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21148, 1, 2432, N'false_5511999424142@c.us_3ABC6ED8C110DEEFE8EE', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:58:13.000' AS DateTime), N'Queria saber o valor primeiro se possível para avaliar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21147, 1, 2432, N'false_5511999424142@c.us_3A73A48B2DB4C3DF9D08', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:55:18.000' AS DateTime), N'Esse final 8 com 80,22 metros quanto está', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21146, 1, 2432, N'false_5511999424142@c.us_3A697A5BF7C8160361CA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:23:15.000' AS DateTime), N'Me envie as plantas e os valores , por favor!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21145, 1, 2432, N'false_5511999424142@c.us_3A895341C55DDD52479B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:22:43.000' AS DateTime), N'Oi Thalita, boa tarde!\nQuais tamanhos você tem?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21157, 1, 2434, N'false_5511975724440@c.us_4275C059085D76A3AC68EDFC4', N'Entrada', NULL, 0, 0, CAST(N'2020-08-01 01:56:06.000' AS DateTime), N'Estou no Instagram como @jcfaadvocacia. Instale o aplicativo para seguir minhas fotos e vídeos. https://www.instagram.com/invites/contact/?i=1pdazaw4970f&utm_content=2hcntcq', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21159, 1, 2437, N'false_5511982765301@c.us_644D2647E1571688FA8F6A8A8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:58:28.000' AS DateTime), N'Sim, pode enviar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21158, 1, 2437, N'false_5511982765301@c.us_02B429927AD88B4A21CB74824', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:58:08.000' AS DateTime), N'Boa tarde!!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21170, 1, 2438, N'false_5511983552176@c.us_3A6F5CED3862BF4E0E43', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 15:29:24.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21169, 1, 2438, N'false_5511983552176@c.us_3A0F7661EB7B3CCA7317', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 15:26:32.000' AS DateTime), N'B diaaa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21168, 1, 2438, N'false_5511983552176@c.us_3AC94087EB1A983294B7', N'Entrada', NULL, 0, 0, CAST(N'2020-07-01 15:02:06.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21167, 1, 2438, N'false_5511983552176@c.us_3AEAB9745B6FDBE15DB8', N'Entrada', NULL, 0, 0, CAST(N'2020-07-01 14:41:44.000' AS DateTime), N'Maximo 350', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21166, 1, 2438, N'false_5511983552176@c.us_3A9520B9199B208F4535', N'Entrada', NULL, 0, 0, CAST(N'2020-07-01 14:41:39.000' AS DateTime), N'B dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21165, 1, 2438, N'false_5511983552176@c.us_3AEA7AC905AC4ACF6872', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 18:00:03.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21164, 1, 2438, N'false_5511983552176@c.us_3ACEB00AB4BFE2205464', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:49:30.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21163, 1, 2438, N'false_5511983552176@c.us_3ACDAE7F0FEDAF537B1F', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:21:51.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21162, 1, 2438, N'false_5511983552176@c.us_3AF8104FB250D9027206', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:14:30.000' AS DateTime), N'Pigioni', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21161, 1, 2438, N'false_5511983552176@c.us_3A6C39807B49DF3E1B6D', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:13:16.000' AS DateTime), N'E a partir?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21160, 1, 2438, N'false_5511983552176@c.us_3A0D4020FDCE3ECCA901', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:12:35.000' AS DateTime), N'Me passa o preço ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21172, 1, 2439, N'false_5511949538876@c.us_1FC85E1E2618992D1DBEFA457', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 16:26:34.000' AS DateTime), N'Valores do imóvel \nValor da entrada \nEtc?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21171, 1, 2439, N'false_5511949538876@c.us_DCF9D08DD1724A0417F3B118C', N'Entrada', NULL, 0, 0, CAST(N'2020-08-12 16:26:16.000' AS DateTime), N'Poderia me dar mais informação', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21176, 1, 2440, N'false_5511991910082@c.us_4BBA14194C24FC81B609E212E', N'Entrada', NULL, 0, 0, CAST(N'2020-10-09 15:19:22.000' AS DateTime), N'Ok.\nObrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21175, 1, 2440, N'false_5511991910082@c.us_462C9E8DE7FD88795978D7744', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:15:33.000' AS DateTime), N'Ok.\nNo aguardo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21174, 1, 2440, N'false_5511991910082@c.us_A895CE5ECE1DAC5FF792C03BC', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:10:44.000' AS DateTime), N'Qual o endereço deste e quanto está saindo?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21173, 1, 2440, N'false_5511991910082@c.us_8ED3F367FE2784C82CA4A3239', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 17:19:07.000' AS DateTime), N'Tem mais material com p apto em si ?\nQuando será a entrega?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21177, 1, 2441, N'false_5511970453532@c.us_3A079414151D0B42F364', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 14:55:12.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21178, 1, 2443, N'false_5511958541112@c.us_DD66A32B1ECEE756A1249842D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:25:27.000' AS DateTime), N'Obrigada. Vou ler', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21180, 1, 2445, N'false_5511982244050@c.us_88C2919AC0D9AE99A9483530B', N'Entrada', NULL, 0, 0, CAST(N'2020-03-17 15:59:14.000' AS DateTime), N'Bom dia, querida', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21179, 1, 2445, N'false_5511982244050@c.us_4E7C8CDF2DFC387FF0DFE3C82', N'Entrada', NULL, 0, 0, CAST(N'2020-03-17 09:04:44.000' AS DateTime), N'Bom dia!\nEstou confinada em casa! \nMotivo:idade 67, grupo de risco!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21183, 1, 2446, N'false_5511947209665@c.us_DBD1D3A7E2ACA284CCD2551DC', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 14:55:57.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21182, 1, 2446, N'false_5511947209665@c.us_AA6E2F760A1D3963C7E1D0D88', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 14:55:55.000' AS DateTime), N'revoked', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21181, 1, 2446, N'false_5511947209665@c.us_6B5F9232521D6D991FA997F39', N'Entrada', NULL, 0, 0, CAST(N'2019-12-02 21:45:40.000' AS DateTime), N'Qual valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21191, 1, 2448, N'false_5511991795236@c.us_E6F54136F89AC5D2C7F567273', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:05:40.000' AS DateTime), N'Queria mas em conta', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21190, 1, 2448, N'false_5511991795236@c.us_7B388CA64AA2E5459BBF6EEE8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:05:34.000' AS DateTime), N'Mas pra nós não dá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21189, 1, 2448, N'false_5511991795236@c.us_04E1C75D3D8FF3153980BF55D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:05:26.000' AS DateTime), N'Entendi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21188, 1, 2448, N'false_5511991795236@c.us_24035D5ADE5EB78DC7DAF71B7', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:58:07.000' AS DateTime), N'Não entendi esse valor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21187, 1, 2448, N'false_5511991795236@c.us_D3154B096CE2A311E72D334B2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:02:04.000' AS DateTime), N'Agora não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21186, 1, 2448, N'false_5511991795236@c.us_D940CFB96B086245F38B6C510', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 15:59:59.000' AS DateTime), N'Se poder falar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21185, 1, 2448, N'false_5511991795236@c.us_8EA2AB17EA88C228688FC5442', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 15:59:54.000' AS DateTime), N'Queria saber sem corretor por quando', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21184, 1, 2448, N'false_5511991795236@c.us_24B0E96CCD3A50E72B601DBC7', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 15:55:05.000' AS DateTime), N'Thalita qual e valor 88m', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21198, 1, 2449, N'false_5511953188682@c.us_3AFDD208C6C1ECA2DC5A', N'Entrada', NULL, 0, 0, CAST(N'2020-02-11 14:55:18.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21197, 1, 2449, N'false_5511953188682@c.us_3ABC09CF63C043EB33EA', N'Entrada', NULL, 0, 0, CAST(N'2020-02-11 14:04:42.000' AS DateTime), N'Luci, bom dia. Por gentileza, peça para a sua cliente ligar para 97576-5240 (Ademar). Ele está cuidando desta parte. Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21196, 1, 2449, N'false_5511953188682@c.us_5E8B0F22DAE6002202AE', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 13:21:32.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21195, 1, 2449, N'false_5511953188682@c.us_3AFE17A389B063271F40', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 12:56:41.000' AS DateTime), N'Bom dia, vou atrasar 15 minutos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21194, 1, 2449, N'false_5511953188682@c.us_3A3D8528CD22649AC746', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 17:49:06.000' AS DateTime), N'Às 10h, estarei pontualmente aí. Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21193, 1, 2449, N'false_5511953188682@c.us_3AE342A66750E6F40CB4', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 17:09:34.000' AS DateTime), N'Boa tarde, Luci. Pode ser amanhã na parte da manhã?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21192, 1, 2449, N'false_5511953188682@c.us_3AF222550865A73D0AD9', N'Entrada', NULL, 0, 0, CAST(N'2020-01-20 15:29:05.000' AS DateTime), N'Bom dia, Luci. Obrigado pelo retorno. Estou fazendo uma pesquisa para alugar um escritório de aproximadamente 40m2', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21203, 1, 2453, N'false_5511994974011@c.us_3ABA7F24BC125BFB4BED', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:18:04.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21202, 1, 2453, N'false_5511994974011@c.us_3AC345C74B62A685CE1E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 17:37:22.000' AS DateTime), N'?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21201, 1, 2453, N'false_5511994974011@c.us_3AFBC8D9F39B85258B8C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 17:37:20.000' AS DateTime), N'Qual valor do empreendimento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21200, 1, 2453, N'false_5511994974011@c.us_3A128A3955FFD348A30C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 17:27:03.000' AS DateTime), N'Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21199, 1, 2453, N'false_5511994974011@c.us_3A0E4853E1F080DD4594', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 17:26:48.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21221, 1, 2454, N'false_5511985668506@c.us_3EB0AD9D2E56A2F7037E', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:23:12.000' AS DateTime), N'obg!!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21220, 1, 2454, N'false_5511985668506@c.us_3EB0AF8B682F4A3EDE7D', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:21:57.000' AS DateTime), N'revoked', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21219, 1, 2454, N'false_5511985668506@c.us_3EB0828146238C94C959', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:20:50.000' AS DateTime), N'obg', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21218, 1, 2454, N'false_5511985668506@c.us_3EB0231461E6ED458C74', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:20:49.000' AS DateTime), N'acabei de responde -la', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21217, 1, 2454, N'false_5511985668506@c.us_3EB06E81AFB0BCCC5EA1', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:20:44.000' AS DateTime), N'entrou sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21216, 1, 2454, N'false_5511985668506@c.us_3EB0472C5C6A701589D8', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 15:20:42.000' AS DateTime), N'oi boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21215, 1, 2454, N'false_5511985668506@c.us_3EB0ED3A8AE7A9D1E999', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:44:47.000' AS DateTime), N'desculpe pelo caps', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21214, 1, 2454, N'false_5511985668506@c.us_3EB0C3E33A5B122AD6B4', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:44:45.000' AS DateTime), N'ops', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21213, 1, 2454, N'false_5511985668506@c.us_3EB0D977DDC43FEA8F7A', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:44:43.000' AS DateTime), N'LOCAÇÃO', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21212, 1, 2454, N'false_5511985668506@c.us_0AFFA5C7DC1261189FFA92000', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:27:59.000' AS DateTime), N'Tem fotos?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21211, 1, 2454, N'false_5511985668506@c.us_9929CB650C1B5ADB6EF83E950', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:27:55.000' AS DateTime), N'Semi mobiliadas? Quais valores?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21210, 1, 2454, N'false_5511985668506@c.us_C7BA3A991445D8F7DE28B8F10', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:27:01.000' AS DateTime), N'Td bem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21209, 1, 2454, N'false_5511985668506@c.us_F5C0897C08BF787650B1D2677', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:26:55.000' AS DateTime), N'Olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21208, 1, 2454, N'false_5511985668506@c.us_1FA9B7687D8DE80248A3332F3', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:25:12.000' AS DateTime), N'Olá  tem unidades no ed Brasil? Algo de 2 quartos?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21207, 1, 2454, N'false_5511985668506@c.us_29D57661A0E13CB4B3E551099', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:34:25.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21206, 1, 2454, N'false_5511985668506@c.us_4343FCD0B8272CA70A93E4CCA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:30:38.000' AS DateTime), N'Tem valores?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21205, 1, 2454, N'false_5511985668506@c.us_15A4A1AC40BEBE7DF9706F1CF', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:30:36.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21204, 1, 2454, N'false_5511985668506@c.us_6620B1456652F34588496C394', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:30:33.000' AS DateTime), N'OI Thalita', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21222, 1, 2458, N'false_5511973663578@c.us_3A81F9406048C4635C89', N'Entrada', NULL, 0, 0, CAST(N'2020-05-13 22:55:12.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21229, 1, 2459, N'false_5511938011577@c.us_3A733FA13B1172FF12C2', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 16:08:59.000' AS DateTime), N'Estou trabalhando', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21228, 1, 2459, N'false_5511938011577@c.us_3AF9FF976292346590A0', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 16:08:55.000' AS DateTime), N'Nã da', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21227, 1, 2459, N'false_5511938011577@c.us_3A588171A9C61E7457E3', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:58:14.000' AS DateTime), N'Não entendi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21226, 1, 2459, N'false_5511938011577@c.us_3A61E0A05370DFF206BA', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:57:35.000' AS DateTime), N'E atende minha necessidade', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21225, 1, 2459, N'false_5511938011577@c.us_3A39D36A99214E2B01A5', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:57:31.000' AS DateTime), N'Gostaria de ver o empreendimento primeiro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21224, 1, 2459, N'false_5511938011577@c.us_3AE0A9A78433E1895D36', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:57:22.000' AS DateTime), N'Pode me passar valores e fotos ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21223, 1, 2459, N'false_5511938011577@c.us_3A8CD2DFE920F741BCFB', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:55:58.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21231, 1, 2462, N'false_5514981691286@c.us_DBB82546DB7B1F5FC369A11CA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:19:57.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21230, 1, 2462, N'false_5514981691286@c.us_BD6992870D004BC1CCAE4ECD4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:19:54.000' AS DateTime), N'Bom dia!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21233, 1, 2468, N'false_5511980670113@c.us_3A9BA1EE4BCCD35AF85F', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 14:03:45.000' AS DateTime), N'Quais os valores e condições?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21232, 1, 2468, N'false_5511980670113@c.us_3ACA4D3CDA8DD5ADAC96', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 14:03:30.000' AS DateTime), N'Oi Luci! \nBom diaaa!!!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21235, 1, 2472, N'false_5511947783636@c.us_E315F1B885567304F1586548A', N'Entrada', NULL, 0, 0, CAST(N'2020-08-06 14:14:04.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21234, 1, 2472, N'false_5511947783636@c.us_731E4A3F351FCD5402C2266B7', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 16:23:30.000' AS DateTime), N'Boa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21237, 1, 2473, N'false_5511972329884@c.us_AF9CE38894F78317CC0170D5B', N'Entrada', NULL, 0, 0, CAST(N'2020-02-13 18:02:56.000' AS DateTime), N'Obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21236, 1, 2473, N'false_5511972329884@c.us_B9D9462BDD84E7272B81DA033', N'Entrada', NULL, 0, 0, CAST(N'2020-02-13 17:48:04.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21245, 1, 2476, N'false_5511973134551@c.us_C74FCDAE4F4C62E9195097787', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:28:31.000' AS DateTime), N'Ok. Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21244, 1, 2476, N'false_5511973134551@c.us_636C8530F2E29C54190634F84', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:26:40.000' AS DateTime), N'Qualquer coisa posso te chamar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21243, 1, 2476, N'false_5511973134551@c.us_E4A697E37F42DEEF1C0C1BFA7', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:26:32.000' AS DateTime), N'Estou na dependendo da venda de uma casa de herança para comprar um AP', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21242, 1, 2476, N'false_5511973134551@c.us_A286C291A2A0A152909F23034', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:25:45.000' AS DateTime), N'No momento não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21241, 1, 2476, N'false_5511973134551@c.us_36F31EDDA1E9028841F5E3FDF', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:25:17.000' AS DateTime), N'Excelente dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21240, 1, 2476, N'false_5511973134551@c.us_CBC386705377B1D75DBD7953E', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:25:11.000' AS DateTime), N'Perdão', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21239, 1, 2476, N'false_5511973134551@c.us_3AD65E9F012DA8C1A504F6EEC', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 17:25:07.000' AS DateTime), N'Desculpa mesmo. De qualquer forma', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21238, 1, 2476, N'false_5511973134551@c.us_66D493D6FCF223E9D3E1EE417', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 16:49:31.000' AS DateTime), N'Quem é?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21251, 1, 2479, N'false_5511958281235@c.us_64D97AE4CB14D5190DD725233', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 14:52:02.000' AS DateTime), N'Talvez mais para frente. Vou anotar o contato.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21250, 1, 2479, N'false_5511958281235@c.us_D7357580BDDC02F135DEFD3C1', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 18:39:17.000' AS DateTime), N'Não.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21249, 1, 2479, N'false_5511958281235@c.us_CCF9A882025E460097AEFA616', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 18:39:16.000' AS DateTime), N'Olá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21248, 1, 2479, N'false_5511958281235@c.us_7E089F950E9C7FC7D74B58226', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 21:42:44.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21247, 1, 2479, N'false_5511958281235@c.us_23C586C9C92E70281509D8CF6', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:15:51.000' AS DateTime), N'Bom dia.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21246, 1, 2479, N'false_5511958281235@c.us_FFED11325B5DC438565294EF7', N'Entrada', NULL, 0, 0, CAST(N'2019-12-10 15:45:16.000' AS DateTime), N'Ok obrigado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21254, 1, 2480, N'false_5511989063294@c.us_3A0B5F304E7B9EF04F24', N'Entrada', NULL, 0, 0, CAST(N'2019-12-14 11:46:33.000' AS DateTime), N'não! Obrigada ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21253, 1, 2480, N'false_5511989063294@c.us_3EB0E5FB502397AC68B4', N'Entrada', NULL, 0, 0, CAST(N'2019-12-13 14:43:25.000' AS DateTime), N'acho que na época que mandei o contato, já tinha recebido uma resposta haha', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21252, 1, 2480, N'false_5511989063294@c.us_3EB0192C7F37EEDAD221', N'Entrada', NULL, 0, 0, CAST(N'2019-12-13 14:43:10.000' AS DateTime), N'ah sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21261, 1, 2481, N'false_5511961442209@c.us_B4A1FC85F01E7CBF580D06C5E', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 16:56:26.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21260, 1, 2481, N'false_5511961442209@c.us_3EB01B97F51EA69ACA30', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 16:03:54.000' AS DateTime), N'vou mandar a apresentação da nossa empresas de mármores e granitos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21259, 1, 2481, N'false_5511961442209@c.us_3EB0816ED02C52B4355A', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 16:03:35.000' AS DateTime), N'obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21258, 1, 2481, N'false_5511961442209@c.us_2B2AD688C8C693A5A7FB4B384', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 15:14:32.000' AS DateTime), N'Correto!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21257, 1, 2481, N'false_5511961442209@c.us_CD7CB59A06125CC55FC9AE741', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 13:49:23.000' AS DateTime), N'Você tem algum contato para me passar?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21256, 1, 2481, N'false_5511961442209@c.us_A796D1DD023F360F3DFE7CAB2', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 13:49:07.000' AS DateTime), N'Eu precisa era de um emprego na área da engenharia.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21255, 1, 2481, N'false_5511961442209@c.us_BD8A8F25994780F6B18A03646', N'Entrada', NULL, 0, 0, CAST(N'2020-01-14 13:48:48.000' AS DateTime), N'Obrigada Graciele', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21263, 1, 2482, N'false_5511947341975@c.us_3EB09B279C0226730449', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:12:53.000' AS DateTime), N'bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21262, 1, 2482, N'false_5511947341975@c.us_4BFD253F264A113AC6DD8A5DF', N'Entrada', NULL, 0, 0, CAST(N'2019-12-10 18:04:14.000' AS DateTime), N'Ola, muito obrigado ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21265, 1, 2483, N'false_5511982649315@c.us_3EB0377089871CD4327A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:02:28.000' AS DateTime), N'eu que agradeço o tempo e esforço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21264, 1, 2483, N'false_5511982649315@c.us_3EB0E8BB6D370EDD17A6', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:01:17.000' AS DateTime), N'agradeço, porém não estou interessado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21266, 1, 2492, N'false_5511982764142@c.us_2E685933078CC29E70170D974', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 15:24:59.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21270, 1, 2497, N'false_5511947342924@c.us_5E749C7A6319EFDFEA3DE3C11', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 16:15:37.000' AS DateTime), N'Obg', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21269, 1, 2497, N'false_5511947342924@c.us_348643B1EBCEA163157F32584', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 16:15:32.000' AS DateTime), N'Ops', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21268, 1, 2497, N'false_5511947342924@c.us_0BD0C050A1B41649D7C1AC555', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 16:15:26.000' AS DateTime), N'Obrig9', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21267, 1, 2497, N'false_5511947342924@c.us_9745A7B9931722E49C5A1864E', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 16:14:50.000' AS DateTime), N'Tranquilo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21271, 1, 2498, N'false_5511968206059@c.us_3EB03EB25B121D176DBE', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 23:17:25.000' AS DateTime), N'*BORA!*??  \nJá começou nossa *LIVE!*?\nAcesse:\nhttps://www.facebook.com/100040062855572/videos/245560380122722/', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21274, 1, 2503, N'false_5511997905027@c.us_3A97F7BD3B9A130DBF31', N'Entrada', NULL, 0, 0, CAST(N'2020-03-12 20:53:04.000' AS DateTime), N'Mas eu te falei que achamos pequeno o de 88 metros e vc me manda de 80?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21273, 1, 2503, N'false_5511997905027@c.us_3AA879E47D2EFE53DEFD', N'Entrada', NULL, 0, 0, CAST(N'2020-03-12 20:40:35.000' AS DateTime), N'Só a sacada que é grande o restante é muito pequeno', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21272, 1, 2503, N'false_5511997905027@c.us_3A02553C92ABD44FA07A', N'Entrada', NULL, 0, 0, CAST(N'2020-03-12 20:40:18.000' AS DateTime), N'Oi Graciele, eu conheço já fui visitar um apto nesse prédio, achamos muito pequeno', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21279, 1, 2504, N'false_5511950373116@c.us_3A0411085E8D99181C66', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 17:57:00.000' AS DateTime), N'Ok, vou analisar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21278, 1, 2504, N'false_5511950373116@c.us_3AF51A60367D1E75CA6A', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 14:32:46.000' AS DateTime), N'Valor do condomínio', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21277, 1, 2504, N'false_5511950373116@c.us_3A790A68280D48F2CA36', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 14:32:41.000' AS DateTime), N'480 50 metros ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21276, 1, 2504, N'false_5511950373116@c.us_3A97EBDD41AC6362E19F', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 14:29:24.000' AS DateTime), N'Metragem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21275, 1, 2504, N'false_5511950373116@c.us_3A1B492BB20486815DF7', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 14:26:44.000' AS DateTime), N'Qual valor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21294, 1, 2506, N'false_5511981310281@c.us_FCD9D157522ED722E66054EA2', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 14:50:21.000' AS DateTime), N'Pf vc pode me enviar fotos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21293, 1, 2506, N'false_5511981310281@c.us_68871BABC529FBD064AE98979', N'Entrada', NULL, 0, 0, CAST(N'2020-03-05 14:50:09.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21292, 1, 2506, N'false_5511981310281@c.us_FE5EE3E66AC8960C94A1E7E33', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 21:29:18.000' AS DateTime), N'Só queria uma ideia do valor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21291, 1, 2506, N'false_5511981310281@c.us_7A33E6D3EA3837FB1C840B211', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 21:28:58.000' AS DateTime), N'Não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21290, 1, 2506, N'false_5511981310281@c.us_D0D8FDB119CC1B0E5009EF1A5', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 19:48:44.000' AS DateTime), N'Oiiii olha eu não recebi nada ainda e estamos com.um apto na mooca para decidirmos', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21289, 1, 2506, N'false_5511981310281@c.us_FD7E7A75BFA3725875081D6B5', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 16:14:23.000' AS DateTime), N'Ok obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21288, 1, 2506, N'false_5511981310281@c.us_C7407D9D0ED02817DF67EC65F', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 16:12:29.000' AS DateTime), N'Vc ira enviar hoje?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21287, 1, 2506, N'false_5511981310281@c.us_A65A46E98118049FD9399D76A', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:42:49.000' AS DateTime), N'Ok combinado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21286, 1, 2506, N'false_5511981310281@c.us_F11CFB2C6C239DFB4DBD275C3', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:34:55.000' AS DateTime), N'Vc pode me enviar as informações pf', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21285, 1, 2506, N'false_5511981310281@c.us_4A0782772B4157FC18C0264C8', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:32:53.000' AS DateTime), N'Qual o tamanho?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21284, 1, 2506, N'false_5511981310281@c.us_D4015C340FFDACB888E3ABDB4', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:31:36.000' AS DateTime), N'Qual o valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21283, 1, 2506, N'false_5511981310281@c.us_0D41ED3AD6DC11E1A2A9B30A4', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:31:06.000' AS DateTime), N'Onde fica?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21282, 1, 2506, N'false_5511981310281@c.us_107F1B27CD085BD2FC4606B18', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:29:30.000' AS DateTime), N'Onde fica ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21281, 1, 2506, N'false_5511981310281@c.us_C0FC72D549DC297281944C72B', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:26:10.000' AS DateTime), N'Não conheço \nJa está pronto?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21280, 1, 2506, N'false_5511981310281@c.us_95123D3255C4C1DC10C7B31D0', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 15:10:48.000' AS DateTime), N'Oi bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21310, 1, 2510, N'false_5511998348668@c.us_3A6CF8CCACB8716148F1', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 17:03:46.000' AS DateTime), N'Boa tarde !', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21309, 1, 2510, N'false_5511998348668@c.us_3EB00A317293B4CAF225', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:30:44.000' AS DateTime), N'eu que agradeço', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21308, 1, 2510, N'false_5511998348668@c.us_3EB0A73E2E83BFD87270', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:26:26.000' AS DateTime), N'ok obrigada luci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21307, 1, 2510, N'false_5511998348668@c.us_3EB070E6A053E9CE2519', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:23:04.000' AS DateTime), N'minha família e de fora de SP e fico aqui somente para trabalhar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21306, 1, 2510, N'false_5511998348668@c.us_3EB09E7B083E1923ABFB', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:20:59.000' AS DateTime), N'trabalho do outro lado da cidade', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21305, 1, 2510, N'false_5511998348668@c.us_3EB041397F51B125710B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:20:51.000' AS DateTime), N'estou mega sem tempo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21304, 1, 2510, N'false_5511998348668@c.us_3EB0D4D98B0475658033', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:09:29.000' AS DateTime), N'tendi', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21303, 1, 2510, N'false_5511998348668@c.us_3EB04B4C303E62AF55DB', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 19:05:12.000' AS DateTime), N'luci o Jaime acabou de mandar msg pra mim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21302, 1, 2510, N'false_5511998348668@c.us_3EB0BB0CDCB60D9A771F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:56:46.000' AS DateTime), N'luci o financiamento para um apto hojje sem considerar entrada sairia na faixa de quanto?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21301, 1, 2510, N'false_5511998348668@c.us_3EB0D4B3138A97169D7B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:40:22.000' AS DateTime), N'eu conheço o edificio por fora e tenho amigos que moram la', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21300, 1, 2510, N'false_5511998348668@c.us_3EB0FBBF9E8D380182FC', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:40:07.000' AS DateTime), N'e isso que to presquisa', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21299, 1, 2510, N'false_5511998348668@c.us_3EB053A5107C924A63B6', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:40:03.000' AS DateTime), N'como condições', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21298, 1, 2510, N'false_5511998348668@c.us_3EB082BCF9774B5438F8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:40:00.000' AS DateTime), N'estou pesquisando algo que consiga financiar dentro do que tenho hj', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21297, 1, 2510, N'false_5511998348668@c.us_3EB031EA3295A02E3F9C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:31:43.000' AS DateTime), N'mais acredito que o valor seja muito além do que estou me programando, pq hoje não teria uma entrada interessante', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21296, 1, 2510, N'false_5511998348668@c.us_3EB00F453D87CE566DCC', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:30:47.000' AS DateTime), N'eu moro px a esse condominio e por isso tinha interesse', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21295, 1, 2510, N'false_5511998348668@c.us_3EB04BF1BC411A75986B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 18:30:32.000' AS DateTime), N'Obrigada Luci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21315, 1, 2511, N'false_5511963171088@c.us_3A57A74776B25F98D64C', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 18:26:16.000' AS DateTime), N'Queremos algo de até 450.000,00', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21314, 1, 2511, N'false_5511963171088@c.us_3ABA6D4920B92AC52328', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 18:26:03.000' AS DateTime), N'Por este motivo, estamos focando nos aptos entre 60 e 70 mts', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21313, 1, 2511, N'false_5511963171088@c.us_3ADECF67C5E0DBF29072', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 18:25:30.000' AS DateTime), N'Mas, o valor infelizmente está mto fora do que estamos procurando', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21312, 1, 2511, N'false_5511963171088@c.us_3A00E97DCA7B060AC2AB', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 18:25:15.000' AS DateTime), N'Visitamos este empreendimento faz uns meses', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21311, 1, 2511, N'false_5511963171088@c.us_3A7D44E2584470963468', N'Entrada', NULL, 0, 0, CAST(N'2020-01-15 18:25:03.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21467, 1, 2513, N'false_5511985570541@c.us_14515D1E35B57F7010475CA2C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 16:32:15.000' AS DateTime), N'Olá\nPasse os valores, unidades disponíveis, metragem....formas de pagamento.\nEstas são informações essenciais.\nObrigada.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21472, 1, 2515, N'false_5511979872899@c.us_D9BD17E7C9EDAB19B7C6EC7EE', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:38:12.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21471, 1, 2515, N'false_5511979872899@c.us_21AD3A0E7006A7C04463BE995', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:08:39.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21470, 1, 2515, N'false_5511979872899@c.us_B146F8D8AE5FB864F7D53EA12', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:08:38.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21469, 1, 2515, N'false_5511979872899@c.us_746A7094EC477607DEBB66791', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 14:02:47.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21468, 1, 2515, N'false_5511979872899@c.us_3C7D92B94B84B58FC85ECDD24', N'Entrada', NULL, 0, 0, CAST(N'2020-02-06 23:55:31.000' AS DateTime), N'Qual o valor do de 80m?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21466, 1, 2516, N'false_5511994307381@c.us_0A759B4162F5931CBB41FF39F', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 13:54:36.000' AS DateTime), N'Eu de saúde muito bem Graças a Deus, de Cuca, preocupada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21465, 1, 2516, N'false_5511994307381@c.us_1CF3BA001A7F05875C752790B', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 13:54:04.000' AS DateTime), N'As últimas, deveri enviar por email e WhatsApp tb', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21464, 1, 2516, N'false_5511994307381@c.us_4B8EBB8837075AB7B26B95DC8', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 12:39:33.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21463, 1, 2516, N'false_5511994307381@c.us_6F3A5F105A75E00C373AA6DF5', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 12:26:40.000' AS DateTime), N'Ref as cartas que foram para o correio?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21462, 1, 2516, N'false_5511994307381@c.us_13318735CAE34EBA854D24494', N'Entrada', NULL, 0, 0, CAST(N'2020-09-08 12:26:22.000' AS DateTime), N'Ary, como esta este serviço?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21461, 1, 2516, N'false_5511994307381@c.us_DEB8ABED3FA4A0F70E304757D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-31 19:50:40.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21460, 1, 2516, N'false_5511994307381@c.us_3E4B994DC6BD5D6DE1C3D4441', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 12:34:40.000' AS DateTime), N'Por favor, Ary..  preciso de resposta', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21459, 1, 2516, N'false_5511994307381@c.us_677F519149E4791C0D6744D6D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 11:23:38.000' AS DateTime), N'Gente já 8;20 e ninguem leu.....', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21458, 1, 2516, N'false_5511994307381@c.us_633956035BBB3FE4B44BD465F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 01:39:07.000' AS DateTime), N'Recebi, liguei,  recepção da voz não é boa, e falar que atende somente de segunda a sexta  horário. Comercial tb..não é boa\nPara vender imóveis, a disponibilidade tem que ser 24 hs.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21457, 1, 2516, N'false_5511994307381@c.us_22730BFA8D6BB488E71AAEA31', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 01:37:29.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21456, 1, 2516, N'false_5511994307381@c.us_AE7BF90BAAB0934A31A84EB8C', N'Entrada', NULL, 0, 0, CAST(N'2020-06-25 05:47:45.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21455, 1, 2516, N'false_5511994307381@c.us_0875D32EA0FFF7F7417427120', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 14:19:39.000' AS DateTime), N'oieee, que bom', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21454, 1, 2516, N'false_5511994307381@c.us_9DC87FA19D859191A7D9339CA', N'Entrada', NULL, 0, 0, CAST(N'2020-04-30 13:51:35.000' AS DateTime), N'ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21453, 1, 2519, N'false_5511981683076@c.us_BF42A8A8A039A1F64371E572E', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:41:48.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21452, 1, 2519, N'false_5511981683076@c.us_5FEE49B835EC8D81210273DF4', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:41:37.000' AS DateTime), N'Ate o momento não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21451, 1, 2519, N'false_5511981683076@c.us_6E17955B2EC9E324BFB5B111C', N'Entrada', NULL, 0, 0, CAST(N'2020-07-30 13:41:30.000' AS DateTime), N'Bom dia', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21450, 1, 2519, N'false_5511981683076@c.us_8EF8CCA65666426F111D5C4C7', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:12:48.000' AS DateTime), N'Obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21449, 1, 2519, N'false_5511981683076@c.us_FCEB823888E2BA6855FD96618', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:12:42.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21473, 1, 2521, N'false_5511999126185@c.us_E013C590A17AE0A5A9EADBAE2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 13:50:06.000' AS DateTime), N'Ok . Obg!??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21477, 1, 2522, N'false_5511995057654@c.us_C6343BED85F5BA407EC3AA59D', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 17:27:59.000' AS DateTime), N'Quem ?é', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21476, 1, 2522, N'false_5511995057654@c.us_67590F698A23404A43D5326F3', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 17:27:44.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21475, 1, 2522, N'false_5511995057654@c.us_5CEEF3E5E16E333D67154BDC3', N'Entrada', NULL, 0, 0, CAST(N'2020-02-21 17:41:18.000' AS DateTime), N'Onde fica e qual valor?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21481, 1, 2523, N'false_5511998971916@c.us_7A3141EC3993D6004194B5B3A', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 21:49:16.000' AS DateTime), N'Ola', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21480, 1, 2523, N'false_5511998971916@c.us_69AB501BA841B00DEBEA8516F', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 20:13:34.000' AS DateTime), N'Qual é a data do seu evento por gentileza e quantas pessoas ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21479, 1, 2523, N'false_5511998971916@c.us_76CE847193CA2D8CE216E0A89', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 20:13:17.000' AS DateTime), N'Meu nome é Thais sou responsável pelos agendamentos das visitas do Espaço Pimenta Nativa Anália Franco ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21478, 1, 2523, N'false_5511998971916@c.us_69B26E80ACBAEC9C16BC7954C', N'Entrada', NULL, 0, 0, CAST(N'2020-03-04 20:13:09.000' AS DateTime), N'Ola Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21522, 1, 2527, N'false_5511996827883@c.us_7A583450345B69696647BE916', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 20:00:24.000' AS DateTime), N'?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21521, 1, 2527, N'false_5511996827883@c.us_9E58225E222AEA7D1244DCA66', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 20:00:22.000' AS DateTime), N'E longe da estação', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21520, 1, 2527, N'false_5511996827883@c.us_BA889A7380CB1746FAFCFA093', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 18:53:11.000' AS DateTime), N'E valores?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21519, 1, 2527, N'false_5511996827883@c.us_A654D7727BEFB221B350EC06E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 18:53:08.000' AS DateTime), N'Tem foto do apartamento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21518, 1, 2527, N'false_5511996827883@c.us_0430043929E4856776924CC84', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 18:53:03.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21517, 1, 2527, N'false_5511996827883@c.us_2A7F7A5BD0F22E47073D7A050', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 18:53:01.000' AS DateTime), N'Ola', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21474, 1, 2528, N'false_5511999629003@c.us_3A078DFCC9936379BFEC', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 20:32:47.000' AS DateTime), N'Boa tarde,\nEstou bem e vc ? Não estamos mais interessados no  empreendimento', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21724, 1, 2531, N'false_5511947140587@c.us_CF4E760B57B73E864F4489679', N'Entrada', NULL, 0, 0, CAST(N'2020-10-22 14:46:33.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21723, 1, 2531, N'false_5511947140587@c.us_8CB2800AE41CEA90F6E8DEBF6', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:44:47.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21722, 1, 2531, N'false_5511947140587@c.us_C1ADCC4F1E492557A459B9919', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:44:03.000' AS DateTime), N'203\n204 \n2111', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21721, 1, 2531, N'false_5511947140587@c.us_A721F117C68960C9F653F1D7C', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:41:03.000' AS DateTime), N'A partir de R$ 765.000,00', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21720, 1, 2531, N'false_5511947140587@c.us_DB2E1C8842483F5ACE37C1BBA', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:40:55.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21719, 1, 2531, N'false_5511947140587@c.us_3CA9E10642C2F45D10F80B755', N'Entrada', NULL, 0, 0, CAST(N'2020-10-08 18:40:51.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21718, 1, 2531, N'false_5511947140587@c.us_B09BA1E46C249706AF433E179', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:22:15.000' AS DateTime), N'1005', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21714, 1, 2531, N'false_5511947140587@c.us_8058AA0215A76DF7276A2294F', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:22:09.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21715, 1, 2531, N'false_5511947140587@c.us_AA34FCD553FFC034F6AA8DADF', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:22:09.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21716, 1, 2531, N'false_5511947140587@c.us_B9E8D4E85F12EF405F464ADCD', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:22:09.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21717, 1, 2531, N'false_5511947140587@c.us_98A8C1CBDC67239BB244FA74D', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:22:09.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21713, 1, 2531, N'false_5511947140587@c.us_77F4B511C1C21AF06DCF47699', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:21:42.000' AS DateTime), N'1104 ??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21709, 1, 2531, N'false_5511947140587@c.us_094C19C4649DF87E936CADA3A', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:21:37.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21710, 1, 2531, N'false_5511947140587@c.us_5AB14BD57A795326AB2A10E46', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:21:37.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21711, 1, 2531, N'false_5511947140587@c.us_2CA2F0E785A3536C5D16FDC73', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:21:37.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21712, 1, 2531, N'false_5511947140587@c.us_A66AA8FA8A76285DFFEE82DDF', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 18:21:37.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21708, 1, 2531, N'false_5511947140587@c.us_FED37732FE7825809C2FF48CA', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:29:56.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21707, 1, 2531, N'false_5511947140587@c.us_7BBD86F027978F761711810D9', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:28:59.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21706, 1, 2531, N'false_5511947140587@c.us_F40A66DB5AE39146CFDA2CAAE', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:28:41.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21705, 1, 2531, N'false_5511947140587@c.us_3994B1FCB4779E923E871E8B9', N'Entrada', NULL, 0, 0, CAST(N'2020-10-01 13:31:27.000' AS DateTime), N'Vou te passar as tabelas', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21704, 1, 2531, N'false_5511947140587@c.us_AE5FC08F57FAEBBADD28ECA69', N'Entrada', NULL, 0, 0, CAST(N'2020-10-01 13:31:23.000' AS DateTime), N'Bom dia Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21703, 1, 2531, N'false_5511947140587@c.us_D81387EFD8B60CD00892EB26B', N'Entrada', NULL, 0, 0, CAST(N'2020-09-22 14:06:43.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21702, 1, 2531, N'false_5511947140587@c.us_23540A426C7C84D59FC4BB34E', N'Entrada', NULL, 0, 0, CAST(N'2020-09-22 14:01:50.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21701, 1, 2531, N'false_5511947140587@c.us_D1DE38E9D071CB37E1757D7CF', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 18:13:02.000' AS DateTime), N'Sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21700, 1, 2531, N'false_5511947140587@c.us_9D3A2973D6F2C70FCA7AC2780', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:21:18.000' AS DateTime), N'Vou verificar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21699, 1, 2531, N'false_5511947140587@c.us_B33BFAEAAADA5962D45D9FC4F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:21:12.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21698, 1, 2531, N'false_5511947140587@c.us_8B9B08EC322F614F0397F5B75', N'Entrada', NULL, 0, 0, CAST(N'2020-07-29 17:21:09.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21697, 1, 2531, N'false_5511947140587@c.us_66AA25C97788908E106EF14B5', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 16:28:58.000' AS DateTime), N'Eles dizem que através do meu CNPJ não aparece nenhum contrato lá.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21696, 1, 2531, N'false_5511947140587@c.us_49DB3027B7D35142D14439AB5', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 16:28:41.000' AS DateTime), N'Liguei na Amil e passei o meu CNPJ', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21695, 1, 2531, N'false_5511947140587@c.us_A3A9FCBA754F65960A95C8751', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 16:28:33.000' AS DateTime), N'Tudo bem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21694, 1, 2531, N'false_5511947140587@c.us_BB113974550B109951FAB02FB', N'Entrada', NULL, 0, 0, CAST(N'2020-07-20 16:28:31.000' AS DateTime), N'Boa tarde Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21693, 1, 2531, N'false_5511947140587@c.us_A0B49531DE9455B760C623EF0', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 18:23:47.000' AS DateTime), N'Boleto', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21692, 1, 2531, N'false_5511947140587@c.us_032A08701607CA275E1F768DD', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 18:23:42.000' AS DateTime), N'Não sei onde tirar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21691, 1, 2531, N'false_5511947140587@c.us_7A7F4686E13001CCF9DD97769', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 18:23:36.000' AS DateTime), N'Me ajuda a imprimir a 2 via do convênio', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21690, 1, 2531, N'false_5511947140587@c.us_1AEC8CA54DE8C30D9465D2DC8', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 18:23:25.000' AS DateTime), N'Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21689, 1, 2531, N'false_5511947140587@c.us_D3FC7BEF5F7CA376CEBE4FAA3', N'Entrada', NULL, 0, 0, CAST(N'2020-07-18 16:12:39.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21688, 1, 2531, N'false_5511947140587@c.us_3C25F5C006664F352E7833F17', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:39:26.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21687, 1, 2531, N'false_5511947140587@c.us_396FD90408F97665054A7C45F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:24:39.000' AS DateTime), N'O Júnior disse que não está visitando por conta da pandemia. Segundo ele só pós pandemia.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21686, 1, 2531, N'false_5511947140587@c.us_B1E45F2279E76775F172B634A', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:24:17.000' AS DateTime), N'O Felipe falou que está quebrado. Que não tem o dinheiro da entrada.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21685, 1, 2531, N'false_5511947140587@c.us_11EE2C40E8EAA0664D3264E9B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:24:04.000' AS DateTime), N'Falei com os clientes.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21684, 1, 2531, N'false_5511947140587@c.us_DF152519BEA29AB71D16B70AE', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:23:58.000' AS DateTime), N'Tudo também.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21683, 1, 2531, N'false_5511947140587@c.us_B748C6B84303B63AD2D42053F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:17:06.000' AS DateTime), N'Tudo bem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21682, 1, 2531, N'false_5511947140587@c.us_1A88AB36A7280CC57AEF52FE3', N'Entrada', NULL, 0, 0, CAST(N'2020-07-14 15:17:00.000' AS DateTime), N'Boa tarde Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21681, 1, 2531, N'false_5511947140587@c.us_664B94C58B4CA5485485B15AF', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 13:24:38.000' AS DateTime), N'Tudo bem. Lu não falei. Falo hoje sem falta. Sorry', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21680, 1, 2531, N'false_5511947140587@c.us_4E15B0AEF2CDE5F7FB30F42B2', N'Entrada', NULL, 0, 0, CAST(N'2020-07-13 13:20:48.000' AS DateTime), N'Bom dia Lu. Tudo bem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21679, 1, 2531, N'false_5511947140587@c.us_22865DAEA534DF3EF7B74FA57', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:43:10.000' AS DateTime), N'Blz.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21678, 1, 2531, N'false_5511947140587@c.us_669C2309AE51454F6E2600D8F', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:38:06.000' AS DateTime), N'Claro', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21677, 1, 2531, N'false_5511947140587@c.us_8D07588618AF1535AA8FCD39B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 16:38:04.000' AS DateTime), N'Pode sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21676, 1, 2531, N'false_5511947140587@c.us_A4975B3CB718D96058B042B30', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:37:41.000' AS DateTime), N'O valor que ele está buscando está bem abaixo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21675, 1, 2531, N'false_5511947140587@c.us_6E3CD8F13D890ADF720D6F5AC', N'Entrada', NULL, 0, 0, CAST(N'2020-07-10 15:37:24.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21674, 1, 2531, N'false_5511947140587@c.us_6D28DE0A8A4196A7137E64ECA', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 18:04:46.000' AS DateTime), N'18° \nUnidades 183 e 184\n21° unidade 211.\n183 está promocional R$ 753.000,00', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21673, 1, 2531, N'false_5511947140587@c.us_1B8929D76D618E743FB05759D', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:58:41.000' AS DateTime), N'video', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21672, 1, 2531, N'false_5511947140587@c.us_A816EFE1829D76E3C4C613D28', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:57:46.000' AS DateTime), N'A tá', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21671, 1, 2531, N'false_5511947140587@c.us_7562B2FE718E190FA14BF1389', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:54:19.000' AS DateTime), N'https://www.sferica.com.br/temporario/wzarzur/vila_tatuape/', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21670, 1, 2531, N'false_5511947140587@c.us_38DB22F3A4D5C9C2FC9FF1096', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:53:57.000' AS DateTime), N'Mando sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21669, 1, 2531, N'false_5511947140587@c.us_EADE4D40F3EBA8D5850353938', N'Entrada', NULL, 0, 0, CAST(N'2020-07-09 17:53:54.000' AS DateTime), N'Tudo e você Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21668, 1, 2531, N'false_5511947140587@c.us_F1C1FFABD5844E3E24C141956', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 18:14:57.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21667, 1, 2531, N'false_5511947140587@c.us_753475587BAB05E647E7F0BC3', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 17:52:45.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21666, 1, 2531, N'false_5511947140587@c.us_C64F7923D066F4CFDC03AC9B1', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 17:52:31.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21665, 1, 2531, N'false_5511947140587@c.us_F3696DD90BFF4F23FC41879DF', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 18:47:18.000' AS DateTime), N'Tem que ser 2 dorm.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21664, 1, 2531, N'false_5511947140587@c.us_596512B996DCDA1A3453DA952', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 18:47:13.000' AS DateTime), N'Natalie busca no máximo até 400 mil', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21663, 1, 2531, N'false_5511947140587@c.us_5DE45D49891A77E01A5207A3E', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 17:02:09.000' AS DateTime), N'Pode lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21662, 1, 2531, N'false_5511947140587@c.us_0E93C947A5AA87587DEFAE8D3', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 14:19:51.000' AS DateTime), N'Área privativa. Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21661, 1, 2531, N'false_5511947140587@c.us_769CEAF8F4BD223B5A6D75C03', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 14:09:24.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21660, 1, 2531, N'false_5511947140587@c.us_D3833B42185887F2F70C3F20F', N'Entrada', NULL, 0, 0, CAST(N'2020-06-30 14:08:18.000' AS DateTime), N'Vou te mandar a tabela Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21659, 1, 2531, N'false_5511947140587@c.us_4FEF0C09BA1245C84744C1484', N'Entrada', NULL, 0, 0, CAST(N'2020-06-29 17:39:27.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21658, 1, 2531, N'false_5511947140587@c.us_6A1A865C62EE19FD25A82E40B', N'Entrada', NULL, 0, 0, CAST(N'2020-06-29 17:39:22.000' AS DateTime), N'Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21657, 1, 2531, N'false_5511947140587@c.us_948E93E7497D8CD7E777010DE', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:18:18.000' AS DateTime), N'Blz.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21656, 1, 2531, N'false_5511947140587@c.us_ED326FF336F059EF01FFD1DB6', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:17:58.000' AS DateTime), N'Qual cliente ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21655, 1, 2531, N'false_5511947140587@c.us_98777F83ECE52093BEB32FC44', N'Entrada', NULL, 0, 0, CAST(N'2020-06-23 16:17:45.000' AS DateTime), N'Tudo Lu e você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21654, 1, 2531, N'false_5511947140587@c.us_5349FCBF5A793C51BB54D8141', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 19:35:10.000' AS DateTime), N'video', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21653, 1, 2531, N'false_5511947140587@c.us_6A9BCD19AC9672D795EE4F061', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 19:34:32.000' AS DateTime), N'Vídeo do Vila. Unidade 183.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21652, 1, 2531, N'false_5511947140587@c.us_F801FF67CF970024322BD41D6', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 19:33:56.000' AS DateTime), N'Esse aqui é o tour virtual do decorado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21651, 1, 2531, N'false_5511947140587@c.us_7A089FC21C500FBB1F30330B9', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 19:33:43.000' AS DateTime), N'https://www.sferica.com.br/temporario/wzarzur/vila_tatuape/', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21650, 1, 2531, N'false_5511947140587@c.us_69498EC6FE207F16147D472AC', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 19:31:59.000' AS DateTime), N'Tenho um vídeo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21649, 1, 2531, N'false_5511947140587@c.us_8031D0C80C2B8D3B0C93913C2', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 16:18:28.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21648, 1, 2531, N'false_5511947140587@c.us_42698469954F57F0BE7B2B764', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 15:49:12.000' AS DateTime), N'Busca até 300 mil', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21647, 1, 2531, N'false_5511947140587@c.us_AAFE2443F1DEF2E3B0C202977', N'Entrada', NULL, 0, 0, CAST(N'2020-04-29 15:47:54.000' AS DateTime), N'Essa busca até 300 mil', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21646, 1, 2531, N'false_5511947140587@c.us_D36A9D7BD16B8765881DE0CCC', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 16:49:59.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21645, 1, 2531, N'false_5511947140587@c.us_B1F9340253E7323299122C109', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 16:49:44.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21644, 1, 2531, N'false_5511947140587@c.us_D4528272B2ECDBD3A4CFADC6A', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 15:29:54.000' AS DateTime), N'Essa não', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21643, 1, 2531, N'false_5511947140587@c.us_A7F421996CEA8DCA4DD96E752', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 14:22:02.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21642, 1, 2531, N'false_5511947140587@c.us_CF947455FCD63F07B789B168B', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 14:08:06.000' AS DateTime), N'Ele falou que precisava de um apartamento maior, mas a cobertura é muito pra ele.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21641, 1, 2531, N'false_5511947140587@c.us_7D7231DFDE2070EA8B955A5F5', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 14:07:49.000' AS DateTime), N'Já transferiu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21640, 1, 2531, N'false_5511947140587@c.us_85602676125D55898270B044E', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 14:07:45.000' AS DateTime), N'Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21639, 1, 2531, N'false_5511947140587@c.us_B610DD56FFDF2F9728CB7F6CD', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:43:29.000' AS DateTime), N'A vida tem que continuar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21638, 1, 2531, N'false_5511947140587@c.us_D9020E17DB01F56633A6E17A0', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:43:24.000' AS DateTime), N'Bem vinda de volta. Kkk', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21637, 1, 2531, N'false_5511947140587@c.us_41E3C4B34CF49FFBE712BEB8B', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:42:02.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21636, 1, 2531, N'false_5511947140587@c.us_DBD33EFA3B267F772F8305555', N'Entrada', NULL, 0, 0, CAST(N'2020-04-28 13:41:58.000' AS DateTime), N'.bom dia Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21635, 1, 2531, N'false_5511947140587@c.us_124D861FC5E1AB056DB5E70BD', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 18:58:23.000' AS DateTime), N'revoked', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21633, 1, 2531, N'false_5511947140587@c.us_4145E5DDDB7E7E7CDB18570E9', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 18:57:38.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21634, 1, 2531, N'false_5511947140587@c.us_6D903BC091F60FCF970A7F2A4', N'Entrada', NULL, 0, 0, CAST(N'2020-03-30 18:57:38.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21632, 1, 2531, N'false_5511947140587@c.us_D0DA70E65A90DD3CC2037CE2E', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:27:39.000' AS DateTime), N'Digo isso Lu para não acontecer como no início em que a Talita passava todo mundo, apenas pelo fato do cliente ter atendido.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21631, 1, 2531, N'false_5511947140587@c.us_A62D0141CD6C865E59205CCF3', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:27:11.000' AS DateTime), N'Sim, mas ela mostrou interesse ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21630, 1, 2531, N'false_5511947140587@c.us_E601405FDF255357FB039B795', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:24:18.000' AS DateTime), N'Mas você chegou a falar com ela Lu ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21629, 1, 2531, N'false_5511947140587@c.us_021357841576DA46F6F506383', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:19:30.000' AS DateTime), N'Lu, nos clientes que mandar coloca um breve relato do que conversou . Por favor.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21628, 1, 2531, N'false_5511947140587@c.us_B9869CDD77C88E9C860363F1B', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:06:32.000' AS DateTime), N'Sim Lu\n Mas oque a cliente falou pra você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21627, 1, 2531, N'false_5511947140587@c.us_AEA83D6A96BB6C7784EC501EE', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:05:14.000' AS DateTime), N'Já transferi pra mim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21626, 1, 2531, N'false_5511947140587@c.us_BE0A15802E151C618D6632162', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:05:03.000' AS DateTime), N'Oque ela busca Lu ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21625, 1, 2531, N'false_5511947140587@c.us_33DB4099B85558049BD570193', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:03:57.000' AS DateTime), N'Vou verificar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21624, 1, 2531, N'false_5511947140587@c.us_1A065AD292466F5ABA2788447', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 17:00:01.000' AS DateTime), N'Tudo bem ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21623, 1, 2531, N'false_5511947140587@c.us_71AF8B02632620896B2A0336C', N'Entrada', NULL, 0, 0, CAST(N'2020-03-26 16:59:59.000' AS DateTime), N'Boa tarde Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21622, 1, 2531, N'false_5511947140587@c.us_6DF62ABE3F1254F9DA708E935', N'Entrada', NULL, 0, 0, CAST(N'2020-03-10 17:56:54.000' AS DateTime), N'Incorporadora Wzarzur.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21621, 1, 2531, N'false_5511947140587@c.us_AB9E275F98D08891CA3BF76CF', N'Entrada', NULL, 0, 0, CAST(N'2020-03-10 17:56:43.000' AS DateTime), N'Rocontec.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21620, 1, 2531, N'false_5511947140587@c.us_171C3BB33A5F2A5E3FFD5D804', N'Entrada', NULL, 0, 0, CAST(N'2020-03-10 17:56:37.000' AS DateTime), N'Boa tarde Lu. Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21619, 1, 2531, N'false_5511947140587@c.us_2D82E7BB01AC9445E631065B8', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 16:36:51.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21618, 1, 2531, N'false_5511947140587@c.us_803D50C17660F59DF80348322', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 16:36:41.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21617, 1, 2531, N'false_5511947140587@c.us_741A31E3880AE06FCC5A5F29E', N'Entrada', NULL, 0, 0, CAST(N'2020-03-09 16:36:36.000' AS DateTime), N'Bom dia Luci.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21616, 1, 2531, N'false_5511947140587@c.us_F1FB8DEC6784F56C7CA6D24FA', N'Entrada', NULL, 0, 0, CAST(N'2020-02-19 16:10:23.000' AS DateTime), N'Boa tarde Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21615, 1, 2531, N'false_5511947140587@c.us_F2D08A2CF8E56BE2BC727D74A', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:56:44.000' AS DateTime), N'Como foi para a base de dados de vocês ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21614, 1, 2531, N'false_5511947140587@c.us_DBCF8305C8E413D1AF4411FDC', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:56:27.000' AS DateTime), N'O Sr. José não excluiu da base de dados dele.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21613, 1, 2531, N'false_5511947140587@c.us_8DCC2AA67D3140C9B89C265A3', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:56:18.000' AS DateTime), N'Lu,', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21612, 1, 2531, N'false_5511947140587@c.us_FCB1CBFE55DCA0AF4CA5E6554', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:51:44.000' AS DateTime), N'Sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21611, 1, 2531, N'false_5511947140587@c.us_9A3CF995CB2B0E0F96BB62F82', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:47:13.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21610, 1, 2531, N'false_5511947140587@c.us_AC278745FE2AA67A7F152C491', N'Entrada', NULL, 0, 0, CAST(N'2020-02-14 19:47:10.000' AS DateTime), N'Boa tarde Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21609, 1, 2531, N'false_5511947140587@c.us_E34E9D68F06ED7F88E4FBD597', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 18:52:18.000' AS DateTime), N'Não lembro de você ter falado RS.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21608, 1, 2531, N'false_5511947140587@c.us_4B8A38A90280E7564CFBEF3AB', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 18:52:06.000' AS DateTime), N'Sabe o nome dele Lu ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21607, 1, 2531, N'false_5511947140587@c.us_28B74A5F973B3CA2BA462AC84', N'Entrada', NULL, 0, 0, CAST(N'2020-02-07 18:51:28.000' AS DateTime), N'Oi Lu. Vou verificar. Obrigado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21606, 1, 2531, N'false_5511947140587@c.us_7AA25664D29BCBD260ABCA2A4', N'Entrada', NULL, 0, 0, CAST(N'2020-02-05 15:58:00.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21605, 1, 2531, N'false_5511947140587@c.us_3F4A3C30D9E89F5066D024C48', N'Entrada', NULL, 0, 0, CAST(N'2020-02-05 15:57:54.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21604, 1, 2531, N'false_5511947140587@c.us_845698BE262AEE50FB4EA28FE', N'Entrada', NULL, 0, 0, CAST(N'2020-02-05 15:55:49.000' AS DateTime), N'Oi Lu, vou pedir pro Jaime dar um pulo aí', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21603, 1, 2531, N'false_5511947140587@c.us_87AAEBC434364FDE7B9D406C0', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 17:42:57.000' AS DateTime), N'O do vila está a 1.044,00 \n\nO do Brasil\nApto 50 m² : R$ 800,00\nApto 53 m² : R$ 850.00\nApto 80 m²: R$ 1.205', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21602, 1, 2531, N'false_5511947140587@c.us_6F6C6CB3E8EEE10568A6EB49C', N'Entrada', NULL, 0, 0, CAST(N'2020-02-04 17:41:01.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21601, 1, 2531, N'false_5511947140587@c.us_598C5AC3D651928A53F44C12F', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:43:25.000' AS DateTime), N'Sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21600, 1, 2531, N'false_5511947140587@c.us_84C5F08CF674512F2CF4A1C13', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:42:44.000' AS DateTime), N'Virado para o jardim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21599, 1, 2531, N'false_5511947140587@c.us_BAD95AC54A652A960610D2BC0', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:42:37.000' AS DateTime), N'3.200,00 o pacote.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21598, 1, 2531, N'false_5511947140587@c.us_1367470F2F87CB2E542BB3973', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:42:09.000' AS DateTime), N'Tem 2 de 35 metros.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21597, 1, 2531, N'false_5511947140587@c.us_F8B5FB84DF94B77AFD2E6EF92', N'Entrada', NULL, 0, 0, CAST(N'2020-02-03 16:38:29.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21596, 1, 2531, N'false_5511947140587@c.us_4E757206C3DD4795C19D6F0D5', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:55:34.000' AS DateTime), N'715.000,00 valor hoje já promocional', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21595, 1, 2531, N'false_5511947140587@c.us_3CE1614943A9622E2ADE2F807', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:47:03.000' AS DateTime), N'A Unidade mais baixa que possuímos é a Unidade 132.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21594, 1, 2531, N'false_5511947140587@c.us_33788F3AD1CB3936256479805', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:41:26.000' AS DateTime), N'Bom dia Graci', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21593, 1, 2531, N'false_5511947140587@c.us_3769494C144AE1907974A6F5D', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:53.000' AS DateTime), N'Temos.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21592, 1, 2531, N'false_5511947140587@c.us_6B782434566792B7AA40D86BC', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:47.000' AS DateTime), N'Está temo sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21591, 1, 2531, N'false_5511947140587@c.us_182DA8C562129368B714CAEEC', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:44.000' AS DateTime), N'As de 50 são viradas para a Av. Paulista.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21590, 1, 2531, N'false_5511947140587@c.us_3DC7F1EDFE254BD08BDFD0393', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:32.000' AS DateTime), N'As de 53 para a 9 de julho não temos mais.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21589, 1, 2531, N'false_5511947140587@c.us_BC4BD1646D7E291BC80822FFF', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:17.000' AS DateTime), N'As que são viradas para a 9 de julho são as de 53 m².', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21588, 1, 2531, N'false_5511947140587@c.us_F36D517E11021D1EEC999CBFB', N'Entrada', NULL, 0, 0, CAST(N'2020-01-26 17:39:01.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21585, 1, 2531, N'false_5511947140587@c.us_BBEF3B9821FAF530D8AB039C7', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:19:28.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21586, 1, 2531, N'false_5511947140587@c.us_ABE065F3ACEB7FE5ED3655135', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:19:28.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21587, 1, 2531, N'false_5511947140587@c.us_C96D880EBFC2AB811C54A9096', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:19:28.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21584, 1, 2531, N'false_5511947140587@c.us_7B90992561F1695B56542D606', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:19:05.000' AS DateTime), N'Andares altos lu de 50, pode passar a 540.000,00 mas nesses casos temos como negociar ok. Dependendo da forma de pagamento.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21583, 1, 2531, N'false_5511947140587@c.us_8E2EC711FA3BFE8C6CFE2F1B5', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:15:51.000' AS DateTime), N'Lu, a de 50 m² temos Unidades a partir de 440 mil, Unidade do 2° andar. Valor promocional.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21582, 1, 2531, N'false_5511947140587@c.us_ECC85EAA998B1D0F770C90E9C', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:14:54.000' AS DateTime), N'Tudo e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21581, 1, 2531, N'false_5511947140587@c.us_32AA4FBC69BB20DC67EECF585', N'Entrada', NULL, 0, 0, CAST(N'2020-01-21 15:14:49.000' AS DateTime), N'Bom dia Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21580, 1, 2531, N'false_5511947140587@c.us_82C526D0C22FEEB7632D0B8C8', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:11:20.000' AS DateTime), N'Entendo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21579, 1, 2531, N'false_5511947140587@c.us_403B43B926CB7C04926F70C94', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:09:30.000' AS DateTime), N'Inclusive foi vocês que me passaram no mês passado ela.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21578, 1, 2531, N'false_5511947140587@c.us_B7AF307A5C556927476585CC4', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:09:19.000' AS DateTime), N'Tranquilo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21577, 1, 2531, N'false_5511947140587@c.us_3EFC83A736A438AF9BBBFE327', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:07:46.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21576, 1, 2531, N'false_5511947140587@c.us_1A471AC6A9553148FEBEF7D42', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 16:07:06.000' AS DateTime), N'Lu. A Marilene busca até 300 mil. Falei com ela a pouco tempo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21575, 1, 2531, N'false_5511947140587@c.us_7429EFF48A880FCD33D6832D0', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 15:49:27.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21574, 1, 2531, N'false_5511947140587@c.us_3028353A562866895F9C61E86', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 15:48:27.000' AS DateTime), N'Vou falar xom ele. ??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21573, 1, 2531, N'false_5511947140587@c.us_3DE2E23F3E0C3AE6C48D48F48', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 15:48:24.000' AS DateTime), N'Tudo bem e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21572, 1, 2531, N'false_5511947140587@c.us_D351A3FA14E9674EC75B0FE48', N'Entrada', NULL, 0, 0, CAST(N'2019-12-03 15:48:18.000' AS DateTime), N'Bom dia Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21571, 1, 2531, N'false_5511947140587@c.us_E3CE2F6E2ED9947CDA410EAD1', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:14:45.000' AS DateTime), N'Ele mesmo.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21570, 1, 2531, N'false_5511947140587@c.us_983C7A405D91997DAB745403B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:14:39.000' AS DateTime), N'Isso.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21569, 1, 2531, N'false_5511947140587@c.us_671FBC2E26D184A7596714FE9', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:10:29.000' AS DateTime), N'Ele quer no máximo 600 mil.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21568, 1, 2531, N'false_5511947140587@c.us_A7C74709666F46E35BCC8C0AA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:10:23.000' AS DateTime), N'Tô insistindo com ele.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21567, 1, 2531, N'false_5511947140587@c.us_03F0D83BFC4B476C49DFE783B', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 19:10:17.000' AS DateTime), N'Passou.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21566, 1, 2531, N'false_5511947140587@c.us_2B8EDFBE477B360EAA7A290DF', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:59:34.000' AS DateTime), N'Sim. Pode deixar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21565, 1, 2531, N'false_5511947140587@c.us_802485ED3D3351F3303727F2A', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:59:13.000' AS DateTime), N'No osso.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21564, 1, 2531, N'false_5511947140587@c.us_B96D27AF741183000F5EECC7C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:59:10.000' AS DateTime), N'Até 708.320 passa RS.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21563, 1, 2531, N'false_5511947140587@c.us_1989530E91EB459E5B90427B0', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:58:51.000' AS DateTime), N'Menos que isso não vai.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21562, 1, 2531, N'false_5511947140587@c.us_E37072347BE1B0493D206055D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:58:45.000' AS DateTime), N'Unidade mais em conta divulgado pela empresa está em 715 mil. Unidade promocional*', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21561, 1, 2531, N'false_5511947140587@c.us_4735D4C05B6A71FF7C20E9EC2', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:58:27.000' AS DateTime), N'Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21560, 1, 2531, N'false_5511947140587@c.us_233982F586ECB6E03B97B1C47', N'Entrada', NULL, 0, 0, CAST(N'2019-11-28 18:55:53.000' AS DateTime), N'Oi Lu', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21559, 1, 2531, N'false_5511947140587@c.us_029649E712EE42EB679BC5A52', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 19:23:52.000' AS DateTime), N'Recebi sim', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21558, 1, 2531, N'false_5511947140587@c.us_4C858DB8EDC78DDCFE2D54F1C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 19:23:50.000' AS DateTime), N'Oi Lu. Tudo bem e com você ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21557, 1, 2531, N'false_5511947140587@c.us_4532BA6D5CC6EE39F8442727C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:44.000' AS DateTime), N'??', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21556, 1, 2531, N'false_5511947140587@c.us_44F4321A9B35291AEFA90999F', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:42.000' AS DateTime), N'Oi Thalita.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21555, 1, 2531, N'false_5511947140587@c.us_E297FF790022FEB90805DBA90', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:37.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21554, 1, 2531, N'false_5511947140587@c.us_A2179F148D5062599DDAE8550', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:07.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21553, 1, 2531, N'false_5511947140587@c.us_66A53F512CEECABD11E383E04', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:05.000' AS DateTime), N'Ok. Pode deixar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21552, 1, 2531, N'false_5511947140587@c.us_456C2F2F3B17559FE72E41E83', N'Entrada', NULL, 0, 0, CAST(N'2019-11-25 15:37:01.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21551, 1, 2531, N'false_5511947140587@c.us_131156F4C82982EEF72133228', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:59:20.000' AS DateTime), N'Lu. Tabela está a R$ 802.000,00', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21550, 1, 2531, N'false_5511947140587@c.us_BECED112ED4CE74073E1AF6D8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:48:06.000' AS DateTime), N'Final 1 - 52.89 M2\nFinal 3 - 49,67 m2\nFinal 8 - 80,22 m²', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21548, 1, 2531, N'false_5511947140587@c.us_3EB04B5CFCB34983B34C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:47:10.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21549, 1, 2531, N'false_5511947140587@c.us_3EB040775B69844E182D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:47:10.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21547, 1, 2531, N'false_5511947140587@c.us_3EB0BA2188393C9EFD91', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:47:09.000' AS DateTime), N'document', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21546, 1, 2531, N'false_5511947140587@c.us_3220A78AC12AC1368A32D2151', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:42:12.000' AS DateTime), N'Vou te passar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21545, 1, 2531, N'false_5511947140587@c.us_9D85441A89114D57D475AB698', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:42:09.000' AS DateTime), N'Tenho sim Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21544, 1, 2531, N'false_5511947140587@c.us_AFF69CD10461F6EAC62CAD7E6', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 19:36:31.000' AS DateTime), N'ptt', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21543, 1, 2531, N'false_5511947140587@c.us_36113730115AB856651176F07', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 18:30:52.000' AS DateTime), N'Lu está R$ 750,00 já incluso água e gás.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21542, 1, 2531, N'false_5511947140587@c.us_898752ACEEDCB35AE480435D4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:34:57.000' AS DateTime), N'Pois fica mais apresentável', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21541, 1, 2531, N'false_5511947140587@c.us_2BC51CA39CF8680BD22B78246', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:34:39.000' AS DateTime), N'Geralmente compartilho fotos do decorado.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21540, 1, 2531, N'false_5511947140587@c.us_7C2B8AC6F102E1697FCAA51C7', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:34:29.000' AS DateTime), N'Lu, vou tirar. Vou daqui a pouco para o Vila.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21539, 1, 2531, N'false_5511947140587@c.us_34012ED0481DE5A07BCE4F8D1', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:22:36.000' AS DateTime), N'Vou te mandar.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21538, 1, 2531, N'false_5511947140587@c.us_50C31E15BA7BC5E14DC63C829', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:22:33.000' AS DateTime), N'Essa é do decotado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21537, 1, 2531, N'false_5511947140587@c.us_E2BA505F277FB41BE2C04B1DC', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:22:28.000' AS DateTime), N'Desculpe', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21536, 1, 2531, N'false_5511947140587@c.us_1A25916EED741FF7243CF7A43', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:22:26.000' AS DateTime), N'Do modelo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21535, 1, 2531, N'false_5511947140587@c.us_34683782D661E1661C9AE60A6', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:22:24.000' AS DateTime), N'Ah', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21532, 1, 2531, N'false_5511947140587@c.us_3EB0CDAB4A42818FA949', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:18:08.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21533, 1, 2531, N'false_5511947140587@c.us_3EB0EF99C450A27834C8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:18:08.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21534, 1, 2531, N'false_5511947140587@c.us_3EB0EECAB90EAD28F2FA', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:18:08.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21530, 1, 2531, N'false_5511947140587@c.us_3EB0C30F65CA0AB0AEB3', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:18:07.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21531, 1, 2531, N'false_5511947140587@c.us_3EB0AED14BA44214B90E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:18:07.000' AS DateTime), N'image', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21529, 1, 2531, N'false_5511947140587@c.us_896DAAA645A7046E9C6C25E13', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:15:48.000' AS DateTime), N'Mando sim Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21528, 1, 2531, N'false_5511947140587@c.us_874237A1E6AD5216262081153', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:14:36.000' AS DateTime), N'Tenho sim.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21527, 1, 2531, N'false_5511947140587@c.us_000A44364A03BE5547A884908', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 17:14:34.000' AS DateTime), N'Boa tarde Lu.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21526, 1, 2531, N'false_5511947140587@c.us_9EE56798CAD002276BF3986AD', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:45:41.000' AS DateTime), N'??????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21525, 1, 2531, N'false_5511947140587@c.us_3F2241D24F82F07F28902461D', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:44:27.000' AS DateTime), N'Alabi busca até 180 mil.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21524, 1, 2531, N'false_5511947140587@c.us_1B2017C2B8E5F41C9EFAF84BD', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:44:16.000' AS DateTime), N'Com quem eu falo ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21523, 1, 2531, N'false_5511947140587@c.us_EF4281FD92C8735B3E336BD1C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 14:43:46.000' AS DateTime), N'Bom dia.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21482, 1, 2534, N'false_5511997603436@c.us_D7643C32CC8EEE70C3A7A2F01', N'Entrada', NULL, 0, 0, CAST(N'2019-11-22 16:16:06.000' AS DateTime), N'????', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21494, 1, 2536, N'false_5511953532484@c.us_6112D68F8EEDB75DD3B4D81D7', N'Entrada', NULL, 0, 0, CAST(N'2020-08-05 15:22:36.000' AS DateTime), N'Olá, como você está?\nAgradeço o envio da mensagem e responderei assim que possível.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21493, 1, 2536, N'false_5511953532484@c.us_DFAFDAC12612AAE89F0A29FA0', N'Entrada', NULL, 0, 0, CAST(N'2020-06-24 15:07:18.000' AS DateTime), N'Olá, como você está?\nAgradeço o envio da mensagem e responderei assim que possível.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21492, 1, 2536, N'false_5511953532484@c.us_E80E4ECFB17816C5953E2BB1D', N'Entrada', NULL, 0, 0, CAST(N'2020-05-11 01:17:08.000' AS DateTime), N'Olá, não estou mais.\nObrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21491, 1, 2536, N'false_5511953532484@c.us_0FFE037BF47CED9ADF01719B0', N'Entrada', NULL, 0, 0, CAST(N'2020-04-27 16:38:47.000' AS DateTime), N'Olá, como você está?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21490, 1, 2536, N'false_5511953532484@c.us_36A5D667768960ED7AFE6820C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 19:32:50.000' AS DateTime), N'Olá Luci, agradeço a informação. O Studio está fora do meu orçamento.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21489, 1, 2536, N'false_5511953532484@c.us_ACF5CCBC8A273E7BF3322BFC8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-26 17:48:11.000' AS DateTime), N'Olá Thalita! Quais são os valores dos Studios?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21485, 1, 2538, N'false_5511959202046@c.us_3FBDE2074284E8A7304BB75DD', N'Entrada', NULL, 0, 0, CAST(N'2020-07-01 15:20:56.000' AS DateTime), N'Ok.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21484, 1, 2538, N'false_5511959202046@c.us_174B45C943C52A6D26E3E873B', N'Entrada', NULL, 0, 0, CAST(N'2020-07-01 15:14:24.000' AS DateTime), N'Oi...bom dia.....estou vendo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21516, 1, 2539, N'false_5511979629123@c.us_3EB034A587E9D3906423', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:54:41.000' AS DateTime), N'vc tem fotos e/ou videos do decorado?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21515, 1, 2539, N'false_5511979629123@c.us_3EB03AB2F0D1408D4902', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:54:31.000' AS DateTime), N'interessante', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21514, 1, 2539, N'false_5511979629123@c.us_3AB58AF2E0D3C5F97D22', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:09:32.000' AS DateTime), N'Quais valores do metro quadrado ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21513, 1, 2539, N'false_5511979629123@c.us_3A879187D5574AE3EF16', N'Entrada', NULL, 0, 0, CAST(N'2020-10-06 15:09:24.000' AS DateTime), N'Legal', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21497, 1, 2541, N'false_5511985279521@c.us_EB227B78E2BE3FB419E8D9FD5', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 16:07:03.000' AS DateTime), N'Deve ser um contato antigo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21496, 1, 2541, N'false_5511985279521@c.us_2A479EE40FDF0DABEDD6D8427', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 16:06:58.000' AS DateTime), N'Não estou procurando', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21495, 1, 2541, N'false_5511985279521@c.us_4B384781CDE0DA93571AF671F', N'Entrada', NULL, 0, 0, CAST(N'2020-05-08 15:58:34.000' AS DateTime), N'Boa tarde', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21512, 1, 2542, N'false_5515991731275@c.us_3A5987E09944BEDE8D6B', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 17:15:20.000' AS DateTime), N'Por enquanto não vou me mudar pra SP. Mas vou salvar corretamente o número de vocês aqui e nos falamos em breve.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21511, 1, 2542, N'false_5515991731275@c.us_3AC966E143BC127A6BC1', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 15:14:15.000' AS DateTime), N'É da Urbic?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21510, 1, 2542, N'false_5515991731275@c.us_3A7192C1344550D8BA23', N'Entrada', NULL, 0, 0, CAST(N'2020-01-07 14:14:38.000' AS DateTime), N'Bom dia!', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21509, 1, 2542, N'false_5515991731275@c.us_3AA7BDD041F09170E1AD', N'Entrada', NULL, 0, 0, CAST(N'2019-12-19 14:25:11.000' AS DateTime), N'Bom dia, Luci! Se possível, me mande as plantas de 50m2 e 80m2 pra eu deixar salvas aqui no meu celular.', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21503, 1, 2543, N'false_5511984508366@c.us_3ACB0A69BD3C367DB7C8', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:56:10.000' AS DateTime), N'Muito obrigada', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21502, 1, 2543, N'false_5511984508366@c.us_3A3EA60D602FFA5DC190', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:54:30.000' AS DateTime), N'Por favor', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21501, 1, 2543, N'false_5511984508366@c.us_3A4D0EF0B32E743418D4', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:53:14.000' AS DateTime), N'Consegue me passar os valores?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21500, 1, 2543, N'false_5511984508366@c.us_3A4D73709B90FA9F751E', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:53:07.000' AS DateTime), N'Eu imagino q talvez não esteja no meu orçamento esse de 50 m2', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21499, 1, 2543, N'false_5511984508366@c.us_3ACC23D599461F50AA7C', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:44:26.000' AS DateTime), N'Quando sai a unidade ?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21498, 1, 2543, N'false_5511984508366@c.us_3A88926A34BAF953AC39', N'Entrada', NULL, 0, 0, CAST(N'2019-11-21 16:44:20.000' AS DateTime), N'Ola tudo bem!?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21488, 1, 2544, N'false_5511960640303@c.us_3EB0B9E4A6AE66EAA772', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:35:05.000' AS DateTime), N'vc disse qu eia me enviar os valores tambem', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21487, 1, 2544, N'false_5511960640303@c.us_3EB00E615CD595D02BBB', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:34:23.000' AS DateTime), N'vou olhar e já confirmo se marcamos para o domingo', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21486, 1, 2544, N'false_5511960640303@c.us_3EB0AE887D420FC857E5', N'Entrada', NULL, 0, 0, CAST(N'2020-01-31 14:34:04.000' AS DateTime), N'obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21508, 1, 2548, N'false_5511981918454@c.us_FB1CF180D6FAC1E9B090EC9B4', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 20:17:12.000' AS DateTime), N'Pode deixar', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21507, 1, 2548, N'false_5511981918454@c.us_D4465B1C5E155FE2B3A5FB660', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 18:04:13.000' AS DateTime), N'Ok', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21506, 1, 2548, N'false_5511981918454@c.us_3EB044F2FC70F3D1F492', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 17:52:08.000' AS DateTime), N'ok, obrigado', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21505, 1, 2548, N'false_5511981918454@c.us_C6EE3F4D9177ADF488D9FD895', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 17:48:03.000' AS DateTime), N'E vc tem ideia de valor  do AP?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21504, 1, 2548, N'false_5511981918454@c.us_A07AABA6F90DA95082FECC2F3', N'Entrada', NULL, 0, 0, CAST(N'2020-07-07 17:38:50.000' AS DateTime), N'Qual o vir de 50m2?', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21483, 1, 2550, N'false_551131995786@c.us_C019CB0491D452A3CB3DA50978', N'Entrada', NULL, 0, 0, CAST(N'2020-06-26 15:09:26.000' AS DateTime), N'?? Seja bem-vindo(a), ao Sabor Genuino ??\r\n\r\nFaça seu pedido pelos nossos canais digitais para *participar das nossas promoções semanais!*\r\n\r\n?? Robô no WhatsApp, clique aqui:\r\nhttps://www.pedzap.com.br/h/BOQT9W\r\n\r\n?? Cardápio Online, clique aqui:\r\nhttps://saborgenuino.pedzap.com.br\r\n\r\n*Utilizando os links acima você recebe 5 por cento desconto em todos os pedidos e entrega grátis em todos seus pedidos.*\r\n\r\n_Você será notificado no WhatsApp sobre o seu pedido durante o preparo, saída para entrega e chegada do motoboy no local_\r\n\r\n??? Ou se preferir, me envie uma mensagem para falar com um atendente ...', 0, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21726, 1, 2591, N'false_5511947310291@c.us_3A41FF9F9ED0ABDC0C0C', N'Entrada', N'Robot', 0, 0, CAST(N'2020-10-23 11:40:14.137' AS DateTime), NULL, 11, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21725, 1, 2592, N'false_5511972651069@c.us_4E0F84A385D13975C587E963A', N'Entrada', N'Robot', 0, 0, CAST(N'2020-10-23 11:40:14.137' AS DateTime), NULL, 11, 0, 1, 0, NULL)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21796, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-14 09:08:42.033' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21795, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIDdFQTFFODQ1RkMy', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-14 09:08:34.873' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21794, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-13 10:10:49.123' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21793, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-13 10:10:46.483' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21792, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-13 10:02:30.577' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21791, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-13 10:02:25.040' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21790, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-13 09:42:42.910' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21789, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-13 09:42:39.517' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21788, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-13 09:22:16.197' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21787, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-13 09:21:23.663' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21786, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-11 09:52:42.717' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21785, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-11 09:52:21.473' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21784, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-11 09:50:40.107' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21783, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-11 09:43:31.580' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21782, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIDdFQTFFODQ1RkMy', N'Entrada', N'Sessao: 223', 0, 0, CAST(N'2024-05-11 09:33:46.280' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21781, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIDdFQTFFODQ1RkMy', N'Entrada', N'Robot', 0, 0, CAST(N'2024-05-11 09:28:50.223' AS DateTime), N'Atendimento', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21780, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-05-10 12:07:49.187' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) 00000000000.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21779, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEMyQjI4QkRGRjU3', N'Entrada', N'Robot', 0, 0, CAST(N'2024-05-10 12:07:48.707' AS DateTime), N'image', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21778, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-04-17 08:03:34.070' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) 00000000000.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21777, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEMyQjI4QkRGRjU3', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-17 08:03:33.937' AS DateTime), N'image', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21776, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-04-16 09:12:47.390' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) 00000000000.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21775, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEMyQjI4QkRGRjU3', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-16 09:12:47.170' AS DateTime), N'image', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21774, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-04-16 08:57:16.820' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) 00000000000.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21773, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIENCQTE3NjMxRkM4', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-16 08:55:58.927' AS DateTime), N'audio', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21772, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIENCQTE3NjMxRkM4', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-16 08:14:36.867' AS DateTime), NULL, 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21771, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-04-11 08:02:11.203' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) 00000000000.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21770, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEJEOTI4OTVEQjg1', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-11 08:01:57.950' AS DateTime), N'Oi', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21769, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEJEOTI4OTVEQjg1', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-11 07:54:26.643' AS DateTime), N'Oi', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21768, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEJEOTI4OTVEQjg1', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-11 07:29:19.937' AS DateTime), N'Oi', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21767, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYxMTg3MjNEMDI3', N'Entrada', N'Robot', 0, 0, CAST(N'2024-04-10 16:05:58.350' AS DateTime), N'Oi', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21766, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-25 11:37:38.940' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21765, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-25 11:37:05.870' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21764, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-25 11:33:12.160' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21763, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 19:04:01.717' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21762, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 15:33:28.660' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21761, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 15:32:42.757' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21760, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 15:26:33.210' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21759, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 12:17:11.740' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21758, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 12:16:05.470' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21757, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-24 12:13:28.770' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21756, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-23 09:44:40.730' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21755, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-23 09:44:08.777' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21754, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-22 11:42:27.210' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21753, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-22 11:37:27.383' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21752, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEYzRjU0M0VBODI0', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-22 11:23:49.147' AS DateTime), N'Mais um teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21751, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-22 10:40:03.170' AS DateTime), N'Ary Bevilaqua para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) [CPF_MASCARADO].', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21750, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEFEODZFMEQ0MDND', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-22 10:37:50.203' AS DateTime), N'Teste', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21749, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-21 08:22:32.820' AS DateTime), N'Bom dia, Sr Ary Bevilaqua, obrigado por entrar em contato.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21748, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-21 08:21:46.877' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21747, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-21 08:04:58.410' AS DateTime), N'Bom dia, Sr Ary Bevilaqua, obrigado por entrar em contato.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21746, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-21 08:02:49.740' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21745, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-21 08:00:42.703' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21744, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-21 07:56:43.927' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21743, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 219', 0, 0, CAST(N'2024-03-20 10:45:00.027' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21742, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 219', 0, 0, CAST(N'2024-03-20 08:08:34.153' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21741, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 219', 0, 0, CAST(N'2024-03-19 11:17:22.347' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21740, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 219', 0, 0, CAST(N'2024-03-18 19:32:36.373' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21737, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-17 14:58:44.277' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21736, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-17 14:57:08.783' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21735, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 0', 0, 0, CAST(N'2024-03-17 14:56:25.760' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21734, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEQ4N0MxMzM5QUFB', N'Entrada', N'Sessao: 0', 0, 0, CAST(N'2024-03-05 11:04:31.753' AS DateTime), N'Boa tarde', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21733, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 0', 0, 0, CAST(N'2024-02-29 17:32:07.210' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21732, 0, 2594, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-02-29 17:29:30.620' AS DateTime), N'Bom dia, Sr Ary Bevilaqua, obrigado por entrar em contato.', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21731, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 0', 0, 0, CAST(N'2024-02-29 12:17:17.103' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21730, 0, 2594, N'wamid.HBgNNTUxMTk2MzE5MTkyMhUCABIYIEVFQTYzNjAzMzBD', N'Entrada', N'Sessao: 0', 0, 0, CAST(N'2024-02-29 12:11:26.340' AS DateTime), N'Teste whats....', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21739, 0, 2595, N'', N'Saida', N'Robot', 0, 0, CAST(N'2024-03-18 16:56:52.167' AS DateTime), N'Aguarde um instante que um colaborador nosso irá atende-lo!', 11, 0, 0, 1, 1)
GO
INSERT [dbo].[Conversas] ([IdConversa], [Usuarios_IdUsr], [Contatos_IdContato], [IdConversaWhats], [Sentido], [Destino], [Recebido], [Lido], [Data], [Mensagem], [Config_IdConfig], [Enviada], [LidoChat], [Origem], [Classificacao]) VALUES (21738, 0, 2595, N'ABGGFlA5Fpa', N'Entrada', N'Robot', 0, 0, CAST(N'2024-03-18 16:56:45.207' AS DateTime), N'this is a text message', 11, 0, 0, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Conversas] OFF
GO
INSERT [dbo].[EmpresaCliente] ([IdEmpresa], [Nome], [LogoTipo], [Instrucoes]) VALUES (1, N'BV', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[FluxoAtendimento] ON 

GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (57, 7, 3, 1, 10, 58, 67, 67, N'', N'Saudação', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (58, 7, 2, 2, 29, 59, 58, 67, N'', N'Confirmação', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (59, 7, 3, 3, 30, 60, 66, 67, N'', N'Validado', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (60, 7, 5, 4, 32, 0, 0, 0, N'0', N'Opçoes', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (61, 7, 5, 5, 43, 0, 0, 0, N'1', N'opcao1', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (62, 7, 5, 6, 44, 0, 0, 0, N'2', N'opcao2', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (63, 7, 5, 7, 36, 0, 0, 0, N'3', N'opcao 3', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (64, 7, 5, 8, 42, 0, 0, 0, N'4', N'opcao4', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (65, 7, 5, 9, 37, 0, 0, 0, N'5', N'Opcao 5', 1, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (66, 7, 1, 10, 26, 0, 0, 0, N'', N'Erro', 0, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (67, 7, 1, 12, 26, 0, 0, 0, N'', N'Agradecimento', 1, 0)
GO
INSERT [dbo].[FluxoAtendimento] ([IdFluxoAtendimento], [CampanhaIdCampanha], [Tipo], [Ordem], [IdMensagem], [Condicao1], [Condicao2], [Saida], [Chave], [NomeFluxo], [Finalizado], [Ofensa]) VALUES (68, 23, 1, 13, 34, 0, 0, 0, N'', N'Atendimento', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[FluxoAtendimento] OFF
GO
SET IDENTITY_INSERT [dbo].[Lista] ON 

GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10119, 1, N'AryBevilaquaCunha', NULL, NULL, N'', NULL, 0, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10120, 1, N'Carlos', N'12345678', NULL, NULL, N'5511981543993', 0, NULL, 0, NULL, 20374, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10276, 24, N'Teste1', N'', N'CPF', N'', N'11999999991', 0, N'Teste1', 0, NULL, 0, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10277, 24, N'Teste2', N'', N'CPF', N'', N'11999999992', 0, N'Teste2', 0, NULL, 0, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10278, 24, N'Teste3', N'', N'CPF', N'', N'11999999993', 0, N'Teste3', 0, NULL, 0, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10279, 24, N'Teste4', N'', N'CPF', N'', N'11999999994', 0, N'Teste4', 0, NULL, 0, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10280, 24, N'Teste5', N'', N'CPF', N'', N'11999999995', 0, N'Teste5', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10281, 24, N'Teste6', N'', N'CPF', N'', N'11999999996', 0, N'Teste6', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10282, 24, N'Teste7', N'', N'CPF', N'', N'11999999997', 0, N'Teste7', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10283, 24, N'Teste8', N'', N'CPF', N'', N'11999999998', 0, N'Teste8', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10284, 24, N'Teste9', N'', N'CPF', N'', N'11999999999', 0, N'Teste9', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10285, 24, N'Teste10', N'', N'CPF', N'', N'12999999999', 0, N'Teste10', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10289, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21749, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10290, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21751, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10291, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21771, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10292, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21774, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10293, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21776, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10294, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21778, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10295, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 21780, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10175, 1, N'AryBevilaquaCunha', NULL, NULL, N'', NULL, 738, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10182, 1, N'Airton', NULL, NULL, N'', NULL, 739, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10185, 1, N'Airton', NULL, NULL, N'', NULL, 739, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10192, 1, N'Airton', NULL, NULL, N'', NULL, 740, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10200, 1, N'Airton', NULL, NULL, N'', NULL, 741, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10117, 7, N'Airton Bevilaqua Cunha', N'12345678912', N'CPF', N'0', N'5511996482585', 742, N'Airton Bevilaqua Cunha', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10207, 1, N'Airton', NULL, NULL, N'', NULL, 742, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10118, 7, N'Ary Bevilaqua', N'12345678901', N'CPF', N'0', N'5511963191922', 746, N'Ary Bevilaqua', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10219, 1, N'Ary Bevilaqua  Cunha ,', NULL, NULL, N'', NULL, 746, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10221, 1, N'Ary Bevilaqua  Cunha', NULL, NULL, N'', NULL, 747, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10223, 1, N'Ary Bevilaqua  Cunha', NULL, NULL, N'', NULL, 751, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10225, 1, N'Ary Bevilaqua  Cunha', NULL, NULL, N'', NULL, 752, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10227, 1, N'Ary Bevilaqua  Cunha', NULL, NULL, N'', NULL, 753, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10229, 23, N'Cliente Bia***maria', N'5511983734092', N'CPF', N'', N'5511983734092@c.us', 756, N'Cliente Bia***maria', 0, N'', 20609, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10230, 23, N'Cliente Cl?udia**joyce', N'5511988217538', N'CPF', N'', N'5511988217538@c.us', 757, N'Cliente Cl?udia**joyce', 0, N'', 20610, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10231, 23, N'Cliente Diogo Pereira***maria', N'5511980854474', N'CPF', N'', N'5511980854474@c.us', 758, N'Cliente Diogo Pereira***maria', 0, N'', 20611, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10232, 23, N'Cliente Emanuel**JOYCE', N'5511995011869', N'CPF', N'', N'5511995011869@c.us', 759, N'Cliente Emanuel**JOYCE', 0, N'', 20612, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10233, 23, N'Cliente Jo?o Jaime**Joyce', N'5511999798727', N'CPF', N'', N'5511999798727@c.us', 760, N'Cliente Jo?o Jaime**Joyce', 0, N'', 20613, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10234, 23, N'Cliente Juliana *m', N'5516992624796', N'CPF', N'', N'5516992624796@c.us', 761, N'Cliente Juliana *m', 0, N'', 20614, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10235, 23, N'Cliente Losangela Venda***duda', N'5511995570694', N'CPF', N'', N'5511995570694@c.us', 762, N'Cliente Losangela Venda***duda', 0, N'', 20615, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10236, 23, N'Cliente Maria Jaqueline**duda', N'5511992236359', N'CPF', N'', N'5511992236359@c.us', 763, N'Cliente Maria Jaqueline**duda', 0, N'', 20616, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10237, 23, N'Cliente Renice**joyce', N'5511984544090', N'CPF', N'', N'5511984544090@c.us', 764, N'Cliente Renice**joyce', 0, N'', 20617, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10238, 23, N'Cliente Rodolfo**maria', N'5511987920415', N'CPF', N'', N'5511987920415@c.us', 765, N'Cliente Rodolfo**maria', 0, N'', 20618, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10239, 23, N'Cliente Sheila**joyce', N'5511986265915', N'CPF', N'', N'5511986265915@c.us', 766, N'Cliente Sheila**joyce', 0, N'', 20619, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10240, 23, N'Cliente Viviane**joyce', N'5511984335906', N'CPF', N'', N'5511984335906@c.us', 767, N'Cliente Viviane**joyce', 0, N'', 20620, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10241, 23, N'Cliente William *maria', N'5511998421844', N'CPF', N'', N'5511998421844@c.us', 768, N'Cliente William *maria', 0, N'', 20621, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10242, 23, N'Gustavo Venda Maria', N'5511963524079', N'CPF', N'', N'5511963524079@c.us', 769, N'Gustavo Venda Maria', 0, N'', 20622, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10243, 23, N'Jarcir Leads', N'554299668682', N'CPF', N'', N'554299668682@c.us', 770, N'Jarcir Leads', 0, N'', 20623, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10244, 23, N'Joyce Cliente Jose Carlos', N'5511986068998', N'CPF', N'', N'5511986068998@c.us', 771, N'Joyce Cliente Jose Carlos', 0, N'', 20624, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10245, 23, N'Maria Corretora', N'5511981787501', N'CPF', N'', N'5511981787501@c.us', 772, N'Maria Corretora', 0, N'', 20625, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10246, 23, N'Rafael Surp', N'5511990019288', N'CPF', N'', N'5511990019288@c.us', 773, N'Rafael Surp', 0, N'', 20626, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10247, 23, N'Venda Evelyn ***maria', N'556592900954', N'CPF', N'', N'556592900954@c.us', 774, N'Venda Evelyn ***maria', 0, N'', 20627, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10248, 23, N'+55 11 94319-4258', N'5511943194258', N'CPF', N'', N'5511943194258@c.us', 775, N'+55 11 94319-4258', 0, N'', 20628, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10249, 23, N'+55 11 94714-4191', N'5511947144191', N'CPF', N'', N'5511947144191@c.us', 776, N'+55 11 94714-4191', 0, N'', 20629, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10250, 23, N'+55 11 94788-2442', N'5511947882442', N'CPF', N'', N'5511947882442@c.us', 777, N'+55 11 94788-2442', 0, N'', 20630, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10251, 23, N'+55 11 94899-3015', N'5511948993015', N'CPF', N'', N'5511948993015@c.us', 778, N'+55 11 94899-3015', 0, N'', 20631, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10252, 23, N'+55 11 94943-7572', N'5511949437572', N'CPF', N'', N'5511949437572@c.us', 779, N'+55 11 94943-7572', 0, N'', 20632, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10253, 23, N'+55 11 95500-3608', N'5511955003608', N'CPF', N'', N'5511955003608@c.us', 780, N'+55 11 95500-3608', 0, N'', 20633, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10254, 23, N'+55 11 95858-0768', N'5511958580768', N'CPF', N'', N'5511958580768@c.us', 781, N'+55 11 95858-0768', 0, N'', 20634, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10255, 23, N'+55 11 95952-3197', N'5511959523197', N'CPF', N'', N'5511959523197@c.us', 782, N'+55 11 95952-3197', 0, N'', 20635, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10256, 23, N'+55 11 96191-6957', N'5511961916957', N'CPF', N'', N'5511961916957@c.us', 783, N'+55 11 96191-6957', 0, N'', 20636, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10257, 23, N'+55 11 96231-7452', N'5511962317452', N'CPF', N'', N'5511962317452@c.us', 784, N'+55 11 96231-7452', 0, N'', 20637, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10258, 23, N'+55 11 96438-3020', N'5511964383020', N'CPF', N'', N'5511964383020@c.us', 785, N'+55 11 96438-3020', 0, N'', 20638, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10259, 23, N'+55 11 96479-3711', N'5511964793711', N'CPF', N'', N'5511964793711@c.us', 786, N'+55 11 96479-3711', 0, N'', 20639, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10260, 23, N'+55 11 96891-9867', N'5511968919867', N'CPF', N'', N'5511968919867@c.us', 787, N'+55 11 96891-9867', 0, N'', 20640, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10261, 23, N'+55 11 97214-2779', N'5511972142779', N'CPF', N'', N'5511972142779@c.us', 788, N'+55 11 97214-2779', 0, N'', 20641, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10262, 23, N'+55 11 97465-8264', N'5511974658264', N'CPF', N'', N'5511974658264@c.us', 789, N'+55 11 97465-8264', 0, N'', 20642, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10263, 23, N'+55 11 97705-7292', N'5511977057292', N'CPF', N'', N'5511977057292@c.us', 790, N'+55 11 97705-7292', 0, N'', 20643, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10264, 23, N'+55 11 97716-5048', N'5511977165048', N'CPF', N'', N'5511977165048@c.us', 791, N'+55 11 97716-5048', 0, N'', 20644, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10265, 23, N'+55 11 98097-4980', N'5511980974980', N'CPF', N'', N'5511980974980@c.us', 792, N'+55 11 98097-4980', 0, N'', 20645, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10266, 23, N'+55 11 98314-9779', N'5511983149779', N'CPF', N'', N'5511983149779@c.us', 793, N'+55 11 98314-9779', 0, N'', 20646, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10267, 23, N'+55 11 98351-4500', N'5511983514500', N'CPF', N'', N'5511983514500@c.us', 794, N'+55 11 98351-4500', 0, N'', 20647, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10268, 23, N'+55 11 98370-0877', N'5511983700877', N'CPF', N'', N'5511983700877@c.us', 795, N'+55 11 98370-0877', 0, N'', 20648, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10269, 23, N'+55 11 98468-8281', N'5511984688281', N'CPF', N'', N'5511984688281@c.us', 796, N'+55 11 98468-8281', 0, N'', 20649, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10270, 23, N'+55 11 98702-2757', N'5511987022757', N'CPF', N'', N'5511987022757@c.us', 797, N'+55 11 98702-2757', 0, N'', 20650, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10271, 23, N'+55 11 98756-1690', N'5511987561690', N'CPF', N'', N'5511987561690@c.us', 798, N'+55 11 98756-1690', 0, N'', 20651, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10272, 23, N'+55 13 99710-9915', N'5513997109915', N'CPF', N'', N'5513997109915@c.us', 799, N'+55 13 99710-9915', 0, N'', 20652, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10273, 23, N'+55 73 9993-8113', N'557399938113', N'CPF', N'', N'557399938113@c.us', 800, N'+55 73 9993-8113', 0, N'', 20653, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10274, 23, N'', N'status', N'CPF', N'', N'status@broadcast', 801, N'', 0, N'', 20654, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10275, 23, N'Voc?', N'5511983432833', N'CPF', N'', N'5511983432833@c.us', 802, N'Voc?', 0, N'', 20655, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10286, 1, N'Ary Bevilaqua', NULL, NULL, N'', NULL, 2594, NULL, 0, NULL, 0, 0, NULL, N'5511963191922', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10287, 1, N'Ary Bevilaqua', NULL, NULL, N'', NULL, 2594, NULL, 0, NULL, 0, 0, NULL, N'5511963191922', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Lista] ([IdLista], [CampanhaIdCampanha], [Nome], [Documento], [NomeDocumento], [Chave], [Telefone], [ContatoIdContato], [UserWhatsApp], [Ativo], [Status], [ConversaIdConvera], [Desativado], [UsuarioIdUsuario], [FacebookId], [Email], [Sexo], [Anexo1], [Anexo2], [Anexo3], [CodBarras], [IdEnvioLista], [enviado], [DtEnvio]) VALUES (10288, 1, N'Ary Bevilaqua', NULL, NULL, N'', NULL, 2594, NULL, 0, NULL, 0, 0, NULL, N'5511963191922', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Lista] OFF
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00001', 10, CAST(N'2024-01-03 00:00:00.000' AS DateTime), CAST(50.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00002', 10, CAST(N'2024-01-25 00:00:00.000' AS DateTime), CAST(250.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00003', 10, CAST(N'2024-01-15 00:00:00.000' AS DateTime), CAST(530.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00004', 10, CAST(N'2024-02-03 00:00:00.000' AS DateTime), CAST(550.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00005', 10, CAST(N'2024-02-15 00:00:00.000' AS DateTime), CAST(50.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00006', 10, CAST(N'2024-02-18 00:00:00.000' AS DateTime), CAST(750.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00007', 10, CAST(N'2024-02-03 00:00:00.000' AS DateTime), CAST(850.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00008', 10, CAST(N'2024-04-12 00:00:00.000' AS DateTime), CAST(502.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00009', 10, CAST(N'2024-04-10 00:00:00.000' AS DateTime), CAST(530.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00010', 10, CAST(N'2024-04-03 00:00:00.000' AS DateTime), CAST(950.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00011', 10, CAST(N'2024-05-03 00:00:00.000' AS DateTime), CAST(580.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00012', 10, CAST(N'2024-05-03 00:00:00.000' AS DateTime), CAST(500.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00013', 10, CAST(N'2024-05-03 00:00:00.000' AS DateTime), CAST(580.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00014', 10, CAST(N'2024-06-03 00:00:00.000' AS DateTime), CAST(650.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00015', 10, CAST(N'2024-06-03 00:00:00.000' AS DateTime), CAST(570.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[loja_venda] ([CODIGO_FILIAL], [TICKET], [DATA_VENDA], [VALOR_VENDA]) VALUES (N'00016', 10, CAST(N'2024-06-03 00:00:00.000' AS DateTime), CAST(503.53 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Mensagem] ON 

GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (10, N'Mensagem Entrada Padrao', 1, N'[SAUDACAO], Sr [NOMERETORNO], obrigado por entrar em contato.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (25, N'Mensagem Erro Validação', 1, N'Nao conseguimos entender sua resposta, favor verificar se as informacoes digitadas estao corretas.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (26, N'Agradecimento', 1, N'Obrigado! ')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (27, N'Mensagem Saudação Fluxo Atendimento', 1, N'[SAUDACAO], Sr(a) [NOMERETORNO], obrigado por acessar nosso atendimento automatizado CROSP, gostaria de continuar. Digite S ou N .')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (28, N'Mensagem Validação Fluxo Atendimento', 2, N'[NOMERETORNO] para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) [CPF_MASCARADO].')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (29, N'Mensagem Validação CPF', 2, N'[NOMERETORNO] para nossa seguranca precisamos confirmar seus dados cadastrais. Favor digitar as informacoes que estao com (X) [CPF_MASCARADO].')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (30, N'Mensagem Validado Fluxo Atendimento', 3, N'Obrigado, validamos seu cadastro e gostariamos de apresentar uma oportunidade imperdivel da CROSP , deseja saber? digite S ou N.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (32, N'Mensagem Opçoes', 1, N'Temos a seguinte oportunidade para voce:

    Valor Corrigido: [OPCAO1]

Opcoes:

1 -  A vista [OPCAO3] para pagamento ate [OPCAO2]
2 - [OPCAO4] para pagamento ate [OPCAO2]
3 - [OPCAO5] para pagamento ate [OPCAO2]
4 - [OPCAO6] para pagamento ate [OPCAO2]
5 - [OPCAO7] para pagamento ate [OPCAO2]

Selecione a opcao desejada que enviaremos um boleto')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (33, N'Agradecimento', 1, N'Obrigado pela informacao.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (34, N'Transferencia', 1, N'So um momento que ja falo com voce.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (35, N'Inicio', 1, N'[SAUDACAO],[PRIMEIRONOME]')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (36, N'Formalização 3', 1, N'Você escolheu  a opçao [CHAVE]

Pagamento parcelado em  [OPCAO5] para pagamento da primeira parcela para o dia [OPCAO2]

Posso enviar o seu boleto agora? Digite S ou N você ainda voltar ao menu de anterior digitando 0 (zero).')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (37, N'Formalização 5', 1, N'Você escolheu  a opçao [CHAVE]

Pagamento parcelado em  [OPCAO7] para pagamento da primeira parcela para o dia [OPCAO2]

Posso enviar o seu boleto agora? Digite S ou N você ainda voltar ao menu de anterior digitando 0 (zero).')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (38, N'Produto 1', 1, N'A Plus Empresarial tem a solução ideal para sua empresa, seja ela pequena, média ou grande')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (39, N'Produto 2', 1, N'A Plus Empresarial te proporcionara seu PABX com mais de 100 funções, sem nenhum investimento e com ligações gratuitas e limitadas.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (40, N'Produto 3', 1, N'Que tal receber de volta todo dinheiro pago indevidamente nos ultimos 5 anos sobre o ICMS da sua conta de energia e ainda reduzir em mais de 7% o valor da sua conta.')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (41, N'Produto 4', 1, N'Hoje em dia, na década do empreendedorismo, manter controle dos negócios é questão de sobrevivência. Esse controle pode ter que ser ainda maior, quando o assunto é planejamento financeiro. Se tratando de uma grande aliada ao controle financeiro da sua empresa.
Essas ações por sua vez têm algumas funções estratégicas que engajam o encontro de maior controle, como:')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (42, N'Formalização 4', 1, N'Você escolheu  a opçao [CHAVE]

Pagamento parcelado em  [OPCAO6] para pagamento da primeira parcela para o dia [OPCAO2]

Posso enviar o seu boleto agora? Digite S ou N você ainda voltar ao menu de anterior digitando 0 (zero).')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (43, N'Formalização 1', 3, N'Você escolheu  a opçao [CHAVE]

Pagamento a vista no valor de [OPCAO3] para pagamento no dia [OPCAO2]

Posso enviar o seu boleto agora? Digite S ou N você ainda voltar ao menu de anterior digitando 0 (zero).
')
GO
INSERT [dbo].[Mensagem] ([IdMensagem], [NomeMensagem], [Tipo], [Texto]) VALUES (44, N'Formalização 2 ', 3, N'Você escolheu  a opçao [CHAVE]

Pagamento parcelado em  [OPCAO4] para pagamento da primeira parcela para o dia [OPCAO2]

Posso enviar o seu boleto agora? Digite S ou N você ainda voltar ao menu de anterior digitando 0 (zero).')
GO
SET IDENTITY_INSERT [dbo].[Mensagem] OFF
GO
SET IDENTITY_INSERT [dbo].[MensagemQueue] ON 

GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (70, 1, 20603, CAST(N'2020-10-08 14:04:33.767' AS DateTime), 0, CAST(N'2020-10-08 14:04:40.040' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (71, 1, 20605, CAST(N'2020-10-08 14:06:02.673' AS DateTime), 0, CAST(N'2020-10-08 14:06:10.133' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (72, 1, 20606, CAST(N'2020-10-08 14:45:10.060' AS DateTime), 0, CAST(N'2020-10-08 14:45:15.067' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (73, 1, 20607, CAST(N'2020-10-08 14:58:53.640' AS DateTime), 0, CAST(N'2020-10-08 14:58:57.500' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (74, 1, 20608, CAST(N'2020-10-08 15:09:48.427' AS DateTime), 0, CAST(N'2020-10-08 15:10:09.703' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (75, 0, 20609, CAST(N'2020-10-09 11:18:54.717' AS DateTime), 1, CAST(N'2020-12-17 23:26:04.563' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (76, 0, 20610, CAST(N'2020-10-09 11:19:00.327' AS DateTime), 1, CAST(N'2020-12-17 23:32:24.210' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (77, 0, 20611, CAST(N'2020-10-09 11:19:05.480' AS DateTime), 1, CAST(N'2020-12-17 23:32:37.413' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (78, 0, 20612, CAST(N'2020-10-09 11:19:10.673' AS DateTime), 1, CAST(N'2020-12-17 23:32:43.593' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (79, 0, 20613, CAST(N'2020-10-09 11:19:15.870' AS DateTime), 1, CAST(N'2020-11-08 15:41:14.333' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (80, 0, 20614, CAST(N'2020-10-09 11:19:21.077' AS DateTime), 1, CAST(N'2020-11-08 15:43:09.320' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (81, 0, 20615, CAST(N'2020-10-09 11:19:26.280' AS DateTime), 1, CAST(N'2020-11-08 15:43:39.223' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (82, 0, 20616, CAST(N'2020-10-09 11:19:31.620' AS DateTime), 1, CAST(N'2020-11-08 15:44:15.867' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (83, 0, 20617, CAST(N'2020-10-09 11:19:36.887' AS DateTime), 1, CAST(N'2020-11-08 15:44:46.167' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (84, 0, 20618, CAST(N'2020-10-09 11:19:57.073' AS DateTime), 1, CAST(N'2020-11-08 15:45:16.173' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (85, 0, 20619, CAST(N'2020-10-09 11:20:02.360' AS DateTime), 1, CAST(N'2020-11-08 15:45:46.173' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (86, 0, 20620, CAST(N'2020-10-09 11:20:07.520' AS DateTime), 1, CAST(N'2020-11-08 15:46:16.180' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (87, 0, 20621, CAST(N'2020-10-09 11:20:12.863' AS DateTime), 1, CAST(N'2020-11-08 15:46:46.200' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (88, 0, 20622, CAST(N'2020-10-09 11:20:18.500' AS DateTime), 1, CAST(N'2020-11-08 15:47:16.190' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (89, 0, 20623, CAST(N'2020-10-09 11:20:23.797' AS DateTime), 1, CAST(N'2020-11-08 15:47:46.197' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (90, 0, 20624, CAST(N'2020-10-09 11:20:29.257' AS DateTime), 1, CAST(N'2020-11-08 15:48:16.210' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (91, 0, 20625, CAST(N'2020-10-09 11:20:34.610' AS DateTime), 1, CAST(N'2020-11-08 15:48:46.213' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (92, 0, 20626, CAST(N'2020-10-09 11:20:40.003' AS DateTime), 1, CAST(N'2020-11-08 15:49:16.207' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (93, 0, 20627, CAST(N'2020-10-09 11:20:45.407' AS DateTime), 1, CAST(N'2020-11-08 15:49:46.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (94, 0, 20628, CAST(N'2020-10-09 11:20:50.680' AS DateTime), 1, CAST(N'2020-11-08 15:50:16.223' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (95, 0, 20629, CAST(N'2020-10-09 11:20:55.913' AS DateTime), 1, CAST(N'2020-11-08 15:50:46.230' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (96, 0, 20630, CAST(N'2020-10-09 11:21:01.167' AS DateTime), 1, CAST(N'2020-11-08 15:51:16.237' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (97, 0, 20631, CAST(N'2020-10-09 11:21:06.503' AS DateTime), 1, CAST(N'2020-11-08 15:51:46.240' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (98, 0, 20632, CAST(N'2020-10-09 11:21:11.803' AS DateTime), 1, CAST(N'2020-11-08 21:10:58.173' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (99, 0, 20633, CAST(N'2020-10-09 11:21:16.990' AS DateTime), 1, CAST(N'2020-11-08 21:11:27.820' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (100, 0, 20634, CAST(N'2020-10-09 11:21:22.160' AS DateTime), 1, CAST(N'2020-11-08 21:11:57.827' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (101, 0, 20635, CAST(N'2020-10-09 11:21:27.373' AS DateTime), 1, CAST(N'2020-11-08 21:12:27.827' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (102, 0, 20636, CAST(N'2020-10-09 11:21:32.573' AS DateTime), 1, CAST(N'2020-11-08 21:12:57.830' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (103, 0, 20637, CAST(N'2020-10-09 11:21:37.770' AS DateTime), 1, CAST(N'2020-11-08 21:13:39.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (104, 0, 20638, CAST(N'2020-10-09 11:21:42.983' AS DateTime), 1, CAST(N'2020-11-08 21:18:30.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (105, 0, 20639, CAST(N'2020-10-09 11:21:48.377' AS DateTime), 1, CAST(N'2020-11-08 21:18:59.927' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (106, 0, 20640, CAST(N'2020-10-09 11:21:53.660' AS DateTime), 1, CAST(N'2020-11-08 21:19:30.177' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (107, 0, 20641, CAST(N'2020-10-09 11:21:58.907' AS DateTime), 1, CAST(N'2020-11-08 21:23:57.430' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (108, 0, 20642, CAST(N'2020-10-09 11:22:04.087' AS DateTime), 1, CAST(N'2020-11-08 21:24:27.360' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (109, 0, 20643, CAST(N'2020-10-09 11:22:09.293' AS DateTime), 1, CAST(N'2020-11-08 21:24:57.440' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (110, 0, 20644, CAST(N'2020-10-09 11:22:14.487' AS DateTime), 1, CAST(N'2020-11-08 21:25:27.553' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (111, 0, 20645, CAST(N'2020-10-09 11:22:19.690' AS DateTime), 1, CAST(N'2020-11-08 21:28:03.763' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (112, 0, 20646, CAST(N'2020-10-09 11:22:24.883' AS DateTime), 1, CAST(N'2020-11-08 21:28:33.673' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (113, 0, 20647, CAST(N'2020-10-09 11:22:30.073' AS DateTime), 1, CAST(N'2020-11-08 21:29:03.677' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (114, 0, 20648, CAST(N'2020-10-09 11:22:35.207' AS DateTime), 1, CAST(N'2020-11-08 21:29:33.680' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (115, 0, 20649, CAST(N'2020-10-09 11:22:40.333' AS DateTime), 1, CAST(N'2020-11-09 13:31:47.620' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (116, 0, 20650, CAST(N'2020-10-09 11:22:45.483' AS DateTime), 1, CAST(N'2020-11-09 13:32:16.897' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (117, 0, 20651, CAST(N'2020-10-09 11:22:50.620' AS DateTime), 1, CAST(N'2020-11-09 13:32:46.903' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (118, 0, 20652, CAST(N'2020-10-09 11:22:55.767' AS DateTime), 1, CAST(N'2020-11-09 13:33:16.907' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (119, 0, 20653, CAST(N'2020-10-09 11:23:00.887' AS DateTime), 1, CAST(N'2020-12-17 23:24:08.307' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (120, 0, 20654, CAST(N'2020-10-09 11:23:06.030' AS DateTime), 1, CAST(N'2020-12-17 23:26:03.993' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (121, 0, 20655, CAST(N'2020-10-09 11:23:11.187' AS DateTime), 1, CAST(N'2020-12-17 23:26:04.560' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (122, 0, 21727, CAST(N'2020-12-17 11:58:15.257' AS DateTime), 0, CAST(N'2020-12-17 23:23:35.763' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (123, 0, 21728, CAST(N'2020-12-17 12:00:24.553' AS DateTime), 0, CAST(N'2020-12-17 23:23:47.997' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MensagemQueue] ([IdQueue], [status], [ConversaIdconversa], [DataEnvio], [Origem], [UltimaTentativa], [erro], [Mensagem], [Tentando]) VALUES (124, 0, 21729, CAST(N'2020-12-17 22:35:19.977' AS DateTime), 0, CAST(N'2020-12-17 23:23:58.080' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MensagemQueue] OFF
GO
SET IDENTITY_INSERT [dbo].[OpcaoLista] ON 

GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5821, 10117, 1, N'R$ 800,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5822, 10117, 2, N'20/09/2020')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5823, 10117, 3, N'R$ 500,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5824, 10117, 4, N' 2 x R$260,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5825, 10117, 5, N' 3 x R$ 180,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5826, 10117, 6, N'4x R$150,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5827, 10117, 7, N'5x R$ 120,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5828, 10117, 8, N'')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5829, 10117, 9, N'')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5830, 10118, 1, N'R$ 800,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5831, 10118, 2, N'20/09/2020')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5832, 10118, 3, N'R$ 500,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5833, 10118, 4, N'2x R$260,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5834, 10118, 5, N'3 x R$ 180,00 ')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5835, 10118, 6, N'4x R$150,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5836, 10118, 7, N'5x R$ 120,00')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5837, 10118, 8, N'')
GO
INSERT [dbo].[OpcaoLista] ([IdOpcaoLista], [ListaIdlista], [Ordem], [Opcao]) VALUES (5838, 10118, 9, N'')
GO
SET IDENTITY_INSERT [dbo].[OpcaoLista] OFF
GO
INSERT [dbo].[Parametro] ([IdParametro], [NomeDoc], [DigValidacao], [PosicaoValidacao], [QtdeDigitos], [PalavraTransf], [TempoMsg], [MensagemSaudacao], [MensagemErroValid], [Desistencia], [DDD], [Servidor], [Porta], [Debug], [QtdeLista], [Campanha_idCampanha], [ServidorFace], [WhatsBotSever], [WhatsBotPort], [ServidorAnexos], [ServidorCaminho], [ApiGoogle]) VALUES (1, N'CPF', N'X', 3, 4, N'ATENDIMENTO', 5, 10, 25, N'Sair', N'', N'127.0.0.1', 3229, 0, 10, 7, N'mq.lacquasistemas.com.br', N'127.0.0.1', N'3333', N'http://localhost:58121/Anexos/Index', N'C:\projetos\Documentos\Project\WhatsApp\SiteMVC\Anexos\GetImage', N'AIzaSyBT1El66j2sOcYyFrrG_4U1VxXjezydkDs')
GO
SET IDENTITY_INSERT [dbo].[Relatorios] ON 

GO
INSERT [dbo].[Relatorios] ([IdRelatorio], [Nome], [Permissao], [DataCriacao], [Query], [Toolbar], [Desativado]) VALUES (1, N'Campanhas', 3, CAST(N'2020-01-25 00:00:00.000' AS DateTime), N'select  IdCampanha,NomeCampanha,DataEnvio,DataTermino,fl.IdFluxoAtendimento,fl.Ordem,fl.Chave,	
fl.NomeFluxo,	fl.Finalizado,	NomeMensagem,Texto,Descricao as TipoFluxo , flEsperada.NomeFluxo Esperado, flNEsperada.NomeFluxo NEsperado
from Campanha ca
inner join FluxoAtendimento fl on ca.IdCampanha = fl.CampanhaIdCampanha
left join FluxoAtendimento flEsperada on flEsperada.IdFluxoAtendimento = fl.Condicao1
left join FluxoAtendimento flNEsperada on flNEsperada.IdFluxoAtendimento = fl.Condicao2
left join Mensagem ms on ms.IdMensagem = fl.IdMensagem
left join Tipos tp on fl.Tipo = tp.Valor and tp.Referencia=''TipoFluxo''', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Relatorios] OFF
GO
SET IDENTITY_INSERT [dbo].[Servico] ON 

GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (1, N'WhatsApp', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (2, N'SMS', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (3, N'Discador', 2, N'http://172.16.4.38/pi/', NULL, NULL, NULL, N'01733ad92058aafe1bee65fbb3288a28')
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (4, N'Ura', 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (5, N'Leads', 4, NULL, N'DbIturan', NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (6, N'Facebook', 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (7, N'Telegram', 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Servico] ([IdServico], [Nome], [Regra], [Site], [BancoDados], [Usuario], [Senha], [Token]) VALUES (8, N'Email', 7, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Servico] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessao] ON 

GO
INSERT [dbo].[Sessao] ([IdSession], [Contato_Idcontato], [Usuario_IdUsuario], [DataCriacao], [DataAtendimento], [DataEncerramento], [Config_idconfig], [Origem], [Classificacao], [Motivo]) VALUES (223, 2594, 1, CAST(N'2024-05-11 09:28:59.797' AS DateTime), CAST(N'2024-10-25 09:53:26.307' AS DateTime), NULL, 11, 0, 1, NULL)
GO
INSERT [dbo].[Sessao] ([IdSession], [Contato_Idcontato], [Usuario_IdUsuario], [DataCriacao], [DataAtendimento], [DataEncerramento], [Config_idconfig], [Origem], [Classificacao], [Motivo]) VALUES (227, 2595, 4, CAST(N'2024-10-24 15:10:12.473' AS DateTime), CAST(N'2024-10-31 15:30:59.380' AS DateTime), NULL, 11, 0, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sessao] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusAtendimento] ON 

GO
INSERT [dbo].[StatusAtendimento] ([IdStatusAtendimento], [ContatoIdContato], [ConversaIdconversa], [TipoFluxo], [Fluxo_Origem], [Fluxo_DestinoEsperado], [Fluxo_DestinoInesperado], [Resposta], [RespostaEsperada], [Finalizado], [IdLista]) VALUES (301, 2594, 21780, 2, 58, 59, 58, NULL, N'', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[StatusAtendimento] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos] ON 

GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (1, N'TipoMensagem', N'1', N'Informação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (2, N'TipoMensagem', N'2', N'Validação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (3, N'TipoMensagem', N'3', N'Confirmação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (4, N'TipoMensagem', N'4', N'Saida')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (5, N'TipoMensagem', N'5', N'Erro')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (6, N'TipoFluxo', N'1', N'Informação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (7, N'TipoFluxo', N'2', N'Validação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (8, N'TipoFluxo', N'3', N'Confirmação')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (9, N'TipoFluxo', N'4', N'Questionamento')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (10, N'TipoFluxo', N'5', N'Opções')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (11, N'TipoFluxo', N'6', N'Transfere')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (12, N'TipoPermissao', N'1', N'Administrador')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (13, N'TipoPermissao', N'2', N'Supervisor')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (14, N'TipoPermissao', N'3', N'Operador')
GO
INSERT [dbo].[Tipos] ([IdTipo], [Referencia], [Valor], [Descricao]) VALUES (15, N'TipoOrigem', N'1', N'WhatsApp')
GO
SET IDENTITY_INSERT [dbo].[Tipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

GO
INSERT [dbo].[Usuarios] ([IdUsr], [NomeUsuario], [Id_Externo], [Permissao], [Senha], [Email], [Login], [Status], [Celular], [Confirmacao], [ConfigIdConfig]) VALUES (1, N'Administrador', N'Sim', 1, N'+8FvIrffP+gIdCvMRSxWnQ==', N'', N'Admin', 0, N'5511963191922', N'Sim', 11)
GO
INSERT [dbo].[Usuarios] ([IdUsr], [NomeUsuario], [Id_Externo], [Permissao], [Senha], [Email], [Login], [Status], [Celular], [Confirmacao], [ConfigIdConfig]) VALUES (2, N'Gerente', N'Sim', 1, N'+8FvIrffP+gIdCvMRSxWnQ==', N'', N'Gerente', 0, N'', N'Sim', 11)
GO
INSERT [dbo].[Usuarios] ([IdUsr], [NomeUsuario], [Id_Externo], [Permissao], [Senha], [Email], [Login], [Status], [Celular], [Confirmacao], [ConfigIdConfig]) VALUES (3, N'Supervisor', N'', 2, N'+8FvIrffP+gIdCvMRSxWnQ==', N'', N'Supervisor', 1, N'', NULL, 2)
GO
INSERT [dbo].[Usuarios] ([IdUsr], [NomeUsuario], [Id_Externo], [Permissao], [Senha], [Email], [Login], [Status], [Celular], [Confirmacao], [ConfigIdConfig]) VALUES (4, N'Operador', N'4102', 3, N'+8FvIrffP+gIdCvMRSxWnQ==', N'', N'Operador', 0, N'', N'Sim', 0)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[xconfig] ON 

GO
INSERT [dbo].[xconfig] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado]) VALUES (1, N'5511954513303', N'PgT4bJFzIFwzP5JlZMVI30lPLEg=', N'Lacqua Sistema', 0)
GO
INSERT [dbo].[xconfig] ([IdConfig], [Telefone], [Senha], [Apelido], [Desativado]) VALUES (2, N'5511957381250', N'HxA4ZfZGA7dZz2bcl4bPokVZPsg=', N'Consulcred', 0)
GO
SET IDENTITY_INSERT [dbo].[xconfig] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Contatos_15_293576084__K1_K6]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Contatos_15_293576084__K1_K6] ON [dbo].[Contatos]
(
	[IdContato] ASC,
	[IdWhatsApp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Contatos_15_293576084__K21_K1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_20_22]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Contatos_15_293576084__K21_K1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_20_22] ON [dbo].[Contatos]
(
	[IdConfig] ASC,
	[IdContato] ASC
)
INCLUDE ( 	[NomeInformado],
	[Documento],
	[NomeDoc],
	[Codigo],
	[IdWhatsApp],
	[Telefone],
	[UserWhatsApp],
	[ClienteExterno],
	[Cadastro],
	[Status],
	[NomeRetornado],
	[UltimoAcesso],
	[Email],
	[FaceId],
	[FaceRecipentId],
	[Sexo],
	[FaceMsgId],
	[ImageProfile],
	[DataAtualizacao]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_WHATSAPPUSER]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IDX_WHATSAPPUSER] ON [dbo].[Contatos]
(
	[UserWhatsApp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Conversas_15_1767677345__K3_K9D_K1_2_4_5_6_7_8_10_11_12_13_14_15_1040]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Conversas_15_1767677345__K3_K9D_K1_2_4_5_6_7_8_10_11_12_13_14_15_1040] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC,
	[Data] DESC,
	[IdConversa] ASC
)
INCLUDE ( 	[Usuarios_IdUsr],
	[IdConversaWhats],
	[Sentido],
	[Destino],
	[Recebido],
	[Lido],
	[Mensagem],
	[Config_IdConfig],
	[Enviada],
	[LidoChat],
	[Origem],
	[Classificacao]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_Conversas_15_1954106002__K3_9]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Conversas_15_1954106002__K3_9] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC
)
INCLUDE ( 	[Data]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_Conversas_15_1954106002__K3_K1]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Conversas_15_1954106002__K3_K1] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC,
	[IdConversa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Conversas_15_1954106002__K3_K5_K6_K13_K1_9]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Conversas_15_1954106002__K3_K5_K6_K13_K1_9] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC,
	[Sentido] ASC,
	[Destino] ASC,
	[LidoChat] ASC,
	[IdConversa] ASC
)
INCLUDE ( 	[Data]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Conversas_15_1954106002__K3_K6_K2]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Conversas_15_1954106002__K3_K6_K2] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC,
	[Destino] ASC,
	[Usuarios_IdUsr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_CONTATO]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [ID_CONTATO] ON [dbo].[Conversas]
(
	[Contatos_IdContato] ASC,
	[Usuarios_IdUsr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_IDWHATS]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IDX_IDWHATS] ON [dbo].[Conversas]
(
	[IdConversaWhats] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Idx_N_Enviada]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [Idx_N_Enviada] ON [dbo].[Conversas]
(
	[Config_IdConfig] ASC,
	[Enviada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdxContatoData]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IdxContatoData] ON [dbo].[Conversas]
(
	[IdConversa] ASC,
	[Data] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SentidoData]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IX_SentidoData] ON [dbo].[Conversas]
(
	[LidoChat] ASC,
	[Sentido] ASC
)
INCLUDE ( 	[IdConversa],
	[Contatos_IdContato],
	[Data]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ixlido]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [ixlido] ON [dbo].[Conversas]
(
	[LidoChat] ASC
)
INCLUDE ( 	[Contatos_IdContato],
	[Sentido],
	[Destino]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20210305-150239]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210305-150239] ON [dbo].[Conversas]
(
	[IdConversa] DESC
)
INCLUDE ( 	[Data],
	[Sentido],
	[Lido]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Lista_15_501576825__K8_K22_1_2_3_4_5_6_7_9_10_11_12_13_14_15_16_17_18_19_20_21_23_24]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Lista_15_501576825__K8_K22_1_2_3_4_5_6_7_9_10_11_12_13_14_15_16_17_18_19_20_21_23_24] ON [dbo].[Lista]
(
	[ContatoIdContato] ASC,
	[IdEnvioLista] ASC
)
INCLUDE ( 	[IdLista],
	[CampanhaIdCampanha],
	[Nome],
	[Documento],
	[NomeDocumento],
	[Chave],
	[Telefone],
	[UserWhatsApp],
	[Ativo],
	[Status],
	[ConversaIdConvera],
	[Desativado],
	[UsuarioIdUsuario],
	[FacebookId],
	[Email],
	[Sexo],
	[Anexo1],
	[Anexo2],
	[Anexo3],
	[CodBarras],
	[enviado],
	[DtEnvio]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_env]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [ix_env] ON [dbo].[Lista]
(
	[IdEnvioLista] ASC
)
INCLUDE ( 	[IdLista],
	[ContatoIdContato]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnvioLista]    Script Date: 05/11/2024 09:41:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EnvioLista] ON [dbo].[Lista]
(
	[ContatoIdContato] ASC,
	[IdEnvioLista] DESC,
	[IdLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IXCHAVEDES]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IXCHAVEDES] ON [dbo].[Lista]
(
	[CampanhaIdCampanha] ASC,
	[Desativado] ASC
)
INCLUDE ( 	[Nome],
	[Documento],
	[Chave],
	[Telefone]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ixenvlista]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [ixenvlista] ON [dbo].[Lista]
(
	[Telefone] ASC,
	[IdEnvioLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_MensagemQueue_15_66099276__K3_1_2_4_5_6_7_9_5201]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_MensagemQueue_15_66099276__K3_1_2_4_5_6_7_9_5201] ON [dbo].[MensagemQueue]
(
	[ConversaIdconversa] ASC
)
INCLUDE ( 	[IdQueue],
	[status],
	[DataEnvio],
	[Origem],
	[UltimaTentativa],
	[erro],
	[Tentando]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXQueue]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IXQueue] ON [dbo].[MensagemQueue]
(
	[status] ASC
)
INCLUDE ( 	[IdQueue],
	[Origem],
	[UltimaTentativa],
	[erro],
	[Tentando]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_Sessao_15_325576198__K6_K2_K3_1_4_5_7_8]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Sessao_15_325576198__K6_K2_K3_1_4_5_7_8] ON [dbo].[Sessao]
(
	[Contato_Idcontato] ASC,
	[DataEncerramento] ASC,
	[Usuario_IdUsuario] ASC
)
INCLUDE ( 	[IdSession],
	[DataCriacao],
	[DataAtendimento],
	[Config_idconfig],
	[Origem]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataEnc]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IX_DataEnc] ON [dbo].[Sessao]
(
	[DataEncerramento] ASC,
	[Contato_Idcontato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXSESSAOCONTATO]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [IXSESSAOCONTATO] ON [dbo].[Sessao]
(
	[Contato_Idcontato] ASC
)
INCLUDE ( 	[IdSession]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ContatoIdx]    Script Date: 05/11/2024 09:41:06 ******/
CREATE NONCLUSTERED INDEX [ContatoIdx] ON [dbo].[StatusAtendimento]
(
	[ContatoIdContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AtendimentoSessao]  WITH CHECK ADD  CONSTRAINT [FK_AtendimentoSessao_Conversas] FOREIGN KEY([Conversa_idConversa])
REFERENCES [dbo].[Conversas] ([IdConversa])
GO
ALTER TABLE [dbo].[AtendimentoSessao] CHECK CONSTRAINT [FK_AtendimentoSessao_Conversas]
GO
ALTER TABLE [dbo].[AtendimentoSessao]  WITH CHECK ADD  CONSTRAINT [FK_AtendimentoSessao_Sessao] FOREIGN KEY([Sessao_IdSessao])
REFERENCES [dbo].[Sessao] ([IdSession])
GO
ALTER TABLE [dbo].[AtendimentoSessao] CHECK CONSTRAINT [FK_AtendimentoSessao_Sessao]
GO
ALTER TABLE [dbo].[FluxoAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_FluxoAtendimento_Campanha] FOREIGN KEY([CampanhaIdCampanha])
REFERENCES [dbo].[Campanha] ([IdCampanha])
GO
ALTER TABLE [dbo].[FluxoAtendimento] CHECK CONSTRAINT [FK_FluxoAtendimento_Campanha]
GO
ALTER TABLE [dbo].[Lista]  WITH CHECK ADD  CONSTRAINT [FK_Lista_Campanha] FOREIGN KEY([CampanhaIdCampanha])
REFERENCES [dbo].[Campanha] ([IdCampanha])
GO
ALTER TABLE [dbo].[Lista] CHECK CONSTRAINT [FK_Lista_Campanha]
GO
ALTER TABLE [dbo].[OpcaoLista]  WITH CHECK ADD  CONSTRAINT [FK_OpcaoLista_Lista] FOREIGN KEY([ListaIdlista])
REFERENCES [dbo].[Lista] ([IdLista])
GO
ALTER TABLE [dbo].[OpcaoLista] CHECK CONSTRAINT [FK_OpcaoLista_Lista]
GO
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Mensagem] FOREIGN KEY([MensagemSaudacao])
REFERENCES [dbo].[Mensagem] ([IdMensagem])
GO
ALTER TABLE [dbo].[Parametro] CHECK CONSTRAINT [FK_Parametro_Mensagem]
GO
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Mensagem1] FOREIGN KEY([MensagemErroValid])
REFERENCES [dbo].[Mensagem] ([IdMensagem])
GO
ALTER TABLE [dbo].[Parametro] CHECK CONSTRAINT [FK_Parametro_Mensagem1]
GO
ALTER TABLE [dbo].[Sessao]  WITH CHECK ADD  CONSTRAINT [FK_Sessao_Contatos] FOREIGN KEY([Contato_Idcontato])
REFERENCES [dbo].[Contatos] ([IdContato])
GO
ALTER TABLE [dbo].[Sessao] CHECK CONSTRAINT [FK_Sessao_Contatos]
GO
/****** Object:  StoredProcedure [dbo].[SP_REINDEX_GERAL]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[SP_REINDEX_GERAL]
AS 
CREATE TABLE #fraglist (
   ObjectName CHAR (255),
   ObjectId INT,
   IndexName CHAR (255),
   IndexId INT,
   Lvl INT,
   CountPages INT,
   CountRows INT,
   MinRecSize INT,
   MaxRecSize INT,
   AvgRecSize INT,
   ForRecCount INT,
   Extents INT,
   ExtentSwitches INT,
   AvgFreeBytes INT,
   AvgPageDensity INT,
   ScanDensity DECIMAL,
   BestCount INT,
   ActualCount INT,
   LogicalFrag DECIMAL,
   ExtentFrag DECIMAL)



insert into #fraglist
exec ('dbcc showcontig with all_indexes, tableresults')

DELETE #fraglist WHERE ObjectId in (SELECT id FROM SYSOBJECTS WHERE XTYPE <> 'U')
DELETE #fraglist WHERE IndexName =''

DECLARE @SQL VARCHAR(100)
DECLARE @TABELA VARCHAR(100), @INDICE VARCHAR(100)

DECLARE CURS CURSOR FOR SELECT ObjectName, IndexName FROM #fraglist --WHERE AvgPageDensity < 70 

OPEN CURS

FETCH NEXT FROM CURS INTO @TABELA, @INDICE

WHILE @@FETCH_STATUS <> -1
BEGIN
	
	SET @SQL= 'DBCC DBREINDEX('+RTRIM(@TABELA)+','+RTRIM(@INDICE)+')'
	PRINT @SQL
	EXEC (@SQL)
	FETCH NEXT FROM CURS INTO @TABELA, @INDICE
END

CLOSE CURS
DEALLOCATE CURS

GO
/****** Object:  StoredProcedure [dbo].[STP_CONS_LISTACHAT]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_CONS_LISTACHAT] --@TIPO_ACAO='CONTATOS', @IDUSR = 4
	@TIPO_ACAO VARCHAR(50),
	@IDUSR INT = -1
AS

IF @TIPO_ACAO='ESPERA'
BEGIN
	SELECT distinct
			IdContato,
			3 TipoChat,
			NomeInformado,
			Documento,
			c.Telefone,
			UserWhatsApp,
			NomeRetornado,
			QtdeNLido,
			ImageProfile,
			c.IdConfig,
			UltimaMsg,
			DataUltimaMsg,
			UltimoAcesso,
			cf.Apelido Chip,
			cf.Telefone TelefoneChip,
			c.status,
		    ISNULL( cl.Nome, 'Não Seguimentado')	Seguimento,
			u.NomeUsuario,
			Case when s.DataEncerramento is null and isnull(s.Usuario_IdUsuario,0) = 0 then 'Espera'
			     when s.DataEncerramento is null and s.Usuario_IdUsuario > 0 then 'Aberta'
				 when s.DataEncerramento is  null then 'Fechada' End StatusSessao
	FROM dbo.Contatos C with (nolock)
		 --left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
		 left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
		 left join Classificacao cl with (nolock) on cl.[idClas]=s.Classificacao
		 left join Config cf with (nolock ) on cf.[IdConfig] = C.IdConfig
		 left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
		 LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	where  s.DataEncerramento is null and s.Usuario_IdUsuario =0
	order by DataUltimaMsg desc
END

IF @TIPO_ACAO='ATIVOS'
BEGIN
	SELECT distinct
			IdContato,
			2 TipoChat,
			NomeInformado,
			Documento,
			c.Telefone,
			UserWhatsApp,
			NomeRetornado,
			QtdeNLido,
			ImageProfile,
			c.IdConfig,
			UltimaMsg,
			DataUltimaMsg,
			UltimoAcesso,
			cf.Apelido Chip,
			cf.Telefone TelefoneChip,
			c.status,
		    ISNULL( cl.Nome, 'Não Seguimentado')	Seguimento,
			u.NomeUsuario,
			Case when s.DataEncerramento is null and isnull(s.Usuario_IdUsuario,0) = 0 then 'Espera'
			     when s.DataEncerramento is null and s.Usuario_IdUsuario > 0 then 'Aberta'
				 when s.DataEncerramento is  null then 'Fechada' End StatusSessao
	FROM dbo.Contatos C with (nolock)
		 --left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
		 left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
		 left join Classificacao cl with (nolock) on cl.[idClas]=s.Classificacao
		 left join Config cf with (nolock ) on cf.[IdConfig] = C.IdConfig
		 left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
	LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	where  s.DataEncerramento is null and s.Usuario_IdUsuario = @IDUSR
	order by DataUltimaMsg desc
END

IF @TIPO_ACAO='CONTATOS'
BEGIN
	DECLARE @ULT_SESSAO INT

	

	IF EXISTS(SELECT IDUSR FROM Usuarios WHERE Permissao=3 AND IdUsr= @IDUSR)
	BEGIN
	SELECT distinct
			IdContato,
			1 TipoChat,
			NomeInformado,
			Documento,
			c.Telefone,
			UserWhatsApp,
			NomeRetornado,
			QtdeNLido,
			ImageProfile,
			c.IdConfig,
			UltimaMsg,
			DataUltimaMsg,
			UltimoAcesso,
			cf.Apelido Chip,
			cf.Telefone TelefoneChip,
			c.status,
		    ISNULL( cl.Nome, 'Não Seguimentado')	Seguimento,
			u.NomeUsuario,
			Case when s.DataEncerramento is null and isnull(s.Usuario_IdUsuario,0) = 0 then 'Espera'
			     when s.DataEncerramento is null and s.Usuario_IdUsuario > 0 then 'Aberta'
				 when s.DataEncerramento is not null then 'Fechada' End StatusSessao
			
	FROM dbo.Contatos C with (nolock)
		 --left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
		 LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
		 left join VW_ULTIMA_SESSAO vc with (nolock) on vc.Contato_Idcontato = c.IdContato
		 left join sessao s with (nolock) on s.IdSession = vc.IdSession
		 left join Classificacao cl with (nolock) on cl.[idClas]=s.Classificacao
		 left join Config cf with (nolock ) on cf.[IdConfig] = C.IdConfig
		 left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
	WHERE Contatos_IdContato IN (SELECT [Contatos_IdContato] from  CONVERSAS where[Usuarios_IdUsr] =  @IDUSR) 
	order by DataUltimaMsg desc
	END
	ELSE
	BEGIN
	SELECT distinct
			IdContato,
			1 TipoChat,
			NomeInformado,
			Documento,
			c.Telefone,
			UserWhatsApp,
			NomeRetornado,
			QtdeNLido,
			ImageProfile,
			c.IdConfig,
			UltimaMsg,
			DataUltimaMsg,
			UltimoAcesso,
			cf.Apelido Chip,
			cf.Telefone TelefoneChip,
			c.status,
		    ISNULL( cl.Nome, 'Não Seguimentado')	Seguimento,
			u.NomeUsuario,
			Case when s.DataEncerramento is null and isnull(s.Usuario_IdUsuario,0) = 0 then 'Espera'
			     when s.DataEncerramento is null and s.Usuario_IdUsuario > 0 then 'Aberta'
				 when s.DataEncerramento is not null then 'Fechada' End StatusSessao
	FROM dbo.Contatos C with (nolock)
		 --left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
		 LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
		 left join VW_ULTIMA_SESSAO vc with (nolock) on vc.Contato_Idcontato = c.IdContato
		 left join sessao s with (nolock) on s.IdSession = vc.IdSession
		 left join Classificacao cl with (nolock) on cl.[idClas]=s.Classificacao
		 left join Config cf with (nolock ) on cf.[IdConfig] = C.IdConfig
		 left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
		order by DataUltimaMsg desc
	END	
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_ANEXOS]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_ANEXOS] -- @TIPO_ACAO='get', @CONVERSASIDCONVERSA=     20573
@TIPO_ACAO VARCHAR(50),
@ID INT=0, 
@CONVERSASIDCONVERSA INT = 0, 
@URL VARCHAR(MAX)= NULL, 
@CHAVE VARCHAR(MAX)= NULL, 
@EMPRESACLIENTEID INT = 0, 
@NOMEARQUIVO VARCHAR(MAX)= NULL,
@TIPO VARCHAR(MAX) = NULL

AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	
    IF EXISTS(SELECT * FROM dbo.Anexos WHERE IdAnexo=@ID)
	BEGIN
		UPDATE dbo.Anexos
		SET ConversasIdconversa= CASE WHEN @CONVERSASIDCONVERSA = 0 THEN ConversasIdconversa ELSE @CONVERSASIDCONVERSA END ,
		    url=ISNULL(@URL,url),
		    chave=ISNULL(@CHAVE,chave),
		    EmpresaClienteId =   CASE WHEN @EMPRESACLIENTEID = 0 THEN EmpresaClienteId ELSE @EMPRESACLIENTEID END ,
		    NomeArquivo =ISNULL(@NOMEARQUIVO,NomeArquivo),
			TIPO = ISNULL(@TIPO,Tipo)
		WHERE IdAnexo=@ID
		    
		 SELECT * FROM Anexos WHERE IdAnexo=@ID
	END
	ELSE
	BEGIN
		INSERT INTO  Anexos (  ConversasIdconversa, url, chave, EmpresaClienteId, NomeArquivo,Tipo)
		VALUES ( @CONVERSASIDCONVERSA, @URL, @CHAVE, @EMPRESACLIENTEID, @NOMEARQUIVO, @Tipo)
		
		 SELECT * FROM Anexos WHERE IdAnexo=@@IDENTITY
	END
END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT * 
	FROM Anexos
	WHERE (@CHAVE IS NULL OR CHAVE = @CHAVE)
	      AND (@CONVERSASIDCONVERSA =0 OR ConversasIdconversa=@CONVERSASIDCONVERSA)


END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CALCULOINTEGRACAO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STP_TB_CALCULOINTEGRACAO]
 @TIPO_ACAO NVarchar(max),
@IdCalc int = 0, 
@Integracao_integracao int =0 , 
@Vencimento datetime = null,
@Parcelas int =0, 
@Desconto decimal(18,2) = 0


as

IF @TIPO_ACAO='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM CALCULOINTEGRACAO WHERE IdCalc=@IdCalc)
	BEGIN
		UPDATE CALCULOINTEGRACAO SET 
		 
		Integracao_integracao= @Integracao_integracao, 
		Parcelas= @Parcelas, 
		Desconto= @Desconto, 
		Vencimento=@Vencimento

		WHERE IdCalc = @IdCalc

		SELECT * FROM CALCULOINTEGRACAO WHERE IdCalc=@IdCalc
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].CALCULOINTEGRACAO(  Integracao_integracao, Parcelas, Desconto, Vencimento)
		VALUES  ( @Integracao_integracao, @Parcelas, @Desconto, @Vencimento)

		SELECT * FROM CALCULOINTEGRACAO WHERE IdCalc=@@IDENTITY
	END
END

IF @TIPO_ACAO='GET'
BEGIN
	SELECT * FROM CALCULOINTEGRACAO WHERE IdCalc= @IdCalc   OR Integracao_integracao = @Integracao_integracao
END

IF @TIPO_ACAO='DELETE'
BEGIN
	delete CALCULOINTEGRACAO WHERE  IdCalc= @IdCalc    
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CAMPANHA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CAMPANHA]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOMECAMPANHA VARCHAR(50)=NULL,
	@DATACRIACAO DATETIME=NULL,
	@DATAENVIO DATETIME=NULL,
	@DATATERMINO DATETIME=NULL
	
AS

IF @TIPO_ACAO='SALVA'
BEGIN
	IF EXISTS(SELECT * FROM Campanha WHERE IdCampanha=@ID)
	BEGIN
		UPDATE CAMPANHA
		SET NomeCampanha=ISNULL(@NOMECAMPANHA,NomeCampanha),
		    DataEnvio=ISNULL(@DATAENVIO,DataEnvio),
		    DataTermino=ISNULL(@DATATERMINO,DataTermino)
		WHERE IdCampanha=@ID
		    
		 SELECT * FROM CAMPANHA WHERE IdCampanha=@ID
	END
	ELSE
	BEGIN
		INSERT INTO  CAMPANHA ( NomeCampanha, DataCriacao, DataEnvio, DataTermino)
		VALUES (@NOMECAMPANHA,GETDATE(),@DATAENVIO,@DATATERMINO)
		
		select * from campanha where IdCampanha=@@IDENTITY
	END
END

IF @TIPO_ACAO='GET'
BEGIN
	SELECT * 
	FROM CAMPANHA
	WHERE (@ID=0 OR IdCampanha=@ID) AND
		  (@NOMECAMPANHA IS NULL OR NomeCampanha = @NOMECAMPANHA) AND
		  (@DATACRIACAO IS NULL OR DataCriacao =@DATACRIACAO ) AND
		  (@DATAENVIO IS NULL OR DataEnvio = @DATAENVIO)AND
		  (@DATATERMINO IS NULL OR DataTermino =@DATATERMINO )

END


GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CONFIG]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CONFIG]-- @TIPO_ACAO='STATUSCONECCAO' , @ID=1, @STATUSCONECCAO = 1
	@TIPO_ACAO VARCHAR(50),
	@ID INT =0,
	@TELEFONE VARCHAR(50)='',
	@SENHA VARCHAR(50)='',
	@APELIDO VARCHAR(50)='',
	@STATUSCONECCAO BIT =0,
	@EquipeIdEquipe int =0
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN
	
	IF NOT EXISTS(SELECT * FROM Config WHERE (IdConfig =@ID or Telefone=@TELEFONE))
	BEGIN
	
	    INSERT INTO dbo.Config ( Telefone, Senha, Apelido,Desativado)
	    VALUES (@TELEFONE,@SENHA,@APELIDO,0)
	    
	   SELECT * ,[Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat FROM Config WHERE IdConfig = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE dbo.Config 
		SET   Telefone = @TELEFONE, 
		      Senha=@SENHA, 
		      Apelido=@APELIDO,
			  Desativado =0
		WHERE IdConfig =@ID
		      or Telefone=@TELEFONE


		SELECT *,[Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat FROM Config WHERE  IdConfig =@ID or Telefone=@TELEFONE
		
	END
END

IF @TIPO_ACAO = 'GET_ALL_ATV'
BEGIN
	
	SELECT * ,[Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat
	FROM Config 
	WHERE Desativado = 0
END

IF @TIPO_ACAO = 'GET_ALL'
BEGIN
	
	SELECT *, [Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat
	FROM Config 
	WHERE Desativado = 0

END

IF @TIPO_ACAO = 'GET_CHIP_LISTA'
BEGIN
	
	SELECT *,[Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat
	FROM Config 
	WHERE ChipLista = 1

END

IF @TIPO_ACAO = 'DESATIVA'
BEGIN
	
	UPDATE Config 
	SET  Desativado=1 
	WHERE IdConfig = @ID

END

IF @TIPO_ACAO = 'ATIVA'
BEGIN
	
	UPDATE Config 
	SET  Desativado=0
	WHERE IdConfig = @ID

END

IF @TIPO_ACAO = 'CHIPLISTA'
BEGIN
	
	SELECT TOP 1 CONFIG.*, [Apelido] + ' - ' + [dbo].[fnFormatPhoneNumber](telefone) TelFormat
	FROM CONFIG ,
	     Parametro
	WHERE Parametro.IdParametro =1 AND 
	      CONFIG.QtdeEnvio <= Parametro.QtdeLista AND 
	      CONFIG.DataEnvio= dbo.DATA_CHEIA(GETDATE()) AND 
	      CONFIG.CHIPLISTA =1
    ORDER BY CONFIG.QtdeEnvio

END

IF @TIPO_ACAO = 'ADDLIGACAO'
BEGIN
	
	UPDATE CONFIG
	SET QtdeEnvio =QtdeEnvio+1
	WHERE IdConfig=@ID

END

IF @TIPO_ACAO = 'INICIALISTA'
BEGIN
	
	UPDATE CONFIG
	SET QtdeEnvio =0,
	    DataEnvio= dbo.DATA_CHEIA(GETDATE())
	WHERE CHIPLISTA =1 AND
	      DataEnvio < dbo.DATA_CHEIA(GETDATE())

END

IF @TIPO_ACAO = 'HABILITALISTA'
BEGIN
	UPDATE CONFIG
	SET ChipLista=1
	WHERE IdConfig = @ID
END

IF @TIPO_ACAO = 'DESABILITACHIP'
BEGIN
	UPDATE CONFIG
	SET ChipLista=0
	WHERE IdConfig = @ID
END

IF @TIPO_ACAO = 'STATUSCONECCAO'
BEGIN
	UPDATE CONFIG
	SET StatusConeccao=@STATUSCONECCAO
	WHERE IdConfig = @ID
END




GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CONTATO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CONTATO]   --@TIPO_ACAO='GETCONTATO_SESSAO', @IDUSUARIO=15  --, @IDWHATSAPP = '5511963191922@c.us' --CONTATO_LISTA' ,@IDCAMPANHA=0,@IDUSUARIO=1
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME_INFORMADO VARCHAR(50) = NULL,
	@NOMERETORNADO VARCHAR(50) = NULL,
	@DOCUMENTO VARCHAR(50) = NULL,
	@NOMEDOC VARCHAR(50) = NULL,
	@CODIGO VARCHAR(50) = NULL,
	@IDWHATSAPP VARCHAR(50) = NULL,
	@TELEFONE VARCHAR(50) = NULL,
	@USERWHATSAPP VARCHAR(50) = NULL,
	@CLIENTEEXTERNO VARCHAR(50) = NULL,
	@CADASTRO VARCHAR(50) = NULL,
	@ULTACESSO DATETIME = NULL,
	@STATUS VARCHAR(50) = NULL,
	@IDUSUARIO int =0,
	@IDCAMPANHA INT =0,
	@EMAIL VARCHAR(50) = NULL, 
	@FACEID VARCHAR(50) = NULL, 
	@FACERECIPENTID VARCHAR(50) = NULL, 
	@SEXO VARCHAR(50) = NULL, 
	@FACEMSGID VARCHAR(50) = NULL,
    @CAMPANHA_IDCAMPANHA INT = 0,
	@ImageProfile varchar(max) = null,
	@IdConfig int =0
AS

DECLARE @ENVIO INT, @IDCC int, @SERVIDOR_DOWNLOAD VARCHAR(MAX)

SELECT TOP 1 @SERVIDOR_DOWNLOAD=[ServidorAnexos] FROM PARAMETRO

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM  dbo.Contatos WHERE IdContato = @ID 
												 or IdWhatsApp = @IDWHATSAPP
												 or ClienteExterno =   RIGHT(replace(@IDWHATSAPP, '@c.us',''), 8))
	BEGIN
		UPDATE dbo.Contatos
		SET   NomeInformado= case when NomeInformado like '%@%' then @NOMERETORNADO else isnull(@NOME_INFORMADO,NomeInformado) end,
		      Documento=ISNULL(@DOCUMENTO, Documento),
		      NomeDoc=ISNULL(@NOMEDOC, NomeDoc),
		      Codigo=ISNULL(@CODIGO, Codigo),
		      IdWhatsApp=ISNULL(@IDWHATSAPP, IdWhatsApp),
		      Telefone=ISNULL(@TELEFONE, Telefone),
		      UserWhatsApp=ISNULL(@USERWHATSAPP, UserWhatsApp),
		      ClienteExterno=RIGHT(replace(@IDWHATSAPP, '@c.us',''), 8),
		      Cadastro=ISNULL(@CADASTRO, Cadastro),
		      Status=ISNULL(@STATUS,Status),
		      NomeRetornado=ISNULL(@NOMERETORNADO,NomeRetornado),
		      UltimoAcesso=ISNULL(@ULTACESSO,UltimoAcesso),
		      FaceId = ISNULL(@FACEID,FaceId),
		      FaceRecipentId = ISNULL(@FACERECIPENTID,FaceRecipentId),
		      FaceMsgId = ISNULL(@FACEMSGID,FaceMsgId),
		      Email = ISNULL(@EMAIL,Email),
		      Sexo = ISNULL(@SEXO,Sexo),
			  ImageProfile = ISNULL(@ImageProfile,
			                    case when len( isnull(ImageProfile,'')) <= 3 then @SERVIDOR_DOWNLOAD +  @IDWHATSAPP else ImageProfile end),
			  IdConfig=case when @IdConfig=0 then IdConfig else @IdConfig end,
              [DataAtualizacao]=getdate(),
			  @IDCC = IdContato
		WHERE IdContato = @ID OR IdWhatsApp = @IDWHATSAPP
        


		SELECT TOP 1 @ENVIO=isnull( MAX(IDENVIO),0)
		FROM [dbo].[EnvioLista]  e,lista l 
		WHERE e.[IdEnvio]  =l.IdEnvioLista and l.ContatoIdContato =   @IDCC

        SELECT 	IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
				IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
				IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
				QtdeNLido, UltimaMsg, DataUltimaMsg
		FROM Contatos c with (nolock)
			left join lista l  with (nolock) on c.IdContato = l.ContatoIdContato  
		    left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato 
	        left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
			LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
		WHERE   (IdContato = @id  OR c.IdWhatsApp = @IDWHATSAPP) and 
		        (l.[IdEnvioLista] is null or l.[IdEnvioLista] = @ENVIO)
				and s.DataEncerramento is null
		order by UltimaMsg desc



	END
	ELSE
	BEGIN
		INSERT INTO dbo.Contatos (NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status,NomeRetornado,ImageProfile,IdConfig,[DataAtualizacao])
		VALUES (isnull(@NOME_INFORMADO, @IDWHATSAPP),@DOCUMENTO ,@NOMEDOC ,@CODIGO ,@IDWHATSAPP ,@TELEFONE ,	@USERWHATSAPP ,RIGHT(replace(@IDWHATSAPP, '@c.us',''), 8) ,@CADASTRO ,@STATUS ,isnull(@NOMERETORNADO,@IDWHATSAPP),@ImageProfile,@IdConfig,getdate())

		set @IDCC = @@IDENTITY

		SELECT 	IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
				IdSession, Contato_Idcontato, Usuario_IdUsuario, s.DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
				IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
				QtdeNLido, UltimaMsg, DataUltimaMsg
		FROM Contatos c with (nolock)
			left join lista l  with (nolock) on c.IdContato = l.ContatoIdContato  
		    left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	        left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
			LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	    WHERE IdContato = @IDCC
		order by UltimaMsg desc
	END
END

IF @TIPO_ACAO = 'GET'
BEGIN

	SELECT distinct top 300
	IdContato, NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	QtdeNLido, UltimaMsg, DataUltimaMsg
	FROM dbo.Contatos C with (nolock)
	--left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
    left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
	LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	where  (C.IdContato=@ID ) or @ID=0
	order by DataUltimaMsg desc


END



IF @TIPO_ACAO = 'GETCONFIG'
BEGIN



	SELECT 	IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ContatoIdContato, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId, l.Email
	QtdeNLido, UltimaMsg, DataUltimaMsg
	FROM dbo.Contatos C with (nolock)
		left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
		left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
		left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
		LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	where (c.IdConfig = @IdConfig)
    order by UltimaMsg desc

END
IF @TIPO_ACAO = 'GETCONTATO_USR'
BEGIN
--declare @IDUSUARIO int = 1
	SELECT top 100  IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ContatoIdContato, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId, l.Email
	QtdeNLido, UltimaMsg, DataUltimaMsg
	FROM dbo.Contatos c with (nolock)
	left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio with (nolock))
	left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr
	LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	WHERE  c.IdContato in (select Contatos_IdContato 
	                        from Conversas with (nolock)
							where  destino='chat' and  
							       ( @IDUSUARIO in (select idusr from usuarios with (nolock) where Permissao <=2) ) or Usuarios_IdUsr =@IDUSUARIO )
	order by UltimaMsg desc, NomeRetornado  

END


IF @TIPO_ACAO = 'GETLISTACONTATO'
BEGIN


		--UPDATE LISTA SET ContatoIdContato = C.IdContato
		--FROM Contatos c
		--	inner join lista l on c.Telefone = l.Telefone  
		--	inner join Campanha cc on cc.IdCampanha = l.CampanhaIdCampanha
		--WHERE cc.DataTermino > getdate()

		--update Contatos set Documento = l.Documento, NomeInformado=l.Nome, NomeDoc=l.NomeDocumento,[DataAtualizacao]=getdate()
		--FROM Contatos c
		--inner join lista l on c.Telefone = l.Telefone  
		--WHERE l.CampanhaIdCampanha = @CAMPANHA_IDCAMPANHA


		SELECT  top 100 IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
						IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
						IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
						IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ContatoIdContato, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId, l.Email
						QtdeNLido, UltimaMsg, DataUltimaMsg 
		FROM Contatos c with (nolock) 
				left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join sessao s with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr 
				LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
		WHERE  l.IdEnvioLista =  @ENVIO and C.IdWhatsApp = @USERWHATSAPP
		order by UltimaMsg desc



END


IF @TIPO_ACAO = 'PROFILE'
BEGIN


		UPDATE contatos SET  [ImageProfile]=  @ImageProfile,[DataAtualizacao]=getdate()
		WHERE IdContato = @ID OR IdWhatsApp = @IdWhatsApp
		

		SELECT @@ROWCOUNT



END

IF @TIPO_ACAO = 'GETCONTATO_LISTA'
BEGIN
	
	SELECT  distinct IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, s.DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ContatoIdContato, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId, l.Email
	QtdeNLido, UltimaMsg, DataUltimaMsg
	FROM dbo.Contatos c
			    left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join campanha ca with (nolock) on l.[CampanhaIdCampanha] = ca.IdCampanha
				left join sessao s  with (nolock) on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr 
				LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
    order by  UltimaMsg desc, QtdeNLido desc,  NomeRetornado 

END


IF @TIPO_ACAO = 'GETCONTATO_SESSAO'
BEGIN
	
	SELECT  distinct IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, s.DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ContatoIdContato, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId,
	v.QtdeNLido, UltimaMsg, DataUltimaMsg 
	FROM dbo.Contatos c
			    left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join campanha ca with (nolock) on l.[CampanhaIdCampanha] = ca.IdCampanha
				left join sessao s  with (nolock) on s.Contato_Idcontato = c.IdContato 
				left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr 
				LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	WHERE S.[Usuario_IdUsuario] = @IDUSUARIO and s.DataEncerramento is null
    order by  V.[DataUltimaMsg] desc ,  UltimaMsg desc, QtdeNLido desc,  NomeRetornado 

END


IF @TIPO_ACAO = 'LIDOCHAT'
BEGIN
	UPDATE dbo.Conversas SET Lido=1 WHERE Contatos_IdContato = @ID
END


IF @TIPO_ACAO = 'CHECK-ESPERA'
BEGIN
    
	SELECT TOP  1  1 Tipo,@IDUSUARIO Usuarios,Contatos_IdContato, QtdeNLido, S.IdSession, UltimaMsg, DataUltimaMsg,
	 (select count(*) from Sessao WHERE Usuario_IdUsuario =0 and [DataEncerramento] is null ) Ativos
	FROM Sessao S 
	LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = S.Contato_Idcontato
	WHERE S.DataEncerramento IS NULL AND S.Usuario_IdUsuario = 0
	ORDER BY S.IdSession DESC
END



IF @TIPO_ACAO = 'CKECK-ATIVOS'
BEGIN
	SELECT TOP  1 2 Tipo, @IDUSUARIO Usuarios,Contatos_IdContato, QtdeNLido, S.IdSession, UltimaMsg, DataUltimaMsg, 
	 (select count(*) from Sessao WHERE Usuario_IdUsuario =@IDUSUARIO and [DataEncerramento] is null ) Ativos
	FROM Sessao S 
	LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = S.Contato_Idcontato
	WHERE S.DataEncerramento IS NULL AND S.Usuario_IdUsuario =    @IDUSUARIO
	ORDER BY DataUltimaMsg DESC
END

IF @TIPO_ACAO = 'CHECK-CONTATOS'
BEGIN
	IF EXISTS(SELECT IDUSR FROM Usuarios WHERE Permissao=3 AND IdUsr= @IDUSUARIO)
	BEGIN
		SELECT TOP  1 3 Tipo, @IDUSUARIO Usuarios, Contatos_IdContato, QtdeNLido, UltimaMsg, DataUltimaMsg
		FROM  VW_QTDENLIDA V  
		WHERE Contatos_IdContato IN (SELECT [Contatos_IdContato] from  CONVERSAS where[Usuarios_IdUsr] =  @IDUSUARIO)
		order by DataUltimaMsg desc
	END
	ELSE
	BEGIN
		SELECT TOP  1 3 Tipo, @IDUSUARIO Usuarios,Contatos_IdContato, QtdeNLido, UltimaMsg, DataUltimaMsg
        FROM  VW_QTDENLIDA V  
		order by DataUltimaMsg desc
	END	
END

IF @TIPO_ACAO = 'DELETE'
BEGIN
	DELETE dbo.Contatos WHERE IdContato = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CONTATO_BKP]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CONTATO_BKP]  -- @TIPO_ACAO='SALVA', @IDWHATSAPP = '5511963191922@c.us' --CONTATO_LISTA' ,@IDCAMPANHA=0,@IDUSUARIO=1
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME_INFORMADO VARCHAR(50) = NULL,
	@NOMERETORNADO VARCHAR(50) = NULL,
	@DOCUMENTO VARCHAR(50) = NULL,
	@NOMEDOC VARCHAR(50) = NULL,
	@CODIGO VARCHAR(50) = NULL,
	@IDWHATSAPP VARCHAR(50) = NULL,
	@TELEFONE VARCHAR(50) = NULL,
	@USERWHATSAPP VARCHAR(50) = NULL,
	@CLIENTEEXTERNO VARCHAR(50) = NULL,
	@CADASTRO VARCHAR(50) = NULL,
	@ULTACESSO DATETIME = NULL,
	@STATUS VARCHAR(50) = NULL,
	@IDUSUARIO int =0,
	@IDCAMPANHA INT =0,
	@EMAIL VARCHAR(50) = NULL, 
	@FACEID VARCHAR(50) = NULL, 
	@FACERECIPENTID VARCHAR(50) = NULL, 
	@SEXO VARCHAR(50) = NULL, 
	@FACEMSGID VARCHAR(50) = NULL,
    @CAMPANHA_IDCAMPANHA INT = 0,
	@ImageProfile varchar(max) = null,
	@IdConfig int =0
AS

DECLARE @ENVIO INT, @IDCC int, @SERVIDOR_DOWNLOAD VARCHAR(MAX)

SELECT TOP 1 @SERVIDOR_DOWNLOAD=[ServidorAnexos] FROM PARAMETRO

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM  dbo.Contatos WHERE IdContato = @ID 
												 or IdWhatsApp = @IDWHATSAPP)
	BEGIN
		UPDATE dbo.Contatos
		SET   NomeInformado= case when NomeInformado like '%@%' then @NOMERETORNADO else isnull(@NOME_INFORMADO,NomeInformado) end,
		      Documento=ISNULL(@DOCUMENTO, Documento),
		      NomeDoc=ISNULL(@NOMEDOC, NomeDoc),
		      Codigo=ISNULL(@CODIGO, Codigo),
		      IdWhatsApp=ISNULL(@IDWHATSAPP, IdWhatsApp),
		      Telefone=ISNULL(@TELEFONE, Telefone),
		      UserWhatsApp=ISNULL(@USERWHATSAPP, UserWhatsApp),
		      ClienteExterno=ISNULL(@CLIENTEEXTERNO, ClienteExterno),
		      Cadastro=ISNULL(@CADASTRO, Cadastro),
		      Status=ISNULL(@STATUS,Status),
		      NomeRetornado=ISNULL(@NOMERETORNADO,NomeRetornado),
		      UltimoAcesso=ISNULL(@ULTACESSO,UltimoAcesso),
		      FaceId = ISNULL(@FACEID,FaceId),
		      FaceRecipentId = ISNULL(@FACERECIPENTID,FaceRecipentId),
		      FaceMsgId = ISNULL(@FACEMSGID,FaceMsgId),
		      Email = ISNULL(@EMAIL,Email),
		      Sexo = ISNULL(@SEXO,Sexo),
			  ImageProfile = ISNULL(@ImageProfile,case when len( isnull(ImageProfile,'')) <= 3 then @SERVIDOR_DOWNLOAD +  @IDWHATSAPP else ImageProfile end),
			  IdConfig=case when @IdConfig=0 then IdConfig else @IdConfig end,
              [DataAtualizacao]=getdate(),
			  @IDCC = IdContato
		WHERE IdContato = @ID OR IdWhatsApp = @IDWHATSAPP
        


		SELECT TOP 1 @ENVIO=isnull( MAX(IDENVIO),0)
		FROM [dbo].[EnvioLista]  e,lista l 
		WHERE e.[IdEnvio]  =l.IdEnvioLista and l.ContatoIdContato =   @IDCC

        SELECT * , (select count(*) from conversas where Contatos_IdContato = C.IdContato and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
  	               (select isnull(max(IdConversa),0) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
				   (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
		FROM Contatos c
			left join lista l on c.IdContato = l.ContatoIdContato  
		    left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	        left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
		WHERE   (IdContato = 0  OR IdWhatsApp = @IDWHATSAPP) and 
		        (l.[IdEnvioLista] is null or l.[IdEnvioLista] = @ENVIO)
		order by UltimaMsg desc



	END
	ELSE
	BEGIN
		INSERT INTO dbo.Contatos (NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status,NomeRetornado,ImageProfile,IdConfig,[DataAtualizacao])
		VALUES (isnull(@NOME_INFORMADO, @IDWHATSAPP),@DOCUMENTO ,@NOMEDOC ,@CODIGO ,@IDWHATSAPP ,@TELEFONE ,	@USERWHATSAPP ,@CLIENTEEXTERNO ,@CADASTRO ,@STATUS ,isnull(@NOMERETORNADO,@IDWHATSAPP),@ImageProfile,@IdConfig,getdate())

		set @IDCC = @@IDENTITY

		SELECT * ,(select isnull(count(*),0) from conversas where Contatos_IdContato = C.IdContato and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
	              (select isnull(max(IdConversa),0) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
				   (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
		FROM Contatos c
			left join lista l on c.Telefone = l.Telefone and l.[IdEnvioLista] =@ENVIO
			left join Campanha cc on cc.IdCampanha = l.CampanhaIdCampanha 
		WHERE   (IdContato = @IDCC)
		order by UltimaMsg desc
	END
END

IF @TIPO_ACAO = 'GET'
BEGIN

	SELECT distinct * ,(select count(*) from conversas where Contatos_IdContato = C.IdContato and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
                    	(select max(IdConversa) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
						 (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
	FROM dbo.Contatos C
	left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
    left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
	where  (C.IdContato=@ID ) or @ID=0
	order by UltimaMsg desc

END



IF @TIPO_ACAO = 'GETCONFIG'
BEGIN



	SELECT * ,(select count(*) from conversas where Contatos_IdContato = C.IdContato  and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
           	(select max(IdConversa) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
			 (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
	FROM dbo.Contatos C
		left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
		left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
		left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
	where (c.IdConfig = @IdConfig)
    order by UltimaMsg desc

END
IF @TIPO_ACAO = 'GETCONTATO_USR'
BEGIN
--declare @IDUSUARIO int = 1
	SELECT  * ,(select count(*) from conversas where Contatos_IdContato = c.IdContato  and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
           	 (select max(IdConversa) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
			  (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
	FROM dbo.Contatos c
	left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
	left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
	WHERE  c.IdContato in (select Contatos_IdContato 
	                        from Conversas 
							where  destino='chat' and  
							       ( @IDUSUARIO in (select idusr from usuarios where Permissao <=2) ) or Usuarios_IdUsr =@IDUSUARIO )
	order by UltimaMsg desc, NomeRetornado  

END


IF @TIPO_ACAO = 'GETLISTACONTATO'
BEGIN


		--UPDATE LISTA SET ContatoIdContato = C.IdContato
		--FROM Contatos c
		--	inner join lista l on c.Telefone = l.Telefone  
		--	inner join Campanha cc on cc.IdCampanha = l.CampanhaIdCampanha
		--WHERE cc.DataTermino > getdate()

		--update Contatos set Documento = l.Documento, NomeInformado=l.Nome, NomeDoc=l.NomeDocumento,[DataAtualizacao]=getdate()
		--FROM Contatos c
		--inner join lista l on c.Telefone = l.Telefone  
		--WHERE l.CampanhaIdCampanha = @CAMPANHA_IDCAMPANHA


		SELECT * ,(select count(*) from conversas where Contatos_IdContato = C.IdContato and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
	              (select max(IdConversa) from Conversas where Contatos_IdContato = c.IdContato) as UltimaMsg,
				   (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
		FROM Contatos c 
				left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr 
		WHERE  l.IdEnvioLista =  @ENVIO and C.IdWhatsApp = @USERWHATSAPP
		order by UltimaMsg desc



END


IF @TIPO_ACAO = 'PROFILE'
BEGIN


		UPDATE contatos SET  [ImageProfile]=  @ImageProfile,[DataAtualizacao]=getdate()
		WHERE IdContato = @ID OR IdWhatsApp = @IdWhatsApp
		

		SELECT @@ROWCOUNT



END

IF @TIPO_ACAO = 'GETCONTATO_LISTA'
BEGIN
	
	SELECT  distinct c.* ,(select count(*) from conversas where Contatos_IdContato = c.IdContato  and ((sentido='entrada' and LidoChat=0) or (destino='transf' and LidoChat=0 ) )) QtdeNLido,
	CA.IdCampanha,CA.NomeCampanha,
	                      (select max(IdConversa) from Conversas where Contatos_IdContato = c.IdContato) UltimaMsg,
						  (select max(data) from Conversas where Contatos_IdContato = c.IdContato) DataUltimaMsg
	FROM dbo.Contatos c
			    left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join campanha ca on l.[CampanhaIdCampanha] = ca.IdCampanha
				left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr 
    order by  UltimaMsg desc, QtdeNLido desc,  NomeRetornado 

	

END

IF @TIPO_ACAO = 'LIDOCHAT'
BEGIN
	UPDATE dbo.Conversas SET Lido=1 WHERE Contatos_IdContato = @ID
END


IF @TIPO_ACAO = 'DELETE'
BEGIN
	DELETE dbo.Contatos WHERE IdContato = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CONTATOT]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CONTATOT] -- @TIPO_ACAO='GET', @IDWHATSAPP = '5511963191922@c.us' --CONTATO_LISTA' ,@IDCAMPANHA=0,@IDUSUARIO=1
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME_INFORMADO VARCHAR(50) = NULL,
	@NOMERETORNADO VARCHAR(50) = NULL,
	@DOCUMENTO VARCHAR(50) = NULL,
	@NOMEDOC VARCHAR(50) = NULL,
	@CODIGO VARCHAR(50) = NULL,
	@IDWHATSAPP VARCHAR(50) = NULL,
	@TELEFONE VARCHAR(50) = NULL,
	@USERWHATSAPP VARCHAR(50) = NULL,
	@CLIENTEEXTERNO VARCHAR(50) = NULL,
	@CADASTRO VARCHAR(50) = NULL,
	@ULTACESSO DATETIME = NULL,
	@STATUS VARCHAR(50) = NULL,
	@IDUSUARIO int =0,
	@IDCAMPANHA INT =0,
	@EMAIL VARCHAR(50) = NULL, 
	@FACEID VARCHAR(50) = NULL, 
	@FACERECIPENTID VARCHAR(50) = NULL, 
	@SEXO VARCHAR(50) = NULL, 
	@FACEMSGID VARCHAR(50) = NULL,
    @CAMPANHA_IDCAMPANHA INT = 0,
	@ImageProfile varchar(max) = null,
	@IdConfig int =0
AS

DECLARE @ENVIO INT, @IDCC int, @SERVIDOR_DOWNLOAD VARCHAR(MAX)

SELECT TOP 1 @SERVIDOR_DOWNLOAD=[ServidorAnexos] FROM PARAMETRO

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM  dbo.Contatos WHERE IdContato = @ID 
												 or IdWhatsApp = @IDWHATSAPP)
	BEGIN
		UPDATE dbo.Contatos
		SET   NomeInformado= case when NomeInformado like '%@%' then @NOMERETORNADO else isnull(@NOME_INFORMADO,NomeInformado) end,
		      Documento=ISNULL(@DOCUMENTO, Documento),
		      NomeDoc=ISNULL(@NOMEDOC, NomeDoc),
		      Codigo=ISNULL(@CODIGO, Codigo),
		      IdWhatsApp=ISNULL(@IDWHATSAPP, IdWhatsApp),
		      Telefone=ISNULL(@TELEFONE, Telefone),
		      UserWhatsApp=ISNULL(@USERWHATSAPP, UserWhatsApp),
		      ClienteExterno=ISNULL(@CLIENTEEXTERNO, ClienteExterno),
		      Cadastro=ISNULL(@CADASTRO, Cadastro),
		      Status=ISNULL(@STATUS,Status),
		      NomeRetornado=ISNULL(@NOMERETORNADO,NomeRetornado),
		      UltimoAcesso=ISNULL(@ULTACESSO,UltimoAcesso),
		      FaceId = ISNULL(@FACEID,FaceId),
		      FaceRecipentId = ISNULL(@FACERECIPENTID,FaceRecipentId),
		      FaceMsgId = ISNULL(@FACEMSGID,FaceMsgId),
		      Email = ISNULL(@EMAIL,Email),
		      Sexo = ISNULL(@SEXO,Sexo),
			  ImageProfile = ISNULL(@ImageProfile,case when len( isnull(ImageProfile,'')) <= 3 then @SERVIDOR_DOWNLOAD +  @IDWHATSAPP else ImageProfile end),
			  IdConfig=case when @IdConfig=0 then IdConfig else @IdConfig end,
              [DataAtualizacao]=getdate(),
			  @IDCC = IdContato
		WHERE IdContato = @ID OR IdWhatsApp = @IDWHATSAPP
        


		SELECT TOP 1 @ENVIO=isnull( MAX(IDENVIO),0)
		FROM [dbo].[EnvioLista]  e,lista l 
		WHERE e.[IdEnvio]  =l.IdEnvioLista and l.ContatoIdContato =   @IDCC

        SELECT * 
		FROM Contatos c
			left join lista l on c.IdContato = l.ContatoIdContato  
		    left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	        left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
			LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
		--WHERE   (IdContato = 0  OR IdWhatsApp = @IDWHATSAPP) and 
		--        (l.[IdEnvioLista] is null or l.[IdEnvioLista] = @ENVIO)
		order by v.UltimaMsg desc



	END
	ELSE
	BEGIN
		INSERT INTO dbo.Contatos (NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status,NomeRetornado,ImageProfile,IdConfig,[DataAtualizacao])
		VALUES (isnull(@NOME_INFORMADO, @IDWHATSAPP),@DOCUMENTO ,@NOMEDOC ,@CODIGO ,@IDWHATSAPP ,@TELEFONE ,	@USERWHATSAPP ,@CLIENTEEXTERNO ,@CADASTRO ,@STATUS ,isnull(@NOMERETORNADO,@IDWHATSAPP),@ImageProfile,@IdConfig,getdate())

		set @IDCC = @@IDENTITY

		SELECT * 
		FROM Contatos c
			left join lista l on c.Telefone = l.Telefone and l.[IdEnvioLista] =@ENVIO
			left join Campanha cc on cc.IdCampanha = l.CampanhaIdCampanha 
			LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
		WHERE   (IdContato = @IDCC)
		order by V.UltimaMsg desc
	END
END

IF @TIPO_ACAO = 'GET'
BEGIN

	SELECT distinct * 
	FROM dbo.Contatos C
	left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
    left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
	LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
	where  ( @ID=0  and @IDWHATSAPP is null) OR  ((C.IdContato=@ID ) OR (C.IdWhatsApp = @IDWHATSAPP))  
	order by V.UltimaMsg desc

END



IF @TIPO_ACAO = 'GETCONFIG'
BEGIN



	SELECT * 
	FROM dbo.Contatos C
		left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
		left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
		left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
		LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
	where (c.IdConfig = @IdConfig)
    order by V.UltimaMsg desc

END
IF @TIPO_ACAO = 'GETCONTATO_USR'
BEGIN
--declare @IDUSUARIO int = 1
	SELECT  * 
	FROM dbo.Contatos c
	left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
	left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
	left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr
	LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
	WHERE  c.IdContato in (select Contatos_IdContato 
	                        from Conversas 
							where  destino='chat' and  
							       ( @IDUSUARIO in (select idusr from usuarios where Permissao <=2) ) or Usuarios_IdUsr =@IDUSUARIO )
	order by V.UltimaMsg desc, NomeRetornado  

END


IF @TIPO_ACAO = 'GETLISTACONTATO'
BEGIN


		--UPDATE LISTA SET ContatoIdContato = C.IdContato
		--FROM Contatos c
		--	inner join lista l on c.Telefone = l.Telefone  
		--	inner join Campanha cc on cc.IdCampanha = l.CampanhaIdCampanha
		--WHERE cc.DataTermino > getdate()

		--update Contatos set Documento = l.Documento, NomeInformado=l.Nome, NomeDoc=l.NomeDocumento,[DataAtualizacao]=getdate()
		--FROM Contatos c
		--inner join lista l on c.Telefone = l.Telefone  
		--WHERE l.CampanhaIdCampanha = @CAMPANHA_IDCAMPANHA


		SELECT * 
		FROM Contatos c 
				left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr 
				LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
		WHERE  l.IdEnvioLista =  @ENVIO and C.IdWhatsApp = @USERWHATSAPP
		order by V.UltimaMsg desc



END


IF @TIPO_ACAO = 'PROFILE'
BEGIN


		UPDATE contatos SET  [ImageProfile]=  @ImageProfile,[DataAtualizacao]=getdate()
		WHERE IdContato = @ID OR IdWhatsApp = @IdWhatsApp
		

		SELECT @@ROWCOUNT



END

IF @TIPO_ACAO = 'GETCONTATO_LISTA'
BEGIN
	
	SELECT  distinct c.* ,CA.IdCampanha,CA.NomeCampanha,v.*
	                     
	FROM dbo.Contatos c
			    left join lista l on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join campanha ca on l.[CampanhaIdCampanha] = ca.IdCampanha
				left join sessao s on s.Contato_Idcontato = c.IdContato and s.DataEncerramento is null
				left join usuarios u on s.[Usuario_IdUsuario] = u.IdUsr 
				LEFT JOIN VW_QTDENLIDA V ON V.Contatos_IdContato = C.IdContato
    order by  V.UltimaMsg desc, v.QtdeNLido desc,  NomeRetornado 

	

END

IF @TIPO_ACAO = 'LIDOCHAT'
BEGIN
	UPDATE dbo.Conversas SET Lido=1 WHERE Contatos_IdContato = @ID
END


IF @TIPO_ACAO = 'DELETE'
BEGIN
	DELETE dbo.Contatos WHERE IdContato = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_CONVERSAS]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_CONVERSAS] --  @TIPO_ACAO='GET', @IDCONTATO=1318  --@IDUSUARIO=1,@IDCONTATO=4
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCONVERSAWHATS VARCHAR(50)=NULL,
	@IDUSUARIO INT = 0,
	@IDCONTATO INT = 0,
	@SENTIDO VARCHAR(50) =NULL,
	@DESTINO VARCHAR(50) =NULL,
	@RECEBIDO BIT=0,
	@LIDO BIT =0,
	@DATA DATETIME = NULL,
	@MENSAGEM NTEXT = NULL,
	@IDCONFIG INT =0,
	@Dias int =10,
	@ORIGEM INT = 0
AS

--declare @DataConversa datetime = (select min(data) from Conversas where idconversa in ( select top 100 idconversa from conversas where Contatos_IdContato = @IDCONTATO
IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM dbo.Conversas where IdConversa = @ID)
	BEGIN
		UPDATE dbo.Conversas
		SET Usuarios_IdUsr = CASE WHEN @IDUSUARIO = 0 THEN Usuarios_IdUsr ELSE @IDUSUARIO END , 
		    Contatos_IdContato= CASE WHEN @IDCONTATO = 0 THEN Contatos_IdContato ELSE @IDCONTATO END , 
		    IdConversaWhats= CASE WHEN @IDCONVERSAWHATS IS NULL THEN IdConversaWhats ELSE @IDCONVERSAWHATS END , 
		    Sentido= CASE WHEN @SENTIDO IS NULL THEN Sentido ELSE @SENTIDO END , 
		    Destino= CASE WHEN @DESTINO IS NULL THEN Destino ELSE @DESTINO END , 
		    Data=ISNULL(@DATA,Data), 
		    Mensagem= CASE WHEN @MENSAGEM IS NULL THEN Mensagem ELSE @MENSAGEM END ,
		    Config_IdConfig = CASE WHEN @IDCONFIG = 0 THEN Config_IdConfig ELSE @IDCONFIG END,
		    Origem = CASE WHEN @ORIGEM = 0 THEN Origem ELSE @ORIGEM END
		WHERE IdConversa = @ID OR
			  IdConversaWhats = @IDCONVERSAWHATS
			  
	   SELECT IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, Mensagem, Config_IdConfig, Enviada, LidoChat, Origem, Classificacao
	   FROM dbo.Conversas with (nolock)		
	   WHERE IdConversa = @ID OR
			  IdConversaWhats = @IDCONVERSAWHATS
	END
	ELSE
	BEGIN
		INSERT INTO dbo.Conversas ( Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, Mensagem , Config_IdConfig,Origem)
		VALUES                     (@IDUSUARIO ,	@IDCONTATO ,	@IDCONVERSAWHATS ,	@SENTIDO ,	@DESTINO ,	@RECEBIDO ,	@LIDO ,	@DATA , replace(convert(nvarchar(max),@MENSAGEM) , '\n',char(10)) , @IDCONFIG, @ORIGEM)
		
	   SELECT IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, Mensagem, Config_IdConfig, Enviada, LidoChat, Origem, Classificacao
	   FROM dbo.Conversas 	with (nolock)		
	   WHERE IdConversa = @@IDENTITY
	END
	

END

IF @TIPO_ACAO = 'ENVIADA'
BEGIN

		UPDATE dbo.Conversas
		SET Enviada= 1 ,
			IdConversaWhats = isnull(@IDCONVERSAWHATS,IdConversaWhats),
			Recebido = @RECEBIDO
		WHERE IdConversa = @ID OR
			  IdConversaWhats = @IDCONVERSAWHATS

END

IF @TIPO_ACAO = 'RECEBIDO'
BEGIN

		UPDATE dbo.Conversas
		SET Recebido= 1 
		WHERE IdConversa = @ID OR
			  IdConversaWhats = @IDCONVERSAWHATS

END

IF @TIPO_ACAO = 'LIDO'
BEGIN

		UPDATE dbo.Conversas
		SET Lido= 1 
		WHERE IdConversa = @ID OR
			  IdConversaWhats = @IDCONVERSAWHATS

END

IF @TIPO_ACAO = 'LIDOCHAT'
BEGIN

		UPDATE dbo.Conversas
		SET LidoChat= 1 
		WHERE Contatos_IdContato = @IDCONTATO 

END


IF @TIPO_ACAO = 'LIDOCHATContato'
BEGIN
        set @LIDO = 0
		--UPDATE dbo.Conversas
		--SET LidoChat= 1 
		--WHERE [Contatos_IdContato] = @IDCONTATO 

END

IF @TIPO_ACAO = 'GET'
BEGIN
	if @ID > 0
	begin
		SELECT TOP 100 IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, conversas.Mensagem, Config_IdConfig, Enviada, LidoChat, conversas.Origem, Classificacao,
               IdConfig, Telefone, Senha, Apelido, Desativado, ChipLista,  QtdeEnvio, StatusConeccao,
               IdQueue, status, ConversaIdconversa, m.DataEnvio, m.Origem, UltimaTentativa, erro,  Tentando
			FROM  dbo.Conversas with (nolock)	
				left join Config c with (nolock) on c.idconfig = Config_IdConfig
				left join [dbo].[MensagemQueue] m with (nolock) on m.ConversaIdconversa=Conversas.IdConversa
			WHERE  (@ID =0 OR (IdConversa = @ID )) 
		   order by Contatos_IdContato,data desc
	end
	else
	begin
	
		SELECT TOP 100 IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, conversas.Mensagem, Config_IdConfig, Enviada, LidoChat, conversas.Origem, Classificacao,
               IdConfig, Telefone, Senha, Apelido, Desativado, ChipLista,  QtdeEnvio, StatusConeccao,
               IdQueue, status, ConversaIdconversa, m.DataEnvio, m.Origem, UltimaTentativa, erro,  Tentando
		FROM dbo.Conversas with (nolock)	
		    left join Config c with (nolock) on c.idconfig = Config_IdConfig
			left join [dbo].[MensagemQueue] m with (nolock) on m.ConversaIdconversa=Conversas.IdConversa
		where  (Contatos_IdContato=  @IDCONTATO  ) 
		      --AND  			  data > @DataConversa
	   order by Contatos_IdContato,data desc
   end
END

IF @TIPO_ACAO = 'DELETE'
BEGIN
	DELETE
	FROM  dbo.Conversas 
	WHERE   IdConversa = @ID


END

IF @TIPO_ACAO = 'ATENDIMENTO'
BEGIN

	SELECT IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, Mensagem, Config_IdConfig, Enviada, LidoChat, Origem, Classificacao,
            IdContato, NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status, NomeRetornado, UltimoAcesso, Email, FaceId, FaceRecipentId, Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao
	FROM dbo.Conversas CONV with (nolock)	
		 INNER JOIN dbo.Contatos CONT  with (nolock)	 ON CONT.IdContato = CONV.Contatos_IdContato
	WHERE  CONT.IdContato =@IDCONTATO 
	--and data > @DataConversa 
	AND CONV.Config_IdConfig = @IDCONFIG

END

IF @TIPO_ACAO = 'CHECK-CONVERSA'
BEGIN

	SELECT Contatos_IdContato, id
	FROM VW_ULTIMACONVERSA
	WHERE  Contatos_IdContato = @IDCONTATO 


END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_DASHBOARD]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STP_TB_DASHBOARD]
@TIPO_ACAO VARCHAR(50),
@ID_USR INt

as


IF @TIPO_ACAO = 'CONTADORES'
BEGIN

	SELECT 
	(SELECT COUNT(*) FROM [dbo].[Conversas] C WHERE  C.[Data] > Dbo.DATA_CHEIA(getdate())) as Enviadas,
	(SELECT COUNT(*) FROM [dbo].[Conversas] C WHERE  C.[Data] > Dbo.DATA_CHEIA(getdate())  and enviada =0) as Pendente,
	(SELECT COUNT(DISTINCT [Contatos_IdContato]) FROM [dbo].[Conversas] C WHERE  C.[Data] > Dbo.DATA_CHEIA(getdate())) as Contatos
	
END


/*
             public int TotalEnviadas { get; set; }
                public int TotalPendentes { get; set; }
                public int TotalContatos { get; set; }
                public int TotalErros { get; set; }
                public int TotalSessoes { get; set; }

*/
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_EMPRESACLIENTE]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_EMPRESACLIENTE]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
    @NOME VARCHAR(50)=null, 
    @LOGOTIPO VARCHAR(50)=null, 
    @INSTRUCOES VARCHAR(50)=null
	
AS

IF @TIPO_ACAO='SALVA'
BEGIN
	IF EXISTS(SELECT * FROM dbo.EmpresaCliente WHERE IdEmpresa=@ID)
	BEGIN
		UPDATE dbo.EmpresaCliente
		SET Nome=ISNULL(@NOME,Nome),
		    LogoTipo=ISNULL(@LOGOTIPO,LogoTipo),
		    Instrucoes=ISNULL(@INSTRUCOES,Instrucoes)
		WHERE IdEmpresa=@ID
		    
		 SELECT * FROM CAMPANHA WHERE IdCampanha=@ID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.EmpresaCliente  ( Nome, LogoTipo, Instrucoes)
		VALUES (  @NOME, @LOGOTIPO, @INSTRUCOES)
		
		select * from campanha where IdCampanha=@@IDENTITY
	END
END

IF @TIPO_ACAO='GET'
BEGIN
	SELECT * 
	FROM dbo.EmpresaCliente
	WHERE (@ID=0 OR IdEmpresa=@ID) 
END


GO
/****** Object:  StoredProcedure [dbo].[STP_TB_ENVIOLISTA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_TB_ENVIOLISTA]  -- @TIPO_ACAO='SALVA', @UsuarioIdUsuario=1, @CampanhaIdCampanha=25


	@TIPO_ACAO VARCHAR(50),
@IdEnvio INT=0, 
@CampanhaIdCampanha INT=0 , 
@DataCriacao DATETIME=NULL, 
@DataEnvio DATETIME=NULL, 
@UsuarioIdUsuario INT =0, 
@DataTermino DATETIME=NULL


AS


IF @TIPO_ACAO='SALVA'
BEGIN
	IF EXISTS(SELECT * FROM ENVIOLISTA WHERE [IdEnvio]=@IdEnvio)
	BEGIN
		UPDATE ENVIOLISTA SET
			CampanhaIdCampanha=@CampanhaIdCampanha, 
			DataCriacao=@DataCriacao, 
			DataEnvio=@DataEnvio, 
			UsuarioIdUsuario=@UsuarioIdUsuario, 
			DataTermino=@DataTermino
		WHERE IdEnvio =@IdEnvio

		SELECT * FROM ENVIOLISTA WHERE IdEnvio =@IdEnvio
	END
	ELSE
	BEGIN
		INSERT ENVIOLISTA( CampanhaIdCampanha, DataCriacao, UsuarioIdUsuario)
		VALUES (@CampanhaIdCampanha, Getdate(), @UsuarioIdUsuario)

		SELECT * FROM ENVIOLISTA WHERE IdEnvio =@@IDENTITY
	END

	
END


IF @TIPO_ACAO='ENVIO'
BEGIN

	UPDATE ENVIOLISTA SET DataTermino=GETDATE() WHERE IdEnvio=@IdEnvio
END

IF @TIPO_ACAO='TERMINO'
BEGIN

	UPDATE ENVIOLISTA SET DataTermino=GETDATE() WHERE @DataTermino=GETDATE()
END

IF @TIPO_ACAO='GET'
BEGIN

	SELECT * FROM ENVIOLISTA 
END
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_FLUXOATENDIMENTO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_FLUXOATENDIMENTO]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCAMPANHA INT =0,
	@TIPO INT =0,
	@ORDEM INT =0,
	@IDMENSAGEM INT =0,
	@CONDICAO1 INT =0,
	@CONDICAO2 INT = 0,
	@SAIDA INT =0,
	@CHAVE VARCHAR(50) = NULL,
	@NOMEFLUXO VARCHAR(50) = NULL,
	@FINALIZADO BIT =0,
	@OFENSA int = 0
	
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM  FluxoAtendimento WHERE IdFluxoAtendimento=@ID)
	BEGIN
		UPDATE dbo.FluxoAtendimento
		SET CampanhaIdCampanha = CASE WHEN @IDCAMPANHA = 0 THEN CampanhaIdCampanha ELSE  @IDCAMPANHA END, 
		    Tipo= CASE WHEN @TIPO = 0 THEN Tipo ELSE  @TIPO END, 
		    Ordem= CASE WHEN @ORDEM = 0 THEN Ordem ELSE  @ORDEM END, 
		    IdMensagem= CASE WHEN @IDMENSAGEM = 0 THEN IdMensagem ELSE  @IDMENSAGEM END ,
		    Condicao1=CASE WHEN @CONDICAO1 = 0 THEN Condicao1 ELSE  @CONDICAO1 END,
		    Condicao2=CASE WHEN @CONDICAO2 = 0 THEN Condicao2 ELSE  @CONDICAO2 END,
		    Saida=CASE WHEN @SAIDA = 0 THEN Saida ELSE  @SAIDA END,
		    Chave=ISNULL(@CHAVE,Chave),
		    NomeFluxo=ISNULL(@NOMEFLUXO,NomeFluxo),
		    Finalizado = @FINALIZADO,
		    ofensa = @OFENSA
		WHERE 		IdFluxoAtendimento = @ID
		
		select * from dbo.FluxoAtendimento where IdFluxoAtendimento = @ID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.FluxoAtendimento ( CampanhaIdCampanha, Tipo, Ordem, IdMensagem,Condicao1,Condicao2,Saida,Chave,NomeFluxo,Finalizado,ofensa)
		VALUES (@IDCAMPANHA,@TIPO,@ORDEM,@IDMENSAGEM,@CONDICAO1,@CONDICAO2,@SAIDA,@CHAVE,@NOMEFLUXO,@FINALIZADO,@OFENSA)
		
		SELECT * FROM dbo.FluxoAtendimento WHERE IdFluxoAtendimento = @@IDENTITY
	END
END

IF @TIPO_ACAO = 'DELETE'
BEGIN

	DELETE from dbo.FluxoAtendimento where IdFluxoAtendimento = @ID

END


IF @TIPO_ACAO = 'GET'
BEGIN

	SELECT * 
	FROM dbo.FluxoAtendimento
	WHERE (@ID=0 OR IdFluxoAtendimento = @ID) AND
	      (@TIPO=0 OR Tipo = @TIPO) AND
	      (@ORDEM=0 OR ORDEM = @ORDEM) AND
	      (@IDMENSAGEM=0 OR IdMensagem = @IDMENSAGEM) AND
	      (@IDCAMPANHA=0 OR CampanhaIdCampanha = @IDCAMPANHA) AND
		  (@CONDICAO1=0 OR Condicao1 = @CONDICAO1) AND
		  (@CONDICAO2=0 OR Condicao2 = @CONDICAO2) AND
		  (@SAIDA=0 OR Saida = @SAIDA) AND
	  	  (@CHAVE IS NULL OR Chave = @CHAVE) AND
		  (@NOMEFLUXO IS NULL OR NomeFluxo = @NOMEFLUXO) 

END
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_HISTORICOCAMPANHA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_HISTORICOCAMPANHA]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCAMPANHA INT = 0,
	@IDCONTATO INT = 0,
	@IDCONVERSA INT =0,
	@IDLISTA INT =0 ,
	@IDSESSAO INT =0
AS

IF @TIPO_ACAO='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM dbo.HistoricoCampanha WHERE ListaIdLista = @IDLISTA)
	BEGIN
		UPDATE dbo.HistoricoCampanha
		SET  CampanhaIdCampanha= CASE WHEN @IDCAMPANHA = 0 THEN  CampanhaIdCampanha ELSE @IDCAMPANHA END, 
		     ContatoIdContato= CASE WHEN @IDCONTATO = 0 THEN  ContatoIdContato ELSE @IDCONTATO END,  
		     ConversaIdConversa= CASE WHEN @IDCONVERSA = 0 THEN  ConversaIdConversa ELSE @IDCONVERSA END, 
		     ListaIdLista= CASE WHEN @IDLISTA = 0 THEN  ListaIdLista ELSE @IDLISTA END, 
		     Sessao_idSessao= CASE WHEN @IDSESSAO = 0 THEN  Sessao_idSessao ELSE @IDSESSAO END
		WHERE  ListaIdLista = @IDLISTA
		
		SELECT * FROM HistoricoCampanha WHERE  ListaIdLista = @IDLISTA
	
	END


END
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_INTEGRACAO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STP_TB_INTEGRACAO]
 @TIPO_ACAO NVarchar(max),
@IdIntegracao int = 0, 
@Campanha_IdCampanha int =0 , 
@Tipo int =0, 
@Text NVarchar(max) = null, 
@Usuario NVarchar(max) = null, 
@Senha NVarchar(max) = null, 
@url NVarchar(max) = null,
@PrimVencto datetime = null,
@TipoBusca int =0,
@IdListaTeste int =0

as

IF @TIPO_ACAO='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM INTEGRACAO WHERE IdIntegracao=@IdIntegracao)
	BEGIN
		UPDATE INTEGRACAO SET 
			Campanha_IdCampanha = @Campanha_IdCampanha, 
			Tipo= @Tipo, 
			Text= @Text, 
			Usuario= @Usuario, 
			Senha= @Senha, 
			url= @url,
			PrimVencto=@PrimVencto,
			TipoBusca=@TipoBusca
		WHERE IdIntegracao= @IdIntegracao  

		select * from  INTEGRACAO WHERE IdIntegracao=@IdIntegracao
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Integracao]( Campanha_IdCampanha, Tipo, Text, Usuario, Senha, url,PrimVencto,TipoBusca)
		VALUES  (@Campanha_IdCampanha, @Tipo, @Text, @Usuario, @Senha, @url,@PrimVencto,@TipoBusca)

		select * from  INTEGRACAO WHERE IdIntegracao=@@identity
	END

	
END

IF @TIPO_ACAO='GET'
BEGIN
	SELECT * FROM INTEGRACAO WHERE IdIntegracao= @IdIntegracao   OR Campanha_IdCampanha = @Campanha_IdCampanha
END

IF @TIPO_ACAO='DELETE'
BEGIN
	delete INTEGRACAO WHERE IdIntegracao= @IdIntegracao   OR Campanha_IdCampanha = @Campanha_IdCampanha
END


IF @TIPO_ACAO='VINCULATeste'
BEGIN
	insert [dbo].[CampanhaListaTeste](IdCampanha, IdListaTeste)
	values (@Campanha_IdCampanha, @IdListaTeste)
END


IF @TIPO_ACAO='DESVINCULATeste'
BEGIN
	delete  [dbo].[CampanhaListaTeste] where  IdCampanha=@Campanha_IdCampanha and IdListaTeste=@IdListaTeste
END



IF @TIPO_ACAO='GETListaTeste'
BEGIN
	select * 
	from ListaTeste l
	inner join  [dbo].[CampanhaListaTeste] ct on  l.IdListaTeste=ct.IdListaTeste
	where [IdCampanha] = @Campanha_IdCampanha
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_LISTA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_LISTA] -- @TIPO_ACAO='GET', @IDCAMPANHA=7
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCAMPANHA INT = 0,
	@NOME VARCHAR(100) = NULL,
	@DOCUMENTO VARCHAR(50)=NULL,
	@NOMEDOCUMENTO VARCHAR(50)=NULL,
	@CHAVE VARCHAR(50) =NULL,
	@TELEFONE VARCHAR(50) =NULL,
	@IDCONTATO INT=0,
	@USERWHATSAPP VARCHAR(50) = NULL,
	@ATIVO BIT =0,
	@STATUS VARCHAR(50) = NULL,
	@IDCONVERSA INT =0 ,
	@DESATIVADO BIT =0,
	@IDUSUARIO INT = 0,
	@FacebookId Varchar(MAX)=NULL,
	@Email	Varchar(MAX)=NULL,
	@Sexo	Varchar(MAX)=NULL,
	@Anexo1	Varchar(MAX)=NULL,
	@Anexo2	Varchar(MAX)=NULL,
	@Anexo3	Varchar(MAX)=NULL,
	@CodBarras Varchar(MAX)=NULL,
	@IdEnvioLista int=0,
	@Enviado bit=0,
	@DtEnviado datetime =null
AS

IF @TIPO_ACAO = 'LISTAUSR'
BEGIN
	
	SELECT C.IdCampanha, c.NomeCampanha, IdEnvioLista ,COUNT( distinct L.IdLista) QtdeLista, COUNT(distinct con.IdConversa) QtdeConv
	FROM Lista L
		INNER JOIN Campanha C
			ON C.IdCampanha=l.CampanhaIdCampanha
		left join Conversas con
			on con.Contatos_IdContato = l.ContatoIdContato
   WHERE L.UsuarioIdUsuario = @IDUSUARIO and c.IdCampanha > 1
    group by C.IdCampanha, c.NomeCampanha,IdEnvioLista
END

IF @TIPO_ACAO ='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM Lista WHERE  IdLista  = @ID )
	BEGIN
	
		UPDATE LISTA
		SET CampanhaIdCampanha= CASE WHEN @IDCAMPANHA = 0 THEN CampanhaIdCampanha ELSE @IDCAMPANHA END,
		    Nome=ISNULL(@NOME,Nome),
		    Documento=ISNULL(@DOCUMENTO,Documento),
		    NomeDocumento=ISNULL(@NOMEDOCUMENTO,NomeDocumento),
		    Chave=ISNULL(@CHAVE,Chave),
		    Telefone=ISNULL(@TELEFONE,Telefone),
			ContatoIdContato=CASE WHEN @IDCONTATO = 0 THEN ContatoIdContato ELSE @IDCONTATO END,
			UserWhatsApp=ISNULL(@USERWHATSAPP,UserWhatsApp),
			Ativo=CASE WHEN @ATIVO = 0 THEN Ativo ELSE @ATIVO END,
			Status=ISNULL(@STATUS,Status),
			ConversaIdConvera = CASE WHEN @IDCONVERSA = 0 THEN ConversaIdConvera ELSE @IDCONVERSA END,
			Desativado = @DESATIVADO,
			FacebookId=	  @FacebookId,
			Email=		  @Email,	
			Sexo=		  @Sexo,	
			Anexo1=		  @Anexo1,	
			Anexo2=		  @Anexo2,	
			Anexo3=		  @Anexo3,	
			CodBarras= 	  @CodBarras, 
			IdEnvioLista= @IdEnvioLista
		WHERE IdLista =@ID

       
        IF EXISTS(SELECT * FROM HistoricoCampanha WHERE  ListaIdLista  = @ID )
        begin
        
			UPDATE dbo.HistoricoCampanha
			SET  CampanhaIdCampanha= CASE WHEN @IDCAMPANHA = 0 THEN  CampanhaIdCampanha ELSE @IDCAMPANHA END, 
				 ContatoIdContato= CASE WHEN @IDCONTATO = 0 THEN  ContatoIdContato ELSE @IDCONTATO END,  
				 ConversaIdConversa= CASE WHEN @IDCONVERSA = 0 THEN  ConversaIdConversa ELSE @IDCONVERSA END, 
				 ListaIdLista= CASE WHEN @ID = 0 THEN  ListaIdLista ELSE @ID END,
				 IdEnvioLista= CASE WHEN @IdEnvioLista = 0 THEN IdEnvioLista ELSE @IdEnvioLista END
			 WHERE  ListaIdLista = @ID  
	    end
	    else
	    begin
	     		INSERT INTO dbo.HistoricoCampanha( CampanhaIdCampanha, ContatoIdContato, ConversaIdConversa, ListaIdLista,IdEnvioLista)
		         VALUES (@IDCAMPANHA,@IDCONTATO,@IDCONVERSA, @ID,@IdEnvioLista)

	    end
			
		SELECT * FROM LISTA WHERE IdLista =@ID
	END
	ELSE
	BEGIN
	    if(@STATUS = 'Teste')
		begin
			delete lista where UserWhatsApp = @USERWHATSAPP
		end

		INSERT INTO LISTA ( CampanhaIdCampanha, Nome, Documento, NomeDocumento, Chave, Telefone, 
		                    ContatoIdContato,UserWhatsApp,Ativo,Status,ConversaIdConvera,Desativado,
							FacebookId,Email,Sexo,Anexo1,Anexo2,Anexo3,CodBarras,IdEnvioLista )
		VALUES (@IDCAMPANHA,@NOME,@DOCUMENTO,@NOMEDOCUMENTO,@CHAVE,@TELEFONE,@IDCONTATO,@USERWHATSAPP,@ATIVO,@STATUS,@IDCONVERSA,0,
		        @FacebookId,@Email,@Sexo,@Anexo1,@Anexo2,@Anexo3,@CodBarras,@IdEnvioLista )
		
		DECLARE @IDLISTA INT = @@IDENTITY
		
		INSERT INTO dbo.HistoricoCampanha( CampanhaIdCampanha, ContatoIdContato, ConversaIdConversa, ListaIdLista,IdEnvioLista)
		VALUES (@IDCAMPANHA,@IDCONTATO,@IDCONVERSA, @IDLISTA,@IdEnvioLista)
		
		SELECT * FROM LISTA WHERE IdLista = @IDLISTA
	END

END

IF @TIPO_ACAO ='LIMPALISTA'
BEGIN

--	DELETE dbo.OpcaoLista WHERE ListaIdlista IN (SELECT IdLista FROM LISTA WHERE CampanhaIdCampanha = @IDCAMPANHA)
	UPDATE dbo.Lista SET Desativado=1   WHERE CampanhaIdCampanha =@IDCAMPANHA
END

IF @TIPO_ACAO ='GET'
BEGIN
	
	SELECT * 
	FROM LISTA
	WHERE (@ID = 0 OR IdLista=@ID) AND
	      (@IDCAMPANHA = 0 OR CampanhaIdCampanha=@IDCAMPANHA) AND
	      (@NOME IS NULL OR Nome=@NOME) AND
	      (@DOCUMENTO IS NULL OR Documento=@DOCUMENTO) AND
	      (@NOMEDOCUMENTO IS NULL OR NomeDocumento=@NOMEDOCUMENTO) AND
	      (@CHAVE IS NULL OR Chave=@CHAVE) AND
	      (@TELEFONE IS NULL OR Telefone=@TELEFONE) AND
	      (@IDCONTATO =0 OR ContatoIdContato= @IDCONTATO ) AND
	      (@USERWHATSAPP IS NULL OR UserWhatsApp = @UserWhatsApp)AND
		  (@IdEnvioLista =0 OR IdEnvioLista=@IdEnvioLista) AND
	      Desativado =0

END

IF @TIPO_ACAO = 'ENVIADO'
BEGIN
	UPDATE LISTA SET enviado=1 , DtEnvio=GETDATE() WHERE IdLista = @ID
END

IF @TIPO_ACAO ='DISTRIBUI'
BEGIN
	UPDATE LISTA
	SET UsuarioIdUsuario = @IDUSUARIO
	WHERE IdLista = @ID

END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_LISTATESTE]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_LISTATESTE]
@TIPO_ACAO VARCHAR(50),
@IDLISTATESTE INT =0 ,
@NOME VARCHAR(50) = NULL,
@TELEFONE VARCHAR(50) = NULL,
@EMAIL VARCHAR(200) =NULL

AS

IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTs(SELECT * FROM ListaTeste WHERE IdListaTeste = @IDLISTATESTE)
	BEGIN
		UPDATE ListaTeste SET
		Nome = @NOME,
		Telefone = @TELEFONE,
		Email = @EMAIL
		WHERE  IdListaTeste = @IDLISTATESTE

		select * from ListaTeste where IdListaTeste = @IDLISTATESTE
	END
	ELSE
	BEGIN
		insert into ListaTeste ( Nome, Telefone, Email)
		values (@Nome, @Telefone, @Email)

		select * from ListaTeste where IdListaTeste = @@Identity
	END
END


IF @TIPO_ACAO = 'GET'
BEGIN
	select * from ListaTeste
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_LOG]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_LOG]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@DATA DATETIME = NULL,
	@TIPO VARCHAR(50)=NULL,
	@TEXT TEXT = NULL
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTS(SELECT * FROM LOG WHERE IDLOG = @ID)
	BEGIN
		UPDATE LOG 
		SET Data = ISNULL(@DATA,Data),
		    Tipo = ISNULL(@TIPO,Tipo),
		    Mensagem = ISNULL( @TEXT,  Mensagem)
		 WHERE IdLog=@ID
		 
		 SELECT * FROM LOG WHERE IdLog=@ID
	END
	ELSE
	BEGIN
		INSERT INTO LOG ( Data, Tipo, Mensagem)
		VALUES (@DATA,@TIPO,@TEXT)
		
		SELECT * FROM LOG WHERE IdLog=@@IDENTITY
	END

END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT * 
	FROM LOG
	WHERE DATA > @DATA
END 
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_MENSAGEM]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_MENSAGEM]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME VARCHAR(50)=NULL,
	@TIPO INT =0,
	@TEXTO ntext=NULL
AS

IF @TIPO_ACAO='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM Mensagem WHERE IdMensagem=@ID)
	BEGIN
		UPDATE MENSAGEM
		SET  NomeMensagem = ISNULL(@NOME,NomeMensagem), 
		     Tipo = CASE WHEN @TIPO = 0 THEN Tipo ELSE @TIPO END, 
		     Texto = ISNULL(@TEXTO,TEXTO)
		where IdMensagem = @ID
		
		select * from MENSAGEM WHERE IdMensagem = @ID
	END
	ELSE
	BEGIN
		INSERT INTO MENSAGEM ( NomeMensagem, Tipo, Texto)
		VALUES (@NOME,@TIPO,@TEXTO)
		
		SELECT * FROM MENSAGEM WHERE IdMensagem = @@IDENTITY
	END
		
	
	
END



IF @TIPO_ACAO='GET'
BEGIN
	SELECT * 
	FROM MENSAGEM 
	WHERE   (@ID =0 OR IdMensagem =@ID) AND
			(@NOME IS NULL OR NomeMensagem = @NOME) AND
			(@TIPO =0 OR Tipo = @TIPO)
		
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_MENSAGEMQUEUE]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_MENSAGEMQUEUE]  --@TIPO_ACAO='GET'--, @ID=18452  --@IDUSUARIO=1,@IDCONTATO=4
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@STATUS BIT=0,
	@CONVERSA_IDCONVERSA INT = 0,
	@DATAENVIO DATETIME = NULL,
	@ORIGEM int =0,
	@ERRO BIT=0,
	@MENSAGEM VARCHAR(50) = NULL
AS 

declare @DataConversa datetime = getdate() -3
IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM dbo.MensagemQueue where IdQueue = @ID)
	BEGIN
		UPDATE dbo.MensagemQueue
		SET 
		    status= @STATUS, 
		    ConversaIdconversa= CASE WHEN @CONVERSA_IDCONVERSA =0 THEN  ConversaIdconversa ELSE @CONVERSA_IDCONVERSA END, 
		    DataEnvio=ISNULL(@DATAENVIO,DataEnvio), 
		    Origem=CASE WHEN @ORIGEM =0 THEN  Origem ELSE @ORIGEM END
		WHERE IdQueue = @ID

		SELECT * FROM dbo.MensagemQueue WHERE IdQueue = @ID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.MensagemQueue ( status, ConversaIdconversa, DataEnvio, Origem,erro,tentando)
		VALUES ( @status, @CONVERSA_IDCONVERSA, @DataEnvio, @Origem,0,0)
		
	   SELECT * 
	   FROM dbo.MensagemQueue 		
	   WHERE IdQueue = @@IDENTITY
	END
	

END

IF @TIPO_ACAO = 'ERRO'
BEGIN
	UPDATE MensagemQueue SET ERRO=1, MENSAGEM = @MENSAGEM,tentando= isnull(tentando,0) +1
	where IdQueue = @ID
END


IF @TIPO_ACAO = 'GETCONVERSA'
BEGIN
	SELECT * FROM MensagemQueue WHERE ConversaIdconversa = @CONVERSA_IDCONVERSA
END

IF @TIPO_ACAO = 'ENVIADA'
BEGIN

		UPDATE dbo.MensagemQueue
		SET STATUS= 1 ,
		erro=0
		WHERE IdQueue = @ID 

		update Conversas set Enviada = 1
		from Conversas c inner join MensagemQueue m on c.IdConversa = m.ConversaIdconversa
		where m.IdQueue = @ID

END

IF @TIPO_ACAO = 'GET'
BEGIN
        declare @idtentativa int, @tentativa int

		SELECT TOP 1 @idtentativa=IdQueue, @tentativa=tentando
		from [dbo].[MensagemQueue] q
		where (status=0 AND isnull( ERRO,0)=0 and (isnull(tentando,0)=0) or 
		      ((Tentando between 0 and 9) and status=0 and  getdate() >  DATEADD(mi, 1, isnull(UltimaTentativa,getdate()-1 )) ))
		order by q.Status,ORIGEM,UltimaTentativa , IdQueue 

		set @tentativa = isnull(@tentativa,0) +1
		update dbo.MensagemQueue set [UltimaTentativa] = getdate(), tentando=@tentativa
		where IdQueue = @idtentativa

		select   IdQueue, status, ConversaIdconversa, DataEnvio, Origem,[UltimaTentativa]
		FROM  dbo.MensagemQueue
		WHERE   IdQueue = @idtentativa
		   

END

IF @TIPO_ACAO = 'DELETE'
BEGIN
	DELETE
	FROM  dbo.MensagemQueue
	WHERE   IdQueue = @ID


END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_OFENSA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_TB_OFENSA]
	@TIPO_ACAO VARCHAR(50),
	@ID INT ,
	@PALAVRA VARCHAR(150) ,
	@COMPOSTA BIT
AS

	IF @TIPO_ACAO = 'GET_PALAVRA'
	BEGIN

		SELECT PALAVRA FROM OFENSA WHERE COMPOSTA= @COMPOSTA;

	END

	IF @TIPO_ACAO = 'GET'
    BEGIN
		SELECT * 
		FROM OFENSA;
	END 



GO
/****** Object:  StoredProcedure [dbo].[STP_TB_OPCAOLISTA]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_OPCAOLISTA]
		@TIPO_ACAO VARCHAR(50),
	    @ID INT = 0,
	    @IDLISTA INT = 0,
	    @ORDEM INT=0,
	    @OPCAO VARCHAR(150) = NULL
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTS(SELECT * FROM dbo.OpcaoLista WHERE  IdOpcaoLista =@ID)
	BEGIN
		UPDATE dbo.OpcaoLista
		SET ListaIdlista = CASE WHEN @IDLISTA= 0 THEN ListaIdlista ELSE   @IDLISTA END, 
			Ordem = CASE WHEN @ORDEM= 0 THEN Ordem ELSE   @ORDEM END, 
			Opcao = ISNULL(@OPCAO,Opcao)
		WHERE IdOpcaoLista = @ID
		
		
		SELECT * FROM OpcaoLista WHERE IdOpcaoLista = @ID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.OpcaoLista( ListaIdlista, Ordem, Opcao)
		VALUES (@IDLISTA,@ORDEM,@OPCAO)
		
		SELECT * FROM OpcaoLista WHERE IdOpcaoLista = @@IDENTITY 
	
	END
END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT *
	FROM dbo.OpcaoLista
	WHERE ListaIdlista =@IDLISTA
	
END


GO
/****** Object:  StoredProcedure [dbo].[STP_TB_PARAMETRO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_PARAMETRO]
	@TIPO_ACAO VARCHAR(50) , 
	@ID INT = 0, 
	@NOMEDOC VARCHAR(50) = NULL,
	@DIGVALIDACAO  VARCHAR(50) = null,
	@POSICAOVALICADAO INT =0,
	@QTDEDIGITOS INT = 0,
	@PALAVRATRANSD VARCHAR(50) = NULL,
	@TEMPOMSG INT = 0,
	@IDMENSAGEMSAUDACAO INT =0,
	@IDMENSAGEMVALIDA INT =0,
	@DESISTENCIA VARCHAR(50) = NULL,
	@DDD VARCHAR(255) =NULL,
	@SERVIDOR VARCHAR(50)=NULL,
	@CAMPANHA_IDCAMPANHA INT = 0,
	@PORTA INT =0,
	@SERVIDORFACE varchar(max) =null, 
	@WHATSBOTSEVER varchar(max) = null, 
	@WHATSBOTPORT varchar(max) = null
AS

	IF @TIPO_ACAO = 'SALVA'
	BEGIN
	
		IF EXISTS(SELECT * FROM dbo.Parametro WHERE IdParametro = 1)
		BEGIN
			UPDATE Parametro
			SET NomeDoc=ISNULL(@NOMEDOC,NomeDoc), 
			    DigValidacao= ISNULL( @DIGVALIDACAO, DigValidacao),
			    PosicaoValidacao=CASE WHEN @POSICAOVALICADAO= 0 THEN PosicaoValidacao ELSE @POSICAOVALICADAO END,
			    QtdeDigitos=CASE WHEN @QTDEDIGITOS= 0 THEN QtdeDigitos ELSE @QTDEDIGITOS END,
			    PalavraTransf=ISNULL(@PALAVRATRANSD,PalavraTransf),
			    TempoMsg=CASE WHEN @TEMPOMSG= 0 THEN TempoMsg ELSE @TEMPOMSG END, 
			    MensagemSaudacao=CASE WHEN @IDMENSAGEMSAUDACAO= 0 THEN MensagemSaudacao ELSE @IDMENSAGEMSAUDACAO END,
			    MensagemErroValid=CASE WHEN @IDMENSAGEMVALIDA= 0 THEN MensagemErroValid ELSE @IDMENSAGEMVALIDA END,
			    Desistencia = ISNULL(@DESISTENCIA,Desistencia),
			    DDD = ISNULL(@DDD,Desistencia),
			    Servidor = ISNULL(@SERVIDOR,Servidor),
			    Porta = CASE WHEN @PORTA = 0 THEN Porta ELSE @PORTA END,
			    campanha_idcampanha =  CASE WHEN @CAMPANHA_IDCAMPANHA = 0 THEN campanha_idcampanha ELSE @CAMPANHA_IDCAMPANHA END,
			    ServidorFace = ISNULL(@SERVIDORFACE,ServidorFace), 
			    WhatsBotSever =ISNULL(@WHATSBOTSEVER,WhatsBotSever) , 
			    WhatsBotPort=ISNULL(@WHATSBOTPORT,WhatsBotPort)
			    
			    --ServidorFace, WhatsBotSever, WhatsBotPort
			 WHERE IdParametro=1
			    
			 SELECT * FROM dbo.Parametro WHERE IdParametro=1
		END
		ELSE
		BEGIN
		
			INSERT INTO dbo.Parametro (IdParametro, NomeDoc, DigValidacao, PosicaoValidacao, QtdeDigitos, 
			                            PalavraTransf, TempoMsg, MensagemSaudacao, MensagemErroValid,Desistencia,
			                            DDD,Servidor,Porta,campanha_idcampanha,
			                           ServidorFace, WhatsBotSever, WhatsBotPort)
			VALUES ( 1, @NOMEDOC, @DIGVALIDACAO, @POSICAOVALICADAO, @QTDEDIGITOS, @PALAVRATRANSD, @TEMPOMSG, 
			         @IDMENSAGEMSAUDACAO, @IDMENSAGEMVALIDA,@DESISTENCIA,@DDD,@SERVIDOR,@PORTA,@CAMPANHA_IDCAMPANHA,
			         @SERVIDORFACE, @WHATSBOTSEVER, @WHATSBOTPORT)
			
			SELECT * FROM dbo.Parametro WHERE IdParametro=1
		END
	
	END 

	IF @TIPO_ACAO = 'GET'
	BEGIN
	
		SELECT * FROM 	dbo.Parametro WHERE IdParametro =1
	END  

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_RELATORIO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_RELATORIO]
	@TIPO_ACAO VARCHAR(50),
	@IDRELATORIO INT = 0, 
	@NOME  VARCHAR(50) = NULL, 
	@PERMISSAO INT = 0, 
	@QUERY NTEXT =NULL,
    @TOOLBAR BIT =0,
	@Desativado bit =0
AS


IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTS(SELECT * FROM Relatorios WHERE IdRelatorio = @IDRELATORIO)
	BEGIN
		UPDATE Relatorios 
		SET NOME = ISNULL(@NOME,NOME),
		    PERMISSAO = ISNULL(@PERMISSAO,PERMISSAO),
		    QUERY = ISNULL( @QUERY,  QUERY),
			TOOLBAR = @TOOLBAR,
			Desativado = @Desativado
		 WHERE @IDRELATORIO=IDRELATORIO
		 
		 SELECT * FROM Relatorios WHERE IDRELATORIO=@IDRELATORIO
	END
	ELSE
	BEGIN
		INSERT INTO Relatorios( Nome, Permissao, DataCriacao, Query, Toolbar)
		VALUES (@Nome, @Permissao, GETDATE(), @Query, @Toolbar)
		
		SELECT * FROM Relatorios WHERE IdRelatorio=@@IDENTITY
	END

END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT * 
	FROM Relatorios
	where IDRELATORIO = @IDRELATORIO

END 

IF @TIPO_ACAO = 'LISTA'
BEGIN
	SELECT * 
	FROM Relatorios
	where Desativado=@Desativado

END 
IF @TIPO_ACAO = 'GET_PERMISSAO'
BEGIN
	SELECT * 
	FROM Relatorios
	WHERE Permissao >= @PERMISSAO
	and Desativado = 0
END 
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_RETORNOACK]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_RETORNOACK] -- @TIPO_ACAO='get', @CONVERSASIDCONVERSA=     20573
@TIPO_ACAO VARCHAR(50),
@FROMME BIT = 0,
@REMOTE VARCHAR(MAX) = null,
@ID VARCHAR(MAX) ,
@SERIALIZED VARCHAR(MAX) = null,
@BODY VARCHAR(MAX) = null,
@TYPE VARCHAR(MAX)= null,
@T BIGINT = 0,
@NOTIFYNAME VARCHAR(MAX) = null,
@_FROM VARCHAR(MAX) = null,
@_TO VARCHAR(MAX) = null,
@SELF VARCHAR(MAX) = null,
@ACK VARCHAR(MAX) = null,
@INVIS BIT = 0,
@ISNEWMSG BIT = 0 ,
@STAR BIT = 0 ,
@RECVFRESH BIT =  0,
@ISFROMTEMPLATE BIT = 0,
@ISVCARDOVERMMSDOCUMENT BIT = 0,
@ISFORWARDED BIT = 0,
@EPHEMERALSTARTTIMESTAMP BIGINT = 0



AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM RetornoAck WHERE ID = @ID AND ACK = @ACK)
	BEGIN 
		UPDATE RetornoAck SET 
			FromMe = @FromMe ,
			Remote = @Remote,
			Id = @Id,
			Serialized = @Serialized,
			Body = @Body,
			Type = @Type,
			T = @T,
			NotifyName = @NOTIFYNAME,
			_From = @_FROM,
			_To = @_TO,
			Self =@SELF,
			Ack = @ACK,
			Invis = @INVIS,
			IsNewMsg = @ISNEWMSG,
			Star = @STAR,
			RecvFresh = @RECVFRESH,
			IsFromTemplate = @ISFROMTEMPLATE,
			IsVcardOverMmsDocument = @ISVCARDOVERMMSDOCUMENT,
			IsForwarded = @ISFORWARDED,
			EphemeralStartTimestamp = @EPHEMERALSTARTTIMESTAMP
	    where id=@id
	   
	   
		select FromMe,Remote,Id,Serialized,Body,Type,T,NotifyName,_From,_To,
							   Self,Ack,Invis,IsNewMsg,Star,RecvFresh,IsFromTemplate,
							   IsVcardOverMmsDocument,IsForwarded,EphemeralStartTimestamp
		from RETORNOACK
		where id = @id

	END
	ELSE 
    BEGIN
		INSERT INTO RETORNOACK(FromMe,Remote,Id,Serialized,Body,Type,T,NotifyName,_From,_To,
							   Self,Ack,Invis,IsNewMsg,Star,RecvFresh,IsFromTemplate,
							   IsVcardOverMmsDocument,IsForwarded,EphemeralStartTimestamp)
			   VALUES(@FromMe,@Remote,@Id,@Serialized,@Body,@Type,@T,@NotifyName,@_From,
					  @_To,@Self,@Ack,@Invis,@IsNewMsg,@Star,@RecvFresh,@IsFromTemplate,
					  @IsVcardOverMmsDocument,@IsForwarded,@EphemeralStartTimestamp)


		select FromMe,Remote,Id,Serialized,Body,Type,T,NotifyName,_From,_To,
							   Self,Ack,Invis,IsNewMsg,Star,RecvFresh,IsFromTemplate,
							   IsVcardOverMmsDocument,IsForwarded,EphemeralStartTimestamp
		from RETORNOACK
		where IdAck = @@identity

   END
END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT * 
	FROM RETORNOACK
	WHERE Id = @ID


END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_SERVICO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_SERVICO]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME VARCHAR(50) = NULL,
	@REGRA INT =0 ,
	@Site VARCHAR(50) = NULL,
    @BancoDados VARCHAR(50) = NULL,
    @Usuario VARCHAR(50) = NULL,
    @Senha VARCHAR(50) = NULL,
    @Token VARCHAR(50) = NULL
	
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTS(SELECT * FROM Servico WHERE IdServico = @ID)
	BEGIN
		UPDATE Servico 
		SET NOME = ISNULL(@NOME,NOME),
		    Regra = @REGRA

		 WHERE IdServico=@ID
		 
		 SELECT * FROM LOG WHERE IdLog=@ID
	END
	ELSE
	BEGIN
		INSERT INTO SERVICO ( NOME, REGRA,site, BancoDados,Usuario,Senha,Token)
		VALUES (@NOME,@REGRA,@site, @BancoDados,@Usuario,@Senha,@Token)
		
		SELECT * FROM Servico WHERE IdServico=@@IDENTITY
	END

END

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT * 
	FROM SERVICO
	
END 
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_SESSAO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_SESSAO] --@TIPO_ACAO = 'ABERTA', @IDUSUARIO=15    
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCONTATO INT=-1,
	@IDUSUARIO INT=-1,
	@IDCONVERSA INT =0,
	@DATACRIACAO DATETIME = NULL,
	@DATAATENDIMENTO DATETIME = NULL,
	@DATAENCERRAMENTO DATETIME = NULL,
	@IDCONFIG INT =0,
	@ORIGEM INT =0
AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	SELECT @ID = IdSession
	FROM SESSAO
	WHERE   ( Contato_Idcontato = @IDCONTATO) AND 
			(DataEncerramento IS NULL  )

	IF EXISTS(SELECT * FROM SESSAO WHERE IdSession = @ID )
	BEGIN
		UPDATE SESSAO
		SET Usuario_IdUsuario=CASE WHEN @IDUSUARIO = 0 THEN Usuario_IdUsuario ELSE @IDUSUARIO END,
		    Config_idconfig = CASE WHEN @IDCONFIG = 0 THEN Config_idconfig ELSE @IDCONFIG END,
			DataAtendimento = getdate()
		WHERE IdSession = @ID
		    
		SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao
		FROM SESSAO WHERE IdSession = @ID
	END
	ELSE
	BEGIN
	
		--UPDATE SESSAO SET  DataEncerramento = GETDATE()WHERE Contato_Idcontato = @IDCONTATO
		
		
		INSERT INTO SESSAO ( Contato_Idcontato, Usuario_IdUsuario, DataCriacao,Config_idconfig, Origem)
		VALUES ( @IDCONTATO,@IDUSUARIO,GETDATE(),@IDCONFIG,@ORIGEM)
		
		SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao 
		FROM SESSAO WHERE IdSession = @@IDENTITY
	END

END

IF @TIPO_ACAO = 'GET'
BEGIN

SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,(select count(*) from conversas c where c.Contatos_IdContato = S.Contato_Idcontato and LidoChat=0) QtdeNLido
FROM SESSAO S
WHERE   (@ID=0 OR IdSession=@ID) AND
		(@IDCONTATO = 0 OR Contato_Idcontato = @IDCONTATO) AND 
		(@IDUSUARIO = 0 OR Usuario_IdUsuario = @IDUSUARIO) 

END



IF @TIPO_ACAO = 'ABERTA'
BEGIN

SET @IDUSUARIO = CASE WHEN @IDUSUARIO = 0 THEN -1 ELSE @IDUSUARIO END

	SELECT  distinct IdContato, NomeInformado, c.Documento, NomeDoc, Codigo, IdWhatsApp, c.Telefone, c.UserWhatsApp, ClienteExterno, Cadastro, NomeRetornado, UltimoAcesso, c.Email, FaceId, FaceRecipentId, c.Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao,
	IdSession, Contato_Idcontato, Usuario_IdUsuario, s.DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,
	IdUsr, NomeUsuario,  Permissao, ConfigIdConfig,
	l.IdLista, CampanhaIdCampanha, Nome, l.Documento, NomeDocumento, Chave, l.Telefone, ConversaIdConvera, Desativado, UsuarioIdUsuario, FacebookId, l.Email ,
    IdStatusAtendimento, ConversaIdconversa, TipoFluxo, Fluxo_Origem, Fluxo_DestinoEsperado, Fluxo_DestinoInesperado, Resposta, RespostaEsperada, Finalizado ,
	QtdeNLido, UltimaMsg, DataUltimaMsg
	FROM dbo.Contatos c with (nolock)
		        inner join sessao s  with (nolock) on s.Contato_Idcontato = c.IdContato 
			    left join lista l with (nolock) on c.IdContato = l.ContatoIdContato  and l.idlista  in (select idlista from UltimoEnvio)
				left join usuarios u with (nolock) on s.[Usuario_IdUsuario] = u.IdUsr 
				left join StatusAtendimento st with (nolock) on st.ContatoIdContato = c.IdContato 
				LEFT JOIN VW_QTDENLIDA V with (nolock) ON V.Contatos_IdContato = C.IdContato
	WHERE( s.Usuario_IdUsuario = @IDUSUARIO or c.IdContato =@IDCONTATO) and s.DataEncerramento is null
    order by  DataUltimaMsg desc, QtdeNLido desc,  NomeRetornado   
END

IF @TIPO_ACAO = 'ESPERA'
BEGIN

SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao , (select count(*) from conversas where Contatos_IdContato = s.Contato_Idcontato and LidoChat=0) QtdeNLido
FROM SESSAO S
WHERE   (s.Usuario_IdUsuario = 0 ) AND
		 s.DataEncerramento IS NULL 	
END

IF @TIPO_ACAO = 'ENCERRA'
BEGIN

	UPDATE SESSAO
	SET DataEncerramento = GETDATE()
	WHERE IdSession = @ID


	SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao
	FROM SESSAO
	WHERE  IdSession =@ID

END

IF @TIPO_ACAO = 'TRANSF'
BEGIN
	UPDATE SESSAO
	SET DataAtendimento= GETDATE(),
	    Usuario_IdUsuario = @IDUSUARIO,
		DataEncerramento = null
	WHERE IdSession = @ID


	SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao
	FROM SESSAO
	WHERE  IdSession =@ID
END

IF @TIPO_ACAO = 'ATENDE'
BEGIN

	UPDATE SESSAO
	SET DataAtendimento= GETDATE(),
	    Usuario_IdUsuario = @IDUSUARIO
	WHERE IdSession = @ID
	      and Usuario_IdUsuario=0

	SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao
	FROM SESSAO
	WHERE  IdSession =@ID

END


IF @TIPO_ACAO = 'ATENDIMENTO'
BEGIN
	
	if not exists(select * from AtendimentoSessao where Sessao_IdSessao=@ID  and  Conversa_idConversa=@IDCONVERSA )
	begin
		INSERT INTO dbo.AtendimentoSessao ( Sessao_IdSessao, Conversa_idConversa)
		VALUES (@ID,@IDCONVERSA)
	end

	SELECT IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, Config_idconfig, Origem, Classificacao,@IDCONVERSA Conversa_idConversa
	FROM SESSAO 
	WHERE  IdSession =@ID 

END

IF @TIPO_ACAO = 'ATENDIMENTO_SESSAO'
BEGIN

	SELECT	IdSession, Contato_Idcontato, Usuario_IdUsuario, DataCriacao, DataAtendimento, DataEncerramento, s.Config_idconfig, s.Origem, s.Classificacao,
			IdConversa, Usuarios_IdUsr, Contatos_IdContato, IdConversaWhats, Sentido, Destino, Recebido, Lido, Data, Mensagem, conv.Config_IdConfig, Enviada, LidoChat, conv.Origem, conv.Classificacao
			IdContato, NomeInformado, Documento, NomeDoc, Codigo, IdWhatsApp, Telefone, UserWhatsApp, ClienteExterno, Cadastro, Status, NomeRetornado, UltimoAcesso, Email, FaceId, FaceRecipentId, Sexo, FaceMsgId, ImageProfile, IdConfig, DataAtualizacao
	FROM SESSAO S
		INNER JOIN AtendimentoSessao AT ON S.IdSession =AT.Sessao_IdSessao
		INNER JOIN dbo.Conversas CONV ON CONV.IdConversa = AT.Conversa_idConversa
		INNER JOIN dbo.Contatos CONT ON CONT.IdContato = CONV.Contatos_IdContato
	WHERE  IdSession =@ID

END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_STATUSATENDIMENTO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_STATUSATENDIMENTO]
	@TIPO_ACAO VARCHAR(50),
	@ID INT =0, 
	@IDCONTATO INT=0,
	@IDCONVERSA INT=0,
	@TIPO INT=0,
	@ORIGEM INT,
	@DESTINO_ESPERADO INT =0,
	@DESTINO_INESPERADO INT=0,
	@RESPOSTA VARCHAR(50)=NULL,
	@RESPOSTA_ESPERADA VARCHAR(50)=NULL,
	@FINALIZADO BIT =NULL

AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM dbo.StatusAtendimento WHERE ContatoIdContato = @IDCONTATO)
	BEGIN
		UPDATE StatusAtendimento
		SET  ConversaIdconversa= CASE WHEN @IDCONVERSA=0 THEN ConversaIdconversa ELSE @IDCONVERSA END, 
		     TipoFluxo= CASE WHEN @TIPO=0 THEN TipoFluxo ELSE @TIPO END, 
		     Fluxo_Origem= CASE WHEN @ORIGEM=0 THEN Fluxo_Origem ELSE @ORIGEM END, 
		     Fluxo_DestinoEsperado= CASE WHEN @DESTINO_ESPERADO=0 THEN Fluxo_DestinoEsperado ELSE @DESTINO_ESPERADO END, 
		     Fluxo_DestinoInesperado= CASE WHEN @DESTINO_INESPERADO=0 THEN Fluxo_DestinoInesperado ELSE @DESTINO_INESPERADO END, 
		     Resposta =ISNULL(@RESPOSTA,Resposta),
		     RespostaEsperada=ISNULL(@RESPOSTA_ESPERADA,RespostaEsperada),
		     Finalizado = ISNULL(@FINALIZADO,Finalizado)
		WHERE ContatoIdContato= @IDCONTATO
			
        SELECT ST.* ,L.IdLista,CA.NomeCampanha,CA.IdCampanha
		FROM StatusAtendimento ST
			LEFT JOIN CONTATOS C ON C.IdContato = ST.ContatoIdContato
			LEFT JOIN Lista L ON L.ContatoIdContato = C.IdContato
			LEFT JOIN dbo.Campanha CA ON CA.IdCampanha = L.CampanhaIdCampanha
	     WHERE ST.ContatoIdContato= @IDCONTATO
	END
	ELSE
	BEGIN
		INSERT StatusAtendimento ( ContatoIdContato, ConversaIdconversa, TipoFluxo, Fluxo_Origem, Fluxo_DestinoEsperado, Fluxo_DestinoInesperado, Resposta, RespostaEsperada,Finalizado)
		VALUES ( @IDCONTATO, @IDCONVERSA, @TIPO, @ORIGEM, @DESTINO_ESPERADO, @DESTINO_INESPERADO, @RESPOSTA, @RESPOSTA_ESPERADA,@FINALIZADO)
	
        SELECT ST.* ,L.IdLista,CA.NomeCampanha,CA.IdCampanha
		FROM StatusAtendimento ST
			LEFT JOIN CONTATOS C ON C.IdContato = ST.ContatoIdContato
			LEFT JOIN Lista L ON L.ContatoIdContato = C.IdContato
			LEFT JOIN dbo.Campanha CA ON CA.IdCampanha = L.CampanhaIdCampanha
	     WHERE ST.ContatoIdContato= @IDCONTATO
	END
END

IF @TIPO_ACAO = 'GETSTATUS'
BEGIN

	SELECT ST.* ,ISNULL(L.IdLista, 0), CA.NomeCampanha,CA.IdCampanha
	FROM StatusAtendimento ST
	    INNER JOIN CONTATOS C ON C.IdContato = ST.ContatoIdContato
		LEFT JOIN Lista L ON L.ContatoIdContato = C.IdContato
		LEFT JOIN dbo.Campanha CA ON ((CA.IdCampanha = L.CampanhaIdCampanha) OR (CA.IdCampanha=1))
	WHERE  C.IdContato=@IDCONTATO AND ST.Finalizado = 0
	      AND ( CA.DataTermino IS NULL OR    CA.DataTermino >= GETDATE())

	

END



IF @TIPO_ACAO = 'GET'
BEGIN

	SELECT ST.* ,L.IdLista,CA.NomeCampanha,CA.IdCampanha,CA.IdCampanha
	FROM StatusAtendimento ST
	    LEFT JOIN CONTATOS C ON C.IdContato = ST.ContatoIdContato
		LEFT JOIN Lista L ON L.ContatoIdContato = C.IdContato
		LEFT JOIN dbo.Campanha CA ON CA.IdCampanha = L.CampanhaIdCampanha
	WHERE ( @ID =0 OR IdStatusAtendimento =@ID ) AND
	      ( @IDCONTATO =0 OR ST.ContatoIdContato=@IDCONTATO) AND 
	      ( @IDCONVERSA = 0 OR ConversaIdconversa = @IDCONVERSA) AND
	      ( @TIPO = 0 OR TipoFluxo = @TIPO) AND 
	      ( @ORIGEM = 0 OR Fluxo_Origem = @ORIGEM) AND
	      ( @DESTINO_ESPERADO = 0 OR Fluxo_DestinoEsperado = @DESTINO_ESPERADO) AND
	      ( @DESTINO_INESPERADO = 0 OR Fluxo_DestinoInesperado = @DESTINO_INESPERADO ) AND
	      ( @RESPOSTA IS NULL OR Resposta = @RESPOSTA) AND
	      ( @RESPOSTA_ESPERADA IS NULL OR RespostaEsperada = @RESPOSTA_ESPERADA)AND
	      ( @FINALIZADO IS NULL OR  Finalizado= @FINALIZADO)

END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_TEXTOSUGESTAO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[STP_TB_TEXTOSUGESTAO]
	@TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@IDCONFIG INT =0,
	@TEXTO NVARCHAR(MAX)=NULL,
	@NOME Nvarchar(MAX) = null
AS

IF @TIPO_ACAO='SALVA'
BEGIN

	IF EXISTS(SELECT * FROM TEXTOSUGESTAO WHERE IDSUGEST=@ID)
	BEGIN
		UPDATE TEXTOSUGESTAO
		SET  NOme = Isnull(@NOME,nome),
		     CONFIG_IDCONFIG = @IDCONFIG, 
		     TEXTO = ISNULL(@TEXTO,TEXTO)
		WHERE IDSUGEST = @ID
		
		SELECT * FROM TEXTOSUGESTAO WHERE IDSUGEST = @ID
	END
	ELSE
	BEGIN
		INSERT INTO TEXTOSUGESTAO ( nome,TEXTO, CONFIG_IDCONFIG)
		VALUES (@nome,@TEXTO, @IDCONFIG)
		
		SELECT * FROM TEXTOSUGESTAO WHERE IDSUGEST = @@IDENTITY
	END
END

IF @TIPO_ACAO='GET'
BEGIN
	SELECT * 
	FROM TEXTOSUGESTAO 
	WHERE   (@ID =0 OR IDSUGEST =@ID) AND
			(@IDCONFIG =0 OR CONFIG_IDCONFIG = @IDCONFIG) AND
			(@NOME is null or Nome like @NOME + '%')
		
END

IF @TIPO_ACAO='DELETE'
BEGIN
	DELETE  
	FROM TEXTOSUGESTAO 
	WHERE   IDSUGEST =@ID
		
END

GO
/****** Object:  StoredProcedure [dbo].[STP_TB_TIPOS]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STP_TB_TIPOS]
@TIPO_ACAO VARCHAR(50), 
@ID INT = 0,
@REFERENCIA VARCHAR(50) =NULL,
@DESCRICAO VARCHAR(50) = NULL,
@VALOR VARCHAR(50) = NULL

AS

IF @TIPO_ACAO = 'SALVA'
BEGIN

	IF EXISTS(SELECT * FROM TIPOS WHERE IDTIPO = @ID)
	BEGIN
		UPDATE TIPOS
		SET Referencia=ISNULL(@REFERENCIA,Referencia), 
		    Valor = ISNULL(@VALOR, Valor), 
		    Descricao = ISNULL(@DESCRICAO,Descricao)
		WHERE IDTIPO = @ID
		
		SELECT * FROM TIPOS WHERE IDTIPO = @ID
	END
	ELSE
	BEGIN
		INSERT INTO TIPOS ( Referencia, Valor, Descricao)
		VALUES (@REFERENCIA,@VALOR,@DESCRICAO)
		
		SELECT * FROM TIPOS WHERE IDTIPO = @@IDENTITY
	END

END
IF @TIPO_ACAO = 'GET'
BEGIN
		SELECT * 
		FROM dbo.Tipos 
		WHERE (@ID = 0 OR @ID=IDTIPO) AND
			  (@REFERENCIA IS NULL OR Referencia =@REFERENCIA) AND
			  (@DESCRICAO IS NULL OR Descricao=@DESCRICAO) AND
			  (@VALOR IS NULL OR Valor=@VALOR) 
END
GO
/****** Object:  StoredProcedure [dbo].[STP_TB_USUARIO]    Script Date: 05/11/2024 09:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STP_TB_USUARIO]-- @TIPO_ACAO = 'AUTENTICA', @LOGIN='admin', @SENHA='+8FvIrffP+gIdCvMRSxWnQ=='
    @TIPO_ACAO VARCHAR(50),
	@ID INT = 0,
	@NOME VARCHAR(50) = NULL,
	@ID_EXTERNO VARCHAR(50) = NULL,
	@PERMISSAO INT =0,
	@SENHA VARCHAR(50) = NULL,
	@LOGIN VARCHAR(50) = NULL,
	@STATUS BIT = NULL,
	@NOVASENHA VARCHAR(50) = NULL,
	@CELULAR VARCHAR(50) =NULL,
	@EMAIL VARCHAR(50) = NULL,
	@CONFIRMACAO VARCHAR(50)=NULL,
	@IDCONFIG INT =0,
	@EquipeIdEquipe int =0
	
AS

IF @TIPO_ACAO = 'GET'
BEGIN
	SELECT IdUsr, NomeUsuario, Id_Externo, Permissao,  Email, Login, Status, Celular,ConfigIdConfig, t.descricao NomePermissao
	FROM dbo.Usuarios u
	left join tipos t on t.valor=u.Permissao and Referencia='TipoPermissao'
	WHERE ( IdUsr = @ID  or login = @LOGIN) and Status =0
END


IF @TIPO_ACAO = 'LISTAOPER'
BEGIN
	SELECT IdUsr, NomeUsuario, Id_Externo, Permissao,  Email, Login, Status, Celular,ConfigIdConfig, t.descricao NomePermissao
	FROM dbo.Usuarios u
	left join tipos t on t.valor=u.Permissao and Referencia='TipoPermissao'
	WHERE status=0 and Permissao > 1
END

IF @TIPO_ACAO = 'SALVA'
BEGIN
	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE IdUsr=@ID OR LOGIN = @LOGIN)
	BEGIN
		UPDATE dbo.Usuarios
		SET NomeUsuario = CASE WHEN @NOME IS NULL THEN  NomeUsuario ELSE @NOME END, 
		    Id_Externo = CASE WHEN @ID_EXTERNO IS NULL THEN  Id_Externo ELSE @ID_EXTERNO END,
		    Permissao = CASE WHEN @PERMISSAO = 0 THEN Permissao ELSE @PERMISSAO END,
		    LOGIN = ISNULL(@LOGIN,LOGIN),
		    STATUS = ISNULL(@STATUS,STATUS),
		    EMAIL = ISNULL(@EMAIL,EMAIL),
		    CELULAR = ISNULL(@CELULAR,CELULAR),
		    ConfigIdConfig = CASE WHEN @IDCONFIG = 0 THEN ConfigIdConfig ELSE @IDCONFIG END
		WHERE IdUsr=@ID OR LOGIN = @LOGIN
		
		SELECT * , t.descricao NomePermissao
		FROM dbo.Usuarios u
			left join tipos t on t.valor=u.Permissao and Referencia='TipoPermissao'
		 WHERE IdUsr=@ID OR LOGIN = @LOGIN
	END
	ELSE
	BEGIN
        INSERT INTO dbo.Usuarios ( NomeUsuario, Id_Externo, Permissao, Senha, Email, Login, Status, Celular,ConfigIdConfig)
		VALUES (@NOME, @ID_EXTERNO, @PERMISSAO  ,@SENHA, @EMAIL,@LOGIN,0,@CELULAR,@IDCONFIG)
		
		SELECT IdUsr, NomeUsuario, Id_Externo, Permissao,  Email, Login, Status, Celular,ConfigIdConfig , t.descricao NomePermissao
		FROM dbo.Usuarios u
		left join tipos t on t.valor=u.Permissao and Referencia='TipoPermissao'
		WHERE IdUsr=@@IDENTITY
	END
END

IF @TIPO_ACAO = 'ALTSENHA'
BEGIN
	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE LOGIN=@LOGIN AND SENHA=@SENHA AND LEN(@NOVASENHA) > 0)
	BEGIN
		UPDATE dbo.Usuarios
		SET SENHA = @NOVASENHA
		WHERE LOGIN = @LOGIN
		
		SELECT CONVERT(BIT,1) SUCESSO
	END
	ELSE
	BEGIN
		SELECT CONVERT(BIT,0) SUCESSO
	END
END

IF @TIPO_ACAO = 'AUTENTICA'
BEGIN
	IF EXISTS(SELECT * FROM dbo.Usuarios WHERE LOGIN=@LOGIN AND SENHA=@SENHA AND STATUS = 0)
	BEGIN
		SELECT CONVERT(BIT,1) SUCESSO
	END
	ELSE
	BEGIN
		SELECT CONVERT(BIT,0) SUCESSO
	END
END

IF @TIPO_ACAO = 'BLOQUEIA'
BEGIN

	UPDATE dbo.Usuarios SET Status=1 WHERE IdUsr = @ID OR Login=@LOGIN
END

IF @TIPO_ACAO = 'RECUPERASENHA'
BEGIN

    if exists(select * from Usuarios where IdUsr = @ID OR Login=@LOGIN)
    BEGIN
		UPDATE dbo.Usuarios SET  Confirmacao= CAST(RAND(CHECKSUM(NEWID())) * 100000 as INT) + 1   WHERE IdUsr = @ID OR Login=@LOGIN

		SELECT  *, t.descricao NomePermissao
		FROM dbo.Usuarios u
			left join tipos t on t.valor=u.Permissao and Referencia='TipoPermissao'
		WHERE IdUsr = @ID OR Login=@LOGIN
	END

	
END



IF @TIPO_ACAO = 'USR_CONFIG'
BEGIN

	SELECT * 
	FROM CONFIG C
		INNER JOIN [dbo].[UsuarioConfig] UC ON UC.[IdConfig] = C.[IdConfig]
	WHERE UC.IDUSR = @id
END

IF @TIPO_ACAO = 'ALTERASENHA_CONFIRMA'
BEGIN
	IF EXISTS(SELECT * FROM USUARIOS WHERE  Login=@LOGIN AND CONFIRMACAO =@CONFIRMACAO)
	BEGIN

		UPDATE dbo.Usuarios SET  SENHA=@SENHA   WHERE  Login=@LOGIN AND CONFIRMACAO =@CONFIRMACAO
		
		IF  @@Rowcount > 0
		BEGIN
			SELECT CONVERT(BIT,1) SUCESSO
		END
		ELSE
		BEGIN
			SELECT CONVERT(BIT,0) SUCESSO
		END
	END
	ELSE
	BEGIN
		SELECT CONVERT(BIT,0) SUCESSO
	END
	
END

GO
USE [master]
GO
ALTER DATABASE [Chatbot361_DB] SET  READ_WRITE 
GO
