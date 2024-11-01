using ScriptEngine.Machine;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using System.Reflection;
using System.IO;
using System.Linq;

namespace osdf
{
    [ContextClass("ДфКадры", "DfFrames")]
    public class DfFrames : AutoContext<DfFrames>
    {
        public DfFrames()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', []);" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private string name;
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        [ContextMethod("Добавить", "Add")]
        public void Add(DfStyle p1 = null)
        {
            // Получим свойства стиля и их значения.
            ArrayImpl arr = new ArrayImpl();

            System.Reflection.PropertyInfo[] myPropertyInfo = p1.GetType().GetProperties();
            for (int i = 0; i < myPropertyInfo.Length; i++)
            {
                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
                {
                    string NameRu = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
                    string NameEn = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
                    try
                    {
                        if (NameEn != "ItemKey" && NameEn != "Name")
                        {
                            object propValue = p1.GetType().GetProperty(NameEn).GetValue(p1);
                            if (propValue != null)
                            {
                                string attr = DeclarativeForms.namesStyleProps[NameRu][2].ToString();
                                string attrCSS = DeclarativeForms.namesStyleProps[NameRu][3].ToString();
                                string attrValue = (string)p1.GetType().GetProperty("res" + attr).GetValue(p1);
                                if (attrValue.Contains("px")
                                     || attrValue.Contains("rgb(")
                                     || attrValue.Contains("scale(")
                                     || attrValue.Contains("scale3d(")
                                     || attrValue.Contains("scaleX(")
                                     || attrValue.Contains("scaleY(")
                                     || attrValue.Contains("scaleZ(")
                                     || attrValue.Contains("skew(")
                                     || attrValue.Contains("skewX(")
                                     || attrValue.Contains("skewY(")
                                     || attrValue.Contains("rotate(")
                                     || attrValue.Contains("rotate3d(")
                                     || attrValue.Contains("rotateX(")
                                     || attrValue.Contains("rotateY(")
                                     || attrValue.Contains("rotateZ(")
                                     || attrValue.Contains("perspective(")
                                     || attrValue.Contains("blur(")
                                     || attrValue.Contains("brightness(")
                                     || attrValue.Contains("contrast(")
                                     || attrValue.Contains("shadow(")
                                     || attrValue.Contains("invert(")
                                     || attrValue.Contains("opacity(")
                                     || attrValue.Contains("saturate(")
                                     || attrValue.Contains("sepia(")
                                     || attrValue.Contains("url(")
                                     || attrValue.Contains("inset")
                                     || attrValue.Contains("decimal")
                                     || attrValue.Contains("outside")
                                     || attrValue.Contains("none")
                                     || attrValue.Contains("medium")
                                     || attrValue.Contains("baseline")
                                     || attrValue.Contains("stretch")
                                     || attrValue.Contains("auto")		
                                    )
                                {
                                    arr.Add(ValueFactory.Create("\u0022" + attrCSS + "\u0022: \u0022" + attrValue + "\u0022"));
                                }
                                else
                                {
                                    arr.Add(ValueFactory.Create("\u0022" + attrCSS + "\u0022: " + attrValue + " "));
                                }
                            }
                        }
                    }
                    catch { }
                }
            }
            string s = "{ ";
            if (arr.Count() > 0)
            {
                s += arr.Get(0).AsString();
            }
            for (int i1 = 1; i1 < arr.Count(); i1++)
            {
                s += ", " + arr.Get(i1).AsString();
            }
            s += " }";

            if (s != "{  }")
            {
                string strFunc = "mapKeyEl.get('" + ItemKey + "')[mapKeyEl.get('" + ItemKey + "').length] = JSON.parse('" + s + "');";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }
    }
}
