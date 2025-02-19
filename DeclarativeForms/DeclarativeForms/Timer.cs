using ScriptEngine.Machine.Contexts;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфТаймер", "DfTimer")]
    public class DfTimer : AutoContext<DfTimer>
    {
        public DfTimer()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
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

        public int interval { get; set; } = 1000;
        [ContextProperty("Интервал", "Interval")]
        public int Interval
        {
            get { return interval; }
            set { interval = value; }
        }

        public bool enabled { get; set; } = false;
        [ContextProperty("Активен", "Enabled")]
        public bool Enabled
        {
            get { return enabled; }
            private set { enabled = value; }
        }

        public DfAction tick { get; set; }
        [ContextProperty("ПриСрабатыванииТаймера", "Tick")]
        public DfAction Tick
        {
            get { return tick; }
            set { tick = value; }
        }

        [ContextMethod("Начать", "Start")]
        public void Start()
        {
            if (!Enabled)
            {
                string strFunc = "startTimer('" + ItemKey + "', " + Interval + ");";
                if (!DeclarativeForms.strFunctions.Contains(ItemKey))
                {
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
            Enabled = true;
        }

        [ContextMethod("Остановить", "Stop")]
        public void Stop()
        {
            if (Enabled)
            {
                string strFunc = "stopTimer('" + ItemKey + "');";
                if (!DeclarativeForms.strFunctions.Contains(ItemKey))
                {
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
            Enabled = false;
        }
    }
}
