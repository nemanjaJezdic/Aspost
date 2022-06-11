using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Users;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Users
{
    public class EfAdminDeleteUserCommand : EfGenericDelete<User>, IAdminDeleteUserCommand
    {
        public EfAdminDeleteUserCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfAdminDeleteUserCommand;

        public override string Name => "Admin delete user";
    }
}
