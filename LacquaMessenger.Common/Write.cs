using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;

namespace CommonLib.Util
{
    public static class Write
    {

        public static void Log(string TextoEvent)
        {
            string dir = AppDomain.CurrentDomain.BaseDirectory;
            string path = dir + "Eventos.log";
            // This text is added only once to the file.
            try
            {
                if (!File.Exists(path))
                {
                    // Create a file to write to.
                    using (StreamWriter sw = File.CreateText(path))
                    {
                        sw.WriteLine(TextoEvent);
                        sw.Close();
                    }
                }
                else
                {
                    // This text is always added, making the file longer over time
                    // if it is not deleted.
                    using (StreamWriter sw = File.AppendText(path))
                    {
                        sw.WriteLine(TextoEvent);
                        sw.Close();

                    }
                }
            }
            catch(Exception ex)
            {
                // Create a file to write to.
                try
                {
                    using (StreamWriter sk = File.CreateText(dir + "Eventos" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".log"))
                    {
                        sk.WriteLine(TextoEvent);
                        sk.WriteLine("----------------------------------------------------------------------------------------------");
                        sk.WriteLine(ex.Message);
                        sk.Close();
                    }
                }
                catch(Exception exx)
                {
                    Console.WriteLine(exx.Message);
                    Console.WriteLine(TextoEvent);
                    Console.WriteLine("----------------------------------------------------------------------------------------------");
                    Console.WriteLine(ex.Message);
                }
            }

        }

        public static bool IsBinaryEqualTo(this object obj, object obj1)
        {                   
            using (MemoryStream memStream = new MemoryStream())
            {
                if (obj == null || obj1 == null)
                {
                    if (obj == null && obj1 == null)
                        return true;
                    else
                        return false;
                }

                BinaryFormatter binaryFormatter = new BinaryFormatter(null, new StreamingContext(StreamingContextStates.Clone));
                binaryFormatter.Serialize(memStream, obj);
                byte[] b1 = memStream.ToArray();
                memStream.SetLength(0);

                binaryFormatter.Serialize(memStream, obj1);
                byte[] b2 = memStream.ToArray();

                if (b1.Length != b2.Length)
                    return false;

                for (int i = 0; i < b1.Length; i++)
                {
                    if (b1[i] != b2[i])
                        return false;
                }

                return true;
            }
        }

        public static string randon(int len)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[len];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;                                        
        }
    }
}
