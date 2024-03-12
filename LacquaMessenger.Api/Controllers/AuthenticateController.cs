using Microsoft.AspNetCore.Mvc;
using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Domain.UseCases;
using LacquaMessenger.Api.Model;
using LacquaMessenger.App.Security;

namespace LacquaMessenger.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {

        private readonly IUseCase<Usuario> _useCase;

        public AuthenticateController(IUseCase<Usuario> useCase)
        {
            _useCase = useCase;
        }

        [HttpPost("login")]
        public  Usuario Login([FromBody] AuthenticateInput input)
        {
            return new Auth(_useCase).Authenticate(input.Login, input.Senha);
        }


    }
}

