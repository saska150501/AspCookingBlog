using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.DataAccess;
using CookingBlog.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfUpdateCategoryCommand : EfUseCase, IUpdateCategoryCommand
    {
        private readonly UpdateCategoryValidator _validator;

        public EfUpdateCategoryCommand(CookingBlogContext context, UpdateCategoryValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 14;

        public string Name => "Update category";

        public string Description => "";

        public void Execute(UpdateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = Context.Categories.FirstOrDefault(x => x.Id == request.Id && x.IsActive);

            category.Name = request.Data.Name;

            Context.SaveChanges();
        }
    }
}
