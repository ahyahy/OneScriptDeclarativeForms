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
    [ContextClass("ДфГоризонтальноеВыравнивание", "DfCssFloat")]
    public class DfCssFloat : AutoContext<DfCssFloat>, ICollectionContext, IEnumerable<IValue>
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

        public DfCssFloat()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Right));
        }

        [ContextProperty("Лево", "Left")]
        public string Left
        {
        	get { return "left"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Право", "Right")]
        public string Right
        {
        	get { return "right"; }
        }
    }
}
