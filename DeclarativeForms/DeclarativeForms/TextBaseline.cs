using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфБазоваяЛинияТекста", "DfTextBaseline")]
    public class DfTextBaseline : AutoContext<DfTextBaseline>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextBaseline()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Alphabetic));
            _list.Add(ValueFactory.Create(Top));
            _list.Add(ValueFactory.Create(Hanging));
            _list.Add(ValueFactory.Create(Ideographic));
            _list.Add(ValueFactory.Create(Bottom));
            _list.Add(ValueFactory.Create(Middle));
        }

        [ContextProperty("Алфавит", "Alphabetic")]
        public string Alphabetic
        {
        	get { return "alphabetic"; }
        }

        [ContextProperty("Верх", "Top")]
        public string Top
        {
        	get { return "top"; }
        }

        [ContextProperty("Висячая", "Hanging")]
        public string Hanging
        {
        	get { return "hanging"; }
        }

        [ContextProperty("Идеографическая", "Ideographic")]
        public string Ideographic
        {
        	get { return "ideographic"; }
        }

        [ContextProperty("Низ", "Bottom")]
        public string Bottom
        {
        	get { return "bottom"; }
        }

        [ContextProperty("Середина", "Middle")]
        public string Middle
        {
        	get { return "middle"; }
        }
    }
}
