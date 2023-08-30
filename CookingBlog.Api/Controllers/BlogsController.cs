using CookingBlog.Api.DTO;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class BlogsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public BlogsController(UseCaseHandler handler)
        {
            _handler = handler;
        }
        // GET: api/<BlogsController>

        /// <summary>
        /// Searches a blog.
        /// </summary>
        /// <param name="request"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="400">Bad request.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BlogSearch request,
            [FromServices] IGetBlogsQuery query)
        {
            return Ok(_handler.HandlerQuery(query, request));
        }

        // GET api/<BlogsController>/5

        /// <summary>
        /// Findes a blog.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="404">Not found object.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet("{id}")]
        [AllowAnonymous]

        public IActionResult Get(int id, [FromServices] IGetBlogQuery query)
        {
            return Ok(_handler.HandlerQuery(query, id));
        }

        // POST api/<BlogsController>

        /// <summary>
        /// Creates new blog.
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
        public IActionResult Post([FromBody] CreateBlogDto dto,
            [FromServices] ICreateBlogCommand command)
        {

            _handler.HandlerCommand(command, dto);
                return StatusCode(201);
        }

        // PUT api/<BlogsController>/5

        /// <summary>
        /// Updates a blog.
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
        public IActionResult Put(int id, [FromBody] UpdateBlogDto dto,
            [FromServices] IUpdateBlogCommand command)
        {
            var data = new UpdateBlogDto
            {
                Id = id,
                NewTitle = dto.NewTitle,
                NewTags = dto.NewTags,
                NewFiles = dto.NewFiles,
                NewCategory = dto.NewCategory,
                NewTextContent = dto.NewTextContent
            };

            _handler.HandlerCommand(command, data);
            return NoContent();
        }

        // DELETE api/<BlogsController>/5

        /// <summary>
        /// Deletes a blog.
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
        public IActionResult Delete(int id, [FromServices] IDeleteBlogCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }

    }
}
