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
    public class EfUpdateUseUserCasesCommand : EfUseCase, IUpdateUserUseCasesCommand
    {
        private UpdateUserUseCasesValidator _validator;
        public EfUpdateUseUserCasesCommand(CookingBlogContext context, UpdateUserUseCasesValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 8;

        public string Name => "Update user use-cases";

        public string Description => "";

        public void Execute(UpdateUserUseCasesDto request)
        {
            _validator.ValidateAndThrow(request);

            var useCases = Context.UserUseCases.Where(x => x.UserId == request.UserId);

            Context.RemoveRange(useCases);

            var newUseCases = request.UseCaseIds.Select(x => new UserUseCase
            {
                UseCaseId = x,
                UserId = request.UserId
            });

            Context.UserUseCases.AddRange(newUseCases);

            Context.SaveChanges();
        }
    }
}
