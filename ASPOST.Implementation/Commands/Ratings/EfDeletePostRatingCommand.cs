using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Ratings;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Ratings
{
    public class EfDeletePostRatingCommand : EfGenericDelete<Rating>, IDeleteRatingCommand
    {
        public EfDeletePostRatingCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeletePostRatingCommand;

        public override string Name => "Delete post rating";

    }
}
