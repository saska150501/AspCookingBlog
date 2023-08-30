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
    public class EfCreateCommentCommand : EfUseCase, ICreateCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        private readonly CreateCommentValidator _validator;
        public EfCreateCommentCommand(CookingBlogContext context, IApplicationUser currentUser, CreateCommentValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 20;

        public string Name => "Create comment";

        public string Description => "";

        public void Execute(CreateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            int blogId = request.BlogId.GetValueOrDefault();

            if (request.ParentCommentId.HasValue)
            {
                var parentcomment = Context.Comments.Find(request.ParentCommentId.Value);
                blogId = parentcomment.BlogId;
            }

            Context.Comments.Add(new Domain.Entities.Comment
            {
                AuthorId = _currentUser.Id,
                BlogId = blogId,
                ParentCommentId = request.ParentCommentId,
                Text = request.Text
            });

            Context.SaveChanges();
        }
    }
}
