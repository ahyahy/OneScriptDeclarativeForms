using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПоворот3Д", "DfRotate3D")]
    public class DfRotate3D : AutoContext<DfRotate3D>
    {
        public DfRotate3D(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            X = p1;
            Y = p2;
            Z = p3;
            Angle = p4;
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

        private IValue angle;
        [ContextProperty("Угол", "Angle")]
        public IValue Angle
        {
            get { return angle; }
            set { angle = value; }
        }
    }
}
