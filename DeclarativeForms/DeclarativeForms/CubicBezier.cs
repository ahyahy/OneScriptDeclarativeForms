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
    [ContextClass("ДфБезьеКуб", "DfCubicBezier")]
    public class DfCubicBezier : AutoContext<DfCubicBezier>
    {
        public DfCubicBezier(IValue p1, IValue p2, IValue p3, IValue p4)
        {
            Number1 = p1;
            Number2 = p2;
            Number3 = p3;
            Number4 = p4;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private IValue number1;
        [ContextProperty("Число1", "Number1")]
        public IValue Number1
        {
            get { return number1; }
            set { number1 = value; }
        }

        private IValue number2;
        [ContextProperty("Число2", "Number2")]
        public IValue Number2
        {
            get { return number2; }
            set { number2 = value; }
        }

        private IValue number3;
        [ContextProperty("Число3", "Number3")]
        public IValue Number3
        {
            get { return number3; }
            set { number3 = value; }
        }

        private IValue number4;
        [ContextProperty("Число4", "Number4")]
        public IValue Number4
        {
            get { return number4; }
            set { number4 = value; }
        }
    }
}
