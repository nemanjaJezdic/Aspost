﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.Posts
{
    public class UpdatePostValidator : AbstractValidator<CreatePostDto>
    {
        public UpdatePostValidator(Context context)
        {
            RuleFor(x => x.Title)
               .NotEmpty()
               .WithMessage("Post title is required.")
               .Must((post, title) => !context.Posts.Any(p => p.Title == title && p.Id != post.Id))
               .WithMessage("Post with this title already exist.");

            RuleFor(x => x.Description).NotEmpty().WithMessage("Post description is required.");

            RuleFor(x => x.CategoryId).NotEmpty().WithMessage("Category is required.")
                .Must(x => context.Categories.Any(c => c.Id == x))
                .WithMessage("Provided category doesn't exist.");

            
        }

    }
}
