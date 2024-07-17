using System.IO;
using ScriptEngine.Machine.Contexts;

namespace osdf
{
    [ContextClass("ДфЭлементМеню", "DfMenuItem")]
    public class DfMenuItem : AutoContext<DfMenuItem>
    {
        public DfMenuItem(string label, string type)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem1(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfMenuItem(string label, string type, string key)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem2(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022, \u0022" + key + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfMenuItem(string label, string type, string key, string modifiers)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem3(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022, \u0022" + key + "\u0022, \u0022" + modifiers + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem4(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022, \u0022" + menu.Name + "\u0022)";
            submenu = menu;
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu, string key)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem5(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022, \u0022" + menu.Name + "\u0022, \u0022" + key + "\u0022)";
            submenu = menu;
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
        }

        public DfMenuItem(string label, string type, DfMenu menu, string key, string modifiers)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenuItem6(\u0022" + Name + "\u0022, \u0022" + label + "\u0022, \u0022" + type + "\u0022, \u0022" + menu.Name + "\u0022, \u0022" + key + "\u0022, \u0022" + modifiers + "\u0022)";
            submenu = menu;
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
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
                //setMenuItemClick(nameMenuItem)
                string strFunc = "setMenuItemClick(\u0022" + Name + "\u0022)";
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
                //setMenuItemClick(nameMenu)
                string strFunc = "setMenuItemClick(\u0022" + Name + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string label;
        [ContextProperty("Надпись", "Label")]
        public string Label
        {
            get { return label; }
            set
            {
                label = value;
                //setMenuItemLabel(name, label)
                string strFunc = "setMenuItemLabel(\u0022" + Name + "\u0022, \u0022" + label + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private DfMenu submenu;
        [ContextProperty("Подменю", "Submenu")]
        public DfMenu Submenu
        {
            get { return submenu; }
            set
            {
                submenu = value;
                //setMenuItemSubmenu(nameElement, nameSubmenu)
                string strFunc = "setMenuItemSubmenu(\u0022" + Name + "\u0022, \u0022" + submenu.Name + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private bool enabled;
        [ContextProperty("Доступность", "Enabled")]
        public bool Enabled
        {
            get { return enabled; }
            set
            {
                enabled = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "enabled" + "\u0022, \u0022" + enabled.ToString().ToLower() + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string icon;
        [ContextProperty("Значок", "Icon")]
        public string Icon
        {
            get { return icon; }
            set
            {
                icon = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "icon" + "\u0022, \u0022" + icon + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string tooltip;
        [ContextProperty("Подсказка", "Tooltip")]
        public string Tooltip
        {
            get { return tooltip; }
            set
            {
                tooltip = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "tooltip" + "\u0022, \u0022" + tooltip + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private bool _checked;
        [ContextProperty("Помечен", "Checked")]
        public bool Checked
        {
            get { return _checked; }
            set
            {
                _checked = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "checked" + "\u0022, \u0022" + _checked.ToString().ToLower() + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string key;
        [ContextProperty("Клавиша", "Key")]
        public string Key
        {
            get { return key; }
            set
            {
                key = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "key" + "\u0022, \u0022" + key + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string modifiers;
        [ContextProperty("Модификаторы", "Modifiers")]
        public string Modifiers
        {
            get { return modifiers; }
            set
            {
                modifiers = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "modifiers" + "\u0022, \u0022" + modifiers + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }
    }
}
