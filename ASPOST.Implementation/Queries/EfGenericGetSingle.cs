using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Exceptions;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries
{
    public abstract class EfGenericGetSingle<T, TDto> : IQuery<TDto, int>
         where T : Entity
         where TDto : EntityDto
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        protected EfGenericGetSingle(Context context, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public TDto Execute(int id)
        {
            var row = _context.Set<T>().FirstOrDefault(x => x.Id == id);

            if (row == null)
            {
                throw new EntityDoesntExistException(id, typeof(T));
            }

            if (row.IsActive == false && !_actor.IsAdmin)
            {
                throw new EntityDoesntExistException(id, typeof(T));
            }

            return _mapper.Map<TDto>(row);
        }
    }
}
