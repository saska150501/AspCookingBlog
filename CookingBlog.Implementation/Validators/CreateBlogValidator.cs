using CookingBlog.Application.UseCases.DTO;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Validators
{
    public class CreateBlogValidator : AbstractValidator<CreateBlogDto>
    {
        private CookingBlogContext _context;

        public CreateBlogValidator(CookingBlogContext context)
        {
            _context = context;

            RuleFor(x => x.TextContent).Cascade(CascadeMode.Stop).NotEmpty()
                .WithMessage("Text is required");
               

            RuleFor(x => x.Title).Cascade(CascadeMode.Stop).NotEmpty()
                .WithMessage("Title is required")
                 .Must(BlogNotExists).WithMessage("Title {PropertyValue} already exists."); ;

            RuleFor(x => x.Files).Cascade(CascadeMode.Stop).NotEmpty()
                .WithMessage("Files is required");

            RuleFor(x => x.Category.Name).Cascade(CascadeMode.Stop).NotEmpty()
                .WithMessage("Category is required")
                .Must(x=>x == null || context.Categories.Any(c=>c.Name == x && c.IsActive))
                .WithMessage("Category {PropertyValue} doesn't exist");

            RuleFor(x => x.Tags).Cascade(CascadeMode.Stop)
                .Must(tags => BeExistingTags(tags.ToList()))
                .WithMessage("One or more tags do not exist.");
        }

        private bool BlogNotExists(string name)
        {
            return !_context.Blogs.Any(x => x.Title == name && x.IsActive);
        }

        public bool BeExistingTags(List<string> tags)
        {
            foreach (var tag in tags)
            {
                Tag fromDb = _context.Tags
                    .Where(x => x.TagValue == tag && x.IsActive)
                    .FirstOrDefault();

                if (fromDb == null)
                {
                    return false; 
                }
            }

            return true;
        }
    }
}
