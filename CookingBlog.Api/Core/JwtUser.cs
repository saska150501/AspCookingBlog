using CookingBlog.Domain.Entities;
using System.Collections.Generic;

namespace CookingBlog.Api.Core
{
    public class JwtUser : IApplicationUser
    {
        public string Identity { get; set; }

        public int Id { get; set; }

        public IEnumerable<int> UseCaseIds { get; set; } = new List<int>();

        public string Email { get; set; }
    }

    public class AnonimousUser : IApplicationUser
    {
        public string Identity => "Anonymous";

        public int Id => 0;

        public IEnumerable<int> UseCaseIds => new List<int> {1, 3, 4, 5, 11, 15, 28};

        public string Email => "anonymous@gmail.com";
    }
}
