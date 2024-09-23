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
    [ContextClass("ДфПоложениеКартинки", "DfBackgroundPosition")]
    public class DfBackgroundPosition : AutoContext<DfBackgroundPosition>, ICollectionContext, IEnumerable<IValue>
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

        public DfBackgroundPosition()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(TopLeft));
            _list.Add(ValueFactory.Create(TopRight));
            _list.Add(ValueFactory.Create(TopCenter));
            _list.Add(ValueFactory.Create(BottomLeft));
            _list.Add(ValueFactory.Create(BottomRight));
            _list.Add(ValueFactory.Create(BottomCenter));
            _list.Add(ValueFactory.Create(CenterLeft));
            _list.Add(ValueFactory.Create(CenterRight));
            _list.Add(ValueFactory.Create(CenterCenter));
        }

        [ContextProperty("ВерхЛево", "TopLeft")]
        public string TopLeft
        {
        	get { return "top left"; }
        }

        [ContextProperty("ВерхПраво", "TopRight")]
        public string TopRight
        {
        	get { return "top right"; }
        }

        [ContextProperty("ВерхЦентр", "TopCenter")]
        public string TopCenter
        {
        	get { return "top center"; }
        }

        [ContextProperty("НизЛево", "BottomLeft")]
        public string BottomLeft
        {
        	get { return "bottom left"; }
        }

        [ContextProperty("НизПраво", "BottomRight")]
        public string BottomRight
        {
        	get { return "bottom right"; }
        }

        [ContextProperty("НизЦентр", "BottomCenter")]
        public string BottomCenter
        {
        	get { return "bottom center"; }
        }

        [ContextProperty("ЦентрЛево", "CenterLeft")]
        public string CenterLeft
        {
        	get { return "center left"; }
        }

        [ContextProperty("ЦентрПраво", "CenterRight")]
        public string CenterRight
        {
        	get { return "center right"; }
        }

        [ContextProperty("ЦентрЦентр", "CenterCenter")]
        public string CenterCenter
        {
        	get { return "center center"; }
        }
    }
}
