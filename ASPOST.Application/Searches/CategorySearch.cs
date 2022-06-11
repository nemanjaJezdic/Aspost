using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;

namespace ASPOST.Application.Searches
{
    public class CategorySearch : PageSearch
    {
        [QueryProperty(ComparisonOperator.Contains, "Name")]
        public string Name { get; set; }

    }
}
