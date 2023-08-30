using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO
{
    public class CreateCommentDto
    {
        public int? BlogId { get; set; }
        public int? ParentCommentId { get; set; }
        public string Text { get; set; }
    }

    public class UpdateCommentDto : BaseDto
    {
        public string NewText { get; set; }
    }
}
