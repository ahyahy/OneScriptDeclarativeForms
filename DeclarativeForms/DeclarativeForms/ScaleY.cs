using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфМасштабИгрек", "DfScaleY")]
    public class DfScaleY : AutoContext<DfScaleY>
    {
        public DfScaleY(IValue p1)
        {
            Y = p1;
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
    }
}
