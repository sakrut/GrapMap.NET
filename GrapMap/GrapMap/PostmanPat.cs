using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrapMap
{
    public class PostmanPat
    {
        /// <summary>
        /// Start point of search route. Can be null, then start point can by any Visit Point.
        /// </summary>
        public string StartPoint { get; private set; }
        /// <summary>
        /// Point to visit by Postman.
        /// </summary>
        public List<string> VisitPoints { get; private set; }

        public PostmanPat(string startPoint, List<string> visitPoints)
        {
            StartPoint = startPoint;
            VisitPoints = visitPoints;
        }

        public PostmanPat(List<string> visitPoints)
        {
            VisitPoints = visitPoints;
        }
         
    }
}
