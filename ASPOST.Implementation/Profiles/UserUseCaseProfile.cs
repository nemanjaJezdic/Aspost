using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using AutoMapper;

namespace ASPOST.Implementation.Profiles
{
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<UserUseCase, UseCaseDto>();
            CreateMap<UseCaseDto, UserUseCase>();
        }
    }
}
