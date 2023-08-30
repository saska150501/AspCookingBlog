using CookingBlog.Application.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Logging
{
    public class ConsoleExceptionLogger : IExceptionLogger
    {
        public void Log(Exception e)
        {
            Console.WriteLine("Occured at: " + DateTime.UtcNow);
            Console.WriteLine(e.Message);
        }
    }
}
