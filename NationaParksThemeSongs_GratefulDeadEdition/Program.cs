﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Data.SqlClient;
using NationalParksThemeSongs_GratefulDeadEdition.DAO;
using NationalParksThemeSongs_GratefulDeadEdition.Models;
using System.Threading;

namespace NationalParksThemeSongs_GratefulDeadEdition
{
    public class Program : Art
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
            ParksDisplay();
           
                do
                {
                    Console.WriteLine("Please enter the name of the National Park you would like to learn more about: ");
                    userInput = Console.ReadLine().ToLower();
                }
                while (userInput == "");
                Console.WriteLine($"You entered {userInput}");
                Console.WriteLine('\n');

                while (parksDao.GetParkByName(userInput) == null)
                {
                    Console.WriteLine($"I'm sorry, {userInput} is not a valid park name. Please enter the name of the park you would like to learn more about: ");
                    Console.WriteLine("\n");
                    userInput = Console.ReadLine();
                }

                Console.WriteLine(parksDao.GetParkByName(userInput));

                Console.WriteLine("");
                Console.WriteLine($"Display the Theme Song for {parksDao.GetParkByName(userInput).Name}? Y/N ");
                string displayThemeSong = Console.ReadLine().ToLower();
                Console.Clear();
                Buffering();
                Thread.Sleep(3500);
                Console.Clear();
                if (displayThemeSong == "y")
                {
                SongsDisplay();
                Console.WriteLine(songsDao.GetSongByParkName(parksDao.GetParkByName(userInput).Name));
                Console.WriteLine("Press any key to continue.");
                Console.Read();
                Console.Clear();
                EndProgram();
                }

                return userInput;
        }


    }
}
