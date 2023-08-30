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
    public class EfGetBlogQuery : EfUseCase, IGetBlogQuery
    {
        public EfGetBlogQuery(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 28;

        public string Name => "Find blog";

        public string Description => "";

        public BlogDto Execute(int request)
        {
            var blog = Context.Blogs.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (blog == null)
            {
                throw new EntityNotFoundException(nameof(Blog), request);

            }

            return new BlogDto
            {
                Id=blog.Id,
                Title=blog.Title,
                TextContent=blog.TextContent,
                Username=blog.Author.Username,
                Category=blog.Category.Name,
                CreatedAt=blog.CreatedAt,
                Tags=blog.BlogTags.Select(t=>t.Tag.TagValue).ToList(),
                Files=blog.BlogImages.Select(i=>i.Image.Path).ToList()
            };
        }
    }
}
