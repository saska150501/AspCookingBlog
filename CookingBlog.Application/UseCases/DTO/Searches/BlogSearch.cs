using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO.Searches
{
    public class BlogSearch : PageSearch
    {
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string Username { get; set; }
        public string Title { get; set; }
        public string Tag { get; set; }
        public string Category { get; set; }
    }
}
