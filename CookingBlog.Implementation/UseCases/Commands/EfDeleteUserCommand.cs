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
    public class EfDeleteUserCommand : EfUseCase, IDeleteUserCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteUserCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 19;

        public string Name => "Delete user";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;

            if (userId != request)
            {
                throw new UnauthorizedAccessException("You are not authorized to delete this user.");
            }

            var user = Context.Users.Find(userId);

            if (user == null)
            {
                throw new UserNotFoundException(userId);
            }

            var blog = Context.Blogs.FirstOrDefault(x => x.AuthorId == userId);

            Context.Blogs.RemoveRange(blog);
            Context.BlogImages.RemoveRange(blog.BlogImages);
            Context.BlogTags.RemoveRange(blog.BlogTags);
            Context.Users.Remove(user);
            Context.SaveChanges();
        }
    }
}
