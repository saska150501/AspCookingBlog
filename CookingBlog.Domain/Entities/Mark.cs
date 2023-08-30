using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Mark : Entity
    {
        public int UserId { get; set; }
        public int BlogId { get; set; }
        public int Number { get; set; }

        public virtual User UserRated { get; set; }
        public virtual Blog BlogRated { get; set; }
    }
}
