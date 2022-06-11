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
    public class EfUpdateUserUseCaseCommand : EfGenericUpdate<UseCaseDto, UserUseCase>, IUpdateUseCaseCommand
    {
        public EfUpdateUserUseCaseCommand(Context context, IMapper mapper, UpdateUserUseCaseValidator validator) : base(context, mapper, validator)
        {
        }
        public override int Id => (int)UseCasesEnum.EfUpdateUserUseCaseCommand;

        public override string Name => "Update user use case";
    }
}
