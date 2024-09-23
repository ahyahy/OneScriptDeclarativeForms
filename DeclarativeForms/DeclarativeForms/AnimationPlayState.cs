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
    [ContextClass("ДфПауза", "DfAnimationPlayState")]
    public class DfAnimationPlayState : AutoContext<DfAnimationPlayState>, ICollectionContext, IEnumerable<IValue>
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

        public DfAnimationPlayState()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Running));
            _list.Add(ValueFactory.Create(Paused));
        }

        [ContextProperty("Запущена", "Running")]
        public string Running
        {
        	get { return "running"; }
        }

        [ContextProperty("Остановлена", "Paused")]
        public string Paused
        {
        	get { return "paused"; }
        }
    }
}
