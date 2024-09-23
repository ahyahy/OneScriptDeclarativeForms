using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфШиринаГраниц", "DfBordersWidth")]
    public class DfBordersWidth : AutoContext<DfBordersWidth>
    {
        public DfBordersWidth(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            BorderTopWidth = p1;
            BorderRightWidth = p2;
            BorderBottomWidth = p3;
            BorderLeftWidth = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderTopWidth;
        [ContextProperty("ШиринаВерхнейГраницы", "BorderTopWidth")]
        public IValue BorderTopWidth
        {
            get { return borderTopWidth; }
            set { borderTopWidth = value; }
        }

        private IValue borderLeftWidth;
        [ContextProperty("ШиринаЛевойГраницы", "BorderLeftWidth")]
        public IValue BorderLeftWidth
        {
            get { return borderLeftWidth; }
            set { borderLeftWidth = value; }
        }

        private IValue borderBottomWidth;
        [ContextProperty("ШиринаНижнейГраницы", "BorderBottomWidth")]
        public IValue BorderBottomWidth
        {
            get { return borderBottomWidth; }
            set { borderBottomWidth = value; }
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
