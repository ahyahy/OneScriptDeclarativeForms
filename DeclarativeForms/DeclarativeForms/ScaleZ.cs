using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфМасштабЗет", "DfScaleZ")]
    public class DfScaleZ : AutoContext<DfScaleZ>
    {
        public DfScaleZ(IValue p1)
        {
            Z = p1;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue z;
        [ContextProperty("Зет", "Z")]
        public IValue Z
        {
            get { return z; }
            set { z = value; }
        }
    }
}
