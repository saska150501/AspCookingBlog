using CookingBlog.Application.UseCases;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UseCaseLogsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public UseCaseLogsController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Searches a use case log.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="400">Bad request.</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="403">Forbbiden.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogSearch search,
            [FromServices] IGetUseCaseLogQuery query)
        {
            return Ok(_handler.HandlerQuery(query, search));
        }
    }
}
