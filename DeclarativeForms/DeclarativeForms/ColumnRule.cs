using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфРазделительКолонок", "DfColumnRule")]
    public class DfColumnRule : AutoContext<DfColumnRule>
    {
        public DfColumnRule(IValue p1, IValue p2, IValue p3)
        {
            ColumnRuleWidth = p1;
            ColumnRuleStyle = p2;
            ColumnRuleColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue columnRuleWidth;
        [ContextProperty("ШиринаРазделителяКолонок", "ColumnRuleWidth")]
        public IValue ColumnRuleWidth
        {
            get { return columnRuleWidth; }
            set { columnRuleWidth = value; }
        }

        private IValue columnRuleStyle;
        [ContextProperty("СтильРазделителяКолонок", "ColumnRuleStyle")]
        public IValue ColumnRuleStyle
        {
            get { return columnRuleStyle; }
            set { columnRuleStyle = value; }
        }

        private IValue columnRuleColor;
        [ContextProperty("ЦветРазделителяКолонок", "ColumnRuleColor")]
        public IValue ColumnRuleColor
        {
            get { return columnRuleColor; }
            set { columnRuleColor = value; }
        }
    }
}
