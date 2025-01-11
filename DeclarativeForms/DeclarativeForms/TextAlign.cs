using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфВыравниваниеТекста", "DfTextAlign")]
    public class DfTextAlign : AutoContext<DfTextAlign>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextAlign()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(End));
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(Start));
            _list.Add(ValueFactory.Create(Right));
            _list.Add(ValueFactory.Create(Center));
        }

        [ContextProperty("Конец", "End")]
        public string End
        {
        	get { return "end"; }
        }

        [ContextProperty("Лево", "Left")]
        public string Left
        {
        	get { return "left"; }
        }

        [ContextProperty("Начало", "Start")]
        public string Start
        {
        	get { return "start"; }
        }

        [ContextProperty("Право", "Right")]
        public string Right
        {
        	get { return "right"; }
        }

        [ContextProperty("Центр", "Center")]
        public string Center
        {
        	get { return "center"; }
        }
    }
}
