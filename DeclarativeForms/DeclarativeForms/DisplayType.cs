using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфТипОтображения", "DfDisplayType")]
    public class DfDisplayType : AutoContext<DfDisplayType>, ICollectionContext, IEnumerable<IValue>
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

        public DfDisplayType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Block));
            _list.Add(ValueFactory.Create(Inline));
            _list.Add(ValueFactory.Create(InlineBlock));
            _list.Add(ValueFactory.Create(InlineFlex));
            _list.Add(ValueFactory.Create(InlineGrid));
            _list.Add(ValueFactory.Create(InlineTable));
            _list.Add(ValueFactory.Create(Flex));
            _list.Add(ValueFactory.Create(TableColumnGroup));
            _list.Add(ValueFactory.Create(TableRowGroup));
            _list.Add(ValueFactory.Create(TableHeaderGroup));
            _list.Add(ValueFactory.Create(TableCaption));
            _list.Add(ValueFactory.Create(TableColumn));
            _list.Add(ValueFactory.Create(Marker));
            _list.Add(ValueFactory.Create(TableFooterGroup));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Grid));
            _list.Add(ValueFactory.Create(ListItem));
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

        [ContextProperty("ГруппаКолонокТаблицы", "TableColumnGroup")]
        public string TableColumnGroup
        {
        	get { return "table-column-group"; }
        }

        [ContextProperty("ГруппаСтрокТаблицы", "TableRowGroup")]
        public string TableRowGroup
        {
        	get { return "table-row-group"; }
        }

        [ContextProperty("ЗаголовокГруппыТаблицы", "TableHeaderGroup")]
        public string TableHeaderGroup
        {
        	get { return "table-header-group"; }
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

        [ContextProperty("Маркер", "Marker")]
        public string Marker
        {
        	get { return "marker"; }
        }

        [ContextProperty("НижнийКолонтитулТаблицы", "TableFooterGroup")]
        public string TableFooterGroup
        {
        	get { return "table-footer-group"; }
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

        [ContextProperty("СписокЭлементов", "ListItem")]
        public string ListItem
        {
        	get { return "list-item"; }
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
