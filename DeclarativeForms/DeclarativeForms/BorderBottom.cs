using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфНижняяГраница", "DfBorderBottom")]
    public class DfBorderBottom : AutoContext<DfBorderBottom>
    {
        public DfBorderBottom(IValue p1, IValue p2, IValue p3)
        {
            BorderBottomWidth = p1;
            BorderBottomStyle = p2;
            BorderBottomColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderBottomStyle;
        [ContextProperty("СтильНижнейГраницы", "BorderBottomStyle")]
        public IValue BorderBottomStyle
        {
            get { return borderBottomStyle; }
            set { borderBottomStyle = value; }
        }

        private IValue borderBottomColor;
        [ContextProperty("ЦветНижнейГраницы", "BorderBottomColor")]
        public IValue BorderBottomColor
        {
            get { return borderBottomColor; }
            set { borderBottomColor = value; }
        }

        private IValue borderBottomWidth;
        [ContextProperty("ШиринаНижнейГраницы", "BorderBottomWidth")]
        public IValue BorderBottomWidth
        {
            get { return borderBottomWidth; }
            set { borderBottomWidth = value; }
        }
    }
}
