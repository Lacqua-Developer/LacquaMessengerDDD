using LacquaMessenger.Core.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Core.UseCase
{
    public interface IUseCaseCore<TInput> where TInput : Base
    {

    }
}
