using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфПовторШаблона", "DfPatternRepeat")]
    public class DfPatternRepeat : AutoContext<DfPatternRepeat>, ICollectionContext, IEnumerable<IValue>
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

        public DfPatternRepeat()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(NoRepeat));
            _list.Add(ValueFactory.Create(Repeat));
            _list.Add(ValueFactory.Create(RepeatY));
            _list.Add(ValueFactory.Create(RepeatX));
        }

        [ContextProperty("НеПовторять", "NoRepeat")]
        public string NoRepeat
        {
        	get { return "no-repeat"; }
        }

        [ContextProperty("Повторять", "Repeat")]
        public string Repeat
        {
        	get { return "repeat"; }
        }

        [ContextProperty("ПовторятьВертикально", "RepeatY")]
        public string RepeatY
        {
        	get { return "repeat-y"; }
        }

        [ContextProperty("ПовторятьГоризонтально", "RepeatX")]
        public string RepeatX
        {
        	get { return "repeat-x"; }
        }
    }
}
