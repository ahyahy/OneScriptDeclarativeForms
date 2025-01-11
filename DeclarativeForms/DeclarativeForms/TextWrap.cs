using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПереносТекста", "DfTextWrap")]
    public class DfTextWrap : AutoContext<DfTextWrap>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextWrap()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Soft));
            _list.Add(ValueFactory.Create(Hard));
        }

        [ContextProperty("НеПереносить", "Soft")]
        public string Soft
        {
        	get { return "soft"; }
        }

        [ContextProperty("Переносить", "Hard")]
        public string Hard
        {
        	get { return "hard"; }
        }
    }
}
