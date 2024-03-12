using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Core.UseCase
{
    public class Output
    {
        public Output() { }
        public Output(bool success, int errorCode, string? errorMessage, object? data)
        {
            Success = success;
            ErrorCode = errorCode;
            ErrorMessage = errorMessage;
            Data = data;
        }

        public bool Success { get; internal set; }
        public int? ErrorCode { get; internal set; }
        public string? ErrorMessage { get; internal set; }
        public object? Data { get; internal set; }
    }
}
