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
    [ContextClass("ДфФункцияСинхронизации", "DfAnimationTimingFunction")]
    public class DfAnimationTimingFunction : AutoContext<DfAnimationTimingFunction>, ICollectionContext, IEnumerable<IValue>
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

        public DfAnimationTimingFunction()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(CubicBezier));
            _list.Add(ValueFactory.Create(Linear));
            _list.Add(ValueFactory.Create(Ease));
            _list.Add(ValueFactory.Create(EaseOut));
            _list.Add(ValueFactory.Create(EaseIn));
            _list.Add(ValueFactory.Create(EaseInOut));
        }

        [ContextProperty("БезьеКуб", "CubicBezier")]
        public string CubicBezier
        {
        	get { return "cubic-bezier"; }
        }

        [ContextProperty("Линейно", "Linear")]
        public string Linear
        {
        	get { return "linear"; }
        }

        [ContextProperty("Медленно", "Ease")]
        public string Ease
        {
        	get { return "ease"; }
        }

        [ContextProperty("МедленноВконце", "EaseOut")]
        public string EaseOut
        {
        	get { return "ease-out"; }
        }

        [ContextProperty("МедленноВначале", "EaseIn")]
        public string EaseIn
        {
        	get { return "ease-in"; }
        }

        [ContextProperty("МедленноВначалеВконце", "EaseInOut")]
        public string EaseInOut
        {
        	get { return "ease-in-out"; }
        }
    }
}
