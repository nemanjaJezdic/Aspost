using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Users;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Users;
using AutoMapper;

namespace ASPOST.Implementation.Commands.Users
{
    public class EfUpdateUserCommand : EfGenericUpdate<CreateUserDto,User>, IUpdateUserCommand
    {
        public EfUpdateUserCommand(Context context, IMapper mapper, UpdateUserValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdateUserCommand;

        public override string Name => "Update user";
    }
}
