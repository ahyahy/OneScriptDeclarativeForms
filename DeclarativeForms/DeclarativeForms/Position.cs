using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПозиция", "DfPosition")]
    public class DfPosition : AutoContext<DfPosition>, ICollectionContext, IEnumerable<IValue>
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

        public DfPosition()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Absolute));
            _list.Add(ValueFactory.Create(Relative));
            _list.Add(ValueFactory.Create(Static));
            _list.Add(ValueFactory.Create(Sticky));
            _list.Add(ValueFactory.Create(Fixed));
        }

        [ContextProperty("Абсолютно", "Absolute")]
        public string Absolute
        {
        	get { return "absolute"; }
        }

        [ContextProperty("Относительно", "Relative")]
        public string Relative
        {
        	get { return "relative"; }
        }

        [ContextProperty("Статично", "Static")]
        public string Static
        {
        	get { return "static"; }
        }

        [ContextProperty("Стикер", "Sticky")]
        public string Sticky
        {
        	get { return "sticky"; }
        }

        [ContextProperty("Фиксировано", "Fixed")]
        public string Fixed
        {
        	get { return "fixed"; }
        }
    }
}
