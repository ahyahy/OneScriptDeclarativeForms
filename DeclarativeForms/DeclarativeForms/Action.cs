using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

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
        }

        public DfAction()
        {
        }

        [ContextProperty("ИмяМетода", "MethodName")]
        public string MethodName { get; set; }
        
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter { get; set; }

        [ContextProperty("Сценарий", "Script")]
        public IRuntimeContextInstance Script { get; set; }				
    }
}
