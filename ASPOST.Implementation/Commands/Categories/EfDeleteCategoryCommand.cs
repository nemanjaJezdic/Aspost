using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Categories;
using ASPOST.DataAccess;

namespace ASPOST.Implementation.Commands.Categories
{
    public class EfDeleteCategoryCommand : EfGenericDelete<Category>, IDeleteCategoryCommand
    {
        public EfDeleteCategoryCommand(Context context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteCategoryCommand;

        public override string Name => "Delete category";
    }
}
