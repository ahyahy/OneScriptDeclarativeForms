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
    [ContextClass("ДфШрифт", "DfFont")]
    public class DfFont : AutoContext<DfFont>
    {

        public DfFont(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6)
        {
            Name = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createElement(\u0022" + "font" + "\u0022, \u0022" + Name + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            DeclarativeForms.AddToHashtable(Name, this);
            FontStyle = p1;
            FontVariant = p2;
            FontWeight = p3;
            FontSize = p4;
            LineHeight = p5;
            FontFamily = p6;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue fontVariant;
        [ContextProperty("ВариантШрифта", "FontVariant")]
        public IValue FontVariant
        {
            get { return fontVariant; }
            set
            {
                fontVariant = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "fontVariant" + "\u0022, \u0022" + fontVariant + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private IValue lineHeight;
        [ContextProperty("ВысотаСтроки", "LineHeight")]
        public IValue LineHeight
        {
            get { return lineHeight; }
            set
            {
                lineHeight = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "lineHeight" + "\u0022, \u0022" + lineHeight + "px\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private IValue fontWeight;
        [ContextProperty("ЖирностьШрифта", "FontWeight")]
        public IValue FontWeight
        {
            get { return fontWeight; }
            set
            {
                fontWeight = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "fontWeight" + "\u0022, \u0022" + fontWeight + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private string name;
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private IValue fontSize;
        [ContextProperty("РазмерШрифта", "FontSize")]
        public IValue FontSize
        {
            get { return fontSize; }
            set
            {
                fontSize = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "fontSize" + "\u0022, \u0022" + fontSize + "px\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private IValue fontFamily;
        [ContextProperty("СемействоШрифтов", "FontFamily")]
        public IValue FontFamily
        {
            get { return fontFamily; }
            set
            {
                fontFamily = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "fontFamily" + "\u0022, \u0022" + fontFamily + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        private IValue fontStyle;
        [ContextProperty("СтильШрифта", "FontStyle")]
        public IValue FontStyle
        {
            get { return fontStyle; }
            set
            {
                fontStyle = value;
                //setProperty(nameElement, nameProperty, valueProperty)
                string strFunc = "setProperty(\u0022" + Name + "\u0022, \u0022" + "fontStyle" + "\u0022, \u0022" + fontStyle + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

    }
}
