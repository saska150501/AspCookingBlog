using CookingBlog.Application.UseCases;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.UseCases.Queries
{
    public class EfGetUseCaseLogQuery : EfUseCase, IGetUseCaseLogQuery
    {
        private readonly IUseCaseLogger _logger;
        private readonly SearchUseCaseLogValidator _validator;
        public EfGetUseCaseLogQuery(CookingBlogContext context, IUseCaseLogger logger, SearchUseCaseLogValidator validator) : base(context)
        {
            _logger = logger;
            _validator = validator;
        }

        public int Id => 9;

        public string Name => "Search use case logs";

        public string Description => "";

        public PagedResponse<UseCaseLog> Execute(UseCaseLogSearch request)
        {
                var query = Context.LoggEntries.Where(x => x.IsActive);

                if (!string.IsNullOrEmpty(request.UseCaseName))
                {
                    query = query.Where(x => x.UseCaseName.Contains(request.UseCaseName));
                }
                if (!string.IsNullOrEmpty(request.Username))
                {
                    query = query.Where(x => x.Username == request.Username);
                }
                if (request.DateFrom.HasValue)
                {
                    query = query.Where(x => x.CreatedAt >= request.DateFrom.Value);
                }
                if (request.DateTo.HasValue)
                {
                    query = query.Where(x => x.CreatedAt <= request.DateTo.Value);
                }

                if (request.PerPage == null || request.PerPage < 1)
                {
                    request.PerPage = 15;
                }

                if (request.Page == null || request.Page < 1)
                {
                    request.PerPage = 1;
                }

                var toSkip = (request.Page.Value - 1) * request.PerPage.Value;

                var response = new PagedResponse<UseCaseLog>();
                response.TotalCount = query.Count();

                response.Data = query.Skip(toSkip).Take(request.PerPage.Value).Select(log => new UseCaseLog
                {
                    UseCaseName = log.UseCaseName,
                    UserId = log.UserId,
                    Username = log.Username,
                    ExecutionDateTime = log.CreatedAt,
                    Data = log.Data,
                    IsAuthorized = log.IsAuthorized

                }).ToList();

                response.CurrentPage = request.Page.Value;
                response.ItemsPerPage = request.PerPage.Value;

                return response;

        }
    }
}
