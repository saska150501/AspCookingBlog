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
    public class EfUpdateBlogCommand : EfUseCase, IUpdateBlogCommand
    {
        private UpdateBlogValidator _validator;
        private readonly IApplicationUser _currentUser;
        public EfUpdateBlogCommand(CookingBlogContext context, IApplicationUser currentUser, UpdateBlogValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 18;

        public string Name => "Update bloga";

        public string Description => "";

        public void Execute(UpdateBlogDto request)
        {
            _validator.ValidateAndThrow(request);

            var blogToUpdate = Context.Blogs.FirstOrDefault(x => x.Id == request.Id);

            if (blogToUpdate == null)
            {
                throw new EntityNotFoundException(nameof(Blog), request.Id);

            }

            if (blogToUpdate.AuthorId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to update this blog.");
            }

            if (!string.IsNullOrEmpty(request.NewTitle) && request.NewTitle != blogToUpdate.Title)
            {
                if (Context.Blogs.Any(x => x.Title == request.NewTitle))
                {
                    throw new Exception("Title already exists.");
                }
                blogToUpdate.Title = request.NewTitle;
            }

            blogToUpdate.TextContent = request.NewTextContent;

            var existingTagsToRemove = blogToUpdate.BlogTags.ToList(); // Kopija postojećih tagova

            // Ukloniti postojeće tagove
            foreach (var existingTagToRemove in existingTagsToRemove)
            {
                blogToUpdate.BlogTags.Remove(existingTagToRemove);
                Context.BlogTags.Remove(existingTagToRemove); // Ukloniti iz kolekcije BlogTags i baze
            }

            // Dodati nove tagove i ažurirati tabelu Tags
            foreach (var newTagName in request.NewTags)
            {
                var existingTag = Context.Tags.FirstOrDefault(tag => tag.TagValue == newTagName);

                if (existingTag != null)
                {
                    blogToUpdate.BlogTags.Add(new BlogTag
                    {
                        TagId = existingTag.Id
                    });
                }
            }


            var existingImagesToRemove = blogToUpdate.BlogImages.ToList(); 

            
            foreach (var existingImageToRemove in existingImagesToRemove)
            {
                blogToUpdate.BlogImages.Remove(existingImageToRemove);
                Context.BlogImages.Remove(existingImageToRemove); 
            }

            foreach (var newImagePath in request.NewFiles)
            {
                var existingImage = Context.Images.FirstOrDefault(image => image.Path == newImagePath);

                if (existingImage != null)
                {
                    blogToUpdate.BlogImages.Add(new BlogImage
                    {
                        ImageId = existingImage.Id
                    });
                }
                else
                {
                    var newImage = new Image
                    {
                        Path = newImagePath
                    };
                    Context.Images.Add(newImage);

                    blogToUpdate.BlogImages.Add(new BlogImage
                    {
                        Image = newImage
                    });
                }
            }

            Category newCategory = Context.Categories.FirstOrDefault(c => c.Name == request.NewCategory.Name && c.IsActive);
           
            blogToUpdate.Category = newCategory;


            Context.SaveChanges();
        }
    }


}

