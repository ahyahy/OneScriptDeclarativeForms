using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПереносСлов", "DfWordWrap")]
    public class DfWordWrap : AutoContext<DfWordWrap>, ICollectionContext, IEnumerable<IValue>
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

        public DfWordWrap()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(BreakWord));
            _list.Add(ValueFactory.Create(Normal));
        }

        [ContextProperty("Разбивать", "BreakWord")]
        public string BreakWord
        {
        	get { return "break-word"; }
        }

        [ContextProperty("Стандартно", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }
    }
}
