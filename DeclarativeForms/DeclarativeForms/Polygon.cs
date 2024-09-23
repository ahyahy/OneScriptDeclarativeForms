using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПолигон", "DfPolygon")]
    public class DfPolygon : AutoContext<DfPolygon>
    {
        public DfPolygon(ArrayImpl p1)
        {
            Coordinates = p1;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private ArrayImpl coordinates;
        [ContextProperty("Координаты", "Coordinates")]
        public ArrayImpl Coordinates
        {
            get { return coordinates; }
            set { coordinates = value; }
        }
    }
}
