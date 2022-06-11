using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;

namespace ASPOST.Application.Queries.Logs
{
    public interface IGetOneLogQuery : IQuery<LogDto, int>
    {
    }
}
