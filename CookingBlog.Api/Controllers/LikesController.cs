using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class LikesController : ControllerBase
    {
        private UseCaseHandler _handler;

        public LikesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        // POST api/<LikesController>

        /// <summary>
        /// Addes new like.
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull create.</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="403">Forbbiden.</response>
        /// <response code="409">Confilct in the request</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpPost]
        public IActionResult Post([FromBody] LikeDto dto,
            [FromServices] ICreateLikeCommand command)
        {
            _handler.HandlerCommand(command, dto);
            return StatusCode(201);
        }
        // DELETE api/<LikesController>/5

        /// <summary>
        /// Dislike.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">The server has successfully fulfilled the request.</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="403">Forbbiden.</response>
        /// <response code="404">Not found object.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteLikeCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }
    }
}
