using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    public class DfBalloon : AutoContext<DfBalloon>
    {
        public DfBalloon()
        {
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        public string TimeMessage { get; set; }

        public string HeaderColor { get; set; }

        public string HeaderTextColor { get; set; }

        public string TextColor { get; set; }

        public string FontStyle { get; set; }

        public string FontVariant { get; set; }

        public string FontWeight { get; set; }

        public string fontSize;
        public IValue FontSize
        {
            get { return ValueFactory.Create(fontSize); }
            set
            {
                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    fontSize = value.AsString();
                }
                else
                {
                    fontSize = value.AsNumber().ToString().Replace(",", ".") + "px";
                }
            }
        }

        public string lineHeight;
        [ContextProperty("ВысотаСтроки", "LineHeight")]
        public IValue LineHeight
        {
            get { return ValueFactory.Create(lineHeight); }
            set
            {
                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    lineHeight = value.AsString();
                }
                else
                {
                    lineHeight = value.AsNumber().ToString();
                }
            }
        }

        public string FontFamily { get; set; }

        public string BackgroundColor { get; set; }

        public string MessageKey { get; set; }

        private string itemKey;
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        public int Width { get; set; }

        public int Height { get; set; }

        public string Title { get; set; }

        public string Text { get; set; }

        public int Interval { get; set; }
    }
}
