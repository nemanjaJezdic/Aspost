using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace ASPOST.Application.FileUpload
{
    public interface IFileUpload
    {
        string Upload(IFormFile file);
    }
}
