using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.Application.Searches;

namespace ASPOST.Application.Queries.Logs
{
    public interface IGetLogsQuery : IQuery<PageResponse<LogDto>, LogSearch>
    {
    }
}
