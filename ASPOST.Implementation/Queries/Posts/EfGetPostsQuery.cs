using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Posts;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Posts
{
    public class EfGetPostsQuery : EfGenericGet<PostSearch, Post, PostDto>, IGetPostsQuery
    {
        public EfGetPostsQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetPostsQuery;

        public override string Name => "Get Posts";
    }
}
