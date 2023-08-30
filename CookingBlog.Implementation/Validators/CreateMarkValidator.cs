using CookingBlog.Application.UseCases.DTO;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Validators
{
    public class CreateMarkValidator : AbstractValidator<MarkDto>
    {
        public CreateMarkValidator()
        {
            RuleFor(x => x.Mark)
            .InclusiveBetween(1, 10)
            .WithMessage("The mark must be between 1 and 10.");
        }
    }
}
