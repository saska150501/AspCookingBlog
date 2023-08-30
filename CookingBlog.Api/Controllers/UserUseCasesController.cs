using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Domain.Entities;
using CookingBlog.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserUseCasesController : ControllerBase
    {
        private UseCaseHandler _handler;

        public UserUseCasesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Updates a user use cases.
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">The server has successfully fulfilled the request.</response>
        /// <response code="401">Unauthorized.</response>
        /// <response code="403">Forbbiden.</response>
        /// <response code="404">Not found object.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="409">Conflict in the request.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpPut]
        public IActionResult Put([FromBody] UpdateUserUseCasesDto dto,
            [FromServices] IUpdateUserUseCasesCommand command)
        {
            _handler.HandlerCommand(command, dto);
            return NoContent();
        }
    }
}
