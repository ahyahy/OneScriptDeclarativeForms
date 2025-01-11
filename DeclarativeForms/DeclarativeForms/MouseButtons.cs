using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфКнопкиМыши", "DfMouseButtons")]
    public class DfMouseButtons : AutoContext<DfMouseButtons>, ICollectionContext, IEnumerable<IValue>
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

        public DfMouseButtons()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(Right));
            _list.Add(ValueFactory.Create(Middle));
        }

        [ContextProperty("Левая", "Left")]
        public string Left
        {
        	get { return "left"; }
        }

        [ContextProperty("Правая", "Right")]
        public string Right
        {
        	get { return "right"; }
        }

        [ContextProperty("Средняя", "Middle")]
        public string Middle
        {
        	get { return "middle"; }
        }
    }
}
