using CookingBlog.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases
{
    public abstract class EfUseCase
    {
        protected EfUseCase(CookingBlogContext context)
        {
            Context = context;
        }

        protected CookingBlogContext Context { get; }
    }
}
