using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
    public  class LogDto:EntityDto
    {
        public string Name { get; set; }

        public string Data { get; set; }

        public int UserId { get; set; }
    }
}
