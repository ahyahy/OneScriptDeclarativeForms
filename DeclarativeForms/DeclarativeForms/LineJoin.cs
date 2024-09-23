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
    [ContextClass("ДфСтильУглаПересечения", "DfLineJoin")]
    public class DfLineJoin : AutoContext<DfLineJoin>, ICollectionContext, IEnumerable<IValue>
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

        public DfLineJoin()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Round));
            _list.Add(ValueFactory.Create(Miter));
            _list.Add(ValueFactory.Create(Bevel));
        }

        [ContextProperty("Круг", "Round")]
        public string Round
        {
        	get { return "round"; }
        }

        [ContextProperty("Острый", "Miter")]
        public string Miter
        {
        	get { return "miter"; }
        }

        [ContextProperty("Скос", "Bevel")]
        public string Bevel
        {
        	get { return "bevel"; }
        }
    }
}
