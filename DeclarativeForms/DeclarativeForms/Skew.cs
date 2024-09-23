using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфНаклон", "DfSkew")]
    public class DfSkew : AutoContext<DfSkew>
    {
        public DfSkew(IValue p1, IValue p2)
        {
            AngleX = p1;
            AngleY = p2;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue angleY;
        [ContextProperty("УголИгрек", "AngleY")]
        public IValue AngleY
        {
            get { return angleY; }
            set { angleY = value; }
        }

        private IValue angleX;
        [ContextProperty("УголИкс", "AngleX")]
        public IValue AngleX
        {
            get { return angleX; }
            set { angleX = value; }
        }
    }
}
