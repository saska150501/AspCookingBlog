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
    public class EfCreateMarkCommand : EfUseCase, ICreateMarkCommand
    {
        private readonly IApplicationUser _currentUser;
        private CreateMarkValidator _validator;
        public EfCreateMarkCommand(CookingBlogContext context, IApplicationUser currentUser, CreateMarkValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 25;

        public string Name => "Add mark";

        public string Description => "";

        public void Execute(MarkDto request)
        {
            _validator.ValidateAndThrow(request);

            Context.Marks.Add(new Mark
            {
                BlogId = request.BlogId,
                UserId = _currentUser.Id,
                Number = request.Mark
            });

            Context.SaveChanges();
        }
    }
}
