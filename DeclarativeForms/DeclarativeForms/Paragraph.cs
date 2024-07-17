using ScriptEngine.Machine.Contexts;

namespace osdf
{
    [ContextClass("ДфАбзац", "DfParagraph")]
    public class DfParagraph : DfElement
    {
        public DfParagraph(string p1) : base(p1)
        {
        }
    }
}
