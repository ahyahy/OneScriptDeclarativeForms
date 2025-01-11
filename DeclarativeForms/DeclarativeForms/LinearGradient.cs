using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфЛинейныйГрадиент", "DfLinearGradient")]
    public class DfLinearGradient : AutoContext<DfLinearGradient>
    {
        public DfLinearGradient(string ownerItemKey, int p1, int p2, int p3, int p4)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', mapKeyEl.get('" + ownerItemKey + "').createLinearGradient('" + p1 + "', '" + p2 + "', '" + p3 + "', '" + p4 + "'));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.SendStrFunc(strFunc);
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

        private DfContext2d owner;
        public DfContext2d Owner
        {
            get { return owner; }
            set { owner = value; }
        }

        [ContextMethod("ДобавитьОстановкуГрадиента", "AddColorStop")]
        public void AddColorStop(IValue p1, string p2)
        {
            string strFunc = @"
            mapKeyEl.get('" + ItemKey + "').addColorStop('" + p1.AsNumber().ToString().Replace(",", ".") + "', '" + p2 + "');";
            DeclarativeForms.SendStrFunc(strFunc);
        }
    }
}
