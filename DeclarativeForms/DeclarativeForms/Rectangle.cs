using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПрямоугольник", "DfRectangle")]
    public class DfRectangle : AutoContext<DfRectangle>
    {
        public DfRectangle(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            X = p1;
            Y = p2;
            Width = p3;
            Height = p4;
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

        private IValue width;
        [ContextProperty("Ширина", "Width")]
        public IValue Width
        {
            get { return width; }
            set { width = value; }
        }
    }
}
