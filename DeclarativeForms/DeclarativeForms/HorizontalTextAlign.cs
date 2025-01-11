using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфГоризонтальноеВыравниваниеТекста", "DfHorizontalTextAlign")]
    public class DfHorizontalTextAlign : AutoContext<DfHorizontalTextAlign>, ICollectionContext, IEnumerable<IValue>
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

        public DfHorizontalTextAlign()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Justify));
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(Right));
            _list.Add(ValueFactory.Create(Center));
        }

        [ContextProperty("Выровнен", "Justify")]
        public string Justify
        {
        	get { return "justify"; }
        }

        [ContextProperty("Лево", "Left")]
        public string Left
        {
        	get { return "left"; }
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
