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
    public class EfAdminUpdateUserCommand : EfGenericUpdate<AdminCreateUserDto,User>, IAdminUpdateUserCommand
    {
        public EfAdminUpdateUserCommand(Context context, IMapper mapper, AdminUpdateUserValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfAdminUpdateUserCommand;

        public override string Name => "Admin update user";

    }
}
