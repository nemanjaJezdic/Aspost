using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using AutoMapper;

namespace ASPOST.Implementation.Profiles
{
    public class PostRatingProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public PostRatingProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<RatingDto, Rating>()
                .ForMember(x => x.UserId, y => y.MapFrom(u => _actor.Id));

            CreateMap<Rating, RatingDto>();
        }
    }
}
