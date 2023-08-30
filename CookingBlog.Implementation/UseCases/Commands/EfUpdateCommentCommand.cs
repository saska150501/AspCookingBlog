using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using CookingBlog.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfUpdateCommentCommand : EfUseCase, IUpdateCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        private UpdateCommentValidator _validator;
        public EfUpdateCommentCommand(CookingBlogContext context, IApplicationUser currentUser, UpdateCommentValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 22;

        public string Name => "Update comment";

        public string Description => "";

        public void Execute(UpdateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var commentToUpdate = Context.Comments.FirstOrDefault(x => x.Id == request.Id);

            if (commentToUpdate == null)
            {
                throw new EntityNotFoundException(nameof(Comment), request.Id);

            }

            if(commentToUpdate.AuthorId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to update this comment.");
            }

            commentToUpdate.Text = request.NewText;

            Context.SaveChanges();
        }
    }
}
