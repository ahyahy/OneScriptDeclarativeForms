using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфРадиусГраницы", "DfBorderRadius")]
    public class DfBorderRadius : AutoContext<DfBorderRadius>
    {
        public DfBorderRadius(IValue p1, IValue p2, IValue p3, IValue p4)
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

        private IValue borderTopLeftRadius;
        [ContextProperty("ЛевыйРадиусВерхнейГраницы", "BorderTopLeftRadius")]
        public IValue BorderTopLeftRadius
        {
            get { return borderTopLeftRadius; }
            set { borderTopLeftRadius = value; }
        }

        private IValue borderBottomLeftRadius;
        [ContextProperty("ЛевыйРадиусНижнейГраницы", "BorderBottomLeftRadius")]
        public IValue BorderBottomLeftRadius
        {
            get { return borderBottomLeftRadius; }
            set { borderBottomLeftRadius = value; }
        }

        private IValue borderTopRightRadius;
        [ContextProperty("ПравыйРадиусВерхнейГраницы", "BorderTopRightRadius")]
        public IValue BorderTopRightRadius
        {
            get { return borderTopRightRadius; }
            set { borderTopRightRadius = value; }
        }

        private IValue borderBottomRightRadius;
        [ContextProperty("ПравыйРадиусНижнейГраницы", "BorderBottomRightRadius")]
        public IValue BorderBottomRightRadius
        {
            get { return borderBottomRightRadius; }
            set { borderBottomRightRadius = value; }
        }
    }
}
