using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Service
{
    public interface IService<TEntity>
    {
        void DoSomethingWithEntity(TEntity entity);
        // Outros métodos do serviço, se necessário
    }



}
