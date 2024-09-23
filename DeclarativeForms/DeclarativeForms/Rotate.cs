using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПоворот", "DfRotate")]
    public class DfRotate : AutoContext<DfRotate>
    {
        public DfRotate(IValue p1)
        {
            Angle = p1;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue angle;
        [ContextProperty("Угол", "Angle")]
        public IValue Angle
        {
            get { return angle; }
            set { angle = value; }
        }
    }
}
