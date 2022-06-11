using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Categories;
using ASPOST.DataAccess;
using AutoMapper;

namespace ASPOST.Implementation.Queries.Categories
{
    public class EfGetOneCategoryQuery : EfGenericGetSingle<Category, CategoryDto>, IGetOneCategoryQuery
    {
        public EfGetOneCategoryQuery(Context context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneCategoryQuery;

        public override string Name => "Get one category";

    }
}
