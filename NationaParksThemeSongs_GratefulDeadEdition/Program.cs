using System;
using System.Collections.Generic;
using System.IO;
using System.Data.SqlClient;
using NationaParksThemeSongs_GratefulDeadEdition.DAO;
using NationaParksThemeSongs_GratefulDeadEdition.Models;

namespace NationaParksThemeSongs_GratefulDeadEdition
{
    class Program
    {
        private readonly IParksSqlDao parksDao;
        private readonly ISongsSqlDao songsDao;
        static void Main(string[] args)
        {
            string connectionString = @"Server=.\SQLEXPRESS;Database=NationaParksThemeSongs_GratefulDeadEdition;Trusted_Connection=True;";

            Program program = new Program(connectionString);
            program.Run();
        }
        
        public Program(string connectionString)
        {
            parksDao = new ParksSqlDao(connectionString);
            songsDao = new SongsSqlDao(connectionString);
        }

        private void Run()
        {

        }
    }
}
