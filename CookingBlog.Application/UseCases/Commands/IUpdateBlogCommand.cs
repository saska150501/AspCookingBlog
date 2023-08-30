using CookingBlog.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.Commands
{
    public interface IUpdateBlogCommand : ICommand<UpdateBlogDto>
    {
    }
}
