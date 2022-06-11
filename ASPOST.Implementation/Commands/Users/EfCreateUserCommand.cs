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
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly CreateUserValidator _validator;

        public EfCreateUserCommand(Context context, IMapper mapper, CreateUserValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfCreateUserCommand;

        public string Name => "User Registration";
        public void Execute(CreateUserDto request)
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
