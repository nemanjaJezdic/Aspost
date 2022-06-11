using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Posts;
using ASPOST.Application.Data;
using ASPOST.Application.Exceptions;
using ASPOST.Application.FileUpload;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Posts;
using AutoMapper;
using FluentValidation;

namespace ASPOST.Implementation.Commands.Posts
{
    public class EfUpdatePostCommand : IUpdatePostCommand
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly UpdatePostValidator _validator;
        private readonly IFileUpload _uploadFile;

        public EfUpdatePostCommand(Context context, IMapper mapper, UpdatePostValidator validator, IFileUpload uploadFile)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
            _uploadFile = uploadFile;
        }

        public int Id => (int)UseCasesEnum.EfUpdatePostCommand;

        public string Name => "Update post";

        public void Execute(CreatePostDto request)
        {
            var post = _context.Posts.Find(request.Id);

            if (post == null)
            {
                throw new EntityDoesntExistException(request.Id.Value, typeof(Post));
            }

            if (request.Image != null)
            {
                request.Image = _uploadFile.Upload(request.NewImage);
            }
            else
            {
                request.Image = post.Image;
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, post);

            _context.SaveChanges();
        }
    }
}
