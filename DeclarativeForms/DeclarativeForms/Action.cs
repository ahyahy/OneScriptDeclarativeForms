using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.IO;

namespace osdf
{
    [ContextClass("ДфДействие", "DfAction")]
    public class DfAction : AutoContext<DfAction>
    {
        public DfAction(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            Script = script;
            MethodName = methodName;
            Parameter = param;

            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public DfAction()
        {
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        [ContextProperty("ИмяМетода", "MethodName")]
        public string MethodName { get; set; }
        
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter { get; set; }

        [ContextProperty("Сценарий", "Script")]
        public IRuntimeContextInstance Script { get; set; }				
    }
}
