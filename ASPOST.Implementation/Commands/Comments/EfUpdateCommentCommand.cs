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
    public class EfUpdateCommentCommand : EfGenericUpdate<CommentDto, Comment>, IUpdateCommentCommand
    {
        public EfUpdateCommentCommand(Context context, IMapper mapper, UpdateCommentValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdateCommentCommand;

        public override string Name => "Update comment";
    }
}
