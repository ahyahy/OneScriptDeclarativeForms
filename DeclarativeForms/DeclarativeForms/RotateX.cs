using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПоворотИкс", "DfRotateX")]
    public class DfRotateX : AutoContext<DfRotateX>
    {
        public DfRotateX(IValue p1)
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
