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
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(Context context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name).Must((category, name) => !context.Categories.Any(x => x.Name == name && x.Id != category.Id));
                });

        }

    }
}
