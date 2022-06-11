﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST
{
    public class Comment:Entity
    {
        public string Text { get; set; }

        public int PostId { get; set; }

        public virtual Post Post { get; set; }

        public int UserId { get; set; }

        public virtual User User { get; set; }

        public int? ParentId { get; set; }

        public virtual Comment Parent { get; set; }

        public virtual ICollection<Comment> ChildComments { get; set; } = new List<Comment>();
    }
}
