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
    public class UserConfiguration : EntityConfiguration<User>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<User> builder)
        {
            builder.HasIndex(x => x.Username)
                .IsUnique();

            builder.Property(x => x.Username)
                .IsRequired()
                .HasMaxLength(25);

            builder.Property(x => x.FirstName)
                .HasMaxLength(40)
                .IsRequired();

            builder.Property(x => x.Password)
               .IsRequired();

            builder.Property(x => x.LastName)
                .HasMaxLength(40)
                .IsRequired();

            builder.Property(x => x.Email)
                .HasMaxLength(40)
                .IsRequired();

            builder.HasIndex(x => x.Email)
                .IsUnique();

            builder.HasMany(x => x.Blogs)
                .WithOne(x => x.Author)
                .HasForeignKey(x => x.AuthorId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Comments)
                .WithOne(x => x.User)
                .HasForeignKey(x => x.AuthorId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Marks)
                .WithOne(x => x.UserRated)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Likes)
                .WithOne(x => x.User)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.ProfileImage)
                .WithMany()
                .HasForeignKey(x => x.ProfileImageId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.UseCases)
                .WithOne(x => x.User)
                .HasForeignKey(x => x.UserId);

        }
    }
}
