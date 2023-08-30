using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfDeleteTagCommand : EfUseCase, IDeleteTagCommand
    {
        public EfDeleteTagCommand(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 7;

        public string Name => "Delete Tag";

        public string Description => "";

        public void Execute(int request)
        {
            var tag = Context.Tags.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (tag == null)
            {
                throw new EntityNotFoundException(nameof(Tag), request);
            }

            var blogTag = tag.BlogTags;

            Context.BlogTags.RemoveRange(blogTag);

            Context.Tags.Remove(tag);

            Context.SaveChanges();
        }
    }
}
