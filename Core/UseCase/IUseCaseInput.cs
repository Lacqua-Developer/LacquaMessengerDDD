using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Core.UseCase
{
    public interface IUseCaseInput : IRequest<Output>, IBaseRequest
    {
    }
}
