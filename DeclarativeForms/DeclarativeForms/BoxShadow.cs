using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфТень", "DfBoxShadow")]
    public class DfBoxShadow : AutoContext<DfBoxShadow>
    {
        public DfBoxShadow(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, bool p6)
        {
            X = p1;
            Y = p2;
            Blur = p3;
            Spread = p4;
            Color = p5;
            Inset = p6;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue spread;
        [ContextProperty("Величина", "Spread")]
        public IValue Spread
        {
            get { return spread; }
            set { spread = value; }
        }

        private bool inset;
        [ContextProperty("Внутренняя", "Inset")]
        public bool Inset
        {
            get { return inset; }
            set { inset = value; }
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

        private IValue blur;
        [ContextProperty("Размытие", "Blur")]
        public IValue Blur
        {
            get { return blur; }
            set { blur = value; }
        }

        private IValue color;
        [ContextProperty("Цвет", "Color")]
        public IValue Color
        {
            get { return color; }
            set { color = value; }
        }
    }
}
