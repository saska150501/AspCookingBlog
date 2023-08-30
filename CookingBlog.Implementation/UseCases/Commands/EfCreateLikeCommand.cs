using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Commands
{
    public class EfCreateLikeCommand : EfUseCase, ICreateLikeCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfCreateLikeCommand(CookingBlogContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 23;

        public string Name => "Create like";

        public string Description => "";

        public void Execute(LikeDto request)
        {
            Context.Likes.Add(new Like
            {
                BlogId = request.BlogId,
                UserId = _currentUser.Id
            });

            Context.SaveChanges();
        }
    }
}
