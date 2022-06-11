using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Comments;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Comments
{
    public class EfGetCommentsQuery : EfGenericGet<CommentSearch, Comment, CommentDto>, IGetCommentsQuery
    {
        public EfGetCommentsQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetCommentsQuery;

        public override string Name => "Get Comments";
    }
}
