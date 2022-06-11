using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.UseCases;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.UseCases;
using AutoMapper;

namespace ASPOST.Implementation.Commands.UseCases
{
    public class EfCreateUserUseCaseCommand : EfGenericInsert<UseCaseDto, UserUseCase>, ICreateUseCaseCommand
    {
        public EfCreateUserUseCaseCommand(Context context, IMapper mapper, CreateUserUseCaseValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreateUserUseCaseCommand;

        public override string Name => "Create user use case";
    }
}
