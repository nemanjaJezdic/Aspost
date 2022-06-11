using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASPOST.Api.Core.Exceptions
{
    public class ConsoleExceptionLogger : IExceptionLogger
    {
        public void Log(Exception ex)
        {
            Console.WriteLine(ex);
        }
    }
}
