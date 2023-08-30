using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.DataAccess.Configurations
{
    public class MarkConfiguration : EntityConfiguration<Mark>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Mark> builder)
        {
        }
    }
}
