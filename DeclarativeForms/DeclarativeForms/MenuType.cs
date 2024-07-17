using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections;
using System.Collections.Generic;

namespace osdf
{
    [ContextClass("ДфТипМеню", "DfMenuType")]
    public class DfMenuType : AutoContext<DfMenuType>, ICollectionContext, IEnumerable<IValue>
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

        public DfMenuType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Menubar));
            _list.Add(ValueFactory.Create(Contextmenu));
            _list.Add(ValueFactory.Create(None));
        }

        [ContextProperty("Главное", "Menubar")]
        public string Menubar
        {
            get { return "menubar"; }
        }

        [ContextProperty("Контекстное", "Contextmenu")]
        public string Contextmenu
        {
            get { return "contextmenu"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
            get { return "none"; }
        }
    }
}
