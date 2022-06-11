using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Posts;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Posts
{
    public class EfGetOnePostQuery : EfGenericGetSingle<Post, PostDto>, IGetOnePostQuery
    {
        public EfGetOnePostQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOnePostQuery;

        public override string Name => "Get one post";
    }
}
