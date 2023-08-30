using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.Queries
{
    public interface IGetUseCaseLogQuery : IQuery<UseCaseLogSearch, PagedResponse<UseCaseLog>>
    {
    }
}
