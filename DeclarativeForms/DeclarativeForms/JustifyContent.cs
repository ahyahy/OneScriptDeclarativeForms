﻿using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфРасположениеСодержимого", "DfJustifyContent")]
    public class DfJustifyContent : AutoContext<DfJustifyContent>, ICollectionContext, IEnumerable<IValue>
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

        public DfJustifyContent()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(FlexEnd));
            _list.Add(ValueFactory.Create(FlexStart));
            _list.Add(ValueFactory.Create(SpaceAround));
            _list.Add(ValueFactory.Create(Center));
            _list.Add(ValueFactory.Create(SpaceBetween));
        }

        [ContextProperty("Вконце", "FlexEnd")]
        public string FlexEnd
        {
        	get { return "flex-end"; }
        }

        [ContextProperty("ВНачале", "FlexStart")]
        public string FlexStart
        {
        	get { return "flex-start"; }
        }

        [ContextProperty("Вокруг", "SpaceAround")]
        public string SpaceAround
        {
        	get { return "space-around"; }
        }

        [ContextProperty("Вцентре", "Center")]
        public string Center
        {
        	get { return "center"; }
        }

        [ContextProperty("Между", "SpaceBetween")]
        public string SpaceBetween
        {
        	get { return "space-between"; }
        }
    }
}
