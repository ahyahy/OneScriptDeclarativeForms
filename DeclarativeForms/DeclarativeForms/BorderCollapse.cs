using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфГраницаСвернута", "DfBorderCollapse")]
    public class DfBorderCollapse : AutoContext<DfBorderCollapse>, ICollectionContext, IEnumerable<IValue>
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

        public DfBorderCollapse()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Separate));
            _list.Add(ValueFactory.Create(Collapse));
        }

        [ContextProperty("Раздельно", "Separate")]
        public string Separate
        {
        	get { return "separate"; }
        }

        [ContextProperty("Свернуто", "Collapse")]
        public string Collapse
        {
        	get { return "collapse"; }
        }
    }
}
