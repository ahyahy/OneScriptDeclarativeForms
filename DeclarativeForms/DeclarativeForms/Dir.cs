using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфНаправление", "DfDir")]
    public class DfDir : AutoContext<DfDir>, ICollectionContext, IEnumerable<IValue>
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

        public DfDir()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Auto));
            _list.Add(ValueFactory.Create(LeftToRight));
            _list.Add(ValueFactory.Create(RightToLeft));
        }

        [ContextProperty("Автоматически", "Auto")]
        public string Auto
        {
        	get { return "auto"; }
        }

        [ContextProperty("СлеваНаправо", "LeftToRight")]
        public string LeftToRight
        {
        	get { return "ltr"; }
        }

        [ContextProperty("СправаНалево", "RightToLeft")]
        public string RightToLeft
        {
        	get { return "rtl"; }
        }
    }
}
