using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.UseCases;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.UseCases
{
    public class EfGetUserUseCasesQuery : EfGenericGet<UseCaseSearch, UserUseCase, UseCaseDto>, IGetUseCasesQuery
    {
        public EfGetUserUseCasesQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetUserUseCasesQuery;

        public override string Name => "Get User use cases";
    }
}
