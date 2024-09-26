using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфШрифт", "DfFont")]
    public class DfFont : AutoContext<DfFont>
    {
        public DfFont(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6)
        {
            FontStyle = p1;
            FontVariant = p2;
            FontWeight = p3;
            FontSize = p4;
            LineHeight = p5;
            FontFamily = p6;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue fontVariant;
        [ContextProperty("ВариантШрифта", "FontVariant")]
        public IValue FontVariant
        {
            get { return fontVariant; }
            set { fontVariant = value; }
        }

        private IValue lineHeight;
        [ContextProperty("ВысотаСтроки", "LineHeight")]
        public IValue LineHeight
        {
            get { return lineHeight; }
            set { lineHeight = value; }
        }

        private IValue fontWeight;
        [ContextProperty("ЖирностьШрифта", "FontWeight")]
        public IValue FontWeight
        {
            get { return fontWeight; }
            set { fontWeight = value; }
        }

        private IValue fontSize;
        [ContextProperty("РазмерШрифта", "FontSize")]
        public IValue FontSize
        {
            get { return fontSize; }
            set { fontSize = value; }
        }

        private IValue fontFamily;
        [ContextProperty("СемействоШрифтов", "FontFamily")]
        public IValue FontFamily
        {
            get { return fontFamily; }
            set { fontFamily = value; }
        }

        private IValue fontStyle;
        [ContextProperty("СтильШрифта", "FontStyle")]
        public IValue FontStyle
        {
            get { return fontStyle; }
            set { fontStyle = value; }
        }
    }
}
