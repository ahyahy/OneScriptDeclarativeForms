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

        [ContextMethod("Добавить", "Append")]
        public void Append(DfMenuItem p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').append(mapKeyEl.get('" + p1.ItemKey + "'));";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Вставить", "Insert")]
        public void Insert(DfMenuItem p1, int p2)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').insert(mapKeyEl.get('" + p1.ItemKey + "'), parseInt('" + p2 + "'));";
            DeclarativeForms.SendStrFunc(strFunc);
        }

       [ContextMethod("Показать", "Popup")]
        public void Popup(int p1, int p2)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').popup(parseInt('" + p1 + "'), parseInt('" + p2 + "'));";
            DeclarativeForms.SendStrFunc(strFunc);
        }

       [ContextMethod("Удалить", "Remove")]
        public void Remove(DfMenuItem p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').remove(mapKeyEl.get('" + p1.ItemKey + "'));";
            DeclarativeForms.SendStrFunc(strFunc);
        }

       [ContextMethod("УдалитьПоИндексу", "RemoveAt")]
        public void RemoveAt(int p1)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').removeAt(parseInt('" + p1 + "'));";
            DeclarativeForms.SendStrFunc(strFunc);
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
                DeclarativeForms.SendStrFunc(strFunc);
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
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
    }
}
