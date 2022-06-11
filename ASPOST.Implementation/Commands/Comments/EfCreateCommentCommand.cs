using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Comments;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Comments;
using AutoMapper;

namespace ASPOST.Implementation.Commands.Comments
{
    public class EfCreateCommentCommand : EfGenericInsert<CommentDto,Comment>, ICreateCommentCommand
    {
        public EfCreateCommentCommand(Context context, IMapper mapper, CreateCommentValidator validator)
            : base(context, mapper, validator)
        {

        }

        public override int Id => (int)UseCasesEnum.EfCreateCommentCommand;

        public override string Name => "Create new comment ef";
    }
}
