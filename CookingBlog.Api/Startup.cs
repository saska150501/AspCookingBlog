using CookingBlog.Api.Core;
using CookingBlog.Api.Extensions;
using CookingBlog.Application.Emails;
using CookingBlog.Application.Logging;
using CookingBlog.Application.UseCases;
using CookingBlog.Application.UseCases.Commands;
using CookingBlog.Application.UseCases.Queries;
using CookingBlog.DataAccess;
using CookingBlog.Domain.Entities;
using CookingBlog.Implementation;
using CookingBlog.Implementation.Emails;
using CookingBlog.Implementation.Logging;
using CookingBlog.Implementation.UseCases.Commands;
using CookingBlog.Implementation.UseCases.Queries;
using CookingBlog.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var settings = new AppSettings();

            Configuration.Bind(settings);

            services.AddSingleton(settings);
            //services.AddApplicationUser();
            //services.AddJwt(settings);
            //services.AddUseCases();


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


            //addUseCases
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EfGetCategoryQuery>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IGetTagQuery, EfGetTagQuery>();
            services.AddTransient<IGetTagsQuery, EfGetTagsQuery>();
            services.AddTransient<IGetBlogsQuery, EfGetBlogsQuery>();
            services.AddTransient<IDeleteBlogCommand, EfDeleteBlogCommand>();
            services.AddTransient<IUpdateBlogCommand, EfUpdateBlogCommand>();
            services.AddTransient<ICreateTagCommand, EfCreateTagCommand>();
            services.AddTransient<IDeleteTagCommand, EfDeleteTagCommand>();
            services.AddTransient<IUpdateTagCommand, EfUpdateTagCommand>();
            services.AddTransient<IUpdateUserUseCasesCommand, EfUpdateUseUserCasesCommand>();
            services.AddTransient<IGetUseCaseLogQuery, EfGetUseCaseLogQuery>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<ICreateBlogCommand, EfCreateBlogCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<ICreateCommentCommand, EfCreateCommentCommand>();
            services.AddTransient<IDeleteCommentCommand, EfDeleteCommentCommand>();
            services.AddTransient<IUpdateCommentCommand, EfUpdateCommentCommand>();
            services.AddTransient<ICreateLikeCommand, EfCreateLikeCommand>();
            services.AddTransient<IDeleteLikeCommand, EfDeleteLikeCommand>();
            services.AddTransient<ICreateMarkCommand, EfCreateMarkCommand>();
            services.AddTransient<IDeleteMarkCommand, EfDeleteMarkCommand>();
            services.AddTransient<IUpdateMarkCommand, EfUpdateMarkCommand>();
            services.AddTransient<IGetBlogQuery, EfGetBlogQuery>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<RegisterValidator>();
            services.AddTransient<CreateTagValidator>();
            services.AddTransient<UpdateUserUseCasesValidator>();
            services.AddTransient<CreateBlogValidator>();
            services.AddTransient<UpdateTagValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<SearchUseCaseLogValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<UpdateBlogValidator>();
            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<UpdateCommentValidator>();
            services.AddTransient<UpdateMarkValidator>();
            services.AddTransient<CreateMarkValidator>();

            //addApplicationUser
            services.AddTransient<IApplicationUser>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var header = accessor.HttpContext.Request.Headers["Authorization"];

                var user = accessor.HttpContext.User;

                if (user == null || user.FindFirst("UserId") == null)
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


            services.AddTransient<CookingBlogContext>();
            services.AddTransient<IExceptionLogger, ConsoleExceptionLogger>();
            services.AddTransient<IUseCaseLogger, EfUseCaseLogger>();

            services.AddTransient<IEmailSender>(x =>
            
                new SmtpEmailSender(settings.EmailFrom, settings.EmailPassword)
            );

            services.AddTransient<UseCaseHandler>();

            services.AddControllers();
            services.AddHttpContextAccessor();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "CookingBlog.Api", Version = "v1" });

                var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
            });



        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "CookingBlog.Api v1"));
            }

            app.UseRouting();
            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
