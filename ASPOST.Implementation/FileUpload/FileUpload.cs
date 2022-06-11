using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application.FileUpload;
using Microsoft.AspNetCore.Http;

namespace ASPOST.Implementation.FileUpload
{
    public class FileUpload : IFileUpload
    {
        public string Upload(IFormFile file)
        {
            var extension = Path.GetExtension(file.FileName);

            var newFileName = Guid.NewGuid() + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }

            return newFileName;
        }
    }
}
