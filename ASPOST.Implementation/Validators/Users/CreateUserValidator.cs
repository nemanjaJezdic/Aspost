using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.Users
{
    public class CreateUserValidator : AbstractValidator<CreateUserDto>
    {
        public CreateUserValidator(Context _context)
        {
            RuleFor(x => x.FirstName).NotEmpty().MinimumLength(3);
            RuleFor(x => x.LastName).NotEmpty().MinimumLength(3);

            RuleFor(x => x.Password).NotEmpty().MinimumLength(6);

            RuleFor(x => x.Username).NotEmpty().MinimumLength(3)
                .Must(x => !_context.Users.Any(user => user.Username == x))
                .WithMessage("Username is already taken.");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !_context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken.");

        }
    }
}
