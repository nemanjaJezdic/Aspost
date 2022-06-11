using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.UseCases;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.UseCases
{
    public class EfDeleteUserUseCaseCommand : EfGenericDelete<UserUseCase>, IDeleteUseCaseCommand
    {
        public EfDeleteUserUseCaseCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteUserUseCaseCommand;

        public override string Name => "Delete User use case";
    }
}
