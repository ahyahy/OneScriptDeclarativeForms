using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System;

namespace osdf
{
    [ContextClass("ДфАргументыСобытия", "DfEventArgs")]
    public class DfEventArgs : AutoContext<DfEventArgs>
    {
        public DfEventArgs()
        {
        }
		
        public bool _checked;
        [ContextProperty("Помечен", "Checked")]
        public bool Checked
        {
            get { return _checked; }
            set { _checked = value; }
        }
		
        public IValue listItem;
        [ContextProperty("ЭлементыСписка", "ListItem")]
        public ArrayImpl ListItem
        {
            get { return (ArrayImpl)listItem; }
            set { listItem = ValueFactory.Create(value); }
        }
		
        public IValue files;
        [ContextProperty("Файлы", "Files")]
        public ArrayImpl Files
        {
            get { return (ArrayImpl)files; }
            set { files = ValueFactory.Create(value); }
        }

        public IValue height;
        [ContextProperty("ВысотаОкна", "WindowHeight")]
        public int WindowHeight
        {
            get { return Convert.ToInt32(height.AsNumber()); }
            set { height = ValueFactory.Create(value); }
        }

        public IValue windowWidth;
        [ContextProperty("ШиринаОкна", "WindowWidth")]
        public int WindowWidth
        {
            get { return Convert.ToInt32(windowWidth.AsNumber()); }
            set { windowWidth = ValueFactory.Create(value); }
        }

        public IValue y;
        [ContextProperty("Игрек", "Y")]
        public int Y
        {
            get { return Convert.ToInt32(y.AsNumber()); }
            set { y = ValueFactory.Create(value); }
        }

        public IValue x;
        [ContextProperty("Икс", "X")]
        public int X
        {
            get { return Convert.ToInt32(x.AsNumber()); }
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
