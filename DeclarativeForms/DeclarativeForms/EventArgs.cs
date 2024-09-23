using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osdf
{
    [ContextClass("ДфАргументыСобытия", "DfEventArgs")]
    public class DfEventArgs : AutoContext<DfEventArgs>
    {
        public DfEventArgs()
        {
        }

        public IValue y;
        [ContextProperty("Игрек", "Y")]
        public decimal Y
        {
            get { return y.AsNumber(); }
            set { y = ValueFactory.Create(value); }
        }

        public IValue x;
        [ContextProperty("Икс", "X")]
        public decimal X
        {
            get { return x.AsNumber(); }
            set { x = ValueFactory.Create(value); }
        }

        public string button;
        [ContextProperty("Кнопка", "Button")]
        public string Button
        {
            get { return button; }
            set { button = value; }
        }

        private IValue sender = null;
        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender
        {
            get { return sender; }
            set { sender = value; }
        }

        private IValue parameter = null;
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter
        {
            get { return parameter; }
            set { parameter = value; }
        }

        private IValue _value = null;
        [ContextProperty("Значение", "Value")]
        public IValue Value
        {
            get { return _value; }
            set { _value = value; }
        }
    }
}
