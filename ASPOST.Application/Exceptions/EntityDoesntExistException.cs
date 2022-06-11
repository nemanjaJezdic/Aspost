using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Exceptions
{
    public  class EntityDoesntExistException :Exception
    {
        public EntityDoesntExistException(int id, Type type)
          : base($"Entity of type {type.Name} with an id of {id} doesnt exist.")
        {
        }
    }
}
