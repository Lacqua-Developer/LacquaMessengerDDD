# Modelo Projeto .NET Core 6

## Arquitetura

DDD, TDD, Entity Framework, Code First, Clean Code, SOLID, API REST, Swagger, SQL Server, JWT, Ioc entre outros.

## Objetivo
Projeto desenvolvido em Visual Studio 2022 Comunity com .NET Core 6, acessando bando de dados SQL Server Express.

Esse é um projeto inicial para um Bot de mensagem, onde o principal objetivo é criar uma abstração de dados para as operações de: 

<ul>
<li><b>Add(TEntity obj)</b>: Adiciona um novo registro da entidade especificada.</li>
<li><b>AddAll(IEnumerable<TEntity> obj)</b>: Adiciona um conjunto de novos registros da entidade especificada.</li>
<li><b>DeleteAll(IEnumerable<TEntity> obj)</b>: Deleta um conjunto de registros da entidade especificada.</li>
<li><b>Delete(TEntity obj)</b>: Deleta um único registro da entidade especificada.</li>
<li><b>Delete(int id)</b>: Deleta um registro com o ID especificado.</li>
<li><b>GetFull(int id, string[] parameters)</b>: Retorna uma consulta que carrega todas as informações relacionadas ao registro com o ID especificado, considerando os parâmetros fornecidos.</li>
<li><b>Get(int id)</b>: Retorna o registro com o ID especificado.</li>
<li><b>First()</b>: Retorna o primeiro registro.</li>
<li><b>Get()</b>: Retorna uma consulta de todos os registros.</li>
<li><b>Update(TEntity obj)</b>: Atualiza um registro existente da entidade especificada.</li>
<li><b>Commit()</b>: Realiza todas as operações pendentes no contexto do banco de dados.</li>
<li><b>AddOrUpdate(TEntity obj)</b>: Adiciona um novo registro ou atualiza um registro existente, dependendo da existência do registro na fonte de dados.</li>
<li><b>CommitReturningIdentity(TEntity obj)</b>: Realiza todas as operações pendentes no contexto do banco de dados e retorna o ID do registro afetado.</li>
</ul>

## Requisitos mínimos

<ul>
<li>Visual Studio 2022 Comunity com .NET Core 6</li>
<li>SQL Server Express</li>
</ul>


## Configuração

<ul>
<li>Clonar o repositório com comando: git clone https://github.com/Lacqua-Developer/LacquaMessengerDDD.git</li>
<li>Abrir o projeto pelo arquivo <b>LacquaMessenger.Core.sln</b>></li>
<li>Configurar o arquivo appsettings.json, chave ConnectionStrings na pasta LacquaMessenger.Api</li>
<li>Execute o projeto</li>
</ul>

## API Rest

Quando o projeto é iniciado, por padrão, é criado o usuário "Admin" e para acessar a api é necessário informar o token retornado do login;

login: Admin </br>
senha: 102030</br>

![Tela Swagger](./images/API_REST.png)

Retorno: 
{
  "nomeUsuario": "Administrador",
  "id_Externo": null,
  "permissao": 2,
  "senha": "",
  "email": null,
  "login": "Admin",
  "status": null,
  "celular": null,
  "confirmacao": null,
  "idConfig": null,
  "logado": true,
 <strong> "tokenLogin": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxIiwidW5pcXVlX25hbWUiOiJBZG1pbmlzdHJhZG9yIiwiZ3JvdXBzaWQiOiIwIiwicm9sZSI6IjIiLCJwcmltYXJ5c2lkIjoiMSIsIm5iZiI6MTcxMDI1NzE3MywiZXhwIjoxNzEwMjY0MzczLCJpYXQiOjE3MTAyNTcxNzN9.Mmx1k7OzD8CvbftRQMnhz6ieac9jqLwPwIZVXSwB2GU" </strong>,
  "id": 1,
  "nome": "ADMIN",
  "dtInclusao": null,
  "dtAlteracao": "2024-03-12T12:26:13.77192-03:00"
}

Copie a chave tokenLogin e cole no campo value iniciando o a palavra "Bearer" antes da chave, assim voce terá acesso aos outros métodos  da API.

![Autorize](./images/Autorize.png)

