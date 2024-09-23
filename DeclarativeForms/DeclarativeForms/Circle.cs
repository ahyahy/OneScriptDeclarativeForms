using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфКруг", "DfCircle")]
    public class DfCircle : AutoContext<DfCircle>
    {
        public DfCircle(int p1, int p2, int p3)
        {
            X = p1;
            Y = p2;
            Radius = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private int y;
        [ContextProperty("Игрек", "Y")]
        public int Y
        {
            get { return y; }
            set { y = value; }
        }

        private int x;
        [ContextProperty("Икс", "X")]
        public int X
        {
            get { return x; }
            set { x = value; }
        }

        private int radius;
        [ContextProperty("Радиус", "Radius")]
        public int Radius
        {
            get { return radius; }
            set { radius = value; }
        }
    }
}
