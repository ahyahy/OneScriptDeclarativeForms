using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфОформлениеТекстаЛиния", "DfTextDecorationLine")]
    public class DfTextDecorationLine : AutoContext<DfTextDecorationLine>, ICollectionContext, IEnumerable<IValue>
    {
        private List<IValue> _list;

        public int Count()
        {
            return _list.Count;
        }

        public CollectionEnumerator GetManagedIterator()
        {
            return new CollectionEnumerator(this);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IEnumerable<IValue>)_list).GetEnumerator();
        }

        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
        {
            foreach (var item in _list)
            {
                yield return (item as IValue);
            }
        }

        public DfTextDecorationLine()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Overline));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Underline));
            _list.Add(ValueFactory.Create(LineThrough));
        }

        [ContextProperty("НадТекстом", "Overline")]
        public string Overline
        {
        	get { return "overline"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("ПодТекстом", "Underline")]
        public string Underline
        {
        	get { return "underline"; }
        }

        [ContextProperty("ЧерезТекст", "LineThrough")]
        public string LineThrough
        {
        	get { return "line-through"; }
        }
    }
}
