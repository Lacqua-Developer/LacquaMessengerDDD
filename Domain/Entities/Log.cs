using LacquaMessenger.Core.Entities;
using System;

namespace LacquaMessenger.Domain.Entities
{
    public class Log : Base
    {
        public Log() { }    

        public DateTime Data { get; set; }
        public string Tipo { get; set; }
        public string Mensagem { get; set; }

    }
}
