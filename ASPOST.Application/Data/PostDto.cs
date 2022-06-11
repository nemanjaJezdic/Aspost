using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace ASPOST.Application.Data
{
    public class PostDto :EntityDto
    {
        public string Title { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        public int UserId { get; set; }

        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        public IEnumerable<RatingDto> Ratings { get; set; } = new List<RatingDto>();

        public IEnumerable<CommentDto> Comments { get; set; } = new List<CommentDto>();

        public double AverageRating => this.Ratings.Any() ? Ratings.Average(x => x.Rating) : 0;
    }

    public class CreatePostDto
    {
        public int? Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        public IFormFile NewImage { get; set; }

        public int UserId { get; set; }

        public int CategoryId { get; set; }
    }
}
