using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПерспектива", "DfPerspective")]
    public class DfPerspective : AutoContext<DfPerspective>
    {
        public DfPerspective(IValue p1)
        {
            Ratio = p1;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue ratio;
        [ContextProperty("Множитель", "Ratio")]
        public IValue Ratio
        {
            get { return ratio; }
            set { ratio = value; }
        }
    }
}
