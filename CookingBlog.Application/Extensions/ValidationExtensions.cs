using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace CookingBlog.Api.Extensions
{
    public static class ValidationExtensions
    {
        public static UnprocessableEntityObjectResult ToUnprocessableEntity(this IEnumerable<ValidationFailure> errors)
        {
            var error = errors.Select(x => new
            {
                x.ErrorMessage,
                x.PropertyName
            });

            return new UnprocessableEntityObjectResult(error);
        }
    }
}
