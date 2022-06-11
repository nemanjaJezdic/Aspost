using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Users;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Extensions;
using ASPOST.Implementation.Validators.Users;
using AutoMapper;
using FluentValidation;

namespace ASPOST.Implementation.Commands.Users
{
    public class EfAdminCreateUserCommand : IAdminCreateUserCommand
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly AdminCreateUserValidator _validator;

        public EfAdminCreateUserCommand(Context context, IMapper mapper, AdminCreateUserValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfAdminCreateUserCommand;

        public string Name => "Admin create User";
        public void Execute(AdminCreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _mapper.Map<User>(request);

            if (!user.IsAdmin)
            {
                user.AddDefaultUseCases();
            }

            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}
