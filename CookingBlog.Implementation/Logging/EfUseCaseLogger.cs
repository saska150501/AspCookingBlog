using CookingBlog.Application.UseCases;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using LinqKit;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Logging
{
    public class EfUseCaseLogger : IUseCaseLogger
    {
        private readonly CookingBlogContext _context;

        public EfUseCaseLogger(CookingBlogContext context)
        {
            _context = context;
        }
        public void Log(UseCaseLog log)
        {
            
            _context.LoggEntries.Add(new Domain.Entities.LogEntry
            {
                Username = log.Username,
                UserId = log.UserId,
                UseCaseName = log.UseCaseName,
                Data = log.Data,
                CreatedAt = DateTime.UtcNow,
                IsAuthorized =log.IsAuthorized
            });

            _context.SaveChanges();
        }

    }
}
