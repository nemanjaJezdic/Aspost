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
    public class EfCreatePostRatingCommand : EfGenericInsert<RatingDto,Rating>, ICreateRatingCommand
    {
        public EfCreatePostRatingCommand(Context context, IMapper mapper, CreatePostRatingValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreatePostRatingCommand;

        public override string Name => "Create post rating";
    }
}
