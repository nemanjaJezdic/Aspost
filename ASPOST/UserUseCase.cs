using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST
{
    public class UserUseCase:Entity
    {
       
        public int UseCaseId { get; set; }

        public int UserId { get; set; }

         public virtual User User { get; set; }
    }
}
