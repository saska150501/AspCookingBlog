using CookingBlog.Api.DTO;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.DTO;
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
    public class RegisterController : ControllerBase
    {
        private UseCaseHandler _handler;

        public RegisterController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        // POST api/<RegisterController>

        /// <summary>
        /// Registers new user.
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull create.</response>
        /// <response code="409">Confilct in the request</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexcepted server error.</response>

        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromForm] RegisterApiDto dto,
            [FromServices] IRegisterUserCommand command)
        {
           if(dto.Image != null)
           {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(dto.Image.FileName);

                if (!SupportedExtensions.Contains(extension))
                {
                    throw new InvalidOperationException("Invalid file extension.");
                }

                var newNameFile = guid + extension;

                var path = Path.Combine("wwwroot", "images", newNameFile);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    dto.Image.CopyTo(fileStream);
                }

                dto.ProfileImage = newNameFile;
           }

            _handler.HandlerCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<RegisterController>/5

        /// <summary>
        /// Updates a user.
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
        public IActionResult Put(int id, [FromForm] UpdateApiDto dto,
            [FromServices] IUpdateUserCommand command)
        {
            if (dto.Image != null)
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(dto.Image.FileName);

                if (!SupportedExtensions.Contains(extension))
                {
                    throw new InvalidOperationException("Invalid file extension.");
                }

                var newNameFile = guid + extension;

                var path = Path.Combine("wwwroot", "images", newNameFile);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    dto.Image.CopyTo(fileStream);
                }

                dto.NewImageProfile = newNameFile;
            }

            var data = new UpdateApiDto
            {
                Id = id,
                FirstName = dto.FirstName,
                LastName = dto.LastName,
                NewEmail = dto.NewEmail,
                NewPassword = dto.NewPassword,
                NewUsername = dto.NewUsername,
                NewImageProfile = dto.NewImageProfile
            };

            _handler.HandlerCommand(command, data);
            return NoContent();
        }

        // DELETE api/<RegisterController>/5

        /// <summary>
        /// Deletes a user.
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
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _handler.HandlerCommand(command, id);
            return NoContent();
        }

        private IEnumerable<string> SupportedExtensions => new List<string> { ".png", ".jpeg", ".jpg" };
    }
}
