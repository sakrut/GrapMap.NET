using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrapMap.Entities
{
    public class RoutePart
    {
        public string StartPoitn { get; set; }
        public string EndPoitn { get; set; }

        public decimal Distance { get; set; }
        public TimeSpan Time { get; set; }
    }
}
