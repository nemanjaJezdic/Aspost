using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.Commands.Posts;
using ASPOST.Application.Data;
using ASPOST.Application.FileUpload;
using ASPOST.DataAccess;
using ASPOST.Implementation.Validators.Posts;
using AutoMapper;
using FluentValidation;

namespace ASPOST.Implementation.Commands.Posts
{
    public class EfCreatePostCommand : ICreatePostCommand
    {
        private readonly Context _context;
        private readonly IMapper _mapper;
        private readonly IFileUpload _uploadFile;
        private readonly CreatePostValidator _validator;

        public EfCreatePostCommand(Context context, IMapper mapper, IFileUpload uploadFile, CreatePostValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _uploadFile = uploadFile;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfCreatePostCommand;

        public string Name => "Create Post";

        public void Execute(CreatePostDto request)
        {
            _validator.ValidateAndThrow(request);

            request.Image = _uploadFile.Upload(request.NewImage);

            var post = _mapper.Map<Post>(request);

            _context.Posts.Add(post);
            _context.SaveChanges();
        }
    }
}
