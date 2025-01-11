using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфНесвободно", "DfClear")]
    public class DfClear : AutoContext<DfClear>, ICollectionContext, IEnumerable<IValue>
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

        public DfClear()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(Both));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Right));
        }

        [ContextProperty("Лево", "Left")]
        public string Left
        {
        	get { return "left"; }
        }

        [ContextProperty("ЛевоПраво", "Both")]
        public string Both
        {
        	get { return "both"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Право", "Right")]
        public string Right
        {
        	get { return "right"; }
        }
    }
}
