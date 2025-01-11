using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфВертикальноеВыравнивание", "DfVerticalAlign")]
    public class DfVerticalAlign : AutoContext<DfVerticalAlign>, ICollectionContext, IEnumerable<IValue>
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

        public DfVerticalAlign()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Baseline));
            _list.Add(ValueFactory.Create(Top));
            _list.Add(ValueFactory.Create(TextTop));
            _list.Add(ValueFactory.Create(Bottom));
            _list.Add(ValueFactory.Create(TextBottom));
            _list.Add(ValueFactory.Create(Super));
            _list.Add(ValueFactory.Create(Sub));
            _list.Add(ValueFactory.Create(Middle));
        }

        [ContextProperty("БазоваяЛиния", "Baseline")]
        public string Baseline
        {
        	get { return "baseline"; }
        }

        [ContextProperty("Верх", "Top")]
        public string Top
        {
        	get { return "top"; }
        }

        [ContextProperty("ВерхТекста", "TextTop")]
        public string TextTop
        {
        	get { return "text-top"; }
        }

        [ContextProperty("Низ", "Bottom")]
        public string Bottom
        {
        	get { return "bottom"; }
        }

        [ContextProperty("НизТекста", "TextBottom")]
        public string TextBottom
        {
        	get { return "text-bottom"; }
        }

        [ContextProperty("ПоВерху", "Super")]
        public string Super
        {
        	get { return "super"; }
        }

        [ContextProperty("ПоНизу", "Sub")]
        public string Sub
        {
        	get { return "sub"; }
        }

        [ContextProperty("Середина", "Middle")]
        public string Middle
        {
        	get { return "middle"; }
        }
    }
}
