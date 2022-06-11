using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Users;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Users
{
    public class EfDeleteUserCommand : EfGenericDelete<User>, IDeleteUserCommand
    {

        public EfDeleteUserCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteUserCommand;

        public override string Name => "Delete user";
    }
}
