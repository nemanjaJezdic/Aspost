using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.Categories
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(Context context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .Must(x => !context.Categories.Any(c => c.Name == x))
                .WithMessage("Category name is already taken.");

        }
    }
}
