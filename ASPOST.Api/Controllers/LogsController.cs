using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Queries.Logs;
using ASPOST.Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public LogsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<LogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearch search, [FromServices] IGetLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<LogsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneLogQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }
    }
}
