using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфВписываниеОбъекта", "DfObjectFit")]
    public class DfObjectFit : AutoContext<DfObjectFit>, ICollectionContext, IEnumerable<IValue>
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

        public DfObjectFit()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Contain));
            _list.Add(ValueFactory.Create(Fill));
            _list.Add(ValueFactory.Create(ScaleDown));
            _list.Add(ValueFactory.Create(Cover));
            _list.Add(ValueFactory.Create(None));
        }

        [ContextProperty("Вместить", "Contain")]
        public string Contain
        {
        	get { return "contain"; }
        }

        [ContextProperty("Заполнение", "Fill")]
        public string Fill
        {
        	get { return "fill"; }
        }

        [ContextProperty("Масштабировать", "ScaleDown")]
        public string ScaleDown
        {
        	get { return "scale-down"; }
        }

        [ContextProperty("Накрыть", "Cover")]
        public string Cover
        {
        	get { return "cover"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }
    }
}
