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
    [ContextClass("ДфЖирностьШрифта", "DfFontWeight")]
    public class DfFontWeight : AutoContext<DfFontWeight>, ICollectionContext, IEnumerable<IValue>
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

        public DfFontWeight()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Bolder));
            _list.Add(ValueFactory.Create(Bold));
            _list.Add(ValueFactory.Create(Lighter));
            _list.Add(ValueFactory.Create(Normal));
        }

        [ContextProperty("БолееЖирный", "Bolder")]
        public string Bolder
        {
        	get { return "bolder"; }
        }

        [ContextProperty("Жирный", "Bold")]
        public string Bold
        {
        	get { return "bold"; }
        }

        [ContextProperty("МенееЖирный", "Lighter")]
        public string Lighter
        {
        	get { return "lighter"; }
        }

        [ContextProperty("Нормальный", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }
    }
}
