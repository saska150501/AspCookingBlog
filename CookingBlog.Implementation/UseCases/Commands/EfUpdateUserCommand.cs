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
    public class EfUpdateUserCommand : EfUseCase, IUpdateUserCommand
    {
        private UpdateUserValidator _validator;
        private readonly IApplicationUser _currentUser;
        public EfUpdateUserCommand(CookingBlogContext context, IApplicationUser currentUser, UpdateUserValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "Update user credentials";

        public string Description => "";

        public void Execute(UpdateUserDto request)
        {
            var userId = request.Id;

            if (userId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to update this user.");
            }

            var user = Context.Users.Find(userId);

            if (user == null)
            {
                throw new UserNotFoundException(userId);
            }

            _validator.ValidateAndThrow(request);

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;

            if(!string.IsNullOrEmpty(request.NewEmail) && request.NewEmail != user.Email)
            {
                if(Context.Users.Any(x=>x.Email == request.NewEmail))
                {
                    throw new Exception("Email already exists.");
                }
                user.Email = request.NewEmail;
            }

            if (!string.IsNullOrEmpty(request.NewUsername) && request.NewUsername != user.Username)
            {
                if (Context.Users.Any(x => x.Username == request.NewUsername))
                {
                    throw new Exception("Useranme already exists.");
                }
                user.Username = request.NewUsername;
            }

            if (!string.IsNullOrEmpty(request.NewImageProfile))
            {
                var image = new Image
                {
                    Path = request.NewImageProfile
                };

                user.ProfileImage = image;
            }

            var hasPass = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);

            if (!string.IsNullOrEmpty(request.NewPassword))
            {
                user.Password = hasPass;
            }

            Context.SaveChanges();
        }
    }
}
