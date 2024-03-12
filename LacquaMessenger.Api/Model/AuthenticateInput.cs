using LacquaMessenger.Core.UseCase;

namespace LacquaMessenger.Api.Model
{


    public class AuthenticateInput 
    {
        public string? Login { get; set; }
        public string? Senha { get; set; }
    }
}
