using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using NationalParksThemeSongs_GratefulDeadEdition.Models;

namespace NationalParksThemeSongs_GratefulDeadEdition.DAO
{
    public class ParksSqlDao : IParksSqlDao
    {
        private readonly string connectionString;

        public ParksSqlDao(string connString)
        {
            connectionString = connString;
        }

        public IList<Parks> GetAllParks()
        {
            IList<Parks> parks = new List<Parks>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT park_id, name, location, establish_date, area, visitors, description FROM parks;", conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    Parks park = CreateParkFromReader(reader);
                    parks.Add(park);
                }
            }
            return parks;
        }

        public Parks GetParkByName(string parkNameSearch)
        {
            Parks park = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"SELECT * FROM parks WHERE name = @name;", conn);
                cmd.Parameters.AddWithValue("@name", parkNameSearch);

                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    park = CreateParkFromReader(reader);
                }
                return park;
            }
        }
        private Parks CreateParkFromReader(SqlDataReader reader)
        {
            Parks park = new Parks();

            park.ParkId = Convert.ToInt32(reader["park_id"]);
            park.Name = Convert.ToString(reader["name"]);
            park.Location = Convert.ToString(reader["location"]);
            park.EstablishDate = Convert.ToDateTime(reader["establish_date"]);
            park.Area = Convert.ToInt32(reader["area"]);
            park.Visitors = Convert.ToInt32(reader["visitors"]);
            park.Description = Convert.ToString(reader["description"]);

            return park;
        }
    }
}
