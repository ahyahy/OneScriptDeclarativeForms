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
    [ContextClass("ДфРазмерКартинки", "DfBackgroundSize")]
    public class DfBackgroundSize : AutoContext<DfBackgroundSize>, ICollectionContext, IEnumerable<IValue>
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

        public DfBackgroundSize()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Auto));
            _list.Add(ValueFactory.Create(Contain));
            _list.Add(ValueFactory.Create(Cover));
        }

        [ContextProperty("Авто", "Auto")]
        public string Auto
        {
        	get { return "auto"; }
        }

        [ContextProperty("Вместить", "Contain")]
        public string Contain
        {
        	get { return "contain"; }
        }

        [ContextProperty("Накрыть", "Cover")]
        public string Cover
        {
        	get { return "cover"; }
        }
    }
}
