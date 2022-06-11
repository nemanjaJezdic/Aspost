using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.Application.Commands.Ratings;
using ASPOST.Application.Data;
using ASPOST.Application.Queries.Rating;
using ASPOST.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostRatingsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public PostRatingsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<PostRatingsController>
        [HttpGet]
        public IActionResult Get([FromQuery] RatingSearch search, [FromServices] IGetRatingsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<PostRatingsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneRatingQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<PostRatingsController>
        [HttpPost]
        public IActionResult Post([FromBody] RatingDto dto, [FromServices] ICreateRatingCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<PostRatingsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RatingDto dto, [FromServices] IUpdateRatingCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<PostRatingsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteRatingCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}

