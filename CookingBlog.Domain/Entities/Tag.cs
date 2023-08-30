using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Tag : Entity
    {
        public string TagValue { get; set; }
        public virtual ICollection<BlogTag> BlogTags { get; set; } = new HashSet<BlogTag>();
    }
}
