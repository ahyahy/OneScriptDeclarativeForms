using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфОтступ", "DfMargin")]
    public class DfMargin : AutoContext<DfMargin>
    {

        public DfMargin(int p1, int p2, int p3, int p4, bool p5)
        {
            MarginTop = p1;
            MarginRight = p2;
            MarginBottom = p3;
            MarginLeft = p4;
            Auto = p5;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private bool auto;
        [ContextProperty("Авто", "Auto")]
        public bool Auto
        {
            get { return auto; }
            set { auto = value; }
        }

        private int marginTop;
        [ContextProperty("ОтступСверху", "MarginTop")]
        public int MarginTop
        {
            get { return marginTop; }
            set { marginTop = value; }
        }

        private int marginLeft;
        [ContextProperty("ОтступСлева", "MarginLeft")]
        public int MarginLeft
        {
            get { return marginLeft; }
            set { marginLeft = value; }
        }

        private int marginBottom;
        [ContextProperty("ОтступСнизу", "MarginBottom")]
        public int MarginBottom
        {
            get { return marginBottom; }
            set { marginBottom = value; }
        }

        private int marginRight;
        [ContextProperty("ОтступСправа", "MarginRight")]
        public int MarginRight
        {
            get { return marginRight; }
            set { marginRight = value; }
        }
    }
}
