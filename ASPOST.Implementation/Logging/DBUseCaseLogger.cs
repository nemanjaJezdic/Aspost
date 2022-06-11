using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPOST.Application;
using ASPOST.DataAccess;
using Newtonsoft.Json;

namespace ASPOST.Implementation.Logging
{
    public class DBUseCaseLogger : IUseCaseLogger
    {
        private readonly Context _context;

        public DBUseCaseLogger(Context context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.Logs.Add(new Logs
            {
                User = actor.Identity,
                Data = JsonConvert.SerializeObject(useCaseData),
                CreatedAt = DateTime.UtcNow,
                Name = useCase.Name
            });

            _context.SaveChanges();
            
        }
        
    }
}
