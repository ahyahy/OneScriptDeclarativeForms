using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osdf
{
    [ContextClass("ДфАргументы", "DfEventArgs")]
    public class DfEventArgs : AutoContext<DfEventArgs>
    {
        public DfEventArgs()
        {
        }

        private IValue parameter = null;
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter
        {
            get { return parameter; }
            set { parameter = value; }
        }

        private IValue sender = null;
        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender
        {
            get { return sender; }
            set { sender = value; }
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
    }
}
