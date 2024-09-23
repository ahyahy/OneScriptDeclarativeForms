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
    [ContextClass("ДфТипСтиляСписка", "DfListStyleType")]
    public class DfListStyleType : AutoContext<DfListStyleType>, ICollectionContext, IEnumerable<IValue>
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

        public DfListStyleType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(UpperLatin));
            _list.Add(ValueFactory.Create(UpperRoman));
            _list.Add(ValueFactory.Create(Disc));
            _list.Add(ValueFactory.Create(Square));
            _list.Add(ValueFactory.Create(Circle));
            _list.Add(ValueFactory.Create(LowerLatin));
            _list.Add(ValueFactory.Create(LowerRoman));
            _list.Add(ValueFactory.Create(None));
            _list.Add(ValueFactory.Create(Decimal));
            _list.Add(ValueFactory.Create(DecimalLeadingZero));
        }

        [ContextProperty("ВерхнеЛатинский", "UpperLatin")]
        public string UpperLatin
        {
        	get { return "upper-latin"; }
        }

        [ContextProperty("ВерхнеРимский", "UpperRoman")]
        public string UpperRoman
        {
        	get { return "upper-roman"; }
        }

        [ContextProperty("ЗакрашенныйКруг", "Disc")]
        public string Disc
        {
        	get { return "disc"; }
        }

        [ContextProperty("Квадрат", "Square")]
        public string Square
        {
        	get { return "square"; }
        }

        [ContextProperty("Круг", "Circle")]
        public string Circle
        {
        	get { return "circle"; }
        }

        [ContextProperty("НижнеЛатинский", "LowerLatin")]
        public string LowerLatin
        {
        	get { return "lower-latin"; }
        }

        [ContextProperty("НижнеРимский", "LowerRoman")]
        public string LowerRoman
        {
        	get { return "lower-roman"; }
        }

        [ContextProperty("Отсутствие", "None")]
        public string None
        {
        	get { return "none"; }
        }

        [ContextProperty("Число", "Decimal")]
        public string Decimal
        {
        	get { return "decimal"; }
        }

        [ContextProperty("ЧислоСНулями", "DecimalLeadingZero")]
        public string DecimalLeadingZero
        {
        	get { return "decimal-leading-zero"; }
        }
    }
}
