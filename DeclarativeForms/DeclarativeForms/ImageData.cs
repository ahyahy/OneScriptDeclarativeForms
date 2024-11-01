using ScriptEngine.Machine.Contexts;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфДанныеРисунка", "DfImageData")]
    public class DfImageData : AutoContext<DfImageData>
    {
        public DfImageData(string ownerItemKey, int p1, int p2)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', mapKeyEl.get('" + ownerItemKey + "').createImageData(" + p1 + ", " + p2 + "));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            Width = p1;
            Height = p2;
        }

        public DfImageData(string ownerItemKey, DfImageData p1)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', mapKeyEl.get('" + ownerItemKey + "').createImageData(mapKeyEl.get('" + p1.ItemKey + "')));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            Width = p1.Width;
            Height = p1.Height;
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

        private int height;
        [ContextProperty("Высота", "Height")]
        public int Height
        {
            get { return height; }
            set
            {
                height = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['height'] = " + height + ";";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        private int width;
        [ContextProperty("Ширина", "Width")]
        public int Width
        {
            get { return width; }
            set
            {
                width = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['width'] = " + width + ";";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
		
        private string сolor;
        [ContextProperty("Цвет", "Color")]
        public string Color
        {
            get { return сolor; }
            set
            {
                сolor = value;
                string strFunc = "" +
                    "let el = mapKeyEl.get('" + ItemKey + "');" +
                    "const num = '" + сolor + "'.replace('rgb(', '').replace(')', '').replace(',', '').split(' ');" +
                    "for (let i = 0; i < el.data.length; i += 4)" +
                    "{" +
                    "    el.data[i + 0] = num[0];" +
                    "    el.data[i + 1] = num[1];" +
                    "    el.data[i + 2] = num[2];" +
                    "    el.data[i + 3] = 255;" +
                    "}" +
                    "";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }		
    }
}
