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
    public class EfUpdateTagCommand : EfUseCase, IUpdateTagCommand
    {
        private readonly UpdateTagValidator _validator;

        public EfUpdateTagCommand(CookingBlogContext context, UpdateTagValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 12;

        public string Name => "Update tag";

        public string Description => "";


        public void Execute(UpdateTagDto request)
        {
            _validator.ValidateAndThrow(request);

            var tag = Context.Tags.FirstOrDefault(x => x.Id == request.Id && x.IsActive);

            tag.TagValue = request.Data.Name;

            Context.SaveChanges();
        }
    }
}
