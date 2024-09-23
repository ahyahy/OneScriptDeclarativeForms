using ScriptEngine.Machine.Contexts;
using System.Reflection;

namespace osdf
{
    [ContextClass("ТочкаСдвига", "DfTransformOrigin")]
    public class DfTransformOrigin : AutoContext<DfTransformOrigin>
    {
        public DfTransformOrigin(int p1, int p2, int p3)
        {
            AxisX = p1;
            AxisY = p2;
            AxisZ = p3;
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        private int axisZ;
        [ContextProperty("ПоложениеЗет", "AxisZ")]
        public int AxisZ
        {
            get { return axisZ; }
            set { axisZ = value; }
        }

        private int axisY;
        [ContextProperty("ПоложениеИгрек", "AxisY")]
        public int AxisY
        {
            get { return axisY; }
            set { axisY = value; }
        }

        private int axisX;
        [ContextProperty("ПоложениеИкс", "AxisX")]
        public int AxisX
        {
            get { return axisX; }
            set { axisX = value; }
        }
    }
}
