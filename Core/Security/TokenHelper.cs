
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using Microsoft.IdentityModel.JsonWebTokens;
using System.Security.Claims;
using System.Text;



namespace LacquaMessenger.Core.Security
{
    public static class TokenHelper
    {
        public static string CreateToken(int id, string? nome, int? idCliente, int? TipoUsuario)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(ConfigCore.GetValue("Security:JwtKey"));

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Sid, id.ToString()),
                    new Claim(ClaimTypes.Name, nome ?? String.Empty),
                    new Claim(ClaimTypes.GroupSid, idCliente.ToString()),
                    new Claim(ClaimTypes.Role, TipoUsuario.ToString()),
                    new Claim(ClaimTypes.PrimarySid, id.ToString()),

                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }
    }
}
