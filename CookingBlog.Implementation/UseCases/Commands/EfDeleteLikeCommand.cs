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
    public class EfDeleteLikeCommand : EfUseCase, IDeleteLikeCommand
    {
        private readonly IApplicationUser _currentUser;

        public EfDeleteLikeCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 24;

        public string Name => "Dislike";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;
            var like = Context.Likes.Find(request);

            if (like.UserId != userId)
            {
                throw new UnauthorizedAccessException("You are not authorized to dislike.");
            }
            if (like == null)
            {
                throw new EntityNotFoundException(nameof(Like), request);
            }

            like.DeletedAt = DateTime.UtcNow;
            like.IsActive = false;

            Context.Likes.Remove(like);

            Context.SaveChanges();
        }
    }
}
