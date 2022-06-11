using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;

namespace ASPOST.Application.Searches
{
    public class LogSearch : PageSearch
    {
        [QueryProperty(ComparisonOperator.Contains, "User")]
        public string User { get; set; }

        [QueryProperty]
        public string UseCaseName { get; set; }

        [QueryProperty(ComparisonOperator.LessThanOrEqualsTo, "CreatedAt")]
        public DateTime? DateTo { get; set; }

        [QueryProperty(ComparisonOperator.MoreThanOrEqualsTo, "CreatedAt")]
        public DateTime? DateFrom { get; set; }

    }
}
