using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.Exceptions
{
    public class UserNotFoundException : Exception
    {
        public UserNotFoundException(int id)
            :base($"User with an ID of {id} does not exist in datebase.")
        {

        }
    }
}
