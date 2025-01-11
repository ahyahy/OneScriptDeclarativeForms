using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфФункцияПерехода", "DfTransitionTimingFunction")]
    public class DfTransitionTimingFunction : AutoContext<DfTransitionTimingFunction>, ICollectionContext, IEnumerable<IValue>
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

        public DfTransitionTimingFunction()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Linear));
            _list.Add(ValueFactory.Create(Ease));
            _list.Add(ValueFactory.Create(EaseOut));
            _list.Add(ValueFactory.Create(EaseIn));
            _list.Add(ValueFactory.Create(EaseInOut));
        }

        [ContextProperty("Линейно", "Linear")]
        public string Linear
        {
        	get { return "linear"; }
        }

        [ContextProperty("Медленно", "Ease")]
        public string Ease
        {
        	get { return "ease"; }
        }

        [ContextProperty("МедленноВконце", "EaseOut")]
        public string EaseOut
        {
        	get { return "ease-out"; }
        }

        [ContextProperty("МедленноВначале", "EaseIn")]
        public string EaseIn
        {
        	get { return "ease-in"; }
        }

        [ContextProperty("МедленноВначалеВконце", "EaseInOut")]
        public string EaseInOut
        {
        	get { return "ease-in-out"; }
        }
    }
}
