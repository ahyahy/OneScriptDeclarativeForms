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
    [ContextClass("ДфВыравниваниеОтдельных", "DfAlignSelf")]
    public class DfAlignSelf : AutoContext<DfAlignSelf>, ICollectionContext, IEnumerable<IValue>
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

        public DfAlignSelf()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Auto));
            _list.Add(ValueFactory.Create(BaseLine));
            _list.Add(ValueFactory.Create(FlexEnd));
            _list.Add(ValueFactory.Create(FlexStart));
            _list.Add(ValueFactory.Create(Stretch));
            _list.Add(ValueFactory.Create(Center));
        }

        [ContextProperty("Авто", "Auto")]
        public string Auto
        {
        	get { return "auto"; }
        }

        [ContextProperty("БазоваяЛиния", "BaseLine")]
        public string BaseLine
        {
        	get { return "baseline"; }
        }

        [ContextProperty("ГибкийВконце", "FlexEnd")]
        public string FlexEnd
        {
        	get { return "flex-end"; }
        }

        [ContextProperty("ГибкийВначале", "FlexStart")]
        public string FlexStart
        {
        	get { return "flex-start"; }
        }

        [ContextProperty("Растянуто", "Stretch")]
        public string Stretch
        {
        	get { return "stretch"; }
        }

        [ContextProperty("Центр", "Center")]
        public string Center
        {
        	get { return "center"; }
        }
    }
}
