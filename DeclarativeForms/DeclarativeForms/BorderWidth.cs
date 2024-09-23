using ScriptEngine.HostedScript.Library.Binary;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System;

namespace osdf
{
    [ContextClass("ДфШиринаГраницы", "DfBorderWidth")]
    public class DfBorderWidth : AutoContext<DfBorderWidth>, ICollectionContext, IEnumerable<IValue>
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

        public DfBorderWidth()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Medium));
            _list.Add(ValueFactory.Create(Thick));
            _list.Add(ValueFactory.Create(Thin));
        }

        [ContextProperty("Средняя", "Medium")]
        public string Medium
        {
        	get { return "medium"; }
        }

        [ContextProperty("Толстая", "Thick")]
        public string Thick
        {
        	get { return "thick"; }
        }

        [ContextProperty("Тонкая", "Thin")]
        public string Thin
        {
        	get { return "thin"; }
        }
    }
}
