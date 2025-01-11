using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфСтильСдвига", "DfTransformStyle")]
    public class DfTransformStyle : AutoContext<DfTransformStyle>, ICollectionContext, IEnumerable<IValue>
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

        public DfTransformStyle()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Flat));
            _list.Add(ValueFactory.Create(Preserve3d));
        }

        [ContextProperty("Плоский", "Flat")]
        public string Flat
        {
        	get { return "flat"; }
        }

        [ContextProperty("Трехмерный", "Preserve3d")]
        public string Preserve3d
        {
        	get { return "preserve-3d"; }
        }
    }
}
