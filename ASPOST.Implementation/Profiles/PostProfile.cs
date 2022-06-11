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
    public class PostProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public PostProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<Post, PostDto>();
            CreateMap<PostDto, Post>();

            CreateMap<CreatePostDto, Post>()
                .ForMember(x => x.UserId, x => x.MapFrom(y => _actor.Id));
               

            CreateMap<Post, CreatePostDto>();
        }

    }
}
