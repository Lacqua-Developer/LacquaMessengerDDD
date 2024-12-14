using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using WhatsappBusiness.CloudApi.Webhook;

namespace LacquaMessenger.Domain.Service
{
    public class TiposService : IService<Tipos>
    {
        private readonly IRepository<Tipos> _repository;

        public TiposService(IRepository<Tipos> repository)
        {
            _repository = repository;
        }

        public void DoSomethingWithEntity(Tipos entity)
        {
            throw new NotImplementedException();
        }
    }

    public static class EnumGenerator
    {
        public static void GerarEnums(List<Tipos> tipos)
        {
            var grupos = tipos.GroupBy(t => t.Referencia);

            foreach (var grupo in grupos)
            {
                var enumName = grupo.Key;
                var valores = grupo.ToDictionary(t => t.Descricao, t => t.Valor);

                CriarEnum(enumName, valores);
            }
        }

        private static void CriarEnum(string nomeEnum, Dictionary<string, string> valores)
        {
            var assemblyName = new AssemblyName("EnumsDinamicos");
            var assemblyBuilder = AssemblyBuilder.DefineDynamicAssembly(assemblyName, AssemblyBuilderAccess.Run);
            var moduleBuilder = assemblyBuilder.DefineDynamicModule("EnumsModule");

            var enumBuilder = moduleBuilder.DefineEnum(nomeEnum, TypeAttributes.Public, typeof(int));

            foreach (var valor in valores)
            {
                enumBuilder.DefineLiteral(valor.Key, valor.Value);
            }

            enumBuilder.CreateTypeInfo();
        }
    }
}
