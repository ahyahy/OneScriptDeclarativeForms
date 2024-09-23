using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфКартинкаГраницы", "DfBorderImage")]
    public class DfBorderImage : AutoContext<DfBorderImage>
    {
        public DfBorderImage(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5)
        {
            BorderImageSource = p1;
            BorderImageSlice = p2;
            BorderImageWidth = p3;
            BorderImageOutset = p4;
            BorderImageRepeat = p5;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderImageSource;
        [ContextProperty("ИсточникКартинкиГраницы", "BorderImageSource")]
        public IValue BorderImageSource
        {
            get { return borderImageSource; }
            set { borderImageSource = value; }
        }

        private IValue borderImageRepeat;
        [ContextProperty("МозаикаКартинкиГраницы", "BorderImageRepeat")]
        public IValue BorderImageRepeat
        {
            get { return borderImageRepeat; }
            set { borderImageRepeat = value; }
        }

        private IValue borderImageSlice;
        [ContextProperty("НарезкаКартинкиГраницы", "BorderImageSlice")]
        public IValue BorderImageSlice
        {
            get { return borderImageSlice; }
            set { borderImageSlice = value; }
        }

        private IValue borderImageOutset;
        [ContextProperty("СмещениеКартинкиГраницы", "BorderImageOutset")]
        public IValue BorderImageOutset
        {
            get { return borderImageOutset; }
            set { borderImageOutset = value; }
        }

        private IValue borderImageWidth;
        [ContextProperty("ШиринаКартинкиГраницы", "BorderImageWidth")]
        public IValue BorderImageWidth
        {
            get { return borderImageWidth; }
            set { borderImageWidth = value; }
        }
    }
}
