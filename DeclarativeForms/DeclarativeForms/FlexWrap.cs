using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПереносГибких", "DfFlexWrap")]
    public class DfFlexWrap : AutoContext<DfFlexWrap>, ICollectionContext, IEnumerable<IValue>
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

        public DfFlexWrap()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Nowrap));
            _list.Add(ValueFactory.Create(WrapReverse));
            _list.Add(ValueFactory.Create(Wrap));
        }

        [ContextProperty("БезПереноса", "Nowrap")]
        public string Nowrap
        {
        	get { return "nowrap"; }
        }

        [ContextProperty("ОбратныйПеренос", "WrapReverse")]
        public string WrapReverse
        {
        	get { return "wrap-reverse"; }
        }

        [ContextProperty("Перенос", "Wrap")]
        public string Wrap
        {
        	get { return "wrap"; }
        }
    }
}
