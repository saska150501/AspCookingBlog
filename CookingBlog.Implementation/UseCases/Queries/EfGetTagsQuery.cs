using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetTagsQuery : EfUseCase, IGetTagsQuery
    {
        public EfGetTagsQuery(CookingBlogContext context) : base(context)
        {
        }

        public int Id => 4;

        public string Name => "Search Tags";

        public string Description => "";

        public IEnumerable<TagDto> Execute(BaseSearch request)
        {
            var query = Context.Tags.Where(x => x.IsActive);

            var keyword = request.Keyword;

            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(x => x.TagValue.Contains(keyword));
            }

            return query.Select(x => new TagDto
            {
                Id = x.Id,
                Name = x.TagValue
            }).ToList();

        }
    }
}
