using System.Net.Sockets;

namespace CommonLib.Util
{
    public static class TelnetChecker
    {
        public static bool IsPortOpen(string host, int port, int timeout)
        {
            try
            {
                using (var client = new TcpClient())
                {
                    var result = client.BeginConnect(host, port, null, null);
                    var success = result.AsyncWaitHandle.WaitOne(TimeSpan.FromMilliseconds(timeout));

                    if (!success)
                    {
                        return false;
                    }

                    // Verifica se a conexão foi bem-sucedida
                    client.EndConnect(result);
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}