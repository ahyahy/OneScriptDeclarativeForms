using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПраваяГраница", "DfBorderRight")]
    public class DfBorderRight : AutoContext<DfBorderRight>
    {
        public DfBorderRight(IValue p1, IValue p2, IValue p3)
        {
            BorderRightWidth = p1;
            BorderRightStyle = p2;
            BorderRightColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderRightStyle;
        [ContextProperty("СтильПравойГраницы", "BorderRightStyle")]
        public IValue BorderRightStyle
        {
            get { return borderRightStyle; }
            set { borderRightStyle = value; }
        }

        private IValue borderRightColor;
        [ContextProperty("ЦветПравойГраницы", "BorderRightColor")]
        public IValue BorderRightColor
        {
            get { return borderRightColor; }
            set { borderRightColor = value; }
        }

        private IValue borderRightWidth;
        [ContextProperty("ШиринаПравойГраницы", "BorderRightWidth")]
        public IValue BorderRightWidth
        {
            get { return borderRightWidth; }
            set { borderRightWidth = value; }
        }
    }
}
