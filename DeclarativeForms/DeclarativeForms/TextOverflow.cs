using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПереполнениеТекста", "DfTextOverflow")]
    public class DfTextOverflow : AutoContext<DfTextOverflow>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextOverflow()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Ellipsis));
            _list.Add(ValueFactory.Create(Clip));
            _list.Add(ValueFactory.Create(String));
        }

        [ContextProperty("Многоточие", "Ellipsis")]
        public string Ellipsis
        {
        	get { return "ellipsis"; }
        }

        [ContextProperty("Обрезка", "Clip")]
        public string Clip
        {
        	get { return "clip"; }
        }

        [ContextProperty("Строка", "String")]
        public string String
        {
        	get { return "string"; }
        }
    }
}
