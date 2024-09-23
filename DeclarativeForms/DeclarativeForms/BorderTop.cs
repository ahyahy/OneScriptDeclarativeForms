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
    [ContextClass("ДфВерхняяГраница", "DfBorderTop")]
    public class DfBorderTop : AutoContext<DfBorderTop>
    {
        public DfBorderTop(IValue p1, IValue p2, IValue p3)
        {
            BorderTopWidth = p1;
            BorderTopStyle = p2;
            BorderTopColor = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue borderTopStyle;
        [ContextProperty("СтильВерхнейГраницы", "BorderTopStyle")]
        public IValue BorderTopStyle
        {
            get { return borderTopStyle; }
            set { borderTopStyle = value; }
        }

        private IValue borderTopColor;
        [ContextProperty("ЦветВерхнейГраницы", "BorderTopColor")]
        public IValue BorderTopColor
        {
            get { return borderTopColor; }
            set { borderTopColor = value; }
        }

        private IValue borderTopWidth;
        [ContextProperty("ШиринаВерхнейГраницы", "BorderTopWidth")]
        public IValue BorderTopWidth
        {
            get { return borderTopWidth; }
            set { borderTopWidth = value; }
        }
    }
}
