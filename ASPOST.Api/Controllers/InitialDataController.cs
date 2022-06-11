using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASPOST.DataAccess;
using Bogus;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPOST.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InitialDataController : ControllerBase
    {
        private readonly Context _context;

        public InitialDataController(Context context)
        {
            _context = context;
        }

        // GET: api/<InitialDataController>
        [HttpGet]
        public IActionResult Get()
        {
            var categories = new List<Category>
            {
                new Category
                {
                    Name = "Funny",
                },
                new Category
                {
                    Name = "Sport"
                },
                new Category
                {
                    Name = "News"
                },
                new Category
                {
                    Name = "Travel"
                },
                new Category
                {
                    Name = "Awesome"
                }
            };

            _context.Categories.AddRange(categories);

            _context.SaveChanges();

            return Ok();
        }

        // GET api/<InitialDataController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var users = new List<User>();

            for (int i = 11; i <= 25; i++)
            {
                var user = new Faker<User>()
                    .RuleFor(x => x.FirstName, x => x.Name.FirstName())
                    .RuleFor(x => x.LastName, x => x.Name.LastName())
                    .RuleFor(x => x.Username, x => x.Person.UserName)
                    .RuleFor(x => x.Password, x => BCrypt.Net.BCrypt.HashPassword("sifra123"))
                    .RuleFor(x => x.IsAdmin, x => false)
                    .RuleFor(x => x.Email, x => x.Internet.ExampleEmail());

                users.Add(user);
            }

            _context.Users.AddRange(users);

            _context.SaveChanges();

            return Ok();
        }

        // POST api/<InitialDataController>
        [HttpPost]
        public IActionResult Post()
        {
            var posts = new List<Post>();

            for (int i = 1; i <= 10; i++)
            {
                var rnd = new Random();


                var post = new Faker<Post>()
                    .RuleFor(x => x.Title, x => x.Lorem.Sentence())
                    .RuleFor(x => x.Description, x => x.Lorem.Paragraphs())
                    .RuleFor(x => x.Image, x => Guid.NewGuid().ToString() + ".jpg")
                    .RuleFor(x => x.CategoryId, x => rnd.Next(16, 20))
                    .RuleFor(x => x.UserId, x => 36);
                 

                posts.Add(post);
            }

            _context.Posts.AddRange(posts);
            _context.SaveChanges();

            return StatusCode(201);
        }


    }
}
