using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.DataAccess.Configurations
{
    public class LogConfiguration : EntityConfiguration<LogEntry>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<LogEntry> builder)
        {
            builder.Property(x => x.UseCaseName).IsRequired();
            builder.Property(x => x.Username).IsRequired();
            builder.Property(x => x.Data).IsRequired();

            builder.HasIndex(x => x.UseCaseName);
            builder.HasIndex(x => x.Username);
            builder.HasIndex(x => x.CreatedAt);


        }
    }
}
