using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetBlogsQuery : EfUseCase, IGetBlogsQuery
    {
        public EfGetBlogsQuery(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 15;

        public string Name => "Search Blogs";

        public string Description => "";

        public PagedResponse<BlogDto> Execute(BlogSearch request)
        {
            var query = Context.Blogs.AsQueryable();

            if (!string.IsNullOrEmpty(request.Tag))
            {
                query = query.Where(x => x.BlogTags.Any(t => t.Tag.TagValue.ToLower() == request.Tag.ToLower()));
            }

            if (!string.IsNullOrEmpty(request.Username))
            {
                query = query.Where(x => x.Author.Username.ToLower() == request.Username.ToLower());
            }

            if (!string.IsNullOrEmpty(request.Title))
            {
                query = query.Where(x => x.Title.Contains(request.Title));
            }

            if (!string.IsNullOrEmpty(request.Category))
            {
                query = query.Where(x => x.Category.Name.ToLower() == request.Category.ToLower());
            }

            if (request.DateFrom.HasValue)
            {
                query = query.Where(x => x.CreatedAt >= request.DateFrom.Value);
            }

            if (request.DateTo.HasValue)
            {
                query = query.Where(x => x.CreatedAt <= request.DateTo.Value);
            }

            if (request.PerPage == null || request.PerPage < 1)
            {
                request.PerPage = 15;
            }

            if (request.Page == null || request.Page < 1)
            {
                request.PerPage = 1;
            }

            var toSkip = (request.Page.Value - 1) * request.PerPage.Value;

            var response = new PagedResponse<BlogDto>();
            response.TotalCount = query.Count();
            response.Data = query.Skip(toSkip).Take(request.PerPage.Value).Select(x => new BlogDto
            {
                Id = x.Id,
                Username = x.Author.Username,
                CreatedAt = x.CreatedAt,
                Title = x.Title,
                Category = x.Category.Name,
                TextContent = x.TextContent,
                Tags = x.BlogTags.Select(y => y.Tag.TagValue),
                Files = x.BlogImages.Select(y => y.Image.Path)

            }).ToList();

            response.CurrentPage = request.Page.Value;
            response.ItemsPerPage = request.PerPage.Value;

            return response;

        }
    }
}
