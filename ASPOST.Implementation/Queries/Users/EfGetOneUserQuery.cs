using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Users;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Users
{
    public class EfGetOneUserQuery : EfGenericGetSingle<User, UserDto>, IGetOneUserQuery
    {
        public EfGetOneUserQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneUserQuery;

        public override string Name => "Get one user";
    }
}
