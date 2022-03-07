using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NationalParksThemeSongs_GratefulDeadEdition.Models
{
    public class Songs
    {
        public int SongId { get; set; }
        public string Name { get; set; }
        public string Venue { get; set; }
        public string Location { get; set; }
        public DateTime DateRecorded { get; set; }
        public string Link { get; set; }
        public string Description { get; set; }

        public Songs() { }

        public Songs (int songId, string songName, string venueName, string venueLocation, DateTime dateRecorded, string songLink, string songDescription)
        {
            SongId = songId;
            Name = songName;
            Venue = venueName;
            Location = venueLocation;
            DateRecorded = dateRecorded;
            Link = songLink;
            Description = songDescription;
        }
    }
}
