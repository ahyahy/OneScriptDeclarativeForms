using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфСтильГраниц", "DfBordersStyle")]
    public class DfBordersStyle : AutoContext<DfBordersStyle>
    {
        public DfBordersStyle(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            BorderTopStyle = p1;
            BorderRightStyle = p2;
            BorderBottomStyle = p3;
            BorderLeftStyle = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderTopStyle;
        [ContextProperty("СтильВерхнейГраницы", "BorderTopStyle")]
        public IValue BorderTopStyle
        {
            get { return borderTopStyle; }
            set { borderTopStyle = value; }
        }

        private IValue borderLeftStyle;
        [ContextProperty("СтильЛевойГраницы", "BorderLeftStyle")]
        public IValue BorderLeftStyle
        {
            get { return borderLeftStyle; }
            set { borderLeftStyle = value; }
        }

        private IValue borderBottomStyle;
        [ContextProperty("СтильНижнейГраницы", "BorderBottomStyle")]
        public IValue BorderBottomStyle
        {
            get { return borderBottomStyle; }
            set { borderBottomStyle = value; }
        }

        private IValue borderRightStyle;
        [ContextProperty("СтильПравойГраницы", "BorderRightStyle")]
        public IValue BorderRightStyle
        {
            get { return borderRightStyle; }
            set { borderRightStyle = value; }
        }
    }
}
