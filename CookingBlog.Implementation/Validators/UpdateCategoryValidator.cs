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
    public class UpdateCategoryValidator : AbstractValidator<UpdateCategoryDto>
    {
        private CookingBlogContext _context;
        public UpdateCategoryValidator(CookingBlogContext context)
        {
            _context = context;
            RuleFor(x => x.Data.Name).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Name is required.")
                                .MinimumLength(3).WithMessage("Minimum character length must be 3.")
                                .Must(CategoryNotExists).WithMessage("Category {PropertyValue} already exists.");
        }

        private bool CategoryNotExists(string name)
        {
            return !_context.Categories.Any(x => x.Name == name && x.IsActive);
        }
    }
}
