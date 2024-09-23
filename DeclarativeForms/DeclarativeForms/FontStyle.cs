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
    [ContextClass("ДфСтильШрифта", "DfFontStyle")]
    public class DfFontStyle : AutoContext<DfFontStyle>, ICollectionContext, IEnumerable<IValue>
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

        public DfFontStyle()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Italic));
            _list.Add(ValueFactory.Create(Oblique));
            _list.Add(ValueFactory.Create(Normal));
        }

        [ContextProperty("Курсив", "Italic")]
        public string Italic
        {
        	get { return "italic"; }
        }

        [ContextProperty("Наклонный", "Oblique")]
        public string Oblique
        {
        	get { return "oblique"; }
        }

        [ContextProperty("Нормальный", "Normal")]
        public string Normal
        {
        	get { return "normal"; }
        }
    }
}
