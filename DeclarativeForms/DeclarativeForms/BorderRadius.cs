using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфРадиусГраницы", "DfBorderRadius")]
    public class DfBorderRadius : AutoContext<DfBorderRadius>
    {
        public DfBorderRadius(int p1, int p2, int p3, int p4)
        {
            BorderTopLeftRadius = p1;
            BorderTopRightRadius = p2;
            BorderBottomRightRadius = p3;
            BorderBottomLeftRadius = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private int borderTopLeftRadius;
        [ContextProperty("ЛевыйРадиусВерхнейГраницы", "BorderTopLeftRadius")]
        public int BorderTopLeftRadius
        {
            get { return borderTopLeftRadius; }
            set { borderTopLeftRadius = value; }
        }

        private int borderBottomLeftRadius;
        [ContextProperty("ЛевыйРадиусНижнейГраницы", "BorderBottomLeftRadius")]
        public int BorderBottomLeftRadius
        {
            get { return borderBottomLeftRadius; }
            set { borderBottomLeftRadius = value; }
        }

        private int borderTopRightRadius;
        [ContextProperty("ПравыйРадиусВерхнейГраницы", "BorderTopRightRadius")]
        public int BorderTopRightRadius
        {
            get { return borderTopRightRadius; }
            set { borderTopRightRadius = value; }
        }

        private int borderBottomRightRadius;
        [ContextProperty("ПравыйРадиусНижнейГраницы", "BorderBottomRightRadius")]
        public int BorderBottomRightRadius
        {
            get { return borderBottomRightRadius; }
            set { borderBottomRightRadius = value; }
        }
    }
}
