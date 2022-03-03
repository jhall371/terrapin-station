using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NationaParksThemeSongs_GratefulDeadEdition.Models
{
    public class Parks
    {
        public int ParkId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public DateTime EstablishDate { get; set; }
        public int Area { get; set; }
        public int Visitors { get; set; }
        public string Description { get; set; }

        public Parks() { }
        public Parks(int parkId, string parkName, string parkLocation, DateTime dateEstablished, int area, int annualVisitors, string parkDescription)
        {
            ParkId = parkId;
            Name = parkName;
            Location = parkLocation;
            EstablishDate = dateEstablished;
            Area = area;
            Visitors = annualVisitors;
            Description = parkDescription;
        }
    }
}
