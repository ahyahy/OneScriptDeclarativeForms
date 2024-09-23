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
    [ContextClass("ДфРазрывСтраницыДо", "DfPageBreakBefore")]
    public class DfPageBreakBefore : AutoContext<DfPageBreakBefore>, ICollectionContext, IEnumerable<IValue>
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

        public DfPageBreakBefore()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Auto));
            _list.Add(ValueFactory.Create(Always));
            _list.Add(ValueFactory.Create(Left));
            _list.Add(ValueFactory.Create(Right));
            _list.Add(ValueFactory.Create(Avoid));
            _list.Add(ValueFactory.Create(EmptyString));
        }

        [ContextProperty("Авто", "Auto")]
        public string Auto
        {
        	get { return "auto"; }
        }

        [ContextProperty("Всегда", "Always")]
        public string Always
        {
        	get { return "always"; }
        }

        [ContextProperty("Лево", "Left")]
        public string Left
        {
        	get { return "left"; }
        }

        [ContextProperty("Право", "Right")]
        public string Right
        {
        	get { return "right"; }
        }

        [ContextProperty("Предотвратить", "Avoid")]
        public string Avoid
        {
        	get { return "avoid"; }
        }

        [ContextProperty("ПустаяСтрока", "EmptyString")]
        public string EmptyString
        {
        	get { return "empty string"; }
        }
    }
}
