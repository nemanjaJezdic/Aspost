using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST
{
    public class Post:Entity
    {
        public string Title { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        public int UserId { get; set; }

        public virtual User User { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

        public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();

      
    }
}
