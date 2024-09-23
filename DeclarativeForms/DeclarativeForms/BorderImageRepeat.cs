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
    [ContextClass("ДфМозаикаКартинкиГраницы", "DfBorderImageRepeat")]
    public class DfBorderImageRepeat : AutoContext<DfBorderImageRepeat>, ICollectionContext, IEnumerable<IValue>
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

        public DfBorderImageRepeat()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Round));
            _list.Add(ValueFactory.Create(Space));
            _list.Add(ValueFactory.Create(Repeat));
            _list.Add(ValueFactory.Create(Stretch));
        }

        [ContextProperty("Закруглять", "Round")]
        public string Round
        {
        	get { return "round"; }
        }

        [ContextProperty("Интервалы", "Space")]
        public string Space
        {
        	get { return "space"; }
        }

        [ContextProperty("Повторять", "Repeat")]
        public string Repeat
        {
        	get { return "repeat"; }
        }

        [ContextProperty("Растянуто", "Stretch")]
        public string Stretch
        {
        	get { return "stretch"; }
        }
    }
}
