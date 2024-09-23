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
    [ContextClass("ДфОтображать", "DfDisplay")]
    public class DfDisplay : AutoContext<DfDisplay>, ICollectionContext, IEnumerable<IValue>
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

        public DfDisplay()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Block));
            _list.Add(ValueFactory.Create(Inline));
            _list.Add(ValueFactory.Create(InlineBlock));
            _list.Add(ValueFactory.Create(InlineFlex));
            _list.Add(ValueFactory.Create(InlineGrid));
            _list.Add(ValueFactory.Create(ListItem));
            _list.Add(ValueFactory.Create(InlineTable));
            _list.Add(ValueFactory.Create(Flex));
            _list.Add(ValueFactory.Create(TableColumnGroup));
            _list.Add(ValueFactory.Create(TableRowGroup));
            _list.Add(ValueFactory.Create(TableCaption));
            _list.Add(ValueFactory.Create(TableColumn));
            _list.Add(ValueFactory.Create(Compact));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Grid));
            _list.Add(ValueFactory.Create(TableHeaderGroup));
            _list.Add(ValueFactory.Create(TableFooterGroup));
            _list.Add(ValueFactory.Create(TableRow));
            _list.Add(ValueFactory.Create(Table));
            _list.Add(ValueFactory.Create(TableCell));
        }

        [ContextProperty("Блок", "Block")]
        public string Block
        {
        	get { return "block"; }
        }

        [ContextProperty("Встроенный", "Inline")]
        public string Inline
        {
        	get { return "inline"; }
        }

        [ContextProperty("ВстроенныйБлок", "InlineBlock")]
        public string InlineBlock
        {
        	get { return "inline-block"; }
        }

        [ContextProperty("ВстроенныйГибкий", "InlineFlex")]
        public string InlineFlex
        {
        	get { return "inline-flex"; }
        }

        [ContextProperty("ВстроенныйСетка", "InlineGrid")]
        public string InlineGrid
        {
        	get { return "inline-grid"; }
        }

        [ContextProperty("ВстроенныйСписок", "ListItem")]
        public string ListItem
        {
        	get { return "list-item"; }
        }

        [ContextProperty("ВстроенныйТаблица", "InlineTable")]
        public string InlineTable
        {
        	get { return "inline-table"; }
        }

        [ContextProperty("Гибкий", "Flex")]
        public string Flex
        {
        	get { return "flex"; }
        }

        [ContextProperty("ГруппаКолонок", "TableColumnGroup")]
        public string TableColumnGroup
        {
        	get { return "table-column-group"; }
        }

        [ContextProperty("ГруппаСтрок", "TableRowGroup")]
        public string TableRowGroup
        {
        	get { return "table-row-group"; }
        }

        [ContextProperty("ЗаголовокТаблицы", "TableCaption")]
        public string TableCaption
        {
        	get { return "table-caption"; }
        }

        [ContextProperty("КолонкаТаблицы", "TableColumn")]
        public string TableColumn
        {
        	get { return "table-column"; }
        }

        [ContextProperty("Компактно", "Compact")]
        public string Compact
        {
        	get { return "compact"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Сетка", "Grid")]
        public string Grid
        {
        	get { return "grid"; }
        }

        [ContextProperty("СтрокаЗаголовкаТаблицы", "TableHeaderGroup")]
        public string TableHeaderGroup
        {
        	get { return "table-header-group"; }
        }

        [ContextProperty("СтрокаНижнегоКолонтитула", "TableFooterGroup")]
        public string TableFooterGroup
        {
        	get { return "table-footer-group"; }
        }

        [ContextProperty("СтрокаТаблицы", "TableRow")]
        public string TableRow
        {
        	get { return "table-row"; }
        }

        [ContextProperty("Таблица", "Table")]
        public string Table
        {
        	get { return "table"; }
        }

        [ContextProperty("ЯчейкаТаблицы", "TableCell")]
        public string TableCell
        {
        	get { return "table-cell"; }
        }
    }
}
