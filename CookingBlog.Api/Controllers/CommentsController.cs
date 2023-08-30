using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
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
    public class CommentsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public CommentsController(UseCaseHandler handler)
        {
            _handler = handler;
        }
        // POST api/<CommentsController>

        /// <summary>
        /// Creates new comment.
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
        public IActionResult Post([FromBody] CreateCommentDto dto,
            [FromServices] ICreateCommentCommand command)
        {
            _handler.HandlerCommand(command, dto);
            return StatusCode(201);

        }

        // PUT api/<CommentsController>/5

        /// <summary>
        /// Updates a comment.
        /// </summary>
        /// <param name="id"></param>
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

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateCommentDto dto,
            [FromServices] IUpdateCommentCommand command)
        {
            var data = new UpdateCommentDto
            {
                Id = id,
                NewText = dto.NewText
            };

            _handler.HandlerCommand(command, data);
            return NoContent();
        }

        // DELETE api/<CommentsController>/5

        /// <summary>
        /// Deletes a comment.
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
        public IActionResult Delete(int id, [FromServices] IDeleteCommentCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }
    }
}
