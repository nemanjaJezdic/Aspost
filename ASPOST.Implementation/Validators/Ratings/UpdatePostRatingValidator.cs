using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.Ratings
{
    public class UpdatePostRatingValidator : AbstractValidator<RatingDto>
    {
        public UpdatePostRatingValidator(Context context)
        {
            RuleFor(x => x.Rating).NotEmpty()
                .Must(x => x >= 1 && x <= 5)
                .WithMessage("Provide number between 1 and 5");

            RuleFor(x => x.PostId).NotEmpty()
                .Must(x => context.Posts.Any(p => p.Id == x))
                .WithMessage("Provided post doesn't exist.");

        }
    }
}
