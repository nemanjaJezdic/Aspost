﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Doublel.DynamicQueryBuilder.Attributes;

namespace ASPOST.Application.Searches
{
    public class UseCaseSearch : PageSearch
    {
        [QueryProperty]
        public int? UserId { get; set; }

        [QueryProperty]
        public int? UseCaseId { get; set; }
    }
}
