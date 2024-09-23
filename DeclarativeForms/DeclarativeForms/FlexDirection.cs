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
    [ContextClass("ДфНаправлениеЭлементов", "DfFlexDirection")]
    public class DfFlexDirection : AutoContext<DfFlexDirection>, ICollectionContext, IEnumerable<IValue>
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

        public DfFlexDirection()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Column));
            _list.Add(ValueFactory.Create(ColumnReverse));
            _list.Add(ValueFactory.Create(Row));
            _list.Add(ValueFactory.Create(RowReverse));
        }

        [ContextProperty("Колонка", "Column")]
        public string Column
        {
        	get { return "column"; }
        }

        [ContextProperty("КолонкаОбратно", "ColumnReverse")]
        public string ColumnReverse
        {
        	get { return "column-reverse"; }
        }

        [ContextProperty("Строка", "Row")]
        public string Row
        {
        	get { return "row"; }
        }

        [ContextProperty("СтрокаОбратно", "RowReverse")]
        public string RowReverse
        {
        	get { return "row-reverse"; }
        }
    }
}
