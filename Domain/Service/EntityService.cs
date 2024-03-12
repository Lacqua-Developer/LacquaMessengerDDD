﻿using LacquaMessenger.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Service
{
    public class EntityService<TEntity> : IService<TEntity>
    {
        private readonly IRepository<TEntity> _repository;

        public EntityService(IRepository<TEntity> repository)
        {
            _repository = repository;
        }

        public void DoSomethingWithEntity(TEntity entity)
        {
            // Lógica do serviço que utiliza o repositório
        }
    }
}
