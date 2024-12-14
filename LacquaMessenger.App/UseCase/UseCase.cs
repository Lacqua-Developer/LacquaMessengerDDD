using LacquaMessenger.Domain.UseCases;
using LacquaMessenger.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LacquaMessenger.Domain.Repositories;

namespace LacquaMessenger.App
{
    public class UseCase<T> : IUseCase<T> where T : Base
    {
        private readonly IRepository<T> _repository;

        public UseCase(IRepository<T> repository)
        {
            _repository = repository;
        }


        public T Add(T obj)
        {
            return _repository.Add(obj);
        }

        public void AddAll(IEnumerable<T> obj)
        {
            _repository.AddAll(obj);
        }

        public void AddOrUpdate(T obj)
        {
            _repository.AddOrUpdate(obj);
        }

        public void Commit()
        {
            _repository?.Commit();
        }

        public int CommitReturningIdentity(T obj)
        {
            return _repository.CommitReturningIdentity(obj);
        }

        public void Delete(T obj)
        {
            _repository.Delete(obj);
        }

        //public void Delete(int id)
        //{
        //    _repository.Delete(id);
        //}

        public void DeleteAll(IEnumerable<T> obj)
        {
            _repository.DeleteAll(obj);
        }

        public T First()
        {
            return _repository.First();
        }

        //public T Get(int id)
        //{
        //    return _repository.Get(id);
        //}

        public IQueryable<T> Get()
        {
            return _repository.Get();
        }

        public IQueryable<T> GetFull(int id, string[] parameters)
        {
             return _repository.GetFull(id, parameters);
        }

        public void Update(T obj)
        {
            _repository.Update(obj);
        }


    }
}
