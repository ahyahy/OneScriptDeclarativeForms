using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПереводИкс", "DfTranslateX")]
    public class DfTranslateX : AutoContext<DfTranslateX>
    {
        public DfTranslateX(IValue p1)
        {
            X = p1;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
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
