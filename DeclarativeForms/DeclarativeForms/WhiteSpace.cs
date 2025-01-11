using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПробелы", "DfWhiteSpace")]
    public class DfWhiteSpace : AutoContext<DfWhiteSpace>, ICollectionContext, IEnumerable<IValue>
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

        public DfWhiteSpace()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(PreLine));
            _list.Add(ValueFactory.Create(Nowrap));
            _list.Add(ValueFactory.Create(Pre));
            _list.Add(ValueFactory.Create(PreWrap));
            _list.Add(ValueFactory.Create(Normal));
        }

        [ContextProperty("ЗаменятьПереносить", "PreLine")]
        public string PreLine
        {
        	get { return "pre-line"; }
        }

        [ContextProperty("НеПереносить", "Nowrap")]
        public string Nowrap
        {
        	get { return "nowrap"; }
        }

        [ContextProperty("Сохранять", "Pre")]
        public string Pre
        {
        	get { return "pre"; }
        }

        [ContextProperty("СохранятьПереносить", "PreWrap")]
        public string PreWrap
        {
        	get { return "pre-wrap"; }
        }

        [ContextProperty("Стандартно", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }
    }
}
