using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Like : Entity
    {
        public int BlogId { get; set; }
        public int UserId { get; set; }
        public virtual Blog Blog { get; set; }
        public virtual User User { get; set; }
    }
}
