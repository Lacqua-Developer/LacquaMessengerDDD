using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace System
{
    public static class StringExtensions
    {
        public static bool IsNullOrEmpty(this string? text)
        {
            return String.IsNullOrEmpty(text);
        }

        public static string StringNumebersOnly(this decimal value)
        => decimal.Round(value, 2).ToString().StringNumebersOnly();

        public static string StringNumebersOnly(this string value)
        => string.Join("", Regex.Split(value ?? "0", @"[^\d]"));

        public static string RemoverAcentosEReplace(this string texto)
        {
            if (string.IsNullOrEmpty(texto))
                return string.Empty;

            string textoSemAcentos = new string(texto.Normalize(NormalizationForm.FormD)
                 .Where(ch => CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark)
                  .ToArray());

            return textoSemAcentos;
        }

    }
}