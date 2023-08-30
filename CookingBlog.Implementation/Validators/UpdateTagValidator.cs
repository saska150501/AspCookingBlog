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
    public class UpdateTagValidator : AbstractValidator<UpdateTagDto>
    {
        private CookingBlogContext _context;

        public UpdateTagValidator(CookingBlogContext context)
        {
            _context = context;

            RuleFor(x => x.Data.Name).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Name is required.")
                                .MinimumLength(3).WithMessage("Minimum character length must be 3.")
                                .Must(TagNotExists).WithMessage("Tag {PropertyValue} already exists.");
        }

        private bool TagNotExists(string name)
        {
            return !_context.Tags.Any(x => x.TagValue == name && x.IsActive);
        }
    }
}
