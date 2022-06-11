using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Comments;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Comments
{
    public class EfGetOneCommentQuery : EfGenericGetSingle<Comment, CommentDto>, IGetOneCommentQuery
    {

        public EfGetOneCommentQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneCommentQuery;

        public override string Name => "Get one comment";

    }
}
