using NationalParksThemeSongs_GratefulDeadEdition.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NationalParksThemeSongs_GratefulDeadEdition.DAO
{
    public interface IParksSqlDao
    {
        public IList<Parks> GetAllParks();
        public Parks GetParkByName(string parkNameSearch);
    }
}
