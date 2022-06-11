using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Categories;
using ASPOST.Application.Searches;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Categories
{
    public class EfGetCategoriesQuery : EfGenericGet<CategorySearch,Category, CategoryDto>, IGetCategoriesQuery
    {
        public EfGetCategoriesQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetCategoriesQuery;

        public override string Name => "Get categories";
    }
}
