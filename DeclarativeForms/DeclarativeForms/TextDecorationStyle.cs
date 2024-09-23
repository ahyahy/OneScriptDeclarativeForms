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
    [ContextClass("ДфОформлениеТекстаСтиль", "DfTextDecorationStyle")]
    public class DfTextDecorationStyle : AutoContext<DfTextDecorationStyle>, ICollectionContext, IEnumerable<IValue>
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

        public DfTextDecorationStyle()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Wavy));
            _list.Add(ValueFactory.Create(Double));
            _list.Add(ValueFactory.Create(Solid));
            _list.Add(ValueFactory.Create(Dotted));
            _list.Add(ValueFactory.Create(Dashed));
        }

        [ContextProperty("Волнистая", "Wavy")]
        public string Wavy
        {
        	get { return "wavy"; }
        }

        [ContextProperty("Двойная", "Double")]
        public string Double
        {
        	get { return "double"; }
        }

        [ContextProperty("Сплошная", "Solid")]
        public string Solid
        {
        	get { return "solid"; }
        }

        [ContextProperty("ТочкаПробел", "Dotted")]
        public string Dotted
        {
        	get { return "dotted"; }
        }

        [ContextProperty("ЧертаПробел", "Dashed")]
        public string Dashed
        {
        	get { return "dashed"; }
        }
    }
}
