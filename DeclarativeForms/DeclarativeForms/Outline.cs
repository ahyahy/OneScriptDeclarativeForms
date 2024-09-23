using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфКонтур", "DfOutline")]
    public class DfOutline : AutoContext<DfOutline>
    {
        public DfOutline(IValue p1, IValue p2, IValue p3)
        {
            OutlineWidth = p1;
            OutlineStyle = p2;
            OutlineColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue outlineStyle;
        [ContextProperty("СтильКонтура", "OutlineStyle")]
        public IValue OutlineStyle
        {
            get { return outlineStyle; }
            set { outlineStyle = value; }
        }

        private IValue outlineColor;
        [ContextProperty("ЦветКонтура", "OutlineColor")]
        public IValue OutlineColor
        {
            get { return outlineColor; }
            set { outlineColor = value; }
        }

        private IValue outlineWidth;
        [ContextProperty("ШиринаКонтура", "OutlineWidth")]
        public IValue OutlineWidth
        {
            get { return outlineWidth; }
            set { outlineWidth = value; }
        }
    }
}
