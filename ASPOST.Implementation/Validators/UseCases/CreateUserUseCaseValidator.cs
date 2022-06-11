using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.UseCases
{
    public class CreateUserUseCaseValidator : AbstractValidator<UseCaseDto>
    {
        public CreateUserUseCaseValidator(Context context)
        {
            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(u => u.Id == x))
                .WithMessage("Provided user doesn't exist");

            RuleFor(x => x.UseCaseId).NotEmpty()
                .Must(x => Enum.IsDefined(typeof(UseCasesEnum), x))
                .WithMessage("Provided use case doesn't exist");
        }
    }
}
