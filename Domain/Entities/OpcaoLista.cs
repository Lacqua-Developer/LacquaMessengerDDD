using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Domain.Entities
{
    public class OpccaoLista
    {
        private int _IdLista;

        public OpccaoLista()
        { }

        public OpccaoLista(int IdLista)
        {
            _IdLista = IdLista;
        }

        [Key]
        public int IdOpcaoLista { get; set; }
        public int ListaIdlista { get { return _IdLista; } set { _IdLista = value; } }
        public int Ordem { get; set; }
        public string Opcao { get; set; }
    }
}
