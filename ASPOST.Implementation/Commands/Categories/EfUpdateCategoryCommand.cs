using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Categories;
using ASPOST.Application.Data;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Categories;
using AutoMapper;

namespace ASPOST.Implementation.Commands.Categories
{
    public class EfUpdateCategoryCommand : EfGenericUpdate<CategoryDto,Category>, IUpdateCategoryCommand
    {
        public EfUpdateCategoryCommand(Context context, IMapper mapper, UpdateCategoryValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => throw new NotImplementedException();

        public override string Name => throw new NotImplementedException();

    }
}
