using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
    public class CommentDto:EntityDto
    {
        public string Text { get; set; }

        public int PostId { get; set; }

        public int UserId { get; set; }

        public int? ParentId { get; set; }

        public IEnumerable<CommentDto> ChildComments { get; set; } = new List<CommentDto>();
    }
}
