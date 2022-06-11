using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Posts;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Posts
{
    public class EfDeletePostCommand : EfGenericDelete<Post>, IDeletePostCommand
    {
        public EfDeletePostCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeletePostCommand;

        public override string Name => "Delete post using EF";
    }
}
