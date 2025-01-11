using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфОбластьРисования", "DfBackgroundClip")]
    public class DfBackgroundClip : AutoContext<DfBackgroundClip>, ICollectionContext, IEnumerable<IValue>
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

        public DfBackgroundClip()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(PaddingBox));
            _list.Add(ValueFactory.Create(BorderBox));
            _list.Add(ValueFactory.Create(ContentBox));
        }

        [ContextProperty("Заполнение", "PaddingBox")]
        public string PaddingBox
        {
        	get { return "padding-box"; }
        }

        [ContextProperty("Рамка", "BorderBox")]
        public string BorderBox
        {
        	get { return "border-box"; }
        }

        [ContextProperty("Содержимое", "ContentBox")]
        public string ContentBox
        {
        	get { return "content-box"; }
        }
    }
}
