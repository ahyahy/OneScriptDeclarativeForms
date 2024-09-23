using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфКолонкиЭлемента", "DfColumns")]
    public class DfColumns : AutoContext<DfColumns>
    {
        public DfColumns(IValue p1, IValue p2)
        {
            ColumnWidth = p1;
            ColumnCount = p2;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue columnCount;
        [ContextProperty("КоличествоКолонок", "ColumnCount")]
        public IValue ColumnCount
        {
            get { return columnCount; }
            set { columnCount = value; }
        }

        private IValue columnWidth;
        [ContextProperty("ШиринаКолонок", "ColumnWidth")]
        public IValue ColumnWidth
        {
            get { return columnWidth; }
            set { columnWidth = value; }
        }
    }
}
