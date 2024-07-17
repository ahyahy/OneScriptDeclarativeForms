using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections;
using System.Collections.Generic;

namespace osdf
{
    [ContextClass("ДфПозицияФормы", "DfFormPosition")]
    public class DfFormPosition : AutoContext<DfFormPosition>, ICollectionContext, IEnumerable<IValue>
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

        public DfFormPosition()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Mouse));
            _list.Add(ValueFactory.Create(NotSet));
            _list.Add(ValueFactory.Create(Center));
        }

        [ContextProperty("Мышь", "Mouse")]
        public string Mouse
        {
            get { return "mouse"; }
        }

        [ContextProperty("НеУстановлено", "NotSet")]
        public string NotSet
        {
            get { return "null"; }
        }

        [ContextProperty("Центр", "Center")]
        public string Center
        {
            get { return "center"; }
        }
    }
}
