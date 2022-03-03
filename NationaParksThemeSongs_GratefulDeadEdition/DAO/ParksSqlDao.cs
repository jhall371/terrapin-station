using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using NationaParksThemeSongs_GratefulDeadEdition.Models;

namespace NationaParksThemeSongs_GratefulDeadEdition.DAO
{
    public class ParksSqlDao : IParksSqlDao
    {
        private readonly string connectionString;

        public ParksSqlDao(string connString)
        {
            connectionString = connString;
        }

        //public Parks GetParks(int parkId)
        //{
        //    Parks park = null;

        //    using(SqlConnection conn = new SqlConnection(connectionString))
        //    {

        //    }

        //}
    }
}
