using ScriptEngine.Machine.Contexts;
using System.Reflection;
using System.IO;

namespace osdf
{
    [ContextClass("ДфАнимация", "DfAnimation")]
    public class DfAnimation : AutoContext<DfAnimation>
    {
        public DfAnimation(string p1, DfFrames p2, DfAnimationOptions p3)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', mapKeyEl.get('" + p1 + "').animate(mapKeyEl.get('" + p2.ItemKey + "'), mapKeyEl.get('" + p3.ItemKey + "')));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + "; ";
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

        [ContextMethod("Завершить", "Finish")]
        public void Finish()
        {
            string strFunc = "" +
                "let el = mapKeyEl.get('" + ItemKey + "');" +
                "try" +
                "{" +
                "    el.finish();" +
                "}" +
                "catch { }" +
                "";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

        [ContextMethod("Запустить", "Play")]
        public void Play()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).play();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

        [ContextMethod("Отменить", "Cancel")]
        public void Cancel()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).cancel();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }

        [ContextMethod("Пауза", "Pause")]
        public void Pause()
        {
            string strFunc = "mapKeyEl.get(\u0022" + ItemKey + "\u0022).pause();";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
        }
    }
}
