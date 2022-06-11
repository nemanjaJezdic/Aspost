using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Rating;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Ratings
{
    public class EfGetOnePostRatingQuery : EfGenericGetSingle<Rating, RatingDto>, IGetOneRatingQuery
    {
        public EfGetOnePostRatingQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOnePostRatingQuery;

        public override string Name => "Get one post rating";
    }
}
