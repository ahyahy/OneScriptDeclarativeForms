using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфФон", "DfBackground")]
    public class DfBackground : AutoContext<DfBackground>
    {
        public DfBackground(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8)
        {
            BackgroundColor = p1;
            BackgroundImage = p2;
            BackgroundRepeat = p3;
            BackgroundPosition = p4;
            BackgroundOrigin = p5;
            BackgroundClip = p6;
            BackgroundSize = p7;
            BackgroundAttachment = p8;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue backgroundColor;
        [ContextProperty("ЦветФона", "BackgroundColor")]
        public IValue BackgroundColor
        {
            get { return backgroundColor; }
            set { backgroundColor = value; }
        }

        private IValue backgroundImage;
        [ContextProperty("ФоновоеИзображение", "BackgroundImage")]
        public IValue BackgroundImage
        {
            get { return backgroundImage; }
            set { backgroundImage = value; }
        }

        private IValue backgroundRepeat;
        [ContextProperty("МозаикаКартинки", "BackgroundRepeat")]
        public IValue BackgroundRepeat
        {
            get { return backgroundRepeat; }
            set { backgroundRepeat = value; }
        }

        private IValue backgroundPosition;
        [ContextProperty("ПоложениеКартинки", "BackgroundPosition")]
        public IValue BackgroundPosition
        {
            get { return backgroundPosition; }
            set { backgroundPosition = value; }
        }

        private IValue backgroundOrigin;
        [ContextProperty("ОбластьКартинки", "BackgroundOrigin")]
        public IValue BackgroundOrigin
        {
            get { return backgroundOrigin; }
            set { backgroundOrigin = value; }
        }

        private IValue backgroundClip;
        [ContextProperty("ОбластьРисования", "BackgroundClip")]
        public IValue BackgroundClip
        {
            get { return backgroundClip; }
            set { backgroundClip = value; }
        }

        private IValue backgroundSize;
        [ContextProperty("РазмерКартинки", "BackgroundSize")]
        public IValue BackgroundSize
        {
            get { return backgroundSize; }
            set { backgroundSize = value; }
        }

        private IValue backgroundAttachment;
        [ContextProperty("ФоновоеВложение", "BackgroundAttachment")]
        public IValue BackgroundAttachment
        {
            get { return backgroundAttachment; }
            set { backgroundAttachment = value; }
        }
    }
}
