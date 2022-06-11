using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;

namespace ASPOST.Application.Searches
{
    public class PostSearch : PageSearch
    {
        [QueryProperties(ComparisonOperator.Contains, "Title", "Description")]
        public string Keyword { get; set; }

        [QueryProperty]
        public int? CategoryId { get; set; }

    }
}
