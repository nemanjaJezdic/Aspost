using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Users;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Users
{
    public class EfGetUsersQuery : EfGenericGet<UserSearch, User, UserDto>, IGetUsersQuery
    {
        public EfGetUsersQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUsersQuery;

        public override string Name => "Get users";


    }
}
