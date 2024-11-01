using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфСвойстваАнимации", "DfAnimationProperties")]
    public class DfAnimationProperties : AutoContext<DfAnimationProperties>
    {
        public DfAnimationProperties(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8)
        {
            AnimationName = p1;
            AnimationDuration = p2;
            AnimationTimingFunction = p3;
            AnimationDelay = p4;
            AnimationIterationCount = p5;
            AnimationDirection = p6;
            AnimationFillMode = p7;
            AnimationPlayState = p8;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        private IValue animationDuration;
        [ContextProperty("ДлительностьАнимации", "AnimationDuration")]
        public IValue AnimationDuration
        {
            get { return animationDuration; }
            set { animationDuration = value; }
        }

        private IValue animationDelay;
        [ContextProperty("ЗадержкаАнимации", "AnimationDelay")]
        public IValue AnimationDelay
        {
            get { return animationDelay; }
            set { animationDelay = value; }
        }

        private IValue animationFillMode;
        [ContextProperty("ЗаливкаАнимации", "AnimationFillMode")]
        public IValue AnimationFillMode
        {
            get { return animationFillMode; }
            set { animationFillMode = value; }
        }

        private IValue animationName;
        [ContextProperty("ИмяАнимации", "AnimationName")]
        public IValue AnimationName
        {
            get { return animationName; }
            set { animationName = value; }
        }

        private IValue animationIterationCount;
        [ContextProperty("КоличествоПовторов", "AnimationIterationCount")]
        public IValue AnimationIterationCount
        {
            get { return animationIterationCount; }
            set { animationIterationCount = value; }
        }

        private IValue animationDirection;
        [ContextProperty("НаправлениеАнимации", "AnimationDirection")]
        public IValue AnimationDirection
        {
            get { return animationDirection; }
            set { animationDirection = value; }
        }

        private IValue animationPlayState;
        [ContextProperty("Состояние", "AnimationPlayState")]
        public IValue AnimationPlayState
        {
            get { return animationPlayState; }
            set { animationPlayState = value; }
        }

        private IValue animationTimingFunction;
        [ContextProperty("ФункцияСинхронизации", "AnimationTimingFunction")]
        public IValue AnimationTimingFunction
        {
            get { return animationTimingFunction; }
            set { animationTimingFunction = value; }
        }
    }
}
