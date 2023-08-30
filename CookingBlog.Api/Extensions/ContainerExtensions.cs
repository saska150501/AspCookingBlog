using CookingBlog.Api.Core;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using CookingBlog.Implementation.UseCases.Commands;
using CookingBlog.Implementation.UseCases.Queries;
using CookingBlog.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace CookingBlog.Api.Extensions
{
    public static class ContainerExtensions
    {
        public static void AddJwt(this IServiceCollection services, AppSettings settings)
        {
            //mozes sve u startup
            services.AddTransient(x =>
            {
                var context = x.GetService<CookingBlogContext>();
                var settings = x.GetService<AppSettings>();

                return new JwtManager(context, settings.JwtSettings);
            });

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = settings.JwtSettings.Issuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(settings.JwtSettings.SecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EfGetCategoryQuery>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IGetTagQuery, EfGetTagQuery>();
            services.AddTransient<IGetTagsQuery, EfGetTagsQuery>(); 
            services.AddTransient<ICreateTagCommand, EfCreateTagCommand>(); 
            services.AddTransient<IDeleteTagCommand, EfDeleteTagCommand>();
            services.AddTransient<IUpdateTagCommand, EfUpdateTagCommand>();
            services.AddTransient<IUpdateUserUseCasesCommand, EfUpdateUseUserCasesCommand>(); 
            services.AddTransient<IGetUseCaseLogQuery, EfGetUseCaseLogQuery>(); 
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>(); 
            services.AddTransient<ICreateBlogCommand, EfCreateBlogCommand>(); 
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<RegisterValidator>();
            services.AddTransient<CreateTagValidator>();
            services.AddTransient<UpdateUserUseCasesValidator>();
            services.AddTransient<CreateBlogValidator>();
            services.AddTransient<UpdateTagValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<SearchUseCaseLogValidator>();
        }

        public static void AddApplicationUser(this IServiceCollection services)
        {
            services.AddTransient<IApplicationUser>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var header = accessor.HttpContext.Request.Headers["Authorization"];

                var user = accessor.HttpContext.User;

                if(user == null || user.FindFirst("UserId") == null)
                {
                    return new AnonimousUser();
                }

                var actor = new JwtUser
                {
                    Email = user.FindFirst("Email").Value,
                    Id = Int32.Parse(user.FindFirst("UserId").Value),
                    Identity = user.FindFirst("Email").Value,
                    UseCaseIds = JsonConvert.DeserializeObject<List<int>>(user.FindFirst("UseCases").Value)
                };

                return actor;
            });
        }
    }
}
