using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПоложениеЗаголовка", "DfCaptionSide")]
    public class DfCaptionSide : AutoContext<DfCaptionSide>, ICollectionContext, IEnumerable<IValue>
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

        public DfCaptionSide()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Top));
            _list.Add(ValueFactory.Create(Bottom));
        }

        [ContextProperty("Верх", "Top")]
        public string Top
        {
        	get { return "top"; }
        }

        [ContextProperty("Низ", "Bottom")]
        public string Bottom
        {
        	get { return "bottom"; }
        }
    }
}
