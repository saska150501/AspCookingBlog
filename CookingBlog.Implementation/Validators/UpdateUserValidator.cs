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
    public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
    {
        public UpdateUserValidator(CookingBlogContext context)
        {
            RuleFor(x => x.FirstName).Cascade(CascadeMode.Stop)
               .NotEmpty().WithMessage("First name is required.")
               .MaximumLength(40).WithMessage("Maximum character length must be 40.")
               .Matches(@"^[A-Z][a-z]{2,}(\s[A-Z][a-z]{2,})?$")
                   .WithMessage("First name format is not correct"); ;

            RuleFor(x => x.LastName).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Last name is required.")
                .MaximumLength(40).WithMessage("Maximum character length must be 40.")
                .Matches(@"^[A-Z][a-z]{2,}(\s[A-Z][a-z]{2,})?$")
                    .WithMessage("Last name format is not correct");

            RuleFor(x => x.NewUsername).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Username is required.")
                .MinimumLength(3).WithMessage("Minimum character length must be 3.")
                .MaximumLength(12).WithMessage("Maximum character length must be 12.")
                .Matches(@"^(?=.{3,12}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$")
                    .WithMessage("{PropertyValue} format is not correct. Uses letters, numbers, . and _");

            RuleFor(x => x.NewPassword).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Password is required.")
                .Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                    .WithMessage("The password must contain at least 8 characters, one lowercase letter, one uppercase letter, a number and a special character.");

            RuleFor(x => x.NewEmail).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("{PropertyValue} format is not correct");
        }
    }
}
