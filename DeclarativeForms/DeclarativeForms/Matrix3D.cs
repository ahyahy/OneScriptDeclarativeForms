using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфМатрица3Д", "DfMatrix3D")]
    public class DfMatrix3D : AutoContext<DfMatrix3D>
    {
        public DfMatrix3D(ArrayImpl p1)
        {
            Number1 = p1.Get(0).AsNumber();
            Number2 = p1.Get(1).AsNumber();
            Number3 = p1.Get(2).AsNumber();
            Number4 = p1.Get(3).AsNumber();

            Number5 = p1.Get(4).AsNumber();
            Number6 = p1.Get(5).AsNumber();
            Number7 = p1.Get(6).AsNumber();
            Number8 = p1.Get(7).AsNumber();

            Number9 = p1.Get(8).AsNumber();
            Number10 = p1.Get(9).AsNumber();
            Number11 = p1.Get(10).AsNumber();
            Number12 = p1.Get(11).AsNumber();

            Number13 = p1.Get(12).AsNumber();
            Number14 = p1.Get(13).AsNumber();
            Number15 = p1.Get(14).AsNumber();
            Number16 = p1.Get(15).AsNumber();
        }

        public DfMatrix3D()
        {
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private decimal number1;
        [ContextProperty("Число1", "Number1")]
        public decimal Number1
        {
            get { return number1; }
            set { number1 = value; }
        }

        private decimal number2;
        [ContextProperty("Число2", "Number2")]
        public decimal Number2
        {
            get { return number2; }
            set { number2 = value; }
        }

        private decimal number3;
        [ContextProperty("Число3", "Number3")]
        public decimal Number3
        {
            get { return number3; }
            set { number3 = value; }
        }

        private decimal number4;
        [ContextProperty("Число4", "Number4")]
        public decimal Number4
        {
            get { return number4; }
            set { number4 = value; }
        }

        private decimal number5;
        [ContextProperty("Число5", "Number5")]
        public decimal Number5
        {
            get { return number5; }
            set { number5 = value; }
        }

        private decimal number6;
        [ContextProperty("Число6", "Number6")]
        public decimal Number6
        {
            get { return number6; }
            set { number6 = value; }
        }

        private decimal number7;
        [ContextProperty("Число7", "Number7")]
        public decimal Number7
        {
            get { return number7; }
            set { number7 = value; }
        }

        private decimal number8;
        [ContextProperty("Число8", "Number8")]
        public decimal Number8
        {
            get { return number8; }
            set { number8 = value; }
        }

        private decimal number9;
        [ContextProperty("Число9", "Number9")]
        public decimal Number9
        {
            get { return number9; }
            set { number9 = value; }
        }

        private decimal number10;
        [ContextProperty("Число10", "Number10")]
        public decimal Number10
        {
            get { return number10; }
            set { number10 = value; }
        }

        private decimal number11;
        [ContextProperty("Число11", "Number11")]
        public decimal Number11
        {
            get { return number11; }
            set { number11 = value; }
        }

        private decimal number12;
        [ContextProperty("Число12", "Number12")]
        public decimal Number12
        {
            get { return number12; }
            set { number12 = value; }
        }

        private decimal number13;
        [ContextProperty("Число13", "Number13")]
        public decimal Number13
        {
            get { return number13; }
            set { number13 = value; }
        }

        private decimal number14;
        [ContextProperty("Число14", "Number14")]
        public decimal Number14
        {
            get { return number14; }
            set { number14 = value; }
        }

        private decimal number15;
        [ContextProperty("Число15", "Number15")]
        public decimal Number15
        {
            get { return number15; }
            set { number15 = value; }
        }

        private decimal number16;
        [ContextProperty("Число16", "Number16")]
        public decimal Number16
        {
            get { return number16; }
            set { number16 = value; }
        }
    }
}
