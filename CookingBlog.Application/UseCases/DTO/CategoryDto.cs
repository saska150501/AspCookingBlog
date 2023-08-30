﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.DTO
{
    public class CategoryDto : BaseDto
    {
        public string Name { get; set; }
    }
    public class CreateCategoryDto
    {
        public string Name { get; set; }
    }
    public class UpdateCategoryDto
    {
        public int Id { get; set; }
        public CreateCategoryDto Data { get; set; }
    }
}
