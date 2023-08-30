using CookingBlog.Application.Exceptions;
using CookingBlog.Application.Logging;
using CookingBlog.Application.UseCases;
using CookingBlog.Domain.Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation
{
    public class UseCaseHandler
    {
        private IExceptionLogger _logger;
        private IApplicationUser _user;
        private IUseCaseLogger _useCaseLogger;

        public UseCaseHandler(IExceptionLogger logger, IApplicationUser user, IUseCaseLogger useCaseLogger)
        {
            _logger = logger;
            _user = user;
            _useCaseLogger = useCaseLogger;
        }

        public void HandlerCommand<TRequest>(ICommand<TRequest> command, TRequest data)
        {
            try
            {
                HandleLogAuth(command, data);
                var stopwatch = new Stopwatch();

                stopwatch.Start();

                command.Execute(data);
                stopwatch.Stop();

                Console.WriteLine(command.Name + "Duration: " + stopwatch.ElapsedMilliseconds + " ms.");
            }
            catch (Exception e)
            {
                _logger.Log(e);
                throw;
            }
        }

        public TResponse HandlerQuery<TRequest, TResponse>(IQuery<TRequest, TResponse> query, TRequest data)
        {
            try
            {
                HandleLogAuth(query, data);
                var stopwatch = new Stopwatch();
                stopwatch.Start();

                var response = query.Execute(data);
                stopwatch.Stop();

                Console.WriteLine(query.Name + "Duration: " + stopwatch.ElapsedMilliseconds + " ms.");

                return response;
            }
            catch (Exception e)
            {
                _logger.Log(e);
                throw;
            }
        }

        private void HandleLogAuth<TRequest>(IUseCase useCase, TRequest data)
        {
            var log = new UseCaseLog
            {
                Username = _user.Identity,
                ExecutionDateTime = DateTime.UtcNow,
                UseCaseName = useCase.Name,
                UserId = _user.Id,
                Data = JsonConvert.SerializeObject(data),
                IsAuthorized = _user.UseCaseIds.Contains(useCase.Id)
            };

            _useCaseLogger.Log(log);

            if (!log.IsAuthorized)
            {
                throw new ForbiddenUseCaseExecutionException(useCase.Name, _user.Identity);
            }
        }
    }
}
