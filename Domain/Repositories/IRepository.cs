using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Repositories
{
    public  interface IRepository<TEntity>
    {
        TEntity Add(TEntity obj);
        void AddAll(IEnumerable<TEntity> obj);
        void DeleteAll(IEnumerable<TEntity> obj);
        void Delete(TEntity obj);
        //void Delete(int id);

        IQueryable<TEntity> GetFull(int id, string[] parameters);
        //TEntity Get(int id);

        TEntity First();
        IQueryable<TEntity> Get();
        void Update(TEntity obj);

        void Commit();

        void AddOrUpdate(TEntity obj);

        int CommitReturningIdentity(TEntity obj);

    }
}
