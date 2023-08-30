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
    public class EfDeleteMarkCommand : EfUseCase, IDeleteMarkCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteMarkCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 26;

        public string Name => "Delete mark";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;
            var mark = Context.Marks.Find(request);

            if (mark.UserId != userId)
            {
                throw new UnauthorizedAccessException("You are not authorized to remove mark.");
            }
            if (mark == null)
            {
                throw new EntityNotFoundException(nameof(Mark), request);
            }

            mark.DeletedAt = DateTime.UtcNow;
            mark.IsActive = false;

            Context.Marks.Remove(mark);

            Context.SaveChanges();
        }
    }
}
