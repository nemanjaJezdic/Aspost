using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
    public class RatingDto:EntityDto
    {
        public int Rating { get; set; }

        public int PostId { get; set; }

        public int UserId { get; set; }

        public virtual UserDto User { get; set; }
    }
}
