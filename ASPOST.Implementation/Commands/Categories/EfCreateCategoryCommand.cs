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
    public class EfCreateCategoryCommand : EfGenericInsert<CategoryDto,Category>, ICreateCategoryCommand
    {

        public EfCreateCategoryCommand(Context context, IMapper mapper, UpdateCategoryValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreateCategoryCommand;

        public override string Name => "Create Category";

    }
}
