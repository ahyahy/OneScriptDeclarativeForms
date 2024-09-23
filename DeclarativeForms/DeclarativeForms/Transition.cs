using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфПереход", "DfTransition")]
    public class DfTransition : AutoContext<DfTransition>
    {
        public DfTransition(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            TransitionProperty = p1;
            TransitionDuration = p2;
            TransitionTimingFunction = p3;
            TransitionDelay = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue transitionDuration;
        [ContextProperty("ВремяПерехода", "TransitionDuration")]
        public IValue TransitionDuration
        {
            get { return transitionDuration; }
            set { transitionDuration = value; }
        }

        private IValue transitionDelay;
        [ContextProperty("ЗадержкаПерехода", "TransitionDelay")]
        public IValue TransitionDelay
        {
            get { return transitionDelay; }
            set { transitionDelay = value; }
        }

        private IValue transitionProperty;
        [ContextProperty("СвойствоПерехода", "TransitionProperty")]
        public IValue TransitionProperty
        {
            get { return transitionProperty; }
            set { transitionProperty = value; }
        }

        private IValue transitionTimingFunction;
        [ContextProperty("ФункцияПерехода", "TransitionTimingFunction")]
        public IValue TransitionTimingFunction
        {
            get { return transitionTimingFunction; }
            set { transitionTimingFunction = value; }
        }
    }
}
