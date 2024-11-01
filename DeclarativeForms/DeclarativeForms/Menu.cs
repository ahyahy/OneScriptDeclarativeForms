using System.IO;
using ScriptEngine.Machine.Contexts;

namespace osdf
{
    [ContextClass("ДфМеню", "DfMenu")]
    public class DfMenu : AutoContext<DfMenu>
    {
        public DfMenu(string p1)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "";
            if (p1 == "contextmenu")
            {
                strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.Menu({ type: 'contextmenu' })); mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            }
            else if (p1 == "menubar")
            {
                strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.Menu({ type: 'menubar' })); mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            }
            else if (p1 == "none")
            {
                strFunc = "mapKeyEl.set('" + ItemKey + "', new gui.Menu()); mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            }
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        [ContextMethod("Добавить", "Append")]
        public void Append(DfMenuItem p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').append(mapKeyEl.get('" + p1.ItemKey + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

        [ContextMethod("Вставить", "Insert")]
        public void Insert(DfMenuItem p1, int p2)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').insert(mapKeyEl.get('" + p1.ItemKey + "'), parseInt('" + p2 + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

       [ContextMethod("Показать", "Popup")]
        public void Popup(int p1, int p2)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').popup(parseInt('" + p1 + "'), parseInt('" + p2 + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

       [ContextMethod("Удалить", "Remove")]
        public void Remove(DfMenuItem p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').remove(mapKeyEl.get('" + p1.ItemKey + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

       [ContextMethod("УдалитьПоИндексу", "RemoveAt")]
        public void RemoveAt(int p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').removeAt(parseInt('" + p1 + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

        public DfAction _сlick;
        [ContextProperty("Нажатие", "Click")]
        public DfAction Click
        {
            get { return _сlick; }
            set
            {
                _сlick = value;
                //setMenuClick(nameMenu)
                string strFunc = "setMenuClick(\u0022" + ItemKey + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
        [ContextProperty("click", "click")]
        public DfAction Click2
        {
            get { return _сlick; }
            set
            {
                _сlick = value;
                //setMenuClick(nameMenu)
                string strFunc = "setMenuClick(\u0022" + ItemKey + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
    }
}
