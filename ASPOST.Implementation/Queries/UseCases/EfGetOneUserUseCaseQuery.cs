using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.UseCases;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.UseCases
{
    public class EfGetOneUserUseCaseQuery : EfGenericGetSingle<UserUseCase, UseCaseDto>, IGetOneUseCaseQuery
    {
        public EfGetOneUserUseCaseQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneUserUseCaseQuery;

        public override string Name => "Get one user use case";
    }
}
