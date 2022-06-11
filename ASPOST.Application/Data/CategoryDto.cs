using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
   public  class CategoryDto : EntityDto
    {
        public string Name { get; set; }

        public IEnumerable<PostDto> Posts { get; set; } = new List<PostDto>();
    }
}
