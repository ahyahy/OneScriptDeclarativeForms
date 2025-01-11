using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПрописныеТекста", "DfTextTransform")]
    public class DfTextTransform : AutoContext<DfTextTransform>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextTransform()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Uppercase));
            _list.Add(ValueFactory.Create(Lowercase));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Capitalize));
        }

        [ContextProperty("ВсеПрописные", "Uppercase")]
        public string Uppercase
        {
        	get { return "uppercase"; }
        }

        [ContextProperty("ВсеСтрочные", "Lowercase")]
        public string Lowercase
        {
        	get { return "lowercase"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("ПерваяПрописная", "Capitalize")]
        public string Capitalize
        {
        	get { return "capitalize"; }
        }
    }
}
