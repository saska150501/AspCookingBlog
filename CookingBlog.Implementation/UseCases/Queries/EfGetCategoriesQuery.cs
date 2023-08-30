using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetCategoriesQuery : EfUseCase, IGetCategoriesQuery
    {
        public int Id => 1;

        public string Name => "Search categories";

        public string Description => "Search categories using Entity Framwork";

        public EfGetCategoriesQuery(CookingBlogContext context) : base(context)
        {
        }

        public PagedResponse<CategoryDto> Execute(BasePageSearch request)
        {
            var query = Context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }

            if(request.PerPage == null || request.PerPage < 1)
            {
                request.PerPage = 15;
            }

            if (request.Page == null || request.Page < 1)
            {
                request.PerPage = 1;
            }

            var toSkip = (request.Page.Value - 1) * request.PerPage.Value;  

            var response = new PagedResponse<CategoryDto>();
            response.TotalCount = query.Count();
            response.Data = query.Skip(toSkip).Take(request.PerPage.Value).Select(x => new CategoryDto
            {
                Name = x.Name,
                Id = x.Id
            }).ToList();

            response.CurrentPage = request.Page.Value;
            response.ItemsPerPage = request.PerPage.Value;

            return response;
        }
    }
}
