using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфНаправлениеАнимации", "DfAnimationDirection")]
    public class DfAnimationDirection : AutoContext<DfAnimationDirection>, ICollectionContext, IEnumerable<IValue>
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

        public DfAnimationDirection()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Reverse));
            _list.Add(ValueFactory.Create(Normal));
            _list.Add(ValueFactory.Create(Alternate));
            _list.Add(ValueFactory.Create(AlternateReverse));
        }

        [ContextProperty("Обратно", "Reverse")]
        public string Reverse
        {
        	get { return "reverse"; }
        }

        [ContextProperty("Стандартно", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }

        [ContextProperty("Чередовать", "Alternate")]
        public string Alternate
        {
        	get { return "alternate"; }
        }

        [ContextProperty("ЧередоватьОбратно", "AlternateReverse")]
        public string AlternateReverse
        {
        	get { return "alternate-reverse"; }
        }
    }
}
