using ScriptEngine.HostedScript.Library.Binary;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System;

namespace osdf
{
    [ContextClass("ДфХолст", "DfCanvas")]
    public class DfCanvas : AutoContext<DfCanvas>
    {

        public DfCanvas()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', document.createElement('canvas'));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            DeclarativeForms.AddToHashtable(ItemKey, this);
            style = new DfStyle();
            style.Owner = this;

            Context2d = new DfContext2d(ItemKey);
            Context2d.Owner = this;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private int height;
        [ContextProperty("Высота", "Height")]
        public int Height
        {
            get { return height; }
            set
            {
                height = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['height'] = '" + height + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int scrollLeft;
        [ContextProperty("ГоризонтальноеПрокручивание", "ScrollLeft")]
        public int ScrollLeft
        {
            get { return scrollLeft; }
            set
            {
                scrollLeft = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['scrollLeft'] = '" + scrollLeft + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string id;
        [ContextProperty("Идентификатор", "Id")]
        public string Id
        {
            get { return id; }
            set
            {
                id = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['id'] = '" + id + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string name;
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['name'] = '" + name + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string accessKey;
        [ContextProperty("КлавишаДоступа", "AccessKey")]
        public string AccessKey
        {
            get { return accessKey; }
            set
            {
                accessKey = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['accessKey'] = '" + accessKey + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string _class;
        [ContextProperty("Класс", "Class")]
        public string Class
        {
            get { return _class; }
            set
            {
                _class = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['className'] = '" + _class + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        private DfContext2d context2d;
        [ContextProperty("Контекст2d", "Context2d")]
        public DfContext2d Context2d
        {
            get { return context2d; }
            private set { context2d = value; }
        }

        private string dir;
        [ContextProperty("Направление", "Dir")]
        public string Dir
        {
            get { return dir; }
            set
            {
                dir = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['dir'] = '" + dir + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int tabIndex;
        [ContextProperty("ПорядокОбхода", "TabIndex")]
        public int TabIndex
        {
            get { return tabIndex; }
            set
            {
                tabIndex = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['tabIndex'] = '" + tabIndex + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private bool contentEditable;
        [ContextProperty("Редактируемый", "ContentEditable")]
        public bool ContentEditable
        {
            get { return contentEditable; }
            set
            {
                contentEditable = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['contentEditable'] = " + contentEditable.ToString().ToLower() + ";";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
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
                string strFunc;
                if (parent.AsObject().GetPropValue("ItemKey").AsString() == "mainForm")
                {
                    strFunc = "document.body.appendChild(mapKeyEl.get('" + ItemKey + "'));";
                }
                else
                {
                    strFunc = "mapKeyEl.get('" + parent.AsObject().GetPropValue("ItemKey").AsString() + "').appendChild(mapKeyEl.get('" + ItemKey + "'));";
                }
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                // Родителю добавим потомка.
                ArrayImpl ArrayImpl1 = ((dynamic)parent).Children;
                ArrayImpl1.Add(this);
            }
        }

        public IValue offsetTop { get; set; }
        [ContextProperty("СмещениеВерх", "OffsetTop")]
        public int OffsetTop
        {
            get { return Convert.ToInt32(offsetTop.AsNumber()); }
        }

        public IValue offsetHeight { get; set; }
        [ContextProperty("СмещениеВысота", "OffsetHeight")]
        public int OffsetHeight
        {
            get { return Convert.ToInt32(offsetHeight.AsNumber()); }
        }

        public IValue offsetLeft { get; set; }
        [ContextProperty("СмещениеЛево", "OffsetLeft")]
        public int OffsetLeft
        {
            get { return Convert.ToInt32(offsetLeft.AsNumber()); }
        }

        public IValue offsetWidth { get; set; }
        [ContextProperty("СмещениеШирина", "OffsetWidth")]
        public int OffsetWidth
        {
            get { return Convert.ToInt32(offsetWidth.AsNumber()); }
        }

        private DfStyle style;
        [ContextProperty("Стиль", "Style")]
        public DfStyle Style
        {
            get { return style; }
            set { style.Copy(value); }
        }
        
        private IValue innerText;
        [ContextProperty("Текст", "Text")]
        public IValue Text
        {
            get { return innerText; }
            set
            {
                innerText = value;
                string str = value.AsString();
                str = str.Replace("\u005C", @"\u005C"); // Обратная косая черта
                str = str.Replace("\u003B", @"\u003B"); // Точка с запятой.
                str = str.Replace("\u000A", @"\u000A"); // Перевод строки
                str = str.Replace("\u007C", @"\u007C"); // Знак |
                str = str.Replace("\u0022", @"\u0022"); // Кавычки.
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['innerText'] = '" + str + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int width;
        [ContextProperty("Ширина", "Width")]
        public int Width
        {
            get { return width; }
            set
            {
                width = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['width'] = '" + width + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        public DfAction dblclick;
        [ContextProperty("ДвойноеНажатие", "DoubleClick")]
        public DfAction DoubleClick
        {
            get { return dblclick; }
            set
            {
                dblclick = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dblclick\u0022, doEvent);";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
        
        public DfAction click;
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return click; }
            set
            {
                click = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022click\u0022, doEvent);";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
        
        public DfAction mouseup;
        [ContextProperty("ПриОтпусканииМыши", "MouseUp")]
        public DfAction MouseUp
        {
            get { return mouseup; }
            set
            {
                mouseup = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseup\u0022, doEvent);";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
        
        [ContextMethod("СнятьФокус", "Blur")]
        public void Blur()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).blur();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
        [ContextMethod("Удалить", "Remove")]
        public void Remove()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).remove();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
        [ContextMethod("Фокус", "Focus")]
        public void Focus()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).focus();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
    }
}
