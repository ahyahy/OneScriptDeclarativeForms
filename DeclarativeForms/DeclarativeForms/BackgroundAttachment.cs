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
    [ContextClass("ДфФоновоеВложение", "DfBackgroundAttachment")]
    public class DfBackgroundAttachment : AutoContext<DfBackgroundAttachment>, ICollectionContext, IEnumerable<IValue>
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

        public DfBackgroundAttachment()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Local));
            _list.Add(ValueFactory.Create(Scroll));
            _list.Add(ValueFactory.Create(Fixed));
        }

        [ContextProperty("Локально", "Local")]
        public string Local
        {
        	get { return "local"; }
        }

        [ContextProperty("Прокрутка", "Scroll")]
        public string Scroll
        {
        	get { return "scroll"; }
        }

        [ContextProperty("Фиксировано", "Fixed")]
        public string Fixed
        {
        	get { return "fixed"; }
        }
    }
}
