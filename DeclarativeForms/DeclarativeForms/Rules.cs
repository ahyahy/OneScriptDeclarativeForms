using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфРазлиновка", "DfRules")]
    public class DfRules : AutoContext<DfRules>, ICollectionContext, IEnumerable<IValue>
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

        public DfRules()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(All));
            _list.Add(ValueFactory.Create(Groups));
            _list.Add(ValueFactory.Create(Cols));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Rows));
        }

        [ContextProperty("Все", "All")]
        public string All
        {
        	get { return "all"; }
        }

        [ContextProperty("Группы", "Groups")]
        public string Groups
        {
        	get { return "groups"; }
        }

        [ContextProperty("Колонки", "Cols")]
        public string Cols
        {
        	get { return "cols"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Строки", "Rows")]
        public string Rows
        {
        	get { return "rows"; }
        }
    }
}
