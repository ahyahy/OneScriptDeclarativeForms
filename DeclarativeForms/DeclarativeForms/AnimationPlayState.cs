using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфСостояние", "DfAnimationPlayState")]
    public class DfAnimationPlayState : AutoContext<DfAnimationPlayState>, ICollectionContext, IEnumerable<IValue>
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

        public DfAnimationPlayState()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Running));
            _list.Add(ValueFactory.Create(Paused));
        }

        [ContextProperty("Запущена", "Running")]
        public string Running
        {
        	get { return "running"; }
        }

        [ContextProperty("Остановлена", "Paused")]
        public string Paused
        {
        	get { return "paused"; }
        }
    }
}
