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
    public class UpdateUserUseCasesValidator : AbstractValidator<UpdateUserUseCasesDto>
    {
        public UpdateUserUseCasesValidator(CookingBlogContext context)
        {
            RuleFor(x => x.UserId).Must(x => context.Users.Any(y => y.Id == x && y.IsActive))
                .WithMessage("User with provided ID doesnt exist");

            RuleFor(x => x.UseCaseIds).NotEmpty()
                .WithMessage("Use case are required")
                .Must(x=>x.Distinct().Count()==x.Count())
                .WithMessage("Duplicates are not allowed");
        }
    }
}
