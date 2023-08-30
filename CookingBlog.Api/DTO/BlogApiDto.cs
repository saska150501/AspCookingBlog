using CookingBlog.Application.UseCases.DTO;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;

namespace CookingBlog.Api.DTO
{
    public class BlogApiDto : CreateBlogDto
    {
        public IEnumerable<IFormFile> Images { get; set; } = new List<IFormFile>();

    }
}
