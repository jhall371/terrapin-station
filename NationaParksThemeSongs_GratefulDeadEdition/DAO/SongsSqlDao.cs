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
        public IList<Songs> GetAllSongs()
        {
            IList<Songs> songs = new List<Songs>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT park_id, name, location, establish_date, area, visitors, description FROM parks;", conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Songs song = CreateSongFromReader(reader);
                    songs.Add(song);
                }
            }
            return songs;
        }

        public Songs GetSongByParkName(string parkNameSearch)
        {
            Songs song = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT songs.song_id, songs.name, venue, songs.location, date_recorded, link, songs.description FROM songs 
                                                JOIN park_song ON park_song.song_id = songs.song_id
                                                JOIN parks ON parks.park_id = park_song.park_id
                                                WHERE parks.name = @name", conn);
                cmd.Parameters.AddWithValue("@name", parkNameSearch);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    song = CreateSongFromReader(reader);
                }
                return song;
            }
        }
        private Songs CreateSongFromReader(SqlDataReader reader)
        {
            Songs song = new Songs();

            song.SongId = Convert.ToInt32(reader["song_id"]);
            song.Name = Convert.ToString(reader["name"]);
            song.Venue = Convert.ToString(reader["venue"]);
            song.Location = Convert.ToString(reader["location"]);
            song.DateRecorded = Convert.ToDateTime(reader["date_recorded"]);
            song.Link = Convert.ToString(reader["link"]);
            song.Description = Convert.ToString(reader["description"]);

            return song;
        }
    }
}
