using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using NationalParksThemeSongs_GratefulDeadEdition.Models;

namespace NationalParksThemeSongs_GratefulDeadEdition.DAO
{
    public class SongsSqlDao : ISongsSqlDao
    {
        private readonly string connectionString;

        public SongsSqlDao(string connString)
        {
            connectionString = connString;
        }

        //public Songs GetSongs(int songId)
        //{
        //    Songs song = null;
        //}

    }
}
