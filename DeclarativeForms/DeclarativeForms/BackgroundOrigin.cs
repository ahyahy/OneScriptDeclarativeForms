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
    [ContextClass("ДфОбластьКартинки", "DfBackgroundOrigin")]
    public class DfBackgroundOrigin : AutoContext<DfBackgroundOrigin>, ICollectionContext, IEnumerable<IValue>
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

        public DfBackgroundOrigin()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(PaddingBox));
            _list.Add(ValueFactory.Create(BorderBox));
            _list.Add(ValueFactory.Create(ContentBox));
        }

        [ContextProperty("Заполнение", "PaddingBox")]
        public string PaddingBox
        {
        	get { return "border-box"; }
        }

        [ContextProperty("Рамка", "BorderBox")]
        public string BorderBox
        {
        	get { return "padding-box"; }
        }

        [ContextProperty("Содержимое", "ContentBox")]
        public string ContentBox
        {
        	get { return "content-box"; }
        }
    }
}
