using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Ratings;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Ratings;
using AutoMapper;

namespace ASPOST.Implementation.Commands.Ratings
{
    public class EfUpdatePostRatingCommand : EfGenericUpdate<RatingDto, Rating>, IUpdateRatingCommand
    {
        public EfUpdatePostRatingCommand(Context context, IMapper mapper, UpdatePostRatingValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdatePostRatingCommand;

        public override string Name => "Update post rating";
    }
}
