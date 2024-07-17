using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections;
using System.Collections.Generic;

namespace osdf
{
    [ContextClass("ДфТипЭлементаМеню", "DfMenuItemType")]
    public class DfMenuItemType : AutoContext<DfMenuItemType>, ICollectionContext, IEnumerable<IValue>
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

        public DfMenuItemType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Separator));
            _list.Add(ValueFactory.Create(Normal));
            _list.Add(ValueFactory.Create(Checkbox));
        }

        [ContextProperty("Разделитель", "Separator")]
        public string Separator
        {
            get { return "separator"; }
        }

        [ContextProperty("Стандартный", "Normal")]
        public string Normal
        {
            get { return "normal"; }
        }

        [ContextProperty("Флажок", "Checkbox")]
        public string Checkbox
        {
            get { return "checkbox"; }
        }
    }
}
