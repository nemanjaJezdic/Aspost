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
using FluentValidation;

namespace ASPOST.Implementation.Commands
{
    public abstract class EfGenericUpdate<TDto, TEntity> : ICommand<TDto>
       where TEntity : Entity
       where TDto : EntityDto
    {
        public abstract int Id { get; }
        public abstract string Name { get; }

        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly AbstractValidator<TDto> _validator;

        protected EfGenericUpdate(Context context, IMapper mapper, AbstractValidator<TDto> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        protected EfGenericUpdate(Context context)
        {
            _context = context;
        }

        public void Execute(TDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = _context.Set<TEntity>().Find(request.Id);

            if (item == null)
            {
                throw new EntityDoesntExistException(request.Id, request.GetType());
            }

            _mapper.Map(request, item);

            _context.SaveChanges();

        }
    }
}
