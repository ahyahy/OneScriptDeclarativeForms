using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфСтильСписка", "DfListStyle")]
    public class DfListStyle : AutoContext<DfListStyle>
    {
        public DfListStyle(IValue p1, IValue p2, IValue p3)
        {
            ListStyleType = p1;
            ListStylePosition = p2;
            ListStyleImage = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue listStyleImage;
        [ContextProperty("КартинкаСтиляСписка", "ListStyleImage")]
        public IValue ListStyleImage
        {
            get { return listStyleImage; }
            set { listStyleImage = value; }
        }

        private IValue listStylePosition;
        [ContextProperty("ПозицияСтиляСписка", "ListStylePosition")]
        public IValue ListStylePosition
        {
            get { return listStylePosition; }
            set { listStylePosition = value; }
        }

        private IValue listStyleType;
        [ContextProperty("ТипСтиляСписка", "ListStyleType")]
        public IValue ListStyleType
        {
            get { return listStyleType; }
            set { listStyleType = value; }
        }
    }
}
