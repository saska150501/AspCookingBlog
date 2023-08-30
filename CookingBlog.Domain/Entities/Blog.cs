using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Blog : Entity
    {
        public string Title { get; set; }
        public string TextContent { get; set; }
        public  int AuthorId { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
        public virtual User Author { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Mark> Marks { get; set; } = new HashSet<Mark>();
        public virtual ICollection<BlogImage> BlogImages { get; set; } = new HashSet<BlogImage>();
        public virtual ICollection<BlogTag> BlogTags { get; set; } = new HashSet<BlogTag>();
        public virtual ICollection<Like> Likes { get; set; } = new HashSet<Like>();

    }
}
