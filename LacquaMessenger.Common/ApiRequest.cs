using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace LacquaMessenger.Common
{
    public static class ApiRequest
    {
        public static async Task<T> Get<T>(string url, string? token = null)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

            using (var client = new HttpClient())
            {
                if (token != null)
                {
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                }

                client.Timeout = TimeSpan.FromSeconds(10);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                try
                {
                    var response = await client.GetAsync(url).ConfigureAwait(false);
                    if (response.IsSuccessStatusCode)
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        // Desserializa o conteúdo da resposta para o tipo genérico T
                        return JsonSerializer.Deserialize<T>(responseContent);
                    }
                    else
                    {
                        // Se não for sucesso, você pode lançar uma exceção ou retornar um valor padrão
                        throw new Exception($"Erro ao fazer a requisição GET. Status code: {response.StatusCode}");
                    }
                }
                catch (Exception ex)
                {
                    // Tratar erros adequados, logar, etc.
                    throw new Exception("Erro na requisição GET", ex);
                }
            }
        }

        public static async Task<TResponse> Post<TRequest, TResponse>(string url, TRequest data, string? token = null)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

            using (var client = new HttpClient())
            {
                if (token != null)
                {
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                }

                client.Timeout = TimeSpan.FromSeconds(10);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                try
                {
                    // Serializa o objeto data para o formato JSON
                    var content = new StringContent(JsonSerializer.Serialize(data), Encoding.UTF8, "application/json");

                    var response = await client.PostAsync(url, content).ConfigureAwait(false);
                    if (response.IsSuccessStatusCode)
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        // Desserializa o conteúdo da resposta para o tipo genérico TResponse
                        return JsonSerializer.Deserialize<TResponse>(responseContent);
                    }
                    else
                    {
                        // Se não for sucesso, você pode lançar uma exceção ou retornar um valor padrão
                        throw new Exception($"Erro ao fazer a requisição POST. Status code: {response.StatusCode}");
                    }
                }
                catch (Exception ex)
                {
                    // Tratar erros adequados, logar, etc.
                    throw new Exception("Erro na requisição POST", ex);
                }
            }
        }


    }
}
