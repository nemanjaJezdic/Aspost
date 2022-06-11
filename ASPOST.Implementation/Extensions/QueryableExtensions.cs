using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.Application.Queries;
using ASPOST.Application.Searches;
using AutoMapper;
using AutoMapper.QueryableExtensions;

namespace ASPOST.Implementation.Extensions
{
    public static class QueryableExtensions
    {
        public static PageResponse<TDto> Paged<TDto, TEntity>(
            this IQueryable<TEntity> query, PageSearch search, IMapper mapper)
            where TEntity : Entity
            where TDto : EntityDto
        {
            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PageResponse<TDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = skipped.ProjectTo<TDto>(mapper.ConfigurationProvider).ToList()
            };

            return response;
        }

        public static IQueryable<T> OnlyActive<T>(this IQueryable<T> query) where T : Entity
        {
            query = query.Where(x => x.IsActive == true);

            return query;
        }
    }
}
