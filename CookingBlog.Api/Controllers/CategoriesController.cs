using CookingBlog.Api.Extensions;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.Implementation;
using CookingBlog.Implementation.Validators;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CookingBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private UseCaseHandler _handler;

        public CategoriesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        // GET: api/<CategoriesController>

        /// <summary>
        /// Searches a category.
        /// </summary>
        /// <param name="request"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="400">Bad request.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get([FromQuery] BasePageSearch request,
                                 [FromServices] IGetCategoriesQuery query)
        {
            return Ok(_handler.HandlerQuery(query, request));
        }

        // GET api/<CategoriesController>/5

        /// <summary>
        /// Findes a category.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="404">Not found object.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpGet("{id}")]
        [AllowAnonymous]

        public IActionResult Get(int id, [FromServices] IGetCategoryQuery query)
        {
            return Ok(_handler.HandlerQuery(query, id));
        }

        // POST api/<CategoriesController>

        /// <summary>
        /// Creates new category.
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
        public IActionResult Post([FromBody] CreateCategoryDto dto,
            [FromServices] ICreateCategoryCommand command)        
        {
            _handler.HandlerCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<CategoriesController>/5

        /// <summary>
        /// Updates a category.
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
        public IActionResult Put(int id, [FromBody] CreateCategoryDto dto, [FromServices] IUpdateCategoryCommand command)
        {
            var data = new UpdateCategoryDto
            {
                Id = id,
                Data = dto


            };
            _handler.HandlerCommand(command, data);
            return NoContent();
        }

        // DELETE api/<CategoriesController>/5

        /// <summary>
        /// Deletes a category.
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
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }
    }
}
