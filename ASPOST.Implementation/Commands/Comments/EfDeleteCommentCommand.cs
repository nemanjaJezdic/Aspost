using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Comments;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Comments
{
    public class EfDeleteCommentCommand : EfGenericDelete<Comment>, IDeleteCommentCommand
    {
        public EfDeleteCommentCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteCommentCommand;
        public override string Name => "Delete comment";
    }
}
