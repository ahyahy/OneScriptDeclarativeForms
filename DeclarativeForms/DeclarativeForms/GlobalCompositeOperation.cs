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
    [ContextClass("ДфКомпозиция", "DfGlobalCompositeOperation")]
    public class DfGlobalCompositeOperation : AutoContext<DfGlobalCompositeOperation>, ICollectionContext, IEnumerable<IValue>
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

        public DfGlobalCompositeOperation()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Copy));
            _list.Add(ValueFactory.Create(SourceIn));
            _list.Add(ValueFactory.Create(SourceOut));
            _list.Add(ValueFactory.Create(SourceOver));
            _list.Add(ValueFactory.Create(SourceAtop));
            _list.Add(ValueFactory.Create(Xor));
            _list.Add(ValueFactory.Create(Lighter));
            _list.Add(ValueFactory.Create(DestinationIn));
            _list.Add(ValueFactory.Create(DestinationOut));
            _list.Add(ValueFactory.Create(DestinationOver));
            _list.Add(ValueFactory.Create(DestinationAtop));
        }

        [ContextProperty("Новое", "Copy")]
        public string Copy
        {
        	get { return "copy"; }
        }

        [ContextProperty("НовоеВ", "SourceIn")]
        public string SourceIn
        {
        	get { return "source-in"; }
        }

        [ContextProperty("НовоеВне", "SourceOut")]
        public string SourceOut
        {
        	get { return "source-out"; }
        }

        [ContextProperty("НовоеНад", "SourceOver")]
        public string SourceOver
        {
        	get { return "source-over"; }
        }

        [ContextProperty("НовоеПоверх", "SourceAtop")]
        public string SourceAtop
        {
        	get { return "source-atop"; }
        }

        [ContextProperty("Объединить", "Xor")]
        public string Xor
        {
        	get { return "xor"; }
        }

        [ContextProperty("Совместно", "Lighter")]
        public string Lighter
        {
        	get { return "lighter"; }
        }

        [ContextProperty("СуществующееВ", "DestinationIn")]
        public string DestinationIn
        {
        	get { return "destination-in"; }
        }

        [ContextProperty("СуществующееВне", "DestinationOut")]
        public string DestinationOut
        {
        	get { return "destination-out"; }
        }

        [ContextProperty("СуществующееНад", "DestinationOver")]
        public string DestinationOver
        {
        	get { return "destination-over"; }
        }

        [ContextProperty("СуществующееПоверх", "DestinationAtop")]
        public string DestinationAtop
        {
        	get { return "destination-atop"; }
        }
    }
}
