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

        public bool _checked { get; set; }
        [ContextProperty("Помечен", "Checked")]
        public bool Checked
        {
            get { return _checked; }
            set { _checked = value; }
        }

        public IValue listItem { get; set; }
        [ContextProperty("ЭлементыСписка", "ListItem")]
        public ArrayImpl ListItem
        {
            get { return (ArrayImpl)listItem; }
            set { listItem = ValueFactory.Create(value); }
        }

        public IValue files { get; set; }
        [ContextProperty("Файлы", "Files")]
        public ArrayImpl Files
        {
            get { return (ArrayImpl)files; }
            set { files = ValueFactory.Create(value); }
        }

        public IValue windowHeight { get; set; }
        [ContextProperty("ВысотаОкна", "WindowHeight")]
        public int WindowHeight
        {
            get { return Convert.ToInt32(windowHeight.AsNumber()); }
            set { windowHeight = ValueFactory.Create(value); }
        }

        public IValue windowWidth { get; set; }
        [ContextProperty("ШиринаОкна", "WindowWidth")]
        public int WindowWidth
        {
            get { return Convert.ToInt32(windowWidth.AsNumber()); }
            set { windowWidth = ValueFactory.Create(value); }
        }
		
        public IValue scrolledValue { get; set; }
        [ContextProperty("Прокручено", "ScrolledValue")]
        public int ScrolledValue
        {
            get { return Convert.ToInt32(scrolledValue.AsNumber()); }
            set { scrolledValue = ValueFactory.Create(value); }
        }

        public IValue screenX { get; set; }
        [ContextProperty("ИксЭкрана", "ScreenX")]
        public int ScreenX
        {
            get { return Convert.ToInt32(screenX.AsNumber()); }
            set { screenX = ValueFactory.Create(value); }
        }

        public IValue screenY { get; set; }
        [ContextProperty("ИгрекЭкрана", "ScreenY")]
        public int ScreenY
        {
            get { return Convert.ToInt32(screenY.AsNumber()); }
            set { screenY = ValueFactory.Create(value); }
        }

        public IValue offsetX { get; set; }
        [ContextProperty("ИксСмещение", "OffsetX")]
        public int OffsetX
        {
            get { return Convert.ToInt32(offsetX.AsNumber()); }
            set { offsetX = ValueFactory.Create(value); }
        }

        public IValue offsetY { get; set; }
        [ContextProperty("ИгрекСмещение", "OffsetY")]
        public int OffsetY
        {
            get { return Convert.ToInt32(offsetY.AsNumber()); }
            set { offsetY = ValueFactory.Create(value); }
        }

        public IValue pageX { get; set; }
        [ContextProperty("ИксФормы", "PageX")]
        public int PageX
        {
            get { return Convert.ToInt32(pageX.AsNumber()); }
            set { pageX = ValueFactory.Create(value); }
        }

        public IValue pageY { get; set; }
        [ContextProperty("ИгрекФормы", "PageY")]
        public int PageY
        {
            get { return Convert.ToInt32(pageY.AsNumber()); }
            set { pageY = ValueFactory.Create(value); }
        }

        public IValue movementX { get; set; }
        [ContextProperty("СдвигИкс", "MovementX")]
        public int MovementX
        {
            get { return Convert.ToInt32(movementX.AsNumber()); }
            set { movementX = ValueFactory.Create(value); }
        }

        public IValue movementY { get; set; }
        [ContextProperty("СдвигИгрек", "MovementY")]
        public int MovementY
        {
            get { return Convert.ToInt32(movementY.AsNumber()); }
            set { movementY = ValueFactory.Create(value); }
        }

        public IValue y { get; set; }
        [ContextProperty("Игрек", "Y")]
        public int Y
        {
            get { return Convert.ToInt32(y.AsNumber()); }
            set { y = ValueFactory.Create(value); }
        }

        public IValue x { get; set; }
        [ContextProperty("Икс", "X")]
        public int X
        {
            get { return Convert.ToInt32(x.AsNumber()); }
            set { x = ValueFactory.Create(value); }
        }

        public string button { get; set; }
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

        private IValue _value { get; set; } = null;
        [ContextProperty("Значение", "Value")]
        public IValue Value
        {
            get { return _value; }
            set { _value = value; }
        }
    }
}
