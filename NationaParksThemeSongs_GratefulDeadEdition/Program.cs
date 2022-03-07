using System;
using System.Collections.Generic;
using System.IO;
using System.Data.SqlClient;
using NationalParksThemeSongs_GratefulDeadEdition.DAO;
using NationalParksThemeSongs_GratefulDeadEdition.Models;

namespace NationalParksThemeSongs_GratefulDeadEdition
{
    public class Program
    {
        private readonly IParksSqlDao parksDao;
        private readonly ISongsSqlDao songsDao;
        
        static void Main(string[] args)
        {
            string connectionString = @"Server=.\SQLEXPRESS;Database=NationalParkThemeSongs_GratefulDeadEdition;Trusted_Connection=True;";

            Program program = new Program(connectionString);
            program.Run();
        }

        public Program(string connectionString)
        {
            parksDao = new ParksSqlDao(connectionString);
            songsDao = new SongsSqlDao(connectionString);
        }

        public string Run()
        {
            string userInput;
            do
            {
                Console.WriteLine("Welcome, please enter the name of the National Park you would like to learn more about: ");
                userInput = Console.ReadLine().ToLower();
            }
            while (userInput == "");
            Console.WriteLine($"You entered {userInput}");

            
            while (parksDao.GetParkByName(userInput) == null)
            {
                Console.WriteLine($"I'm sorry, {userInput} is not a valid park name. Please enter the name of the park you would like to learn more about: ");
                userInput = Console.ReadLine();
            }

                 Console.WriteLine(parksDao.GetParkByName(userInput));
            return userInput;


        }

       
    }
}
