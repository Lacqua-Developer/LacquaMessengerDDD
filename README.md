# Modelo Projeto .NET Core 6

## Arquitetura

DDD, TDD, Entity Framework, Code First, Clean Code, SOLID, API REST, Swagger, SQL Server, JWT, Ioc entre outros.

## Objetivo

Estrutura de um projeto inicial para um Bot de mensagem, onde o principal objetivo é criar uma abstração de dados para as operações de: 

<b>Add(TEntity obj)</b>: Adiciona um novo registro da entidade especificada.
<b>AddAll(IEnumerable<TEntity> obj)</b>: Adiciona um conjunto de novos registros da entidade especificada.
<b>DeleteAll(IEnumerable<TEntity> obj)</b>: Deleta um conjunto de registros da entidade especificada.
<b>Delete(TEntity obj)</b>: Deleta um único registro da entidade especificada.
<b>Delete(int id)</b>: Deleta um registro com o ID especificado.
<b>GetFull(int id, string[] parameters)</b>: Retorna uma consulta que carrega todas as informações relacionadas ao registro com o ID especificado, considerando os parâmetros fornecidos.
<b>Get(int id)</b>: Retorna o registro com o ID especificado.
<b>First()</b>: Retorna o primeiro registro.
<b>Get()</b>: Retorna uma consulta de todos os registros.
<b>Update(TEntity obj)</b>: Atualiza um registro existente da entidade especificada.
<b>Commit()</b>: Realiza todas as operações pendentes no contexto do banco de dados.
<b>AddOrUpdate(TEntity obj)</b>: Adiciona um novo registro ou atualiza um registro existente, dependendo da existência do registro na fonte de dados.
<b>CommitReturningIdentity(TEntity obj)</b>: Realiza todas as operações pendentes no contexto do banco de dados e retorna o ID do registro afetado.

