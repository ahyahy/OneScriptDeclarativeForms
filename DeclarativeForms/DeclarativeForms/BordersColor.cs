using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфЦветГраниц", "DfBordersColor")]
    public class DfBordersColor : AutoContext<DfBordersColor>
    {
        public DfBordersColor(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            BorderTopColor = p1;
            BorderRightColor = p2;
            BorderBottomColor = p3;
            BorderLeftColor = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderTopColor;
        [ContextProperty("ЦветВерхнейГраницы", "BorderTopColor")]
        public IValue BorderTopColor
        {
            get { return borderTopColor; }
            set { borderTopColor = value; }
        }

        private IValue borderLeftColor;
        [ContextProperty("ЦветЛевойГраницы", "BorderLeftColor")]
        public IValue BorderLeftColor
        {
            get { return borderLeftColor; }
            set { borderLeftColor = value; }
        }

        private IValue borderBottomColor;
        [ContextProperty("ЦветНижнейГраницы", "BorderBottomColor")]
        public IValue BorderBottomColor
        {
            get { return borderBottomColor; }
            set { borderBottomColor = value; }
        }

        private IValue borderRightColor;
        [ContextProperty("ЦветПравойГраницы", "BorderRightColor")]
        public IValue BorderRightColor
        {
            get { return borderRightColor; }
            set { borderRightColor = value; }
        }
    }
}
