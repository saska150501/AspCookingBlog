using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfDeleteCategoryCommand : EfUseCase, IDeleteCategoryCommand
    {
        public EfDeleteCategoryCommand(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 10;

        public string Name => "Delete category";

        public string Description => "";

        public void Execute(int request)
        {
            var categoryToDelete = Context.Categories.Find(request);
            if (categoryToDelete != null)
            {
                foreach (var blog in categoryToDelete.Blogs)
                {
                    Context.BlogTags.RemoveRange(blog.BlogTags);
                }
                Context.SaveChanges();

                foreach (var blog in categoryToDelete.Blogs)
                {
                    Context.BlogImages.RemoveRange(blog.BlogImages);
                }

                Context.Blogs.RemoveRange(categoryToDelete.Blogs);

            }

            Context.Categories.Remove(categoryToDelete);
            Context.SaveChanges(); 
            
        }
    }
}
