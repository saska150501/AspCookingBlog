using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.DataAccess.Configurations
{
    public class BlogConfiguration : EntityConfiguration<Blog>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Blog> builder)
        {
            builder.HasIndex(x => x.Title).IsUnique();

            builder.Property(x => x.Title)
                .HasMaxLength(250)
                .IsRequired();

            builder.HasMany(x => x.Comments)
                .WithOne(x => x.Blog)
                .HasForeignKey(x => x.BlogId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Marks)
                .WithOne(x => x.BlogRated)
                .HasForeignKey(x => x.BlogId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.BlogImages)
                .WithOne(x => x.Blog)
                .HasForeignKey(x => x.BlogId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.BlogTags)
                .WithOne(x => x.Blog)
                .HasForeignKey(x => x.BlogId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Likes)
                .WithOne(x => x.Blog)
                .HasForeignKey(x => x.BlogId)
                .OnDelete(DeleteBehavior.Restrict);


        }
    }
}
