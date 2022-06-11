using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using FluentValidation;

namespace ASPOST.Implementation.Validators.Comments
{
    public class CreateCommentValidator : AbstractValidator<CommentDto>
    {
        public CreateCommentValidator(Context context)
        {
            RuleFor(x => x.Text).NotEmpty().WithMessage("Text is required").DependentRules(() =>
            {
                RuleFor(x => x.Text).Must((comment, text) => !context.Comments.Any(c => c.Text == text && c.Id != comment.Id && c.PostId == comment.PostId && c.UserId == comment.UserId))
                .WithMessage("This comment already exist.");
            });
            RuleFor(x => x.PostId).NotEmpty().WithMessage("Post is required.")
                .Must(x => context.Posts.Any(p => p.Id == x))
                .WithMessage("Provided post doesn't exist.").DependentRules(() =>
                {
                    RuleFor(x => x.PostId).Must((comment, postId) =>
                    {
                        if (comment.ParentId != null)
                        {
                            return context.Comments.Find(comment.ParentId).PostId == postId;
                        }

                        return true;
                    }).WithMessage("Provided combination of parent comment and post doesn't exist");
                });
            RuleFor(x => x.ParentId)
                .Must(x =>
                {
                    if (x != null)
                    {
                        return context.Comments.Any(c => c.Id == x);
                    }
                    return true;
                })
                .WithMessage("Provided comment doesn't exist.");
        }

    }
}
