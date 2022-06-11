using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ASPOST.DataAccess.Configuration
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {      
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(c => c.Text).IsRequired().HasMaxLength(255);

            builder.Property(c => c.PostId).IsRequired();
            builder.Property(c => c.UserId).IsRequired();

            builder.HasMany(x => x.ChildComments)
                    .WithOne(x => x.Parent)
                    .HasForeignKey(c => c.ParentId)
                    .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
