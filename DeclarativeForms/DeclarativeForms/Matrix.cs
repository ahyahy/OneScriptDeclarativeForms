using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфМатрица", "DfMatrix")]
    public class DfMatrix : AutoContext<DfMatrix>
    {
        public DfMatrix(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6)
        {
            ScaleX = p1;
            OffsetY = p2;
            TransformX = p3;
            ScaleY = p4;
            OffsetX = p5;
            OffsetY = p6;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue scaleY;
        [ContextProperty("МасштабИгрек", "ScaleY")]
        public IValue ScaleY
        {
            get { return scaleY; }
            set { scaleY = value; }
        }

        private IValue scaleX;
        [ContextProperty("МасштабИкс", "ScaleX")]
        public IValue ScaleX
        {
            get { return scaleX; }
            set { scaleX = value; }
        }

        private IValue transformY;
        [ContextProperty("СдвигИгрек", "TransformY")]
        public IValue TransformY
        {
            get { return transformY; }
            set { transformY = value; }
        }

        private IValue transformX;
        [ContextProperty("СдвигИкс", "TransformX")]
        public IValue TransformX
        {
            get { return transformX; }
            set { transformX = value; }
        }

        private IValue offsetY;
        [ContextProperty("СмещениеИгрек", "OffsetY")]
        public IValue OffsetY
        {
            get { return offsetY; }
            set { offsetY = value; }
        }

        private IValue offsetX;
        [ContextProperty("СмещениеИкс", "OffsetX")]
        public IValue OffsetX
        {
            get { return offsetX; }
            set { offsetX = value; }
        }
    }
}
