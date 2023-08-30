using CookingBlog.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.DataAccess.Configurations
{
    public class LikeConfiguration : EntityConfiguration<Like>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Like> builder)
        {
        }
    }
}
