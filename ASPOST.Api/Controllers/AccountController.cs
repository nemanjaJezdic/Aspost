using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Api.Core;
using ASPOST.Application;
using ASPOST.Application.Commands.Users;
using ASPOST.Application.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : Controller
    {
        private readonly UseCaseExecutor _executor;
        private readonly JwtManager _jwtManager;
        private readonly IApplicationActor _actor;
        public AccountController(UseCaseExecutor executor, JwtManager jwtManager, IApplicationActor actor)
        {
            _executor = executor;
            _jwtManager = jwtManager;
            _actor = actor;
        }

        //POST: api/Account
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post(
            [FromBody] CreateUserDto dto,
            [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);

            return StatusCode(201);
        }

        [HttpPost("[action]")]
        [AllowAnonymous]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            var token = _jwtManager.MakeToken(request.Username, request.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new { token });
        }

        [HttpPut]
        public IActionResult Put([FromBody] CreateUserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Id = _actor.Id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        [HttpDelete]
        public IActionResult Delete([FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, _actor.Id);
            return NoContent();
        }

    }

    public class LoginRequest
    {
        public string Username { get; set; }

        public string Password { get; set; }
    }
}
