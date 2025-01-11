using ScriptEngine.Machine.Contexts;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфЛоток", "DfTray")]
    public class DfTray : AutoContext<DfTray>
    {
        public DfTray()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.Tray({ title: 'DeclarativeForms', icon: '' })); mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
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

        public string title { get; set; }
        [ContextProperty("Заголовок", "Title")]
        public string Title
        {
            get { return title; }
            set
            {
                title = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['title'] = '" + title + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string icon { get; set; }
        [ContextProperty("Значок", "Icon")]
        public string Icon
        {
            get { return icon; }
            set
            {
                icon = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['icon'] = '" + icon + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string tooltip { get; set; }
        [ContextProperty("Подсказка", "Tooltip")]
        public string Tooltip
        {
            get { return tooltip; }
            set
            {
                tooltip = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['tooltip'] = '" + tooltip + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public DfAction click { get; set; }
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return click; }
            set
            {
                click = value;
                string strFunc = "" +
                    "mapKeyEl.get(\u0022" + ItemKey + "\u0022).on('click', function()" +
                    "{" +
                    "    sendPost('" + ItemKey + DeclarativeForms.paramDelimiter + @"click');" +
                    "});";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public DfMenu menu;
        [ContextProperty("Меню", "Menu")]
        public DfMenu Menu
        {
            get { return menu; }
            set
            {
                menu = value;
                string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).menu = mapKeyEl.get(\u0022" + menu.ItemKey + "\u0022);";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        [ContextMethod("Удалить", "Remove")]
        public void Remove()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).remove();";
            DeclarativeForms.SendStrFunc(strFunc);
        }
    }
}
