using System.IO;
using ScriptEngine.Machine.Contexts;

namespace osdf
{
    [ContextClass("ДфЭлементМеню", "DfMenuItem")]
    public class DfMenuItem : AutoContext<DfMenuItem>
    {
        public DfMenuItem(string label, string type)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "' }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfMenuItem(string label, string type, string key)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "', " + @"
            key: '" + key + "' }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfMenuItem(string label, string type, string key, string modifiers)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "', " + @"
            key: '" + key + "', " + @"
            modifiers: '" + modifiers + "' }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "', " + @"
            submenu: mapKeyEl.get('" + menu.ItemKey + "') }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            submenu = menu;
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu, string key)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "', " + @"
            submenu: mapKeyEl.get('" + menu.ItemKey + "'), " + @"
            key: '" + key + "' }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            submenu = menu;
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu, string key, string modifiers)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.MenuItem({ " + @"
            label: '" + label + "', " + @"
            click: function() {{ sendPost('" + ItemKey + "' + '" + DeclarativeForms.paramDelimiter + "' + 'click') }}, " + @"
            type: '" + type + "', " + @"
            submenu: mapKeyEl.get('" + menu.ItemKey + "'), " + @"
            key: '" + key + "', " + @"
            modifiers: '" + modifiers + "' }));" + @"
            mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            submenu = menu;
            DeclarativeForms.SendStrFunc(strFunc);
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        public DfAction сlick;
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return сlick; }
            set { сlick = value; }
        }

        public string label { get; set; }
        [ContextProperty("Надпись", "Label")]
        public string Label
        {
            get { return label; }
            set
            {
                label = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "').label = '" + label + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public DfMenu submenu { get; set; }
        [ContextProperty("Подменю", "Submenu")]
        public DfMenu Submenu
        {
            get { return submenu; }
            set
            {
                submenu = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "').submenu = mapKeyEl.get('" + submenu.ItemKey + "');";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public bool enabled { get; set; }
        [ContextProperty("Доступность", "Enabled")]
        public bool Enabled
        {
            get { return enabled; }
            set
            {
                enabled = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['enabled'] = " + enabled.ToString().ToLower() + ";";
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

        public bool _checked { get; set; }
        [ContextProperty("Помечен", "Checked")]
        public bool Checked
        {
            get { return _checked; }
            set
            {
                _checked = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['checked'] = " + _checked.ToString().ToLower() + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
    }
}
