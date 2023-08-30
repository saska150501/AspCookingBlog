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
    public class EfDeleteCommentCommand : EfUseCase, IDeleteCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteCommentCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 21;

        public string Name => "Delete comment";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;
            var comment = Context.Comments.Find(request);

            if (comment.AuthorId != userId)
            {
                throw new UnauthorizedAccessException("You are not authorized to delete this comment.");
            }
            if (comment == null)
            {
                throw new EntityNotFoundException(nameof(Comment), request);
            }

            Context.Comments.RemoveRange(comment.ChildComments);
            Context.Comments.Remove(comment);

            Context.SaveChanges();

        }
    }
}
