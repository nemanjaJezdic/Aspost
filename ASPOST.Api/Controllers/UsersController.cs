using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Commands.Users;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Users;
using ASPOST.Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UsersController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UsersController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<UsersController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] AdminCreateUserDto dto,
            [FromServices] IAdminCreateUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] AdminCreateUserDto dto, [FromServices] IAdminUpdateUserCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IAdminDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
