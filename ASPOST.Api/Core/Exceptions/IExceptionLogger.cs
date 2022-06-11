using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASPOST.Api.Core.Exceptions
{
    public interface IExceptionLogger
    {
        void Log(Exception ex);
    }
}
