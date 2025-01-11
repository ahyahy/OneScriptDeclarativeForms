﻿using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфКалибровка", "DfBoxSizing")]
    public class DfBoxSizing : AutoContext<DfBoxSizing>, ICollectionContext, IEnumerable<IValue>
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

        public DfBoxSizing()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(BorderBox));
            _list.Add(ValueFactory.Create(ContentBox));
        }

        [ContextProperty("Границы", "BorderBox")]
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
