using System;
using ASPOST.DataAccess.Configuration;
using Microsoft.EntityFrameworkCore;

namespace ASPOST.DataAccess
{
    public class Context:DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            base.OnModelCreating(modelBuilder);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=JEZDA-PC;Initial Catalog=aspost;Integrated Security=True").UseLazyLoadingProxies();

            optionsBuilder.EnableSensitiveDataLogging();

            base.OnConfiguring(optionsBuilder);
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            e.UpdatedAt = null;
                            break;

                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            break;

                        case EntityState.Deleted:
                            Entry(e).State = EntityState.Modified;
                            e.IsActive = false;
                            break;
                    }
                }

            }
            return base.SaveChanges();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Logs> Logs { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Post> Posts { get; set; }     
        public DbSet<Rating> Ratings { get; set; }

        

        
    }
}
