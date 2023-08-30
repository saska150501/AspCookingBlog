using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO
{
    public class MarkDto
    {
        public int BlogId { get; set; }
        public int Mark { get; set; }
    }
    public class UpdateMarkDto : BaseDto
    {
        public int Mark { get; set; }
    }
}
