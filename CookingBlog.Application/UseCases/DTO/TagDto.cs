using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO
{
    public class TagDto : BaseDto
    {
        public string Name { get; set; }
    }

    public class CreateTagDto
    {
        public string Name { get; set; }
    }

    public class UpdateTagDto
    {
        public int Id { get; set; }
        public CreateTagDto Data { get; set; }
    }
}
