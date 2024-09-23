using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфФильтрИзображений", "DfImagesFilter")]
    public class DfImagesFilter : AutoContext<DfImagesFilter>
    {
        public DfImagesFilter(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8, IValue p9, IValue p10)
        {
            Blur = p1;
            Brightness = p2;
            Contrast = p3;
            DropShadow = p4;
            Grayscale = p5;
            HueRotate = p6;
            Invert = p7;
            Opacity = p8;
            Saturate = p9;
            Sepia = p10;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue dropShadow;
        [ContextProperty("Тень", "DropShadow")]
        public IValue DropShadow
        {
            get { return dropShadow; }
            set { dropShadow = value; }
        }

        private IValue opacity;
        [ContextProperty("Непрозрачность", "Opacity")]
        public IValue Opacity
        {
            get { return opacity; }
            set { opacity = value; }
        }

        private IValue invert;
        [ContextProperty("Инверсия", "Invert")]
        public IValue Invert
        {
            get { return invert; }
            set { invert = value; }
        }

        private IValue contrast;
        [ContextProperty("Контраст", "Contrast")]
        public IValue Contrast
        {
            get { return contrast; }
            set { contrast = value; }
        }

        private IValue saturate;
        [ContextProperty("Насыщенность", "Saturate")]
        public IValue Saturate
        {
            get { return saturate; }
            set { saturate = value; }
        }

        private IValue grayscale;
        [ContextProperty("ОттенкиСерого", "Grayscale")]
        public IValue Grayscale
        {
            get { return grayscale; }
            set { grayscale = value; }
        }

        private IValue hueRotate;
        [ContextProperty("ПоворотОттенка", "HueRotate")]
        public IValue HueRotate
        {
            get { return hueRotate; }
            set { hueRotate = value; }
        }

        private IValue blur;
        [ContextProperty("Размытие", "Blur")]
        public IValue Blur
        {
            get { return blur; }
            set { blur = value; }
        }

        private IValue sepia;
        [ContextProperty("Ретро", "Sepia")]
        public IValue Sepia
        {
            get { return sepia; }
            set { sepia = value; }
        }

        private IValue brightness;
        [ContextProperty("Яркость", "Brightness")]
        public IValue Brightness
        {
            get { return brightness; }
            set { brightness = value; }
        }
    }
}
