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
    [ContextClass("ДфКурсор", "DfCursor")]
    public class DfCursor : AutoContext<DfCursor>, ICollectionContext, IEnumerable<IValue>
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

        public DfCursor()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Auto));
            _list.Add(ValueFactory.Create(URL));
            _list.Add(ValueFactory.Create(VerticalText));
            _list.Add(ValueFactory.Create(EResize));
            _list.Add(ValueFactory.Create(RwResize));
            _list.Add(ValueFactory.Create(WResize));
            _list.Add(ValueFactory.Create(Progress));
            _list.Add(ValueFactory.Create(ColResize));
            _list.Add(ValueFactory.Create(ContextMenu));
            _list.Add(ValueFactory.Create(Copy));
            _list.Add(ValueFactory.Create(NoDrop));
            _list.Add(ValueFactory.Create(NotAllowed));
            _list.Add(ValueFactory.Create(Wait));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Crosshair));
            _list.Add(ValueFactory.Create(Move));
            _list.Add(ValueFactory.Create(Help));
            _list.Add(ValueFactory.Create(Default));
            _list.Add(ValueFactory.Create(AllScroll));
            _list.Add(ValueFactory.Create(Alias));
            _list.Add(ValueFactory.Create(RowResize));
            _list.Add(ValueFactory.Create(NResize));
            _list.Add(ValueFactory.Create(NeResize));
            _list.Add(ValueFactory.Create(NeswResize));
            _list.Add(ValueFactory.Create(NwResize));
            _list.Add(ValueFactory.Create(NwseResize));
            _list.Add(ValueFactory.Create(NsResize));
            _list.Add(ValueFactory.Create(Text));
            _list.Add(ValueFactory.Create(ZoomIn));
            _list.Add(ValueFactory.Create(Pointer));
            _list.Add(ValueFactory.Create(ZoomOut));
            _list.Add(ValueFactory.Create(SResize));
            _list.Add(ValueFactory.Create(SeResize));
            _list.Add(ValueFactory.Create(SwResize));
            _list.Add(ValueFactory.Create(Cell));
        }

        [ContextProperty("Авто", "Auto")]
        public string Auto
        {
        	get { return "auto"; }
        }

        [ContextProperty("Адрес", "URL")]
        public string URL
        {
        	get { return "URL"; }
        }

        [ContextProperty("ВертикальныйТекст", "VerticalText")]
        public string VerticalText
        {
        	get { return "vertical-text"; }
        }

        [ContextProperty("Восток", "EResize")]
        public string EResize
        {
        	get { return "e-resize"; }
        }

        [ContextProperty("ВостокЗапад", "RwResize")]
        public string RwResize
        {
        	get { return "ew-resize"; }
        }

        [ContextProperty("Запад", "WResize")]
        public string WResize
        {
        	get { return "w-resize"; }
        }

        [ContextProperty("Индикатор", "Progress")]
        public string Progress
        {
        	get { return "progress"; }
        }

        [ContextProperty("Колонка", "ColResize")]
        public string ColResize
        {
        	get { return "col-resize"; }
        }

        [ContextProperty("КонтекстноеМеню", "ContextMenu")]
        public string ContextMenu
        {
        	get { return "context-menu"; }
        }

        [ContextProperty("Копировать", "Copy")]
        public string Copy
        {
        	get { return "copy"; }
        }

        [ContextProperty("НеПереместить", "NoDrop")]
        public string NoDrop
        {
        	get { return "no-drop"; }
        }

        [ContextProperty("НеПрименимо", "NotAllowed")]
        public string NotAllowed
        {
        	get { return "not-allowed"; }
        }

        [ContextProperty("Ожидание", "Wait")]
        public string Wait
        {
        	get { return "wait"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Перекрестие", "Crosshair")]
        public string Crosshair
        {
        	get { return "crosshair"; }
        }

        [ContextProperty("Переместить", "Move")]
        public string Move
        {
        	get { return "move"; }
        }

        [ContextProperty("Помощь", "Help")]
        public string Help
        {
        	get { return "help"; }
        }

        [ContextProperty("ПоУмолчанию", "Default")]
        public string Default
        {
        	get { return "default"; }
        }

        [ContextProperty("Прокрутка", "AllScroll")]
        public string AllScroll
        {
        	get { return "all-scroll"; }
        }

        [ContextProperty("Псевдоним", "Alias")]
        public string Alias
        {
        	get { return "alias"; }
        }

        [ContextProperty("РазмерСтроки", "RowResize")]
        public string RowResize
        {
        	get { return "row-resize"; }
        }

        [ContextProperty("Север", "NResize")]
        public string NResize
        {
        	get { return "n-resize"; }
        }

        [ContextProperty("СевероВосток", "NeResize")]
        public string NeResize
        {
        	get { return "ne-resize"; }
        }

        [ContextProperty("СевероВостокЮгоЗапад", "NeswResize")]
        public string NeswResize
        {
        	get { return "nesw-resize"; }
        }

        [ContextProperty("СевероЗапад", "NwResize")]
        public string NwResize
        {
        	get { return "nw-resize"; }
        }

        [ContextProperty("СевероЗападЮгоВосток", "NwseResize")]
        public string NwseResize
        {
        	get { return "nwse-resize"; }
        }

        [ContextProperty("СеверЮг", "NsResize")]
        public string NsResize
        {
        	get { return "ns-resize"; }
        }

        [ContextProperty("Текст", "Text")]
        public string Text
        {
        	get { return "text"; }
        }

        [ContextProperty("Увеличить", "ZoomIn")]
        public string ZoomIn
        {
        	get { return "zoom-in"; }
        }

        [ContextProperty("Указатель", "Pointer")]
        public string Pointer
        {
        	get { return "pointer"; }
        }

        [ContextProperty("Уменьшить", "ZoomOut")]
        public string ZoomOut
        {
        	get { return "zoom-out"; }
        }

        [ContextProperty("Юг", "SResize")]
        public string SResize
        {
        	get { return "s-resize"; }
        }

        [ContextProperty("ЮгоВосток", "SeResize")]
        public string SeResize
        {
        	get { return "se-resize"; }
        }

        [ContextProperty("ЮгоЗапад", "SwResize")]
        public string SwResize
        {
        	get { return "sw-resize"; }
        }

        [ContextProperty("Ячейка", "Cell")]
        public string Cell
        {
        	get { return "cell"; }
        }
    }
}
