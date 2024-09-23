using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфГраницы", "DfBorders")]
    public class DfBorders : AutoContext<DfBorders>
    {
        public DfBorders(IValue p1, IValue p2, IValue p3)
        {
            BorderWidth = p1;
            BorderStyle = p2;
            BorderColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderStyle;
        [ContextProperty("СтильГраницы", "BorderStyle")]
        public IValue BorderStyle
        {
            get { return borderStyle; }
            set { borderStyle = value; }
        }

        private IValue borderColor;
        [ContextProperty("ЦветГраницы", "BorderColor")]
        public IValue BorderColor
        {
            get { return borderColor; }
            set { borderColor = value; }
        }

        private IValue borderWidth;
        [ContextProperty("ШиринаГраницы", "BorderWidth")]
        public IValue BorderWidth
        {
            get { return borderWidth; }
            set { borderWidth = value; }
        }
    }
}
