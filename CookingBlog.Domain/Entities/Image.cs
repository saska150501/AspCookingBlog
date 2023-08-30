using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Image : Entity
    {
        public string Path { get; set; }
        public virtual ICollection<BlogImage> BlogImages { get; set; } = new HashSet<BlogImage>();
    }
}
