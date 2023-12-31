﻿using CookingBlog.Application.UseCases.DTO;
using CookingBlog.Application.UseCases.DTO.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Application.UseCases.Queries
{
    public interface IGetBlogsQuery : IQuery<BlogSearch, PagedResponse<BlogDto>>
    {
    }
}
