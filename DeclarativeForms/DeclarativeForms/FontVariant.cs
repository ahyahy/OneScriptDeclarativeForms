﻿using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфВариантШрифта", "DfFontVariant")]
    public class DfFontVariant : AutoContext<DfFontVariant>, ICollectionContext, IEnumerable<IValue>
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

        public DfFontVariant()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(SmallCaps));
            _list.Add(ValueFactory.Create(Normal));
        }

        [ContextProperty("МаленькиеЗаглавные", "SmallCaps")]
        public string SmallCaps
        {
        	get { return "small-caps"; }
        }

        [ContextProperty("Нормальный", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }
    }
}
