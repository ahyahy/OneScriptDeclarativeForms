using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфЛеваяГраница", "DfBorderLeft")]
    public class DfBorderLeft : AutoContext<DfBorderLeft>
    {
        public DfBorderLeft(IValue p1, IValue p2, IValue p3)
        {
            borderLeftWidth = p1;
            BorderLeftStyle = p2;
            BorderLeftColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderLeftStyle;
        [ContextProperty("СтильЛевойГраницы", "BorderLeftStyle")]
        public IValue BorderLeftStyle
        {
            get { return borderLeftStyle; }
            set { borderLeftStyle = value; }
        }

        private IValue borderLeftColor;
        [ContextProperty("ЦветЛевойГраницы", "BorderLeftColor")]
        public IValue BorderLeftColor
        {
            get { return borderLeftColor; }
            set { borderLeftColor = value; }
        }

        private IValue borderLeftWidth;
        [ContextProperty("ШиринаЛевойГраницы", "BorderLeftWidth")]
        public IValue BorderLeftWidth
        {
            get { return borderLeftWidth; }
            set { borderLeftWidth = value; }
        }
    }
}
