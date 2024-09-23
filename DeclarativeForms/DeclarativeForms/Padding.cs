using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфЗаполнение", "DfPadding")]
    public class DfPadding : AutoContext<DfPadding>
    {
        public DfPadding(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            PaddingTop = p1;
            PaddingRight = p2;
            PaddingBottom = p3;
            PaddingLeft = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue paddingTop;
        [ContextProperty("ЗаполнениеСверху", "PaddingTop")]
        public IValue PaddingTop
        {
            get { return paddingTop; }
            set { paddingTop = value; }
        }

        private IValue paddingLeft;
        [ContextProperty("ЗаполнениеСлева", "PaddingLeft")]
        public IValue PaddingLeft
        {
            get { return paddingLeft; }
            set { paddingLeft = value; }
        }

        private IValue paddingBottom;
        [ContextProperty("ЗаполнениеСнизу", "PaddingBottom")]
        public IValue PaddingBottom
        {
            get { return paddingBottom; }
            set { paddingBottom = value; }
        }

        private IValue paddingRight;
        [ContextProperty("ЗаполнениеСправа", "PaddingRight")]
        public IValue PaddingRight
        {
            get { return paddingRight; }
            set { paddingRight = value; }
        }
    }
}
