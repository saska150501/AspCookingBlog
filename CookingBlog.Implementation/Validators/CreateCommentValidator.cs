using CookingBlog.Application.UseCases.DTO;
using CookingBlog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Validators
{
    public class CreateCommentValidator : AbstractValidator<CreateCommentDto>
    {
        public CreateCommentValidator(CookingBlogContext context)
        {
            RuleFor(x => x.Text).NotEmpty().WithMessage("Text is required");

            RuleFor(x => x.BlogId).Cascade(CascadeMode.Stop)
                .Must(x => context.Blogs.Any(b => b.Id == x && b.IsActive))
                .When(x => x.ParentCommentId is null)
                .WithMessage("Requested blog does not exist.");

            RuleFor(x => x.ParentCommentId)
                    .Must(x => x == null || context.Comments.Any(c => c.Id == x && c.IsActive))
                    .WithMessage("Parent comment doesn't exist.");
        }
    }
}
