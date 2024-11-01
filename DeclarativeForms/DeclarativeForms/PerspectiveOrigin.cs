using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфИсточникПерспективы", "DfPerspectiveOrigin")]
    public class DfPerspectiveOrigin : AutoContext<DfPerspectiveOrigin>
    {
        public DfPerspectiveOrigin(IValue p1, IValue p2)
        {
            X = p1;
            Y = p2;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue y;
        [ContextProperty("Игрек", "Y")]
        public IValue Y
        {
            get { return y; }
            set { y = value; }
        }

        private IValue x;
        [ContextProperty("Икс", "X")]
        public IValue X
        {
            get { return x; }
            set { x = value; }
        }
    }
}
