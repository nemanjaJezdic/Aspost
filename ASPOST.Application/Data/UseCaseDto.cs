using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
    public class UseCaseDto:EntityDto
    {
        public int UserId { get; set; }

        public int UseCaseId { get; set; }
    }
}
