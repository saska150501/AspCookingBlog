using CookingBlog.Application.Exceptions;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetTagQuery : EfUseCase, IGetTagQuery
    {
        public EfGetTagQuery(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 5;

        public string Name => "Find Tag";

        public string Description => "";

        public TagDto Execute(int request)
        {
            var tag = Context.Tags.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (tag == null)
            {
                throw new EntityNotFoundException(nameof(Tag), request);
            }

            return new TagDto
            {
                Id = tag.Id,
                Name = tag.TagValue
            };

        }
    }
}
