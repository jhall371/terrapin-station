using NationalParksThemeSongs_GratefulDeadEdition.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NationalParksThemeSongs_GratefulDeadEdition.DAO
{
    public interface ISongsSqlDao
    {
        public IList<Songs> GetAllSongs();

        public Songs GetSongByParkName(string parkNameSearch);
    }
}
