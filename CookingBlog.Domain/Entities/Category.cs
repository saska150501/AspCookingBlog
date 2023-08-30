﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Domain.Entities
{
    public class Category : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<Blog> Blogs { get; set; } = new HashSet<Blog>();

    }
}
