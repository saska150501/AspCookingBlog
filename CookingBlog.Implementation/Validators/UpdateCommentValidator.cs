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
    public class UpdateCommentValidator : AbstractValidator<UpdateCommentDto>
    {
        public UpdateCommentValidator(CookingBlogContext context)
        {
            RuleFor(x => x.NewText).NotEmpty().WithMessage("Text is required");
        }
    }
}
