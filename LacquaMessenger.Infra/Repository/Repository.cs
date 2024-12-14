using LacquaMessenger.Domain.Repositories;
using System.Data.Entity.Validation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LacquaMessenger.Core.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace LacquaMessenger.Infra
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : Base
    {
        public Context Context;

        public Repository(Context context)
        {
            Context = context;
           
            context.Database.EnsureCreated();

        }

        
        private DbSet<TEntity> Entity { get { return Context.Set<TEntity>(); } }

        public TEntity? Add(TEntity obj)
        {
            //obj.DtInclusao = DateTime.Now;
            Entity.Add(obj);
            Commit();
            return obj;
        }

        public void AddAll(IEnumerable<TEntity> obj)
        {
            foreach (var entity in obj)
                Add(entity);
            Commit();
        }

        public void DeleteAll(IEnumerable<TEntity> obj)
        {
            foreach (var entity in obj)
                Delete(entity);
            Commit();
        }

        public void Delete(TEntity obj)
        {
            Entity.Remove(obj);
            Commit();
        }

        //public void Delete(int id)
        //{
        //    Entity.Remove(Get(id));
        //    Commit();
        //}

        //public TEntity Get(int id)
        //{

        //    return Entity.AsNoTracking().FirstOrDefault(x => x.Id == id);
        //}

        ///// <summary>
        /////  Retorna objetos completos conforme lista parametros com subtabelas maximo de 6 
        ///// </summary>
        ///// <param name="id"></param>
        ///// <param name="parameters"></param>
        ///// <returns></returns>
        //public IQueryable<TEntity> GetFull(int id, string[] parameters)
        //{
        //    IQueryable<TEntity> ret;
        //    //switch ((parameters != null ? parameters.Length : 0))
        //    //{
        //    //    case 0:
        //    //        ret = Entity.AsNoTracking().Where(x => x.Id == id);
        //    //        break;

        //    //    case 1:
        //    //        ret = Entity.AsNoTracking().Include(parameters[0]).Where(x => x.Id == id);
        //    //        break;

        //    //    case 2:
        //    //        ret = Entity.AsNoTracking()
        //    //                    .Include(parameters[0])
        //    //                    .Include(parameters[1])
        //    //                    .Where(x => x.Id == id);
        //    //        break;

        //    //    case 3:
        //    //        ret = Entity.AsNoTracking()
        //    //                    .Include(parameters[0])
        //    //                    .Include(parameters[1])
        //    //                    .Include(parameters[2])
        //    //                    .Where(x => x.Id == id);
        //    //        break;

        //    //    case 4:
        //    //        ret = Entity.AsNoTracking()
        //    //                    .Include(parameters[0])
        //    //                    .Include(parameters[1])
        //    //                    .Include(parameters[2])
        //    //                    .Include(parameters[3])
        //    //                    .Where(x => x.Id == id);
        //    //        break;

        //    //    case 5:
        //    //        ret = Entity.AsNoTracking()
        //    //                    .Include(parameters[0])
        //    //                    .Include(parameters[1])
        //    //                    .Include(parameters[2])
        //    //                    .Include(parameters[3])
        //    //                    .Where(x => x.Id == id);
        //    //        break;

        //    //    case 6:
        //    //        ret = Entity.AsNoTracking()
        //    //                    .Include(parameters[0])
        //    //                    .Include(parameters[1])
        //    //                    .Include(parameters[2])
        //    //                    .Include(parameters[4])
        //    //                    .Where(x => x.Id == id);
        //    //        break;


        //    //    default:
        //    //        ret = Entity.AsNoTracking().Where(x => x.Id == id);
        //    //        break;
        //    //}

        //    return ret;

        //}

        public TEntity First()
        {
            return Entity.AsNoTracking().FirstOrDefault<TEntity>();
        }

       
        public IQueryable<TEntity> Get()
        {
            try
            {

                return Entity.AsNoTracking().Distinct<TEntity>();       
            }
            catch(Exception ex)
            {
                var x = ex;
            }


            return null;
        }

        public void Update(TEntity obj)
        {
            //obj.DtAlteracao = DateTime.Now;
            Context.Entry(obj).State = EntityState.Modified;
            Commit();
        }

        //public void AddOrUpdate(TEntity obj)
        //{
        //    int id = 0;
        //    int.TryParse(obj.Id.ToString(), out id);
        //    if (id > 0)
        //    {
        //        if (Get(obj.Id).Id > 0)
        //        {
        //            var objUPD = Get(obj.Id);
        //            obj.DtInclusao = objUPD.DtInclusao;
        //            Update(obj);
        //        }
        //        else
        //            Add(obj);
        //    }
        //    else
        //    {
        //        Add(obj);
        //    }

        //    Commit();
        //}

        public void Commit()
        {
            try
            {


                Context.SaveChanges();

            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }

        public IQueryable<TEntity> GetFull(int id, string[] parameters)
        {
            throw new NotImplementedException();
        }

        public void AddOrUpdate(TEntity obj)
        {
            throw new NotImplementedException();
        }

        public int CommitReturningIdentity(TEntity obj)
        {
            throw new NotImplementedException();
        }

        //public int CommitReturningIdentity(TEntity obj)
        //{
        //    int ret = 0;
        //    try
        //    {


        //        Context.SaveChanges();
        //        ret = obj.Id;

        //    }
        //    catch (DbEntityValidationException e)
        //    {
        //        foreach (var eve in e.EntityValidationErrors)
        //        {
        //            Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
        //                eve.Entry.Entity.GetType().Name, eve.Entry);
        //            foreach (var ve in eve.ValidationErrors)
        //            {
        //                Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
        //                    ve.PropertyName, ve.ErrorMessage);
        //            }
        //        }
        //        throw;
        //    }

        //    return ret;
        //}


    }
}
