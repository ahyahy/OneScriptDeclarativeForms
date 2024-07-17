using System.IO;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osdf
{
    [ContextClass("ДфЭлемент", "DfElement")]
    public class DfElement : AutoContext<DfElement>
    {
        public DfElement(string p1)
        {
            string typeElement = DeclarativeForms.namesRusClass[p1];
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createElement(\u0022" + typeElement + "\u0022, \u0022" + Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfAction _dblclick;
        [ContextProperty("ДвойноеНажатие", "DoubleClick")]
        public DfAction DoubleClick
        {
            get { return _dblclick; }
            set
            {
                _dblclick = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "dblclick" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }
        [ContextProperty("dblclick", "dblclick")]
        public DfAction DoubleClick2
        {
            get { return _dblclick; }
            set
            {
                _dblclick = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "dblclick" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        public DfAction _mouseup;
        [ContextProperty("ПриОтпусканииМыши", "MouseUp")]
        public DfAction MouseUp
        {
            get { return _mouseup; }
            set
            {
                _mouseup = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "mouseup" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }
        [ContextProperty("mouseup", "mouseup")]
        public DfAction MouseUp2
        {
            get { return _mouseup; }
            set
            {
                _mouseup = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "mouseup" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string name;
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public DfAction _сlick;
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return _сlick; }
            set
            {
                _сlick = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "click" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }
        [ContextProperty("click", "click")]
        public DfAction Click2
        {
            get { return _сlick; }
            set
            {
                _сlick = value;
                //setEventListener(nameElement, nameEvent)
                string strFunc = "setEventListener(\u0022" + Name + "\u0022, \u0022" + "click" + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private IValue parent;
        [ContextProperty("Родитель", "Parent")]
        public IValue Parent
        {
            get { return parent; }
            set
            {
                parent = value;
                //setParent(nameElement, nameparent)
                string strFunc = "setParent(\u0022" + Name + "\u0022, \u0022" + parent.AsObject().GetPropValue("Name") + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string innerText;
        [ContextProperty("Текст", "Text")]
        public string Text
        {
            get { return innerText; }
            set
            {
                innerText = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "innerText" + "\u0022, \u0022" + innerText + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string backgroundColor;
        [ContextProperty("ЦветФона", "BackgroundColor")]
        public string BackgroundColor
        {
            get { return backgroundColor; }
            set
            {
                backgroundColor = value;
                //setAttribute(nameElement, nameAttribute, valueAttribute)
                string strFunc = "setAttribute(\u0022" + Name + "\u0022, \u0022" + "backgroundColor" + "\u0022, \u0022" + backgroundColor + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string width;
        [ContextProperty("Ширина", "Width")]
        public string Width
        {
            get { return width; }
            set
            {
                width = value;
                //setAttribute(nameElement, nameAttribute, valueAttribute)
                string strFunc = "setAttribute(\u0022" + Name + "\u0022, \u0022" + "width" + "\u0022, \u0022" + width + "px\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string height;
        [ContextProperty("Высота", "Height")]
        public string Height
        {
            get { return height; }
            set
            {
                height = value;
                //setAttribute(nameElement, nameAttribute, valueAttribute)
                string strFunc = "setAttribute(\u0022" + Name + "\u0022, \u0022" + "height" + "\u0022, \u0022" + height + "px\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string display;
        [ContextProperty("Отображать", "Display")]
        public string Display
        {
            get { return display; }
            set
            {
                display = value;
                //setAttribute(nameElement, nameAttribute, valueAttribute)
                string strFunc = "setAttribute(\u0022" + Name + "\u0022, \u0022" + "display" + "\u0022, \u0022" + display + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        [ContextMethod("Показать", "Show")]
        public void Show()
        {
            //showDialog(nameElement)
            string strFunc = "showDialog(\u0022" + Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }

        [ContextMethod("Закрыть", "Close")]
        public void Close()
        {
            //closeDialog(nameElement)
            string strFunc = "closeDialog(\u0022" + Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }
    }
}
