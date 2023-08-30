using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;

namespace CookingBlog.DataAccess
{
    public class CookingBlogContext : DbContext
    {
        public CookingBlogContext(IApplicationUser user)
        {
            User = user;
        }

        public IApplicationUser User { get; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=CookingBlogApi;Integrated Security=True").UseLazyLoadingProxies();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);
            modelBuilder.Entity<BlogImage>().HasKey(x => new { x.BlogId, x.ImageId });
            modelBuilder.Entity<BlogTag>().HasKey(x => new { x.BlogId, x.TagId });
            modelBuilder.Entity<UserUseCase>().HasKey(x => new { x.UserId, x.UseCaseId });

            base.OnModelCreating(modelBuilder);
        }

        public override int SaveChanges()
        {
            foreach(var entry in this.ChangeTracker.Entries())
            {
                if(entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            e.CreatedBy = User.Email;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            e.UpdatedBy = User.Email;
                            break;
                        case EntityState.Deleted:
                            entry.State = EntityState.Modified;
                            e.DeletedAt = DateTime.UtcNow;
                            e.DeletedBy = User.Email;
                            e.IsActive = false;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<BlogImage> BlogImages { get; set; }
        public DbSet<BlogTag> BlogTags { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Like> Likes { get; set; }
        public DbSet<Mark> Marks { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<LogEntry> LoggEntries { get; set; }

    }
}
