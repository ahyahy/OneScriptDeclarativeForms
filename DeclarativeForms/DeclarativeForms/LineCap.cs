using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфСтильКонцовЛинии", "DfLineCap")]
    public class DfLineCap : AutoContext<DfLineCap>, ICollectionContext, IEnumerable<IValue>
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

        public DfLineCap()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Square));
            _list.Add(ValueFactory.Create(Round));
            _list.Add(ValueFactory.Create(Butt));
        }

        [ContextProperty("Квадрат", "Square")]
        public string Square
        {
        	get { return "square"; }
        }

        [ContextProperty("Круг", "Round")]
        public string Round
        {
        	get { return "round"; }
        }

        [ContextProperty("Торец", "Butt")]
        public string Butt
        {
        	get { return "butt"; }
        }
    }
}
