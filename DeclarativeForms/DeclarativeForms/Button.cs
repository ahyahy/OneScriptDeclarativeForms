﻿using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.IO;
using System.Reflection;
using System;

namespace osdf
{
    [ContextClass("ДфКнопка", "DfButton")]
    public class DfButton : AutoContext<DfButton>
    {

        public DfButton()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', document.createElement('button'));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
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

        public bool autofocus { get; set; }
        [ContextProperty("АвтоФокус", "AutoFocus")]
        public bool AutoFocus
        {
            get { return autofocus; }
            set
            {
                autofocus = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['autofocus'] = " + autofocus.ToString().ToLower() + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int scrollTop { get; set; }
        [ContextProperty("ВертикальноеПрокручивание", "ScrollTop")]
        public int ScrollTop
        {
            get { return scrollTop; }
            set
            {
                scrollTop = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['scrollTop'] = '" + scrollTop + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int scrollLeft { get; set; }
        [ContextProperty("ГоризонтальноеПрокручивание", "ScrollLeft")]
        public int ScrollLeft
        {
            get { return scrollLeft; }
            set
            {
                scrollLeft = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['scrollLeft'] = '" + scrollLeft + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string id { get; set; }
        [ContextProperty("Идентификатор", "Id")]
        public string Id
        {
            get { return id; }
            set
            {
                id = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['id'] = '" + id + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string name { get; set; }
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['name'] = '" + name + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string accessKey { get; set; }
        [ContextProperty("КлавишаДоступа", "AccessKey")]
        public string AccessKey
        {
            get { return accessKey; }
            set
            {
                accessKey = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['accessKey'] = '" + accessKey + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string className { get; set; }
        [ContextProperty("Класс", "Class")]
        public string Class
        {
            get { return className; }
            set
            {
                className = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['className'] = '" + className + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        public string dir { get; set; }
        [ContextProperty("Направление", "Dir")]
        public string Dir
        {
            get { return dir; }
            set
            {
                dir = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['dir'] = '" + dir + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public bool disabled { get; set; }
        [ContextProperty("Отключено", "Disabled")]
        public bool Disabled
        {
            get { return disabled; }
            set
            {
                disabled = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['disabled'] = " + disabled.ToString().ToLower() + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public bool movable { get; set; }
        [ContextProperty("Перемещаемый", "Movable")]
        public bool Movable
        {
            get { return movable; }
            set
            {
                movable = value;
                string strFunc;
                if (value)
                {
                    strFunc = "mapKeyEl.get('" + ItemKey + "')['movable'] = " + movable.ToString().ToLower() + ";";
                    strFunc += @"
mapKeyDraggableEl.set('" + ItemKey + "', mapKeyEl.get('" + ItemKey + @"'));
function dragElement" + ItemKey + @"() {
    let elmnt = mapKeyDraggableEl.get('" + ItemKey + @"');
        //alert('' + elmnt);
        if (elmnt != undefined)
        {
            var pos1 = 0;
            var pos2 = 0;
            var pos3 = 0;
            var pos4 = 0;
            elmnt.onmousedown = dragMouseDown;
            function dragMouseDown(e)
            {
                e = e || window.event;
                e.preventDefault();
                pos3 = e.clientX;
                pos4 = e.clientY;
                document.onmouseup = closeDragElement;
                document.onmousemove = elementDrag;
            }
            function elementDrag(e)
            {
                e = e || window.event;
                e.preventDefault();
                pos1 = pos3 - e.clientX;
                pos2 = pos4 - e.clientY;
                pos3 = e.clientX;
                pos4 = e.clientY;
                elmnt.style.top = (elmnt.offsetTop - pos2) + 'px';
                elmnt.style.left = (elmnt.offsetLeft - pos1) + 'px';
            }
            function closeDragElement()
            {
                document.onmouseup = null;
                document.onmousemove = null;
            }
        }
        else
        {
            mapKeyEl.get('" + ItemKey + @"').onmousedown = null;
        }
    }
dragElement" + ItemKey + "();";
                }
                else
                {
                    strFunc = @"
mapKeyDraggableEl.delete('" + ItemKey + @"');
function dragElement" + ItemKey + @"() { mapKeyEl.get('" + ItemKey + @"').onmousedown = null; }
dragElement" + ItemKey + "();";
                }
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public bool draggable { get; set; }
        [ContextProperty("Перетаскиваемый", "Draggable")]
        public bool Draggable
        {
            get { return draggable; }
            set
            {
                draggable = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['draggable'] = " + draggable.ToString().ToLower() + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int tabIndex { get; set; }
        [ContextProperty("ПорядокОбхода", "TabIndex")]
        public int TabIndex
        {
            get { return tabIndex; }
            set
            {
                tabIndex = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['tabIndex'] = '" + tabIndex + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public bool contentEditable { get; set; }
        [ContextProperty("Редактируемый", "ContentEditable")]
        public bool ContentEditable
        {
            get { return contentEditable; }
            set
            {
                contentEditable = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['contentEditable'] = " + contentEditable.ToString().ToLower() + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public IValue parent { get; set; }
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
                DeclarativeForms.SendStrFunc(strFunc);
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

        public DfStyle style { get; set; }
        [ContextProperty("Стиль", "Style")]
        public DfStyle Style
        {
            get { return style; }
            set { style.Copy(value); }
        }
        
        public IValue innerText { get; set; }
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
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        private ArrayImpl children = new ArrayImpl();
        [ContextProperty("Элементы", "Children")]
        public ArrayImpl Children
        {
            get { return children; }
        }

        public DfAction drop  { get; set; }
        [ContextProperty("Бросить", "Drop")]
        public DfAction Drop
        {
            get { return drop; }
            set
            {
                drop = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022drop\u0022, doEvent);";
                strFunc += "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dragover\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public DfAction dblclick  { get; set; }
        [ContextProperty("ДвойноеНажатие", "DoubleClick")]
        public DfAction DoubleClick
        {
            get { return dblclick; }
            set
            {
                dblclick = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dblclick\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction dragend  { get; set; }
        [ContextProperty("КонецПеретаскивания", "DragEnd")]
        public DfAction DragEnd
        {
            get { return dragend; }
            set
            {
                dragend = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dragend\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction mouseover  { get; set; }
        [ContextProperty("МышьНадЭлементом", "MouseOver")]
        public DfAction MouseOver
        {
            get { return mouseover; }
            set
            {
                mouseover = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseover\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction mouseout  { get; set; }
        [ContextProperty("МышьПокинулаЭлемент", "MouseOut")]
        public DfAction MouseOut
        {
            get { return mouseout; }
            set
            {
                mouseout = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseout\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction dragenter  { get; set; }
        [ContextProperty("НадЦелью", "DragEnter")]
        public DfAction DragEnter
        {
            get { return dragenter; }
            set
            {
                dragenter = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dragenter\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction click  { get; set; }
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return click; }
            set
            {
                click = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022click\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction dragstart  { get; set; }
        [ContextProperty("НачалоПеретаскивания", "DragStart")]
        public DfAction DragStart
        {
            get { return dragstart; }
            set
            {
                dragstart = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dragstart\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction mousedown  { get; set; }
        [ContextProperty("ПриНажатииМыши", "MouseDown")]
        public DfAction MouseDown
        {
            get { return mousedown; }
            set
            {
                mousedown = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mousedown\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction mouseup  { get; set; }
        [ContextProperty("ПриОтпусканииМыши", "MouseUp")]
        public DfAction MouseUp
        {
            get { return mouseup; }
            set
            {
                mouseup = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mouseup\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction mousemove  { get; set; }
        [ContextProperty("ПриПеремещенииМыши", "MouseMove")]
        public DfAction MouseMove
        {
            get { return mousemove; }
            set
            {
                mousemove = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022mousemove\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction focus  { get; set; }
        [ContextProperty("ФокусПолучен", "Focused")]
        public DfAction Focused
        {
            get { return focus; }
            set
            {
                focus = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022focus\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction blur  { get; set; }
        [ContextProperty("ФокусПотерян", "LostFocus")]
        public DfAction LostFocus
        {
            get { return blur; }
            set
            {
                blur = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022blur\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        public DfAction dragleave  { get; set; }
        [ContextProperty("ЦельПокинута", "DragLeave")]
        public DfAction DragLeave
        {
            get { return dragleave; }
            set
            {
                dragleave = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).addEventListener(\u0022dragleave\u0022, doEvent);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
        
        [ContextMethod("Анимация", "Animation")]
        public DfAnimation Animation(DfFrames p1, DfAnimationOptions p2)
        {
            return new DfAnimation(ItemKey, p1, p2);
        }
        
        [ContextMethod("ДвойноеНажатие", "DoubleClick")]
        public void DoubleClick2()
        {
            while (!DeclarativeForms.webserverSendUploaded)
            {
                System.Threading.Thread.Sleep(300);
            }
            System.Threading.Thread.Sleep(1000);
            string strFunc = "const event = new MouseEvent('dblclick');" +
                "mapKeyEl.get(\u0022" + ItemKey + "\u0022).dispatchEvent(event);";
            DeclarativeForms.WebServerSendText(strFunc);
        }
        
        [ContextMethod("ДобавитьДочерний", "AppendChild")]
        public IValue AppendChild(IValue p1)
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).appendChild(mapKeyEl.get(\u0022" + ((dynamic)p1).ItemKey + "\u0022));";
            DeclarativeForms.SendStrFunc(strFunc);
            ((dynamic)p1).Parent = this;
            return p1;
        }
        
        [ContextMethod("Нажатие", "Click")]
        public void Click2()
        {
            while (!DeclarativeForms.webserverSendUploaded)
            {
                System.Threading.Thread.Sleep(300);
            }
            System.Threading.Thread.Sleep(1000);
            string strFunc = "const event = new MouseEvent('click');" +
                "mapKeyEl.get(\u0022" + ItemKey + "\u0022).dispatchEvent(event);";
            DeclarativeForms.WebServerSendText(strFunc);
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
            DeclarativeForms.SendStrFunc(strFunc);
        }
        
        [ContextMethod("СнятьФокус", "Blur")]
        public void Blur()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).blur();";
            DeclarativeForms.SendStrFunc(strFunc);
        }
        
        [ContextMethod("Удалить", "Remove")]
        public void Remove()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).remove();";
            DeclarativeForms.SendStrFunc(strFunc);
				
            try
            {
                ArrayImpl arr = (ArrayImpl)((dynamic)Parent).Children;
                IValue val1 = arr.Find(this);
                arr.Remove(Convert.ToInt32(val1.AsNumber()));
            }
            catch { }
        }
        
        [ContextMethod("УдалитьДочерний", "RemoveChild")]
        public void RemoveChild(IValue p1)
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).removeChild(mapKeyEl.get(\u0022" + ((dynamic)p1.AsObject()).ItemKey + "\u0022));";
            DeclarativeForms.SendStrFunc(strFunc);
				
            try
            {
                IValue val1 = Children.Find(p1);
                Children.Remove(Convert.ToInt32(val1.AsNumber()));
            }
            catch { }
        }
        
        [ContextMethod("Фокус", "Focus")]
        public void Focus()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).focus();";
            DeclarativeForms.SendStrFunc(strFunc);
        }
        
    }
}
