using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Entities
{
    public class Ofensa : Base
    {

        public Ofensa() { }

        public Ofensa(object _id, object _palavra, object _composta)
        {
            int i = 0;
            bool b = false;

            int.TryParse(_id.ToString(), out i);
            bool.TryParse(_composta.ToString(), out b);

            this.Id = i;
            composta = b;
            palavra = _palavra.ToString();
        }

        public string palavra { get; set; }
        public bool composta { get; set; }
    }
}