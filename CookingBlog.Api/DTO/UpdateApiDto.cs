using CookingBlog.Application.UseCases.DTO;
using Microsoft.AspNetCore.Http;

namespace CookingBlog.Api.DTO
{
    public class UpdateApiDto : UpdateUserDto
    {
        public IFormFile Image { get; set; }

    }
}
