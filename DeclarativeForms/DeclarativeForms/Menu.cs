using System.IO;
using ScriptEngine.Machine.Contexts;

namespace osdf
{
    [ContextClass("ДфМеню", "DfMenu")]
    public class DfMenu : AutoContext<DfMenu>
    {
        public DfMenu(string p1)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createMenu(\u0022" + Name + "\u0022, \u0022" + p1 + "\u0022)";
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

        [ContextMethod("Добавить", "Append")]
        public void Append(DfMenuItem p1)
        {
            //string strFunc = "doMenuAppend(name, submenuName)";
            string strFunc = "doMenuAppend(\u0022" + Name + "\u0022, \u0022" + p1.Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }

        [ContextMethod("Вставить", "Insert")]
        public void Insert(DfMenuItem p1, int p2)
        {
            //string strFunc = "doMenuInsert(name, submenuName, num)";
            string strFunc = "doMenuInsert(\u0022" + Name + "\u0022, \u0022" + p1.Name + "\u0022, \u0022" + p2 + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }

       [ContextMethod("Показать", "Popup")]
        public void Popup(int p1, int p2)
        {
            //string strFunc = "doMenuPopup(name, x, y)";
            string strFunc = "doMenuPopup(\u0022" + Name + "\u0022, \u0022" + p1 + "\u0022, \u0022" + p2 + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }

       [ContextMethod("Удалить", "Remove")]
        public void Remove(DfMenuItem p1)
        {
            //string strFunc = "doMenuRemove(name, submenuName)";
            string strFunc = "doMenuRemove(\u0022" + Name + "\u0022, \u0022" + p1.Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }

       [ContextMethod("УдалитьПоИндексу", "RemoveAt")]
        public void RemoveAt(int p1)
        {
            //string strFunc = "doMenuRemoveAt(name, num)";
            string strFunc = "doMenuRemoveAt(\u0022" + Name + "\u0022, \u0022" + p1 + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
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
                string strFunc = "setMenuClick(\u0022" + Name + "\u0022)";
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
                //setMenuClick(nameMenu)
                string strFunc = "setMenuClick(\u0022" + Name + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }
    }
}
