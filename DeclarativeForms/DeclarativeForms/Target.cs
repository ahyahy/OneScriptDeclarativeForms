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
    [ContextClass("ДфНазначение", "DfTarget")]
    public class DfTarget : AutoContext<DfTarget>, ICollectionContext, IEnumerable<IValue>
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

        public DfTarget()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Blank));
            _list.Add(ValueFactory.Create(Top));
            _list.Add(ValueFactory.Create(Parent));
            _list.Add(ValueFactory.Create(FrameName));
            _list.Add(ValueFactory.Create(Self));
        }

        [ContextProperty("Новое", "Blank")]
        public string Blank
        {
        	get { return "_blank"; }
        }

        [ContextProperty("Развернуто", "Top")]
        public string Top
        {
        	get { return "_top"; }
        }

        [ContextProperty("Родитель", "Parent")]
        public string Parent
        {
        	get { return "_parent"; }
        }

        [ContextProperty("Фрейм", "FrameName")]
        public string FrameName
        {
        	get { return "framename"; }
        }

        [ContextProperty("ЭтоОкно", "Self")]
        public string Self
        {
        	get { return "_self"; }
        }
    }
}
