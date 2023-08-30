using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetCategoryQuery : EfUseCase, IGetCategoryQuery
    {
        public EfGetCategoryQuery(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 11;

        public string Name => "Find Category";

        public string Description => "";

        public CategoryDto Execute(int request)
        {
            var category = Context.Categories.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (category == null)
            {
                throw new EntityNotFoundException(nameof(Category), request);

            }

            return new CategoryDto
            {
                Id = category.Id,
                Name = category.Name
            };
        }
    }
}
