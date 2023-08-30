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
    public class EfCreateTagCommand : EfUseCase, ICreateTagCommand
    {
        private readonly CreateTagValidator _validator;
        public EfCreateTagCommand(CookingBlogContext context, CreateTagValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Create Tag";

        public string Description => "";

        public void Execute(CreateTagDto request)
        {
            _validator.ValidateAndThrow(request);

            var tag = new Tag
            {
                TagValue = request.Name
            };

            Context.Tags.Add(tag);

            Context.SaveChanges();
        }
    }
}
