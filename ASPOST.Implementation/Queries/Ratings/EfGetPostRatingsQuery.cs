using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Rating;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Ratings
{
    public class EfGetPostRatingsQuery : EfGenericGet<RatingSearch, Rating, RatingDto>, IGetRatingsQuery
    {
        public EfGetPostRatingsQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetPostRatingsQuery;

        public override string Name => "Get post ratings";

    }
}
