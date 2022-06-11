using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Commands.Posts;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Posts;
using ASPOST.Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public PostsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<PostsController>
        [HttpGet]
        public IActionResult Get([FromQuery] PostSearch search, [FromServices] IGetPostsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<PostsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOnePostQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<PostsController>   
        [HttpPost]
        public IActionResult Post([FromForm] CreatePostDto dto, [FromServices] ICreatePostCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<PostsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] CreatePostDto dto, [FromServices] IUpdatePostCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<PostsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
