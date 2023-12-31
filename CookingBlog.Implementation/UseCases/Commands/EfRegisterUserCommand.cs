﻿using CookingBlog.Application.Emails;
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
    public class EfRegisterUserCommand : EfUseCase, IRegisterUserCommand
    {
        public IEnumerable<int> AdminUseCase => new List<int> { 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 };
        public IEnumerable<int> UserUseCase => new List<int> { 1, 4, 5, 11, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 };
        
        private RegisterValidator _validator;
        private IEmailSender _sender;
        public EfRegisterUserCommand(CookingBlogContext context, RegisterValidator validator, IEmailSender sender) : base(context)
        {
            _validator = validator;
            _sender = sender;
        }

        public int Id => 3;

        public string Name => "User Registration";

        public string Description => "";

        public void Execute(RegisterDto request)
        {
            _validator.ValidateAndThrow(request);

            var hashPass = BCrypt.Net.BCrypt.HashPassword(request.Password);

            var user = new User
            {
                Email = request.Email,
                Username = request.Username,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Password = hashPass,
            };

            if (!string.IsNullOrEmpty(request.ProfileImage))
            {
                var image = new Image
                {
                    Path = request.ProfileImage
                };

                user.ProfileImage = image;
            }

            Context.Users.Add(user);

            Context.SaveChanges();

            _sender.Send(new EmailMessage
            {
                To = request.Email,
                Title = "Successful registration!",
                Body = "Dear " + request.Username + "\n Please activate your account..."
            });

            if (!Context.Users.Any())
            {
                var useCasesToAdd = AdminUseCase.Select(x => new UserUseCase
                {
                    UseCaseId = x,
                    UserId = user.Id
                });
                Context.AddRange(useCasesToAdd);
                Context.SaveChanges();
            }
            else
            {
                var useCasesToAdd = UserUseCase.Select(x => new UserUseCase
                {
                    UseCaseId = x,
                    UserId = user.Id
                });

                Context.AddRange(useCasesToAdd);
                Context.SaveChanges();
            }
        }
    }
}
