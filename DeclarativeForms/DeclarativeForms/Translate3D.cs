using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПеревод3Д", "DfTranslate3D")]
    public class DfTranslate3D : AutoContext<DfTranslate3D>
    {
        public DfTranslate3D(IValue p1, IValue p2, IValue p3)
        {
            X = p1;
            Y = p2;
            Z = p3;
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
