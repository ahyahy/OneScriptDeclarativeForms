using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфИзменяемыйРазмер", "DfResize")]
    public class DfResize : AutoContext<DfResize>, ICollectionContext, IEnumerable<IValue>
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

        public DfResize()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Vertical));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Horizontal));
            _list.Add(ValueFactory.Create(Both));
        }

        [ContextProperty("Высота", "Vertical")]
        public string Vertical
        {
        	get { return "vertical"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Ширина", "Horizontal")]
        public string Horizontal
        {
        	get { return "horizontal"; }
        }

        [ContextProperty("ШиринаВысота", "Both")]
        public string Both
        {
        	get { return "both"; }
        }
    }
}
