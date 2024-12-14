using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Core.Entities
{
    public abstract class Base
    {
        //private string nome;

        //public int Id { get; set; }
        //public string Nome { get { return nome; } set { nome = (value != null ? value.ToUpper() : null); } }
        //public DateTime? DtInclusao { get; set; }
        //public DateTime? DtAlteracao { get; set; }

    }

    public abstract class EntityBase<TKey>
    {
        public EntityBase(TKey id)
        {
            this.Id = id;
        }

        public TKey Id { get; set; }
    }

    public abstract class EntityBase : EntityBase<int>
    {
        public EntityBase() : base(0) { }

        public EntityBase(int id) : base(id) { }
    }
}
