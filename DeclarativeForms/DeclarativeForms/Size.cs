using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфРазмер", "DfSize")]
    public class DfSize : AutoContext<DfSize>
    {
        public DfSize(IValue p1, IValue p2)
        {
            Width = p1;
            Height = p2;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue height;
        [ContextProperty("Высота", "Height")]
        public IValue Height
        {
            get { return height; }
            set { height = value; }
        }

        private IValue width;
        [ContextProperty("Ширина", "Width")]
        public IValue Width
        {
            get { return width; }
            set { width = value; }
        }
    }
}
