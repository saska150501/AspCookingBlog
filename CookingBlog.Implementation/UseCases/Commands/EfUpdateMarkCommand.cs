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
    public class EfUpdateMarkCommand : EfUseCase, IUpdateMarkCommand
    {
        private readonly IApplicationUser _currentUser;
        private UpdateMarkValidator _validator;

        public EfUpdateMarkCommand(CookingBlogContext context, IApplicationUser currentUser, UpdateMarkValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 27;

        public string Name => "Update mark";

        public string Description => "";

        public void Execute(UpdateMarkDto request)
        {
            _validator.ValidateAndThrow(request);

            var markToUpdate = Context.Marks.FirstOrDefault(x => x.Id == request.Id);

            if (markToUpdate == null)
            {
                throw new EntityNotFoundException(nameof(Mark), request.Id);

            }

            if (markToUpdate.UserId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to edit mark.");
            }

            markToUpdate.Number = request.Mark;

            Context.SaveChanges();
        }
    }
}
