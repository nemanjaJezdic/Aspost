using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Commands.UseCases;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.UseCases;
using ASPOST.Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UseCasesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UseCasesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UseCasesController>
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseSearch search, [FromServices] IGetUseCasesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UseCasesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUseCaseQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<UseCasesController>
        [HttpPost]
        public IActionResult Post([FromBody] UseCaseDto dto, [FromServices] ICreateUseCaseCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<UseCasesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UseCaseDto dto, [FromServices] IUpdateUseCaseCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<UseCasesController>/5
        [HttpDelete]
        public IActionResult Delete(int id, [FromServices] IDeleteUseCaseCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
