using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфЗаливкаАнимации", "DfAnimationFillMode")]
    public class DfAnimationFillMode : AutoContext<DfAnimationFillMode>, ICollectionContext, IEnumerable<IValue>
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

        public DfAnimationFillMode()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Forwards));
            _list.Add(ValueFactory.Create(Both));
            _list.Add(ValueFactory.Create(Backwards));
            _list.Add(ValueFactory.Create(None));
        }

        [ContextProperty("Вперед", "Forwards")]
        public string Forwards
        {
        	get { return "forwards"; }
        }

        [ContextProperty("ВпередНазад", "Both")]
        public string Both
        {
        	get { return "both"; }
        }

        [ContextProperty("Назад", "Backwards")]
        public string Backwards
        {
        	get { return "backwards"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }
    }
}
