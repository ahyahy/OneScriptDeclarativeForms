using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфТипМаркера", "DfMarkerType")]
    public class DfMarkerType : AutoContext<DfMarkerType>, ICollectionContext, IEnumerable<IValue>
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

        public DfMarkerType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Uppercase));
            _list.Add(ValueFactory.Create(RomanUppercase));
            _list.Add(ValueFactory.Create(RomanLowercase));
            _list.Add(ValueFactory.Create(Lowercase));
            _list.Add(ValueFactory.Create(Number));
        }

        [ContextProperty("Заглавные", "Uppercase")]
        public string Uppercase
        {
        	get { return "A"; }
        }

        [ContextProperty("РимскиеЗаглавные", "RomanUppercase")]
        public string RomanUppercase
        {
        	get { return "I"; }
        }

        [ContextProperty("РимскиеСтрочные", "RomanLowercase")]
        public string RomanLowercase
        {
        	get { return "i"; }
        }

        [ContextProperty("Строчные", "Lowercase")]
        public string Lowercase
        {
        	get { return "a"; }
        }

        [ContextProperty("Число", "Number")]
        public string Number
        {
        	get { return "1"; }
        }
    }
}
