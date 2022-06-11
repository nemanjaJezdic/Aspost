using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Logs;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.UseCasesLogs
{
    public class EfGetUseCaseLogsQuery : EfGenericGet<LogSearch,Logs, LogDto>, IGetLogsQuery
    {
        
        public EfGetUseCaseLogsQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUseCaseLogsQuery;

        public override string Name => "Get use case logs";
    }
}
