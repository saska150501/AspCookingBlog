using CookingBlog.Api.Extensions;
using CookingBlog.Application.Exceptions;
using CookingBlog.Application.Logging;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using CookingBlog.Implementation;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class TagsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public TagsController(UseCaseHandler handler)
        {
            _handler = handler;
        }
        // GET: api/<TagsController>

        /// <summary>
        /// Searches a tag.
        /// </summary>
        /// <param name="request"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="400">Bad request.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BaseSearch request, [FromServices] IGetTagsQuery query)
        {
            return Ok(_handler.HandlerQuery(query, request));
        }

        // GET api/<TagsController>/5

        /// <summary>
        /// Findes a tag.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="404">Not found object.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet("{id}")]
        [AllowAnonymous]

        public IActionResult Get(int id, [FromServices] IGetTagQuery query)
        {
            return Ok(_handler.HandlerQuery(query, id));
        }

        // POST api/<TagsController>

        /// <summary>
        /// Creates new tag.
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
        public IActionResult Post([FromBody] CreateTagDto dto, [FromServices] ICreateTagCommand command)
        {
            _handler.HandlerCommand(command, dto);
            return NoContent();
        }

        // PUT api/<TagsController>/5

        /// <summary>
        /// Updates a tag.
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
        public IActionResult Put(int id, [FromBody] CreateTagDto dto, [FromServices] IUpdateTagCommand command)
        {
            var data = new UpdateTagDto
            {
                Id = id,
                Data = dto
                

            };
            _handler.HandlerCommand(command, data);
            return NoContent();
        }

        // DELETE api/<TagsController>/5

        /// <summary>
        /// Deletes a tag.
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
        public IActionResult Delete(int id, [FromServices] IDeleteTagCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }
    }
}
