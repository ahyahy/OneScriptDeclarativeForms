using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using System.IO;
using System;

namespace osdf
{
    [ContextClass("ДфПараметрыАнимации", "DfAnimationOptions")]
    public class DfAnimationOptions : AutoContext<DfAnimationOptions>
    {
        public DfAnimationOptions(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7)
        {
            string s = "{ ";
            if (p1 != null)
            {
                Duration = Convert.ToInt32(p1.AsNumber());
                s += "\u0022duration\u0022: " + Duration;
            }
            if (p2 != null)
            {
                Easing = p2.AsString();
                s += ", \u0022easing\u0022: \u0022" + Easing + "\u0022";
            }
            if (p3 != null)
            {
                Delay = Convert.ToInt32(p3.AsNumber());
                s += ", \u0022delay\u0022: " + Delay;
            }
            if (p4 != null)
            {
                if (Convert.ToInt32(p4.AsNumber()) == -1)
                {
                    Iterations = -1;
                    s += ", \u0022iterations\u0022: \u0022Infinity\u0022";
                }
                else
                {
                    Iterations = Convert.ToInt32(p4.AsNumber());
                    s += ", \u0022iterations\u0022: " + Iterations;
                }
            }
            if (p5 != null)
            {
                Direction = p5.AsString();
                s += ", \u0022direction\u0022: \u0022" + Direction + "\u0022";
            }
            if (p6 != null)
            {
                Fill = p6.AsString();
                s += ", \u0022fill\u0022: \u0022" + Fill + "\u0022";
            }
            if (p7 != null)
            {
                EndDelay = Convert.ToInt32(p7.AsNumber());
                s += ", \u0022endDelay\u0022: " + EndDelay;
            }
            s += " }";
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', JSON.parse('" + s + "'));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;

            strFunc = "mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        private int duration = 0;
        [ContextProperty("Длительность", "Duration")]
        public int Duration
        {
            get { return duration; }
            private set { duration = value; }
        }

        private string easing;
        [ContextProperty("ФункцияСинхронизации", "Easing")]
        public string Easing
        {
            get { return easing; }
            private set { easing = value; }
        }

        private int delay;
        [ContextProperty("Задержка", "Delay")]
        public int Delay
        {
            get { return delay; }
            private set { delay = value; }
        }

        private int iterations;
        [ContextProperty("КоличествоПовторов", "Iterations")]
        public int Iterations
        {
            get { return iterations; }
            private set { iterations = value; }
        }

        private string direction;
        [ContextProperty("Направление", "Direction")]
        public string Direction
        {
            get { return direction; }
            private set { direction = value; }
        }

        private string fill;
        [ContextProperty("Заливка", "Fill")]
        public string Fill
        {
            get { return fill; }
            private set { fill = value; }
        }

        private int endDelay;
        [ContextProperty("ЗадержкаПосле", "EndDelay")]
        public int EndDelay
        {
            get { return endDelay; }
            private set { endDelay = value; }
        }
    }
}
