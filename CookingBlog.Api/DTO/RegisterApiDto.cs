using CookingBlog.Application.UseCases.DTO;
using Microsoft.AspNetCore.Http;

namespace CookingBlog.Api.DTO
{
    public class RegisterApiDto : RegisterDto
    {
        public IFormFile Image { get; set; }
   
    }
}
