using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Data;
using ASPOST.Application.Searches;

namespace ASPOST.Application.Queries.UseCases
{
    public interface IGetUseCasesQuery : IQuery<PageResponse<UseCaseDto>, UseCaseSearch>
    {

    }
}
