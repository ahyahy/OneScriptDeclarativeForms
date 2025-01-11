using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфКонтекст2d", "DfContext2d")]
    public class DfContext2d : AutoContext<DfContext2d>
    {
        public DfContext2d(string ownerItemKey)
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', mapKeyEl.get('" + ownerItemKey + "').getContext('2d'));" + @"
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

        private DfCanvas owner;
        public DfCanvas Owner
        {
            get { return owner; }
            set { owner = value; }
        }

        [ContextMethod("ЗаполнитьПрямоугольник", "FillRect")]
        public void FillRect(int p1, int p2, int p3, int p4)
        {
            string strFunc = "mapKeyEl.get('" + ItemKey + "').fillRect(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Прямоугольник", "Rect")]
        public void Rect(int p1, int p2, int p3, int p4)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').rect(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("СоздатьЛинейныйГрадиент", "CreateLinearGradient")]
        public DfLinearGradient CreateLinearGradient(int p1, int p2, int p3, int p4)
        {
            DfLinearGradient DfLinearGradient1 = new DfLinearGradient(ItemKey, p1, p2, p3, p4);
            DfLinearGradient1.Owner = this;
            return DfLinearGradient1;
        }

        public IValue fillStyle { get; set; }
        [ContextProperty("СтильЗаполнения", "FillStyle")]
        public IValue FillStyle
        {
            get { return fillStyle; }
            set
            {
                fillStyle = value;
                string strFunc;
                if (fillStyle.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    strFunc = "mapKeyEl.get('" + ItemKey + "')['fillStyle'] = '" + fillStyle + "';";
                }
                else
                {
                    strFunc = "mapKeyEl.get('" + ItemKey + "')['fillStyle'] = mapKeyEl.get('" + ((dynamic)fillStyle).ItemKey + "');";
                }
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }
		
        [ContextMethod("НачатьПуть", "BeginPath")]
        public void BeginPath()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').beginPath();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Начертить", "Stroke")]
        public void Stroke()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').stroke();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Дуга", "Arc")]
        public void Arc(int p1, int p2, int p3, IValue p4, IValue p5, bool p6 = false)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').arc(" + p1 + ", " + p2 + ", " + p3 + ", " + p4.AsNumber().ToString().Replace(",", ".") + ", " + p5.AsNumber().ToString().Replace(",", ".") + ", " + p6.ToString().ToLower() + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }
		
        [ContextMethod("ДугаМежду", "ArcTo")]
        public void ArcTo(int p1, int p2, int p3, int p4, int p5)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').arcTo(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ", " + p5 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("ПерейтиКТочке", "MoveTo")]
        public void MoveTo(int p1, int p2)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').moveTo(" + p1 + ", " + p2 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Линия", "LineTo")]
        public void LineTo(int p1, int p2)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').lineTo(" + p1 + ", " + p2 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("ДобавитьКубическуюБизье", "BezierCurveTo")]
        public void BezierCurveTo(int p1, int p2, int p3, int p4, int p5, int p6)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').bezierCurveTo(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ", " + p5 + ", " + p6 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("ОчиститьПрямоугольник", "ClearRect")]
        public void ClearRect(int p1, int p2, int p3, int p4)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').clearRect(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Обрезать", "Clip")]
        public void Clip()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').clip();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("ЗакончитьПуть", "ClosePath")]
        public void ClosePath()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').closePath();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("СоздатьДанныеРисунка", "CreateImageData")]
        public DfImageData CreateImageData(IValue p1, int p2 = 0)
        {
            DfImageData DfImageData1;
            if (p1.GetType() == typeof(DfImageData))
            {
                DfImageData1 = new DfImageData(ItemKey, (DfImageData)p1);
            }
            else
            {
                DfImageData1 = new DfImageData(ItemKey, Convert.ToInt32(p1.AsNumber()), p2);
            }
            DfImageData1.Owner = this;
            return DfImageData1;
        }

        [ContextMethod("ПоместитьДанныеРисунка", "PutImageData")]
        public void PutImageData(DfImageData p1, int p2, int p3, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').putImageData(mapKeyEl.get('" + p1.ItemKey + "'), " + p2 + ", " + p3 + ");";
            if (p4 != null && p5 != null && p6 != null && p7 != null)
            {
                strFunc = @"mapKeyEl.get('" + ItemKey + "').putImageData(mapKeyEl.get('" + p1.ItemKey + "'), " + p2 + ", " + p3 + ", " + p4 + ", " + p5 + ", " + p6 + ", " + p7 + ");";
            }
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Заполнить", "Fill")]
        public void Fill()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').fill();";
            DeclarativeForms.SendStrFunc(strFunc);
        }
		
        [ContextMethod("Замостить", "Pave")]
        public void Pave(DfImage p1, string p2, int p3, int p4, int p5, int p6)
        {
            string strFunc = "" +
                "let img = mapKeyEl.get('" + p1.ItemKey + "');" +
                "let ctx = mapKeyEl.get('" + ItemKey + "');" +
                "img.onload = function()" +
                "{" +
                "    ctx.rect(" + p3 + ", " + p4 + ", " + p5 + ", " + p6 + ");" +
                "    ctx.fillStyle = ctx.createPattern(img, '" + p2 + "');" +
                "    ctx.fill();" +
                "}" +
                "";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("СоздатьРадиальныйГрадиент", "CreateRadialGradient")]
        public DfRadialGradient CreateRadialGradient(int p1, int p2, int p3, int p4, int p5, int p6)
        {
            DfRadialGradient DfRadialGradient1 = new DfRadialGradient(ItemKey, p1, p2, p3, p4, p5, p6);
            DfRadialGradient1.Owner = this;
            return DfRadialGradient1;
        }

        public DfFont font { get; set; }
        [ContextProperty("Шрифт", "Font")]
        public DfFont Font
        {
            get { return font; }
            set
            {
                font = value;
                if (Owner != null)
                {
                    string fontStyle = "";
                    string fontVariant = "";
                    string fontWeight = "";
                    string fontSize = "100%";
                    string lineHeight = "100%";
                    string fontFamily = "";
                    if (font.FontStyle != null)
                    {
                        fontStyle = font.FontStyle.AsString() + " ";
                    }
                    if (font.FontVariant != null)
                    {
                        fontVariant = font.FontVariant.AsString() + " ";
                    }
                    if (font.FontWeight != null)
                    {
                        fontWeight = font.FontWeight.AsString() + " ";
                    }
                    if (font.FontSize != null)
                    {
                        fontSize = "" + font.FontSize.AsNumber() + "px";
                    }
                    if (font.LineHeight != null)
                    {
                        lineHeight = "" + font.LineHeight.AsNumber() + "px";
                    }
                    if (font.FontFamily != null)
                    {
                        fontFamily = font.FontFamily.AsString() + " ";
                    }
                    string res = fontStyle + fontVariant + fontWeight + fontSize + "/" + lineHeight + " " + fontFamily;
                    string strFunc = "mapKeyEl.get('" + ItemKey + "')['font'] = '" + res + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        [ContextMethod("ЗаполнитьТекст", "FillText")]
        public void FillText(string p1, int p2, int p3, IValue p4 = null)
        {
            string strFunc;
            if (p4 != null)
            {
                strFunc = @"mapKeyEl.get('" + ItemKey + "').fillText('" + p1 + "', " + p2 + ", " + p3 + ", " + p4 + ");";
            }
            else
            {
                strFunc = @"mapKeyEl.get('" + ItemKey + "').fillText('" + p1 + "', " + p2 + ", " + p3 + ");";
            }
            DeclarativeForms.SendStrFunc(strFunc);
        }

        public string direction { get; set; }
        [ContextProperty("НаправлениеТекста", "Direction")]
        public string Direction
        {
            get { return direction; }
            set
            {
                direction = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['direction'] = '" + direction + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        [ContextMethod("РисоватьИзображение", "DrawImage")]
        public void DrawImage(DfImage p1, int p2, int p3, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null, IValue p9 = null)
        {
            string strFunc;
            if (p4 != null && p5 != null && p6 != null && p7 != null && p8 != null && p9 != null)
            {
                strFunc = "" +
                    "let c = mapKeyEl.get('" + Owner.ItemKey + "');" +
                    "let ctx = c.getContext('2d');" +
                    "let img = mapKeyEl.get('" + p1.ItemKey + "');" +
                    "img.onload = function() { ctx.drawImage(img, " + p6 + ", " + p7 + ", " + p8 + ", " + p9 + ", " + p2 + ", " + p3 + ", " + p4 + ", " + p5 + "); }" +
                    "";
            }
            else if (p4 != null && p5 != null)
            {
                strFunc = "" +
                    "let c = mapKeyEl.get('" + Owner.ItemKey + "');" +
                    "let ctx = c.getContext('2d');" +
                    "let img = mapKeyEl.get('" + p1.ItemKey + "');" +
                    "img.onload = function() { ctx.drawImage(img, " + p2 + ", " + p3 + ", " + p4 + ", " + p5 + "); }" +
                    "";
            }
            else
            {
                strFunc = "" +
                    "let c = mapKeyEl.get('" + Owner.ItemKey + "');" +
                    "let ctx = c.getContext('2d');" +
                    "let img = mapKeyEl.get('" + p1.ItemKey + "');" +
                    "img.onload = function() { ctx.drawImage(img, " + p2 + ", " + p3 + "); }" +
                    "";
            }
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("КопироватьДанныеРисунка", "CopyImageData")]
        public void CopyImageData(int p1, int p2, int p3, int p4, int p5, int p6)
        {
            string strFunc = "" +
                "let el = mapKeyEl.get('" + ItemKey + "');" +
                "let c = mapKeyEl.get('" + Owner.ItemKey + "');" +
                "let ctx = c.getContext('2d');" +
                "const imgData = ctx.getImageData(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");" +
                "ctx.putImageData(imgData, " + p5 + ", " + p6 + ");" +
                "";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        public IValue globalAlpha { get; set; }
        [ContextProperty("Альфа", "GlobalAlpha")]
        public IValue GlobalAlpha
        {
            get { return globalAlpha; }
            set
            {
                globalAlpha = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['globalAlpha'] = " + globalAlpha.AsNumber().ToString().Replace(",", ".") + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string globalCompositeOperation { get; set; }
        [ContextProperty("Композиция", "GlobalCompositeOperation")]
        public string GlobalCompositeOperation
        {
            get { return globalCompositeOperation; }
            set
            {
                globalCompositeOperation = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['globalCompositeOperation'] = '" + globalCompositeOperation + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string lineCap { get; set; }
        [ContextProperty("СтильКонцовЛинии", "LineCap")]
        public string LineCap
        {
            get { return lineCap; }
            set
            {
                lineCap = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['lineCap'] = '" + lineCap + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int lineWidth { get; set; }
        [ContextProperty("ШиринаЛинии", "LineWidth")]
        public int LineWidth
        {
            get { return lineWidth; }
            set
            {
                lineWidth = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['lineWidth'] = " + lineWidth + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string lineJoin { get; set; }
        [ContextProperty("СтильУглаПересечения", "LineJoin")]
        public string LineJoin
        {
            get { return lineJoin; }
            set
            {
                lineJoin = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['lineJoin'] = '" + lineJoin + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int miterLimit { get; set; }
        [ContextProperty("ПределСреза", "MiterLimit")]
        public int MiterLimit
        {
            get { return miterLimit; }
            set
            {
                miterLimit = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['miterLimit'] = " + miterLimit + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        [ContextMethod("ДобавитьКвадратичнуюБизье", "QuadraticCurveTo")]
        public void QuadraticCurveTo(int p1, int p2, int p3, int p4)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').quadraticCurveTo(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Восстановить", "Restore")]
        public void Restore()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').restore();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Сохранить", "Save")]
        public void Save()
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').save();";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Повернуть", "Rotate")]
        public void Rotate(IValue p1)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').rotate(" + p1.AsNumber().ToString().Replace(",", ".") + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Масштабировать", "Scale")]
        public void Scale(IValue p1, IValue p2)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').scale(" + p1.AsNumber().ToString().Replace(",", ".") + ", " + p2.AsNumber().ToString().Replace(",", ".") + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("РисоватьПрямоугольник", "StrokeRect")]
        public void StrokeRect(int p1, int p2, int p3, int p4)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').strokeRect(" + p1 + ", " + p2 + ", " + p3 + ", " + p4 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("УстановитьСдвиг", "SetTransform")]
        public void SetTransform(IValue p1, IValue p2, IValue p3, IValue p4, int p5, int p6)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').setTransform(" + p1.AsNumber().ToString().Replace(",", ".") + ", " + p2.AsNumber().ToString().Replace(",", ".") + ", " + p3.AsNumber().ToString().Replace(",", ".") + ", " + p4.AsNumber().ToString().Replace(",", ".") + ", " + p5 + ", " + p6 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        public int shadowBlur { get; set; }
        [ContextProperty("РазмытиеТени", "ShadowBlur")]
        public int ShadowBlur
        {
            get { return shadowBlur; }
            set
            {
                shadowBlur = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['shadowBlur'] = " + shadowBlur + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string shadowColor { get; set; }
        [ContextProperty("ЦветТени", "ShadowColor")]
        public string ShadowColor
        {
            get { return shadowColor; }
            set
            {
                shadowColor = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['shadowColor'] = '" + shadowColor + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int shadowOffsetX { get; set; }
        [ContextProperty("СмещениеТениИкс", "ShadowOffsetX")]
        public int ShadowOffsetX
        {
            get { return shadowOffsetX; }
            set
            {
                shadowOffsetX = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['shadowOffsetX'] = " + shadowOffsetX + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public int shadowOffsetY { get; set; }
        [ContextProperty("СмещениеТениИгрек", "ShadowOffsetY")]
        public int ShadowOffsetY
        {
            get { return shadowOffsetY; }
            set
            {
                shadowOffsetY = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['shadowOffsetY'] = " + shadowOffsetY + ";";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public IValue strokeStyle { get; set; }
        [ContextProperty("СтильОбводки", "StrokeStyle")]
        public IValue StrokeStyle
        {
            get { return strokeStyle; }
            set
            {
                strokeStyle = value;
                string strFunc;
                if (strokeStyle.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    strFunc = "mapKeyEl.get('" + ItemKey + "')['strokeStyle'] = '" + strokeStyle + "';";
                }
                else
                {
                    strFunc = "mapKeyEl.get('" + ItemKey + "')['strokeStyle'] = mapKeyEl.get('" + ((dynamic)strokeStyle).ItemKey + "');";
                }
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        [ContextMethod("РисоватьТекст", "StrokeText")]
        public void StrokeText(string p1, int p2, int p3, IValue p4 = null)
        {
            string strFunc;
            if (p4 != null)
            {
                strFunc = @"mapKeyEl.get('" + ItemKey + "').strokeText('" + p1 + "', " + p2 + ", " + p3 + ", " + p4.AsNumber().ToString().Replace(",", ".") + ");";
            }
            else
            {
                strFunc = @"mapKeyEl.get('" + ItemKey + "').strokeText('" + p1 + "', " + p2 + ", " + p3 + ");";
            }
            DeclarativeForms.SendStrFunc(strFunc);
        }

        public string textAlign { get; set; }
        [ContextProperty("ВыравниваниеТекста", "TextAlign")]
        public string TextAlign
        {
            get { return textAlign; }
            set
            {
                textAlign = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['textAlign'] = '" + textAlign + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string textBaseline { get; set; }
        [ContextProperty("БазоваяЛинияТекста", "TextBaseline")]
        public string TextBaseline
        {
            get { return textBaseline; }
            set
            {
                textBaseline = value;
                string strFunc = "mapKeyEl.get('" + ItemKey + "')['textBaseline'] = '" + textBaseline + "';";
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        [ContextMethod("Сдвинуть", "Transform")]
        public void Transform(IValue p1, IValue p2, IValue p3, IValue p4, int p5, int p6)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').transform(" + p1.AsNumber().ToString().Replace(",", ".") + ", " + p2.AsNumber().ToString().Replace(",", ".") + ", " + p3.AsNumber().ToString().Replace(",", ".") + ", " + p4.AsNumber().ToString().Replace(",", ".") + ", " + p5 + ", " + p6 + ");";
            DeclarativeForms.SendStrFunc(strFunc);
        }

        [ContextMethod("Преобразовать", "Translate")]
        public void Translate(int p1, int p2)
        {
            string strFunc = @"mapKeyEl.get('" + ItemKey + "').translate(" + p1 + ", " + p2 +");";
            DeclarativeForms.SendStrFunc(strFunc);
        }
    }
}
