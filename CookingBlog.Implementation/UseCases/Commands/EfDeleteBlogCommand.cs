using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfDeleteBlogCommand : EfUseCase, IDeleteBlogCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteBlogCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 17;

        public string Name => "Delete blog";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;
            var blog = Context.Blogs.Find(request);

            if (blog.AuthorId != userId)
            {
                throw new UnauthorizedAccessException("You are not authorized to delete this blog.");
            }
            if (blog == null)
            {
                throw new EntityNotFoundException(nameof(Blog), request);
            }

            Context.BlogImages.RemoveRange(blog.BlogImages);

            Context.BlogTags.RemoveRange(blog.BlogTags);

            Context.Comments.RemoveRange(blog.Comments);

            Context.Likes.RemoveRange(blog.Likes);

            Context.Marks.RemoveRange(blog.Marks);

            Context.Blogs.Remove(blog);

            Context.SaveChanges();

        }
    }
}
