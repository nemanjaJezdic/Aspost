﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.Api.Core;
using Microsoft.AspNetCore.Mvc;
using static ASPOST.Api.Controllers.AccountController;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly JwtManager _manager;

        public TokenController(JwtManager manager)
        {
            _manager = manager;
        }

        // POST: TokenController
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest request)
        {
            var token = _manager.MakeToken(request.Username, request.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new { token });

        }
    }
}
