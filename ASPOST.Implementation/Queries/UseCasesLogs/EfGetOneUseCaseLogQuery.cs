using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries;
using ASPOST.Application.Queries.Logs;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.UseCasesLogs
{
    public class EfGetOneUseCaseLogQuery : EfGenericGetSingle<Logs, LogDto>, IGetOneLogQuery
    {
        public EfGetOneUseCaseLogQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUseCaseLogQuery;

        public override string Name => "Get one use case log";
    }
}
