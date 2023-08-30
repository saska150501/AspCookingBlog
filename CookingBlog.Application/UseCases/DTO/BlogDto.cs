using CookingBlog.Application.UseCases.DTO.Searches;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO
{
    public class BlogDto : BaseDto
    {
        public string Title { get; set; }
        public string TextContent { get; set; }
        public string Username { get; set; }
        public string Category { get; set; }
        public DateTime CreatedAt { get; set; }
        public IEnumerable<string> Tags { get; set; }
        public IEnumerable<string> Files { get; set; }
    }
    public class CreateBlogDto
    {
        public string Title { get; set; }
        public string TextContent { get; set; }
        public CreateCategoryDto Category { get; set; }
        public IEnumerable<string> Tags { get; set; } = new List<string>();
        public IEnumerable<string> Files { get; set; } = new List<string>();

    }
    public class UpdateBlogDto : BaseDto
    {
        public string NewTitle { get; set; }
        public string NewTextContent { get; set; }
        public CreateCategoryDto NewCategory { get; set; }

        public IEnumerable<string> NewTags { get; set; } = new List<string>();
        public IEnumerable<string> NewFiles { get; set; } = new List<string>();
    }
}
