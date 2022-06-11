using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using ASPOST.Implementation.Extensions;
using AutoMapper;
using Doublel.QueryableBuilder;

namespace ASPOST.Implementation.Queries
{
    public abstract class EfGenericGet<TSearch, T, TDto> : IQuery<PageResponse<TDto>, TSearch>
      where T : Entity
      where TDto : EntityDto
      where TSearch : PageSearch
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        public abstract int Id { get; }
        public abstract string Name { get; }
        protected EfGenericGet(Context context, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }

        public PageResponse<TDto> Execute(TSearch search)
        {
            var query = _context.Set<T>().AsQueryable();
            query = query.BuildQuery(search);

            if (!_actor.IsAdmin)
            {
                query.OnlyActive();
            }

            return query.Paged<TDto, T>(search, _mapper);
        }
    }
}
