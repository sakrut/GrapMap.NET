using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrapMap.Entities
{
    public class Route
    {
        private RoutePart[] RouteParts { get; set; }

        public Decimal Distance =>  RouteParts?.Sum(x => x.Distance) ?? 0;
        public TimeSpan Time => new TimeSpan(RouteParts?.Sum(x => x.Time.Ticks) ?? 0);

        public string StartPoint => RouteParts.FirstOrDefault()?.StartPoitn;
        public string EndPoint => RouteParts.LastOrDefault()?.StartPoitn;
    }
}
