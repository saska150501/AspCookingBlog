using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class BlogImage
    {
        public int ImageId { get; set; }
        public int BlogId { get; set; }

        public virtual Image Image { get; set; }
        public virtual Blog Blog { get; set; }
    }
}
