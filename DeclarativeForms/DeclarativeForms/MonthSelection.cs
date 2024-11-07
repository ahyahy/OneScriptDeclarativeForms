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
    [ContextClass("ДфВыборМесяца", "DfMonthSelection")]
    public class DfMonthSelection : AutoContext<DfMonthSelection>
    {

        public DfMonthSelection()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', document.createElement('input'));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            strFunc = "mapKeyEl.get('" + ItemKey + "').type = 'month';";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;		
            DeclarativeForms.AddToHashtable(ItemKey, this);
            style = new DfStyle();
            style.Owner = this;
		
            offsetTop = ValueFactory.Create(0);
            offsetHeight = ValueFactory.Create(0);
            offsetLeft = ValueFactory.Create(0);
            offsetWidth = ValueFactory.Create(0);
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private bool autofocus;
        [ContextProperty("АвтоФокус", "AutoFocus")]
        public bool AutoFocus
        {
            get { return autofocus; }
            set
            {
                autofocus = value;
                if (autofocus)
                {
                    string strFunc = "mapKeyEl.get('" + ItemKey + "').focus();";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        private int scrollTop;
        [ContextProperty("ВертикальноеПрокручивание", "ScrollTop")]
        public int ScrollTop
        {
            get { return scrollTop; }
            set
            {
                scrollTop = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['scrollTop'] = '" + scrollTop + "';";
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

        private IValue _value;
        [ContextProperty("Значение", "Value")]
        public IValue Value
        {
            get { return _value; }
            set
            {
                _value = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['value'] = '" + _value + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private string defaultValue;
        [ContextProperty("ЗначениеПоУмолчанию", "DefaultValue")]
        public string DefaultValue
        {
            get { return defaultValue; }
            set
            {
                defaultValue = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['defaultValue'] = '" + defaultValue + "';";
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

        private int max;
        [ContextProperty("Максимум", "Max")]
        public int Max
        {
            get { return max; }
            set
            {
                max = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['max'] = '" + max + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int min;
        [ContextProperty("Минимум", "Min")]
        public int Min
        {
            get { return min; }
            set
            {
                min = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['min'] = '" + min + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private bool disabled;
        [ContextProperty("Отключено", "Disabled")]
        public bool Disabled
        {
            get { return disabled; }
            set
            {
                disabled = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['disabled'] = " + disabled.ToString().ToLower() + ";";
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

        private bool readOnly;
        [ContextProperty("ТолькоЧтение", "ReadOnly")]
        public bool ReadOnly
        {
            get { return readOnly; }
            set
            {
                readOnly = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['readOnly'] = " + readOnly.ToString().ToLower() + ";";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int step;
        [ContextProperty("Шаг", "Step")]
        public int Step
        {
            get { return step; }
            set
            {
                step = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['step'] = '" + step + "';";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private ArrayImpl children = new ArrayImpl();
        [ContextProperty("Элементы", "Children")]
        public ArrayImpl Children
        {
            get { return children; }
        }

        public DfAction input;
        [ContextProperty("Ввод", "Input")]
        public DfAction Input
        {
            get { return input; }
            set
            {
                input = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022input\u0022, doEvent);";
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
        
        public DfAction mouseover;
        [ContextProperty("МышьНадЭлементом", "MouseOver")]
        public DfAction MouseOver
        {
            get { return mouseover; }
            set
            {
                mouseover = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseover\u0022, doEvent);";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
        
        public DfAction mouseout;
        [ContextProperty("МышьПокинулаЭлемент", "MouseOut")]
        public DfAction MouseOut
        {
            get { return mouseout; }
            set
            {
                mouseout = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseout\u0022, doEvent);";
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
        
        public DfAction change;
        [ContextProperty("ПриИзменении", "Change")]
        public DfAction Change
        {
            get { return change; }
            set
            {
                change = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022change\u0022, doEvent);";
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
        
        [ContextMethod("Анимация", "Animation")]
        public DfAnimation Animation(DfFrames p1, DfAnimationOptions p2)
        {
            return new DfAnimation(ItemKey, p1, p2);
        }
        
        [ContextMethod("Выбрать", "Select")]
        public void Select()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).select();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
        [ContextMethod("ПрокрутитьДо", "ScrollIntoView")]
        public void ScrollIntoView(bool p1 = true)
        {
            string strFunc;
            if (!p1)
            {
                strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).scrollIntoView(false);";
            }
            else
            {
                strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).scrollIntoView();";
            }
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
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
        
        [ContextMethod("ШагВверх", "StepUp")]
        public void StepUp(int p1)
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).stepUp(" + p1 + ");";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
        [ContextMethod("ШагВниз", "StepDown")]
        public void StepDown(int p1)
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).stepDown(" + p1 + ");";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
        
    }
}
