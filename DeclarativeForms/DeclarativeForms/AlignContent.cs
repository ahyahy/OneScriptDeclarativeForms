using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфВыравниваниеСодержимого", "DfAlignContent")]
    public class DfAlignContent : AutoContext<DfAlignContent>, ICollectionContext, IEnumerable<IValue>
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

        public DfAlignContent()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(FlexEnd));
            _list.Add(ValueFactory.Create(FlexStart));
            _list.Add(ValueFactory.Create(SpaceAround));
            _list.Add(ValueFactory.Create(SpaceBetween));
            _list.Add(ValueFactory.Create(Stretch));
            _list.Add(ValueFactory.Create(Center));
        }

        [ContextProperty("ГибкийВконце", "FlexEnd")]
        public string FlexEnd
        {
        	get { return "flex-end"; }
        }

        [ContextProperty("ГибкийВначале", "FlexStart")]
        public string FlexStart
        {
        	get { return "flex-start"; }
        }

        [ContextProperty("ПробелВокруг", "SpaceAround")]
        public string SpaceAround
        {
        	get { return "space-around"; }
        }

        [ContextProperty("ПробелМежду", "SpaceBetween")]
        public string SpaceBetween
        {
        	get { return "space-between"; }
        }

        [ContextProperty("Растянуто", "Stretch")]
        public string Stretch
        {
        	get { return "stretch"; }
        }

        [ContextProperty("Центр", "Center")]
        public string Center
        {
        	get { return "center"; }
        }
    }
}
