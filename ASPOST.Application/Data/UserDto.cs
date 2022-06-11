using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPOST.Application.Data
{
    public class UserDto:EntityDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string Username { get; set; }

        public int RoleId { get; set; }

        public virtual RoleDto RoleDTO { get; set; }

        public virtual IEnumerable<PostDto> Posts { get; set; }

        public virtual IEnumerable<CommentDto> Comments { get; set; }

        public virtual IEnumerable<int> UseCases { get; set; } = new List<int>();

        public virtual IEnumerable<RatingDto> Ratings { get; set; }
    }

    public class CreateUserDto : EntityDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool IsAdmin => false;
    }

    public class AdminCreateUserDto : EntityDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool IsAdmin { get; set; }       
    }
}
