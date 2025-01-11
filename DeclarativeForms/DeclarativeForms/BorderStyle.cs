using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфСтильГраницы", "DfBorderStyle")]
    public class DfBorderStyle : AutoContext<DfBorderStyle>, ICollectionContext, IEnumerable<IValue>
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

        public DfBorderStyle()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Inset));
            _list.Add(ValueFactory.Create(Double));
            _list.Add(ValueFactory.Create(Outset));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Ridge));
            _list.Add(ValueFactory.Create(Hidden));
            _list.Add(ValueFactory.Create(Solid));
            _list.Add(ValueFactory.Create(Dotted));
            _list.Add(ValueFactory.Create(Groove));
            _list.Add(ValueFactory.Create(Dashed));
        }

        [ContextProperty("Граница", "Inset")]
        public string Inset
        {
        	get { return "inset"; }
        }

        [ContextProperty("Двойная", "Double")]
        public string Double
        {
        	get { return "double"; }
        }

        [ContextProperty("НачальнаяГраница", "Outset")]
        public string Outset
        {
        	get { return "outset"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Ребристая", "Ridge")]
        public string Ridge
        {
        	get { return "ridge"; }
        }

        [ContextProperty("Скрыто", "Hidden")]
        public string Hidden
        {
        	get { return "hidden"; }
        }

        [ContextProperty("Сплошная", "Solid")]
        public string Solid
        {
        	get { return "solid"; }
        }

        [ContextProperty("ТочкаПробел", "Dotted")]
        public string Dotted
        {
        	get { return "dotted"; }
        }

        [ContextProperty("Трехмерная", "Groove")]
        public string Groove
        {
        	get { return "groove"; }
        }

        [ContextProperty("ЧертаПробел", "Dashed")]
        public string Dashed
        {
        	get { return "dashed"; }
        }
    }
}
