using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфТочка", "DfPoint")]
    public class DfPoint : AutoContext<DfPoint>
    {
        public DfPoint(int p1, int p2)
        {
            X = p1;
            Y = p2;
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
    }
}
