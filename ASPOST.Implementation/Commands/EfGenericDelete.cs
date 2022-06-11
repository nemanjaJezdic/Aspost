using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Exceptions;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands
{
    public abstract class EfGenericDelete<TEntity> : ICommand<int>
       where TEntity : Entity
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        private readonly Context _context;

        protected EfGenericDelete(Context context)
        {
            _context = context;
        }

        public void Execute(int request)
        {
            var item = _context.Set<TEntity>().Find(request);

            if (item == null)
            {
                throw new EntityDoesntExistException(request, typeof(TEntity));
            }

            item.IsActive = false;

            _context.SaveChanges();

        }
    }
}
