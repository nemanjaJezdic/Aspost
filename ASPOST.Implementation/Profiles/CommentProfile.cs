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
    public class CommentProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public CommentProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<Comment, CommentDto>();
            CreateMap<CommentDto, Comment>()
                .ForMember(x => x.UserId, y => y.MapFrom(y => _actor.Id));
        }
    }
}
