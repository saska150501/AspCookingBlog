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
    public class EfCreateBlogCommand : EfUseCase, ICreateBlogCommand
    {
        private IApplicationUser _user;
        private CreateBlogValidator _validator;

        public EfCreateBlogCommand(CookingBlogContext context, CreateBlogValidator validator, IApplicationUser user) : base(context)
        {
            _validator = validator;
            _user = user;
        }

        public int Id => 13;

        public string Name => "Create Blog";

        public string Description => "";

        public void Execute(CreateBlogDto request)
        {
            _validator.ValidateAndThrow(request);

            List<Tag> tags = new List<Tag>();
            foreach(var tag in request.Tags)
            {
                Tag fromDb = Context.Tags.Where(x => x.TagValue == tag && x.IsActive).FirstOrDefault();

                tags.Add(fromDb);
            }

            List<Image> images = new List<Image>();

            foreach (var img in request.Files)
            {
                Image fromDb = Context.Images.Where(x => x.Path == img && x.IsActive).FirstOrDefault();

                if (fromDb == null)
                {
                    fromDb = new Image
                    {
                        Path = img,
                        IsActive = true
                    };
                    Context.Images.Add(fromDb);
                }
                images.Add(fromDb);
            }

            Category categoryFromDb = Context.Categories
                .Where(x => x.Name == request.Category.Name && x.IsActive)
                .FirstOrDefault();

            Context.Blogs.Add(new Blog
            {
                Title = request.Title,
                TextContent = request.TextContent,
                AuthorId = _user.Id,
                CategoryId = categoryFromDb.Id,
                BlogTags = tags.Select(x => new BlogTag
                {
                    Tag = x
                }).ToList(),
                BlogImages = images.Select(x=> new BlogImage
                {
                    Image=x
                }).ToList()
            });

            Context.SaveChanges();

        }
    }
}
