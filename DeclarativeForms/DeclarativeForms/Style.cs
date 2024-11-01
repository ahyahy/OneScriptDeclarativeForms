using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine;
using System.IO;
using System.Reflection;
using System;

namespace osdf
{
    [ContextClass("ДфСтиль", "DfStyle")]
    public class DfStyle : AutoContext<DfStyle>
    {
        public DfStyle()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "mapKeyEl.set('" + ItemKey + "', document.createElement('style'));" + @"
mapElKey.set(mapKeyEl.get('" + ItemKey + "'), '" + ItemKey + "');";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        private IValue owner;
        public IValue Owner
        {
            get { return owner; }
            set { owner = value; }
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }


        public string Rotate(DfRotate p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "rotate(" + angle + "deg)";
            return res;
        }
        public string RotateY(DfRotateY p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "rotateY(" + angle + "deg)";
            return res;
        }
        public string RotateX(DfRotateX p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "rotateX(" + angle + "deg)";
            return res;
        }
        public string Scale(DfScale p1)
        {
            string res;
            string x = "1";
            string y = "1";
            if (p1.X != null)
            {
                x = p1.X.AsString();
            }
            if (p1.Y != null)
            {
                y = p1.Y.AsString();
            }
            res = "scale(" + x + ", " + y + ")";
            return res;
        }
        public string Rotate3D(DfRotate3D p1)
        {
            string res;
            string x = "0";
            string y = "0";
            string z = "0";
            string angle = "0";
            if (p1.X != null)
            {
                x = p1.X.AsString();
            }
            if (p1.Y != null)
            {
                y = p1.Y.AsString();
            }
            if (p1.Z != null)
            {
                z = p1.Z.AsString();
            }
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "rotate3d(" + x + ", " + y + ", " + z + ", " + angle + "deg)";
            return res;
        }
        public string Translate3D(DfTranslate3D p1)
        {
            string res;
            string x = "0px";
            string y = "0px";
            string z = "0px";
            if (p1.X != null)
            {
                x = p1.X.AsString() + "px";
            }
            if (p1.Y != null)
            {
                y = p1.Y.AsString() + "px";
            }
            if (p1.Z != null)
            {
                z = p1.Z.AsString() + "px";
            }
            res = "translate3d(" + x + ", " + y + ", " + z + ")";
            return res;
        }
        public string Scale3D(DfScale3D p1)
        {
            string res;
            string x = "1";
            string y = "1";
            string z = "1";
            if (p1.X != null)
            {
                x = p1.X.AsString();
            }
            if (p1.Y != null)
            {
                y = p1.Y.AsString();
            }
            if (p1.Z != null)
            {
                z = p1.Z.AsString();
            }
            res = "scale3d(" + x + ", " + y + ", " + z + ")";
            return res;
        }
        public string TranslateZ(DfTranslateZ p1)
        {
            string res;
            string z = "0px";
            if (p1.Z != null)
            {
                z = p1.Z.AsNumber().ToString() + "px";
            }
            res = "translateZ(" + z + ")";
            return res;
        }




        //Сдвиг (Transform)
        public string restransform { get; set; }
        private IValue transform;
        [ContextProperty("Сдвиг", "Transform")]
        public IValue Transform
        {
            get { return transform; }
            set
            {
                transform = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restransform = value.AsString();
                }
                else
                {
                    if (transform.GetType() == typeof(ArrayImpl))
                    {
                        ArrayImpl ArrayImpl1 = (ArrayImpl)value;
                        for (int i = 0; i < ArrayImpl1.Count(); i++)
                        {
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotate))
                            {
                                restransform = restransform + " " + Rotate((DfRotate)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateY))
                            {
                                restransform = restransform + " " + RotateY((DfRotateY)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateX))
                            {
                                restransform = restransform + " " + RotateX((DfRotateX)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScale))
                            {
                                restransform = restransform + " " + Scale((DfScale)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotate3D))
                            {
                                restransform = restransform + " " + Rotate3D((DfRotate3D)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslate3D))
                            {
                                restransform = restransform + " " + Translate3D((DfTranslate3D)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScale3D))
                            {
                                restransform = restransform + " " + Scale3D((DfScale3D)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateZ))
                            {
                                restransform = restransform + " " + TranslateZ((DfTranslateZ)ArrayImpl1.Get(i));
                            }
                        }
                    }

                    if (transform.GetType() == typeof(DfRotate))
                    {
                        restransform = Rotate((DfRotate)transform);
                    }
                    if (transform.GetType() == typeof(DfRotateY))
                    {
                        restransform = RotateY((DfRotateY)transform);
                    }
                    if (transform.GetType() == typeof(DfRotateX))
                    {
                        restransform = RotateX((DfRotateX)transform);
                    }
                    if (transform.GetType() == typeof(DfRotate3D))
                    {
                        restransform = Rotate3D((DfRotate3D)transform);
                    }
                    if (transform.GetType() == typeof(DfScale))
                    {
                        restransform = Scale((DfScale)transform);
                    }
                    if (transform.GetType() == typeof(DfTranslate3D))
                    {
                        restransform = Translate3D((DfTranslate3D)transform);
                    }
                    if (transform.GetType() == typeof(DfTranslate3D))
                    {
                        restransform = Translate3D((DfTranslate3D)transform);
                    }
                    if (transform.GetType() == typeof(DfScale3D))
                    {
                        restransform = Scale3D((DfScale3D)transform);
                    }
                    if (transform.GetType() == typeof(DfTranslateZ))
                    {
                        restransform = TranslateZ((DfTranslateZ)transform);
                    }




                }

                //////DeclarativeForms.GlobalContext().Echo(restransform);

                // доделать

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transform'] = '" + restransform + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resanimationPlayState { get; set; }
        private string animationPlayState;
        [ContextProperty("Состояние", "AnimationPlayState")]
        public string AnimationPlayState
        {
            get { return animationPlayState; }
            set
            {
                animationPlayState = value;
                resanimationPlayState = animationPlayState;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationPlayState'] = '" + resanimationPlayState + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbackgroundSize { get; set; }
        private IValue backgroundSize;
        [ContextProperty("РазмерКартинки", "BackgroundSize")]
        public IValue BackgroundSize
        {
            get { return backgroundSize; }
            set
            {
                backgroundSize = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbackgroundSize = value.AsString();
                }
                else
                {
                    DfSize val = (DfSize)value;
                    if (val.Width != null && val.Height != null)
                    {
                        resbackgroundSize = val.Width.AsNumber().ToString() + "px " + val.Height.AsNumber().ToString() + "px";
                    }
                    else
                    {
                        resbackgroundSize = "auto";
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundSize'] = '" + resbackgroundSize + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resfontSize { get; set; }
        private IValue fontSize;
        [ContextProperty("РазмерШрифта", "FontSize")]
        public IValue HeFontSizeight
        {
            get { return fontSize; }
            set
            {
                fontSize = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resfontSize = value.AsString();
                }
                else
                {
                    resfontSize = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['fontSize'] = '" + resfontSize + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resminHeight { get; set; }
        private IValue minHeight;
        [ContextProperty("МинимальнаяВысота", "MinHeight")]
        public IValue MinHeight
        {
            get { return minHeight; }
            set
            {
                minHeight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resminHeight = value.AsString();
                }
                else
                {
                    resminHeight = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['paddingBottom'] = '" + resminHeight + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resopacity { get; set; }
        private IValue opacity;
        [ContextProperty("Непрозрачность", "Opacity")]
        public IValue Opacity
        {
            get { return opacity; }
            set
            {
                opacity = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resopacity = value.AsString();
                }
                else
                {
                    resopacity = value.AsNumber().ToString().Replace(",", ".");
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['opacity'] = '" + resopacity + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restransformOrigin { get; set; }
        private IValue transformOrigin;
        [ContextProperty("ТочкаСдвига", "TransformOrigin")]
        public IValue TransformOrigin
        {
            get { return transformOrigin; }
            set
            {
                transformOrigin = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restransformOrigin = value.AsString();
                }
                else
                {
                    DfTransformOrigin val = (DfTransformOrigin)value;
                    string axisX = "0";
                    string axisY = "0";
                    string axisZ = "0";
                    if (val.AxisX != 0)
                    {
                        axisX = val.AxisX.ToString();
                    }
                    if (val.AxisY != 0)
                    {
                        axisY = val.AxisY.ToString();
                    }
                    if (val.AxisZ != 0)
                    {
                        axisZ = val.AxisZ.ToString();
                    }
                    restransformOrigin = axisX + " " + axisY + " " + axisZ + " ";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transformOrigin'] = '" + restransformOrigin + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restransformStyle { get; set; }
        private string transformStyle;
        [ContextProperty("СтильСдвига", "TransformStyle")]
        public string TransformStyle
        {
            get { return transformStyle; }
            set
            {
                transformStyle = value;
                restransformStyle = transformStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transformStyle'] = '" + restransformStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resperspectiveOrigin { get; set; }
        private IValue perspectiveOrigin;
        [ContextProperty("ИсточникПерспективы", "PerspectiveOrigin")]
        public IValue PerspectiveOrigin
        {
            get { return perspectiveOrigin; }
            set
            {
                perspectiveOrigin = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resperspectiveOrigin = value.AsString();
                }
                else
                {
                    DfPerspectiveOrigin val = (DfPerspectiveOrigin)value;
                    string x = "0";
                    string y = "0";
                    if (val.X != null)
                    {
                        x = val.X.ToString();
                    }
                    if (val.Y != null)
                    {
                        y = val.Y.ToString();
                    }
                    resperspectiveOrigin = x + "px " + y + "px ";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['perspectiveOrigin'] = '" + resperspectiveOrigin + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resperspective { get; set; }
        private IValue perspective;
        [ContextProperty("Перспектива", "Perspective")]
        public IValue Perspective
        {
            get { return perspective; }
            set
            {
                perspective = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resperspective = value.AsString();
                }
                else
                {
                    resperspective = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['perspective'] = '" + resperspective + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbackgroundRepeat { get; set; }
        private string backgroundRepeat;
        [ContextProperty("МозаикаКартинки", "BackgroundRepeat")]
        public string BackgroundRepeat
        {
            get { return backgroundRepeat; }
            set
            {
                backgroundRepeat = value;
                resbackgroundRepeat = backgroundRepeat;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundRepeat'] = '" + resbackgroundRepeat + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resfontFamily { get; set; }
        private string fontFamily;
        [ContextProperty("СемействоШрифтов", "FontFamily")]
        public string FontFamily
        {
            get { return fontFamily; }
            set
            {
                fontFamily = value;
                resfontFamily = fontFamily;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['fontFamily'] = '" + resfontFamily + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restextShadow { get; set; }
        private IValue textShadow;
        [ContextProperty("ТеньТекста", "TextShadow")]
        public IValue TextShadow
        {
            get { return textShadow; }
            set
            {
                textShadow = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restextShadow = value.AsString();
                }
                else
                {
                    DfBoxShadow val = (DfBoxShadow)value;
                    string x = "0px ";
                    string y = "0px ";
                    string blur = "0px ";
                    string color = "rgb(0, 0, 0) ";
                    if (val.X != null)
                    {
                        x = val.X.AsNumber().ToString() + "px ";
                    }
                    if (val.Y != null)
                    {
                        y = val.Y.AsNumber().ToString() + "px ";
                    }
                    if (val.Blur != null)
                    {
                        blur = val.Blur.AsNumber().ToString() + "px ";
                    }
                    if (val.Color != null)
                    {
                        color = val.Color.AsString() + " ";
                    }
                    restextShadow = x + y + blur + color;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textShadow'] = '" + restextShadow + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbackgroundImage { get; set; }
        private string backgroundImage;
        [ContextProperty("ФоновоеИзображение", "BackgroundImage")]
        public string BackgroundImage
        {
            get { return backgroundImage; }
            set
            {
                backgroundImage = value;
                if (value.Contains("gradient"))
                {
                    resbackgroundImage = backgroundImage;
                }
                else
                {
                    resbackgroundImage = "url('" + backgroundImage
                        .Replace("url(\u0022", "")
                        .Replace("\u0022)", "")
                        .Replace("url('", "")
                        .Replace("')", "")
                        .Replace(" ", "%20") +
                        "') ";
                }
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundImage'] = \u0022" + resbackgroundImage + "\u0022;";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoffset { get; set; }
        private IValue offset;
        [ContextProperty("Смещение", "Offset")]
        public IValue Offset
        {
            get { return offset; }
            set
            {
                offset = value;
                resoffset = value.AsNumber().ToString().Replace(",", ".");
            }
        }

        private DfFrames frames;
        [ContextProperty("Кадры", "Frames")]
        public DfFrames Frames
        {
            get { return frames; }
            set
            {
                frames = value;
                string strFunc = "" +
                    "let s = '@keyframes " + frames.Name + @" { \u000A';" +
                    "let el = mapKeyEl.get('" + frames.ItemKey + "');" +
                    "for (var i = 0; i < el.length; i++)" +
                    "{" +
                    "   let item = el[i];" +
                    "   let offset = '';" +
                    "   let keys = Object.keys(item);" +
                    "   let subS = '';" +
                    "   for (var i1 = 0; i1 < keys.length; i1++)" +
                    "   {" +
                    "       let prop = keys[i1];" +
                    "       if (!prop.includes('offset'))" +
                    "       {" +
                    "           subS += prop + ': ';" +
                    "           subS += item[prop] + '; ';" +
                    "       }" +
                    "       else" +
                    "       {" +
                    "           offset = '' + (parseFloat(item[prop]) * 100) + '% ';" +
                    "       }" +
                    "   }" +
                    "   subS = offset + ' {' + subS;" +
                    "   s += subS;" +
                    "   s += '}" + @"\u000A';" +
                    "}" +
                    "s += '}';" +
                    //"alert(s);" +
                    "let el2 = mapKeyEl.get('" + ItemKey + "');" +
                    "var t = document.createTextNode(s);" +
                    "el2.appendChild(t);" +
                    "document.body.appendChild(el2);";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
            }
        }

        public string resanimation { get; set; }
        private IValue animation;
        [ContextProperty("Анимация", "Animation")]
        public IValue Animation
        {
            get { return animation; }
            set
            {
                animation = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resanimation = value.AsString();
                }
                else
                {
                    DfAnimationProperties val = (DfAnimationProperties)value;
                    string name = "none ";
                    string duration = "0ms ";
                    string timingFunction = "ease ";
                    string delay = "0ms ";
                    string iterationCount = "1 ";
                    string direction = "normal ";
                    string fillMode = "none ";
                    string playState = "running ";
                    if (val.AnimationName != null)
                    {
                        name = val.AnimationName + " ";
                    }
                    if (val.AnimationDuration != null)
                    {
                        duration = val.AnimationDuration.AsNumber().ToString() + "ms ";
                    }
                    if (val.AnimationTimingFunction != null)
                    {
                        timingFunction = val.AnimationTimingFunction.AsString() + " ";
                    }
                    if (val.AnimationDelay != null)
                    {
                        delay = val.AnimationDelay.AsNumber().ToString() + "ms ";
                    }
                    if (val.AnimationIterationCount != null)
                    {
                        if (Convert.ToInt32(val.AnimationIterationCount.AsNumber()) == -1)
                        {
                            iterationCount = "infinite ";
                        }
                        else
                        {
                            iterationCount = val.AnimationIterationCount.AsNumber().ToString() + " ";
                        }
                    }
                    if (val.AnimationDirection != null)
                    {
                        direction = val.AnimationDirection.AsString() + " ";
                    }
                    if (val.AnimationFillMode != null)
                    {
                        fillMode = val.AnimationFillMode.AsString() + " ";
                    }
                    if (val.AnimationPlayState != null)
                    {
                        playState = val.AnimationPlayState.AsString() + " ";
                    }
                    resanimation = name + duration + timingFunction + delay + iterationCount + direction + fillMode + playState;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animation'] = '" + resanimation + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resalignSelf { get; set; }
        private string alignSelf;
        [ContextProperty("ВыравниваниеОтдельных", "AlignSelf")]
        public string AlignSelf
        {
            get { return alignSelf; }
            set
            {
                alignSelf = value;
                resalignSelf = alignSelf;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['alignSelf'] = '" + resalignSelf + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resalignContent { get; set; }
        private string alignContent;
        [ContextProperty("ВыравниваниеСодержимого", "AlignContent")]
        public string AlignContent
        {
            get { return alignContent; }
            set
            {
                alignContent = value;
                resalignContent = alignContent;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['alignContent'] = '" + resalignContent + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resflexDirection { get; set; }
        private string flexDirection;
        [ContextProperty("НаправлениеЭлементов", "FlexDirection")]
        public string FlexDirection
        {
            get { return flexDirection; }
            set
            {
                flexDirection = value;
                resflexDirection = flexDirection;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flexDirection'] = '" + resflexDirection + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resflexWrap { get; set; }
        private string flexWrap;
        [ContextProperty("ПереносГибких", "FlexWrap")]
        public string FlexWrap
        {
            get { return flexWrap; }
            set
            {
                flexWrap = value;
                resflexWrap = flexWrap;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flexWrap'] = '" + resflexWrap + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderRadius { get; set; }
        private IValue borderRadius;
        [ContextProperty("РадиусГраницы", "BorderRadius")]
        public IValue BorderRadius
        {
            get { return borderRadius; }
            set
            {
                borderRadius = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderRadius = value.AsString();
                }
                else
                {
                    DfBorderRadius val = (DfBorderRadius)value;
                    string borderTopLeftRadius = "0px ";
                    string borderTopRightRadius = "0px ";
                    string borderBottomRightRadius = "0px ";
                    string borderBottomLeftRadius = "0px ";
                    if (val.BorderTopLeftRadius != 0)
                    {
                        borderTopLeftRadius = val.BorderTopLeftRadius.ToString() + "px ";
                    }
                    if (val.BorderTopRightRadius != 0)
                    {
                        borderTopRightRadius = val.BorderTopRightRadius.ToString() + "px ";
                    }
                    if (val.BorderBottomRightRadius != 0)
                    {
                        borderBottomRightRadius = val.BorderBottomRightRadius.ToString() + "px ";
                    }
                    if (val.BorderBottomLeftRadius != 0)
                    {
                        borderBottomLeftRadius = val.BorderBottomLeftRadius.ToString() + "px ";
                    }
                    resborderRadius = borderTopLeftRadius + borderTopRightRadius + borderBottomRightRadius + borderBottomLeftRadius;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderRadius'] = '" + resborderRadius + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }

            }
        }

        public string resmarginTop { get; set; }
        private IValue marginTop;
        [ContextProperty("ОтступСверху", "MarginTop")]
        public IValue MarginTop
        {
            get { return marginTop; }
            set
            {
                marginTop = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmarginTop = value.AsString();
                }
                else
                {
                    resmarginTop = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['marginTop'] = '" + resmarginTop + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resmarginLeft { get; set; }
        private IValue marginLeft;
        [ContextProperty("ОтступСлева", "MarginLeft")]
        public IValue MarginLeft
        {
            get { return marginLeft; }
            set
            {
                marginLeft = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmarginLeft = value.AsString();
                }
                else
                {
                    resmarginLeft = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['marginLeft'] = '" + resmarginLeft + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resmarginBottom { get; set; }
        private IValue marginBottom;
        [ContextProperty("ОтступСнизу", "MarginBottom")]
        public IValue MarginBottom
        {
            get { return marginBottom; }
            set
            {
                marginBottom = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmarginBottom = value.AsString();
                }
                else
                {
                    resmarginBottom = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['marginBottom'] = '" + resmarginBottom + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resmarginRight { get; set; }
        private IValue marginRight;
        [ContextProperty("ОтступСправа", "MarginRight")]
        public IValue MarginRight
        {
            get { return marginRight; }
            set
            {
                marginRight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmarginRight = value.AsString();
                }
                else
                {
                    resmarginRight = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['marginRight'] = '" + resmarginRight + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resfont { get; set; }
        private IValue font;
        [ContextProperty("Шрифт", "Font")]
        public IValue Font
        {
            get { return font; }
            set
            {
                font = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resfont = value.AsString();
                }
                else
                {
                    DfFont val = (DfFont)value;
                    string fontStyle = "";
                    string fontVariant = "";
                    string fontWeight = "";
                    string fontSize = "100%";
                    string lineHeight = "100%";
                    string fontFamily = "";
                    if (val.FontStyle != null)
                    {
                        fontStyle = val.FontStyle.AsString() + " ";
                    }
                    if (val.FontVariant != null)
                    {
                        fontVariant = val.FontVariant.AsString() + " ";
                    }
                    if (val.FontWeight != null)
                    {
                        fontWeight = val.FontWeight.AsString() + " ";
                    }
                    if (val.FontSize != null)
                    {
                        fontSize = val.FontSize.AsNumber().ToString() + "px";
                    }
                    if (val.LineHeight != null)
                    {
                        lineHeight = val.LineHeight.AsNumber().ToString() + "px";
                    }
                    if (val.FontFamily != null)
                    {
                        fontFamily = val.FontFamily.AsString() + " ";
                    }
                    resfont = fontStyle + fontVariant + fontWeight + fontSize + "/" + lineHeight + " " + fontFamily;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['font'] = '" + resfont + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resfilter { get; set; }
        private IValue filter;
        [ContextProperty("Фильтр", "Filter")]
        public IValue Filter
        {
            get { return filter; }
            set
            {
                filter = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resfilter = value.AsString();
                }
                else
                {
                    DfImagesFilter val = (DfImagesFilter)value;
                    string blur = "";
                    string brightness = "";
                    string contrast = "";
                    string dropShadow = "";
                    string grayscale = "";
                    string hueRotate = "";
                    string invert = "";
                    string opacity = "";
                    string saturate = "";
                    string sepia = "";
                    if (val.Blur != null)
                    {
                        blur = "blur(" + val.Blur.AsNumber().ToString() + "px) ";
                    }
                    if (val.Brightness != null)
                    {
                        brightness = "brightness(" + val.Brightness.AsNumber().ToString() + "%) ";
                    }
                    if (val.Contrast != null)
                    {
                        contrast = "contrast(" + val.Contrast.AsNumber().ToString() + "%) ";
                    }
                    if (val.DropShadow != null)
                    {
                        DfBoxShadow boxShadow = (DfBoxShadow)val.DropShadow;
                        string x = "";
                        string y = "";
                        string _blur = "";
                        string spread = "";
                        string color = "";
                        if (boxShadow.X != null)
                        {
                            x = boxShadow.X.AsNumber().ToString() + "px ";
                        }
                        if (boxShadow.Y != null)
                        {
                            y = boxShadow.Y.AsNumber().ToString() + "px ";
                        }
                        if (boxShadow.Blur != null)
                        {
                            _blur = boxShadow.Blur.AsNumber().ToString() + "px ";
                        }
                        if (boxShadow.Spread != null)
                        {
                            //spread = "" + boxShadow.Spread.AsNumber().ToString() + "px ";
                            // Не поддерживается множеством браузеров. Не используем.
                            spread = "";
                        }
                        if (boxShadow.Color != null)
                        {
                            color = boxShadow.Color.AsString() + "";
                        }
                        dropShadow = "drop-shadow(" + x + y + _blur + spread + color + ") ";
                    }
                    if (val.Grayscale != null)
                    {
                        grayscale = "grayscale(" + val.Grayscale.AsNumber().ToString() + "%) ";
                    }
                    if (val.HueRotate != null)
                    {
                        hueRotate = "hue-rotate(" + val.HueRotate.AsNumber().ToString() + "deg) ";
                    }
                    if (val.Invert != null)
                    {
                        invert = "invert(" + val.Invert.AsNumber().ToString() + "%) ";
                    }
                    if (val.Opacity != null)
                    {
                        opacity = "opacity(" + val.Opacity.AsNumber().ToString() + "%) ";
                    }
                    if (val.Saturate != null)
                    {
                        saturate = "saturate(" + val.Saturate.AsNumber().ToString() + ") ";
                    }
                    if (val.Sepia != null)
                    {
                        sepia = "sepia(" + val.Sepia.AsNumber().ToString() + "%) ";
                    }
                    resfilter = blur + brightness + contrast + dropShadow + grayscale + hueRotate + invert + opacity + saturate + sepia;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['filter'] = '" + resfilter + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resposition { get; set; }
        private string position;
        [ContextProperty("Позиция", "Position")]
        public string Position
        {
            get { return position; }
            set
            {
                position = value;
                resposition = position;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['position'] = '" + resposition + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restop { get; set; }
        private IValue top;
        [ContextProperty("Верх", "Top")]
        public IValue Top
        {
            get { return top; }
            set
            {
                top = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restop = value.AsString();
                }
                else
                {
                    restop = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['top'] = '" + restop + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbottom { get; set; }
        private IValue bottom;
        [ContextProperty("Низ", "Bottom")]
        public IValue Bottom
        {
            get { return bottom; }
            set
            {
                bottom = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbottom = value.AsString();
                }
                else
                {
                    resbottom = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['bottom'] = '" + resbottom + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resleft { get; set; }
        private IValue left;
        [ContextProperty("Лево", "Left")]
        public IValue Left
        {
            get { return left; }
            set
            {
                left = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resleft = value.AsString();
                }
                else
                {
                    resleft = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['left'] = '" + resleft + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resright { get; set; }
        private IValue right;
        [ContextProperty("Право", "Right")]
        public IValue Right
        {
            get { return right; }
            set
            {
                right = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resright = value.AsString();
                }
                else
                {
                    resright = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['right'] = '" + resright + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resjustifyContent { get; set; }
        private string justifyContent;
        [ContextProperty("РасположениеСодержимого", "JustifyContent")]
        public string JustifyContent
        {
            get { return justifyContent; }
            set
            {
                justifyContent = value;
                resjustifyContent = justifyContent;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['justifyContent'] = '" + resjustifyContent + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resdisplay { get; set; }
        private string display;
        [ContextProperty("Отображать", "Display")]
        public string Display
        {
            get { return display; }
            set
            {
                display = value;
                resdisplay = display;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['display'] = '" + resdisplay + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resalignItems { get; set; }
        private string alignItems;
        [ContextProperty("ВыравниваниеЭлементов", "AlignItems")]
        public string AlignItems
        {
            get { return alignItems; }
            set
            {
                alignItems = value;
                resalignItems = alignItems;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['alignItems'] = '" + resalignItems + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resboxShadow { get; set; }
        private IValue boxShadow;
        [ContextProperty("Тень", "BoxShadow")]
        public IValue BoxShadow
        {
            get { return boxShadow; }
            set
            {
                boxShadow = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resboxShadow = value.AsString();
                }
                else
                {
                    DfBoxShadow val = (DfBoxShadow)value;
                    string x = "0px ";
                    string y = "0px ";
                    string blur = "0px ";
                    string spread = "0px ";
                    string color = "rgb(0, 0, 0) ";
                    string inset = "";
                    if (val.X != null)
                    {
                        x = val.X.AsNumber().ToString() + "px ";
                    }
                    if (val.Y != null)
                    {
                        y = val.Y.AsNumber().ToString() + "px ";
                    }
                    if (val.Blur != null)
                    {
                        blur = val.Blur.AsNumber().ToString() + "px ";
                    }
                    if (val.Spread != null)
                    {
                        spread = val.Spread.AsNumber().ToString() + "px ";
                    }
                    if (val.Color != null)
                    {
                        color = val.Color.AsString() + " ";
                    }
                    if (val.Inset)
                    {
                        inset = "inset";
                    }
                    resboxShadow = x + y + blur + spread + color + inset;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['boxShadow'] = '" + resboxShadow + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string reslistStyle { get; set; }
        private IValue listStyle;
        [ContextProperty("СтильСписка", "ListStyle")]
        public IValue ListStyle
        {
            get { return listStyle; }
            set
            {
                listStyle = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    reslistStyle = value.AsString();
                }
                else
                {
                    DfListStyle val = (DfListStyle)value;
                    string listStyleType = "decimal ";
                    string listStylePosition = "outside ";
                    string listStyleImage = "none";
                    if (val.ListStyleType != null)
                    {
                        listStyleType = val.ListStyleType.AsString() + " ";
                    }
                    if (val.ListStylePosition != null)
                    {
                        listStylePosition = val.ListStylePosition.AsString() + " ";
                    }
                    if (val.ListStyleImage != null)
                    {
                        listStyleImage = "url('" + val.ListStyleImage.AsString()
                            .Replace("url(\u0022", "")
                            .Replace("\u0022)", "")
                            .Replace("url('", "")
                            .Replace("')", "")
                            .Replace(" ", "%20") +
                            "') ";
                    }
                    reslistStyle = listStyleType + listStylePosition + listStyleImage;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['listStyle'] = \u0022" + reslistStyle + "\u0022;";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string rescolumnRule { get; set; }
        private IValue columnRule;
        [ContextProperty("РазделительКолонок", "ColumnRule")]
        public IValue ColumnRule
        {
            get { return columnRule; }
            set
            {
                columnRule = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnRule = value.AsString();
                }
                else
                {
                    DfColumnRule val = (DfColumnRule)value;
                    string columnRuleWidth = "medium ";
                    string columnRuleStyle = "none ";
                    string columnRuleColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.ColumnRuleWidth != null)
                    {
                        if (val.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            columnRuleWidth = val.ColumnRuleWidth.AsString() + " ";
                        }
                        else if (val.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            columnRuleWidth = val.ColumnRuleWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.ColumnRuleStyle != null)
                    {
                        columnRuleStyle = val.ColumnRuleStyle.AsString() + " ";
                    }
                    if (val.ColumnRuleColor != null)
                    {
                        columnRuleColor = val.ColumnRuleColor.AsString();
                    }
                    rescolumnRule = columnRuleWidth + columnRuleStyle + columnRuleColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnRule'] = '" + rescolumnRule + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resverticalAlign { get; set; }
        private IValue verticalAlign;
        [ContextProperty("ВертикальноеВыравнивание", "VerticalAlign")]
        public IValue VerticalAlign
        {
            get { return verticalAlign; }
            set
            {
                verticalAlign = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resverticalAlign = value.AsString();
                }
                else
                {
                    resverticalAlign = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['verticalAlign'] = '" + resverticalAlign + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderTop { get; set; }
        private IValue borderTop;
        [ContextProperty("ВерхняяГраница", "BorderTop")]
        public IValue BorderTop
        {
            get { return borderTop; }
            set
            {
                borderTop = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderTop = value.AsString();
                }
                else
                {
                    DfBorderTop val = (DfBorderTop)value;
                    string borderTopWidth = "medium ";
                    string borderTopStyle = "none ";
                    string borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderTopWidth != null)
                    {
                        if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderTopWidth = val.BorderTopWidth.AsString() + " ";
                        }
                        else if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderTopWidth = val.BorderTopWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderTopStyle != null)
                    {
                        borderTopStyle = val.BorderTopStyle.AsString() + " ";
                    }
                    if (val.BorderTopColor != null)
                    {
                        borderTopColor = val.BorderTopColor.AsString();
                    }
                    resborderTop = borderTopWidth + borderTopStyle + borderTopColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTop'] = '" + resborderTop + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resheight { get; set; }
        private IValue height;
        [ContextProperty("Высота", "Height")]
        public IValue Height
        {
            get { return height; }
            set
            {
                height = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resheight = value.AsString();
                }
                else
                {
                    resheight = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['height'] = '" + resheight + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string reshorizontalTextAlign { get; set; }
        private string horizontalTextAlign;
        [ContextProperty("ГоризонтальноеВыравниваниеТекста", "HorizontalTextAlign")]
        public string HorizontalTextAlign
        {
            get { return horizontalTextAlign; }
            set
            {
                horizontalTextAlign = value;
                reshorizontalTextAlign = horizontalTextAlign;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textAlign'] = '" + reshorizontalTextAlign + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderCollapse { get; set; }
        private string borderCollapse;
        [ContextProperty("ГраницаСвернута", "BorderCollapse")]
        public string BorderCollapse
        {
            get { return borderCollapse; }
            set
            {
                borderCollapse = value;
                resborderCollapse = borderCollapse;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderCollapse'] = '" + resborderCollapse + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborders { get; set; }
        private IValue borders;
        [ContextProperty("Границы", "Borders")]
        public IValue Borders
        {
            get { return borders; }
            set
            {
                borders = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborders = value.AsString();
                }
                else
                {
                    DfBorders val = (DfBorders)value;
                    string borderWidth = "medium ";
                    string borderStyle = "none ";
                    string borderColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderWidth != null)
                    {
                        if (val.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderWidth = val.BorderWidth.AsString() + " ";
                        }
                        else if (val.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderWidth = val.BorderWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderStyle != null)
                    {
                        borderStyle = val.BorderStyle.AsString() + " ";
                    }
                    if (val.BorderColor != null)
                    {
                        borderColor = val.BorderColor.AsString();
                    }
                    resborders = borderWidth + borderStyle + borderColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['border'] = '" + resborders + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string respadding { get; set; }
        private IValue padding;
        [ContextProperty("Заполнение", "Padding")]
        public IValue Padding
        {
            get { return padding; }
            set
            {
                padding = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    respadding = value.AsString();
                }
                else
                {
                    DfPadding val = (DfPadding)value;
                    string paddingTop = "0px ";
                    string paddingRight = "0px ";
                    string paddingBottom = "0px ";
                    string paddingLeft = "0px";
                    if (val.PaddingTop != null)
                    {
                        paddingTop = val.PaddingTop.AsNumber().ToString() + "px ";
                    }
                    if (val.PaddingRight != null)
                    {
                        paddingRight = val.PaddingRight.AsNumber().ToString() + "px ";
                    }
                    if (val.PaddingBottom != null)
                    {
                        paddingBottom = val.PaddingBottom.AsNumber().ToString() + "px ";
                    }
                    if (val.PaddingLeft != null)
                    {
                        paddingLeft = val.PaddingLeft.AsNumber().ToString() + "px";
                    }
                    respadding = paddingTop + paddingRight + paddingBottom + paddingLeft;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['padding'] = '" + respadding + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string respaddingTop { get; set; }
        private IValue paddingTop;
        [ContextProperty("ЗаполнениеСверху", "PaddingTop")]
        public IValue PaddingTop
        {
            get { return paddingTop; }
            set
            {
                paddingTop = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    respaddingTop = value.AsString();
                }
                else
                {
                    respaddingTop = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['paddingTop'] = '" + respaddingTop + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string respaddingLeft { get; set; }
        private IValue paddingLeft;
        [ContextProperty("ЗаполнениеСлева", "PaddingLeft")]
        public IValue PaddingLeft
        {
            get { return paddingLeft; }
            set
            {
                paddingLeft = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    respaddingLeft = value.AsString();
                }
                else
                {
                    respaddingLeft = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['paddingLeft'] = '" + respaddingLeft + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string respaddingBottom { get; set; }
        private IValue paddingBottom;
        [ContextProperty("ЗаполнениеСнизу", "PaddingBottom")]
        public IValue PaddingBottom
        {
            get { return paddingBottom; }
            set
            {
                paddingBottom = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    respaddingBottom = value.AsString();
                }
                else
                {
                    respaddingBottom = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['paddingBottom'] = '" + respaddingBottom + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string respaddingRight { get; set; }
        private IValue paddingRight;
        [ContextProperty("ЗаполнениеСправа", "PaddingRight")]
        public IValue PaddingRight
        {
            get { return paddingRight; }
            set
            {
                paddingRight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    respaddingRight = value.AsString();
                }
                else
                {
                    respaddingRight = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['paddingRight'] = '" + respaddingRight + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        public string resborderImage { get; set; }
        private IValue borderImage;
        [ContextProperty("КартинкаГраницы", "BorderImage")]
        public IValue BorderImage
        {
            get { return borderImage; }
            set
            {
                borderImage = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderImage = value.AsString();
                }
                else
                {
                    DfBorderImage val = (DfBorderImage)value;
                    string borderImageSource = "none ";
                    string borderImageSlice = "100 ";
                    string borderImageWidth = "1 ";
                    string borderImageOutset = "0 ";
                    string borderImageRepeat = "stretch";
                    if (val.BorderImageSource != null)
                    {
                        borderImageSource = "url('" + val.BorderImageSource.AsString()
                            .Replace("url(\u0022", "")
                            .Replace("\u0022)", "")
                            .Replace("url('", "")
                            .Replace("')", "")
                            .Replace(" ", "%20") +
                            "') ";
                    }
                    if (val.BorderImageSlice != null)
                    {
                        borderImageSlice = val.BorderImageSlice.AsNumber().ToString() + " ";
                    }
                    if (val.BorderImageWidth != null)
                    {
                        borderImageWidth = val.BorderImageWidth.AsNumber().ToString() + " ";
                    }
                    if (val.BorderImageOutset != null)
                    {
                        borderImageOutset = val.BorderImageOutset.AsNumber().ToString() + " ";
                    }
                    if (val.BorderImageRepeat != null)
                    {
                        borderImageRepeat = val.BorderImageRepeat.AsString();
                    }
                    resborderImage = borderImageSource + borderImageSlice + borderImageWidth + borderImageOutset + borderImageRepeat;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImage'] = \u0022" + resborderImage + "\u0022;";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string rescolumnCount { get; set; }
        private IValue columnCount;
        [ContextProperty("КоличествоКолонок", "ColumnCount")]
        public IValue ColumnCount
        {
            get { return columnCount; }
            set
            {
                columnCount = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnCount = value.AsString();
                }
                else
                {
                    rescolumnCount = value.AsNumber().ToString().Replace(",", ".");
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnCount'] = '" + rescolumnCount + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string rescolumns { get; set; }
        private IValue columns;
        [ContextProperty("КолонкиЭлемента", "Columns")]
        public IValue Columns
        {
            get { return columns; }
            set
            {
                columns = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumns = value.AsString();
                }
                else
                {
                    DfColumns val = (DfColumns)value;
                    string columnWidth = "auto ";
                    string columnCount = "auto";
                    if (val.ColumnWidth != null)
                    {
                        if (val.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            columnWidth = val.ColumnWidth.AsString() + " ";
                        }
                        else if (val.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            columnWidth = val.ColumnWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.ColumnCount != null)
                    {
                        columnCount = val.ColumnCount.AsNumber().ToString();
                    }
                    rescolumns = columnWidth + columnCount;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columns'] = '" + rescolumns + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoutline { get; set; }
        private IValue outline;
        [ContextProperty("Контур", "Outline")]
        public IValue Outline
        {
            get { return outline; }
            set
            {
                outline = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resoutline = value.AsString();
                }
                else
                {
                    DfOutline val = (DfOutline)value;
                    string outlineWidth = "medium ";
                    string outlineStyle = "none ";
                    string outlineColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.OutlineWidth != null)
                    {
                        if (val.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            outlineWidth = val.OutlineWidth.AsString() + " ";
                        }
                        else if (val.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            outlineWidth = val.OutlineWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.OutlineStyle != null)
                    {
                        outlineStyle = val.OutlineStyle.AsString() + " ";
                    }
                    if (val.OutlineColor != null)
                    {
                        outlineColor = val.OutlineColor.AsString();
                    }
                    resoutline = outlineWidth + outlineStyle + outlineColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['outline'] = '" + resoutline + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderLeft { get; set; }
        private IValue borderLeft;
        [ContextProperty("ЛеваяГраница", "BorderLeft")]
        public IValue BorderLeft
        {
            get { return borderLeft; }
            set
            {
                borderLeft = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderLeft = value.AsString();
                }
                else
                {
                    DfBorderLeft val = (DfBorderLeft)value;
                    string borderLeftWidth = "medium ";
                    string borderLeftStyle = "none ";
                    string borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderLeftWidth != null)
                    {
                        if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderLeftWidth = val.BorderLeftWidth.AsString() + " ";
                        }
                        else if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderLeftWidth = val.BorderLeftWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderLeftStyle != null)
                    {
                        borderLeftStyle = val.BorderLeftStyle.AsString() + " ";
                    }
                    if (val.BorderLeftColor != null)
                    {
                        borderLeftColor = val.BorderLeftColor.AsString();
                    }
                    resborderLeft = borderLeftWidth + borderLeftStyle + borderLeftColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderLeft'] = '" + resborderLeft + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderRight { get; set; }
        private IValue borderRight;
        [ContextProperty("ПраваяГраница", "BorderRight")]
        public IValue BorderRight
        {
            get { return borderRight; }
            set
            {
                borderRight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderRight = value.AsString();
                }
                else
                {
                    DfBorderRight val = (DfBorderRight)value;
                    string borderRightWidth = "medium ";
                    string borderRightStyle = "none ";
                    string borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderRightWidth != null)
                    {
                        if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderRightWidth = val.BorderRightWidth.AsString() + " ";
                        }
                        else if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderRightWidth = val.BorderRightWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderRightStyle != null)
                    {
                        borderRightStyle = val.BorderRightStyle.AsString() + " ";
                    }
                    if (val.BorderRightColor != null)
                    {
                        borderRightColor = val.BorderRightColor.AsString();
                    }
                    resborderRight = borderRightWidth + borderRightStyle + borderRightColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderRight'] = '" + resborderRight + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderBottom { get; set; }
        private IValue borderBottom;
        [ContextProperty("НижняяГраница", "BorderBottom")]
        public IValue BorderBottom
        {
            get { return borderBottom; }
            set
            {
                borderBottom = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderBottom = value.AsString();
                }
                else
                {
                    DfBorderBottom val = (DfBorderBottom)value;
                    string borderBottomWidth = "medium ";
                    string borderBottomStyle = "none ";
                    string borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderBottomWidth != null)
                    {
                        if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderBottomWidth = val.BorderBottomWidth.AsString() + " ";
                        }
                        else if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderBottomWidth = val.BorderBottomWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderBottomStyle != null)
                    {
                        borderBottomStyle = val.BorderBottomStyle.AsString() + " ";
                    }
                    if (val.BorderBottomColor != null)
                    {
                        borderBottomColor = val.BorderBottomColor.AsString();
                    }
                    resborderBottom = borderBottomWidth + borderBottomStyle + borderBottomColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottom'] = '" + resborderBottom + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resmargin { get; set; }
        private IValue margin;
        [ContextProperty("Отступ", "Margin")]
        public IValue Margin
        {
            get { return margin; }
            set
            {
                margin = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmargin = value.AsString();
                }
                else
                {
                    DfMargin val = (DfMargin)value;
                    string marginTop = "";
                    string marginRight = "";
                    string marginBottom = "";
                    string marginLeft = "";
                    string auto = "";
                    if (val.MarginTop != 0)
                    {
                        marginTop = val.MarginTop.ToString() + "px ";
                    }
                    if (val.MarginRight != 0)
                    {
                        marginRight = val.MarginRight.ToString() + "px ";
                    }
                    if (val.MarginBottom != 0)
                    {
                        marginBottom = val.MarginBottom.ToString() + "px ";
                    }
                    if (val.MarginLeft != 0)
                    {
                        marginLeft = val.MarginLeft.ToString() + "px ";
                    }
                    if (val.Auto)
                    {
                        auto = "auto";
                    }
                    resmargin = marginTop + marginRight + marginBottom + marginLeft + auto;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['margin'] = '" + resmargin + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoverflow { get; set; }
        private string overflow;
        [ContextProperty("Переполнение", "Overflow")]
        public string Overflow
        {
            get { return overflow; }
            set
            {
                overflow = value;
                resoverflow = overflow;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['overflow'] = '" + resoverflow + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoverflowY { get; set; }
        private string overflowY;
        [ContextProperty("ПереполнениеИгрек", "OverflowY")]
        public string OverflowY
        {
            get { return overflowY; }
            set
            {
                overflowY = value;
                resoverflowY = overflowY;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['overflowY'] = '" + resoverflowY + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoverflowX { get; set; }
        private string overflowX;
        [ContextProperty("ПереполнениеИкс", "OverflowX")]
        public string OverflowX
        {
            get { return overflowX; }
            set
            {
                overflowX = value;
                resoverflowX = overflowX;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['overflowX'] = '" + resoverflowX + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string reswhiteSpace { get; set; }
        private string whiteSpace;
        [ContextProperty("Пробелы", "WhiteSpace")]
        public string WhiteSpace
        {
            get { return whiteSpace; }
            set
            {
                whiteSpace = value;
                reswhiteSpace = whiteSpace;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['whiteSpace'] = '" + reswhiteSpace + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restableLayout { get; set; }
        private string tableLayout;
        [ContextProperty("РазмещениеВТаблице", "TableLayout")]
        public string TableLayout
        {
            get { return tableLayout; }
            set
            {
                tableLayout = value;
                restableLayout = tableLayout;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['tableLayout'] = '" + restableLayout + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbordersStyle { get; set; }
        private IValue bordersStyle;
        [ContextProperty("СтильГраниц", "BordersStyle")]
        public IValue BordersStyle
        {
            get { return bordersStyle; }
            set
            {
                bordersStyle = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbordersStyle = value.AsString();
                }
                else
                {
                    DfBordersStyle val = (DfBordersStyle)value;
                    string borderTopStyle = "none ";
                    string borderRightStyle = "none ";
                    string borderBottomStyle = "none ";
                    string borderLeftStyle = "none";
                    if (val.BorderTopStyle != null)
                    {
                        borderTopStyle = val.BorderTopStyle.AsString() + " ";
                    }
                    if (val.BorderRightStyle != null)
                    {
                        borderRightStyle = val.BorderRightStyle.AsString() + " ";
                    }
                    if (val.BorderBottomStyle != null)
                    {
                        borderBottomStyle = val.BorderBottomStyle.AsString() + " ";
                    }
                    if (val.BorderLeftStyle != null)
                    {
                        borderLeftStyle = val.BorderLeftStyle.AsString();
                    }
                    resbordersStyle = borderTopStyle + borderRightStyle + borderBottomStyle + borderLeftStyle;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderStyle'] = '" + resbordersStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoutlineStyle { get; set; }
        private string outlineStyle;
        [ContextProperty("СтильКонтура", "OutlineStyle")]
        public string OutlineStyle
        {
            get { return outlineStyle; }
            set
            {
                outlineStyle = value;
                resoutlineStyle = outlineStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['outlineStyle'] = '" + resoutlineStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderTopStyle { get; set; }
        private string borderTopStyle;
        [ContextProperty("СтильВерхнейГраницы", "BorderTopStyle")]
        public string BorderTopStyle
        {
            get { return borderTopStyle; }
            set
            {
                borderTopStyle = value;
                resborderTopStyle = borderTopStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTopStyle'] = '" + resborderTopStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderRightStyle { get; set; }
        private string borderRightStyle;
        [ContextProperty("СтильПравойГраницы", "BorderRightStyle")]
        public string BorderRightStyle
        {
            get { return borderRightStyle; }
            set
            {
                borderRightStyle = value;
                resborderRightStyle = borderRightStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderRightStyle'] = '" + resborderRightStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderBottomStyle { get; set; }
        private string borderBottomStyle;
        [ContextProperty("СтильНижнейГраницы", "BorderBottomStyle")]
        public string BorderBottomStyle
        {
            get { return borderBottomStyle; }
            set
            {
                borderBottomStyle = value;
                resborderBottomStyle = borderBottomStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottomStyle'] = '" + resborderBottomStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderLeftStyle { get; set; }
        private string borderLeftStyle;
        [ContextProperty("СтильЛевойГраницы", "BorderLeftStyle")]
        public string BorderLeftStyle
        {
            get { return borderLeftStyle; }
            set
            {
                borderLeftStyle = value;
                resborderLeftStyle = borderLeftStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderLeftStyle'] = '" + resborderLeftStyle + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string restextColor { get; set; }
        private string textColor;
        [ContextProperty("ЦветТекста", "TextColor")]
        public string TextColor
        {
            get { return textColor; }
            set
            {
                textColor = value;
                restextColor = textColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['color'] = '" + restextColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderTopColor { get; set; }
        private string borderTopColor;
        [ContextProperty("ЦветВерхнейГраницы", "BorderTopColor")]
        public string BorderTopColor
        {
            get { return borderTopColor; }
            set
            {
                borderTopColor = value;
                resborderTopColor = borderTopColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTopColor'] = '" + resborderTopColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbordersColor { get; set; }
        private IValue bordersColor;
        [ContextProperty("ЦветГраниц", "BordersColor")]
        public IValue BordersColor
        {
            get { return bordersColor; }
            set
            {
                bordersColor = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbordersColor = value.AsString();
                }
                else
                {
                    DfBordersColor val = (DfBordersColor)value;
                    string borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (val.BorderTopColor != null)
                    {
                        borderTopColor = val.BorderTopColor.AsString() + " ";
                    }
                    if (val.BorderRightColor != null)
                    {
                        borderRightColor = val.BorderRightColor.AsString() + " ";
                    }
                    if (val.BorderBottomColor != null)
                    {
                        borderBottomColor = val.BorderBottomColor.AsString() + " ";
                    }
                    if (val.BorderLeftColor != null)
                    {
                        borderLeftColor = val.BorderLeftColor.AsString();
                    }
                    resbordersColor = borderTopColor + borderRightColor + borderBottomColor + borderLeftColor;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderColor'] = '" + resbordersColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderLeftColor { get; set; }
        private string borderLeftColor;
        [ContextProperty("ЦветЛевойГраницы", "BorderLeftColor")]
        public string BorderLeftColor
        {
            get { return borderLeftColor; }
            set
            {
                borderLeftColor = value;
                resborderLeftColor = borderLeftColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderLeftColor'] = '" + resborderLeftColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderBottomColor { get; set; }
        private string borderBottomColor;
        [ContextProperty("ЦветНижнейГраницы", "BorderBottomColor")]
        public string BorderBottomColor
        {
            get { return borderBottomColor; }
            set
            {
                borderBottomColor = value;
                resborderBottomColor = borderBottomColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottomColor'] = '" + resborderBottomColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderRightColor { get; set; }
        private string borderRightColor;
        [ContextProperty("ЦветПравойГраницы", "BorderRightColor")]
        public string BorderRightColor
        {
            get { return borderRightColor; }
            set
            {
                borderRightColor = value;
                resborderRightColor = borderRightColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderRightColor'] = '" + resborderRightColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoutlineColor { get; set; }
        private string outlineColor;
        [ContextProperty("ЦветКонтура", "OutlineColor")]
        public string OutlineColor
        {
            get { return outlineColor; }
            set
            {
                outlineColor = value;
                resoutlineColor = outlineColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['outlineColor'] = '" + resoutlineColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbackgroundColor { get; set; }
        private string backgroundColor;
        [ContextProperty("ЦветФона", "BackgroundColor")]
        public string BackgroundColor
        {
            get { return backgroundColor; }
            set
            {
                backgroundColor = value;
                resbackgroundColor = backgroundColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundColor'] = '" + resbackgroundColor + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string reswidth { get; set; }
        private IValue width;
        [ContextProperty("Ширина", "Width")]
        public IValue Width
        {
            get { return width; }
            set
            {
                width = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    reswidth = value.AsString();
                }
                else
                {
                    reswidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['width'] = '" + reswidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderTopWidth { get; set; }
        private IValue borderTopWidth;
        [ContextProperty("ШиринаВерхнейГраницы", "BorderTopWidth")]
        public IValue BorderTopWidth
        {
            get { return borderTopWidth; }
            set
            {
                borderTopWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderTopWidth = value.AsString();
                }
                else
                {
                    resborderTopWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTopWidth'] = '" + resborderTopWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resbordersWidth { get; set; }
        private IValue bordersWidth;
        [ContextProperty("ШиринаГраниц", "BordersWidth")]
        public IValue BordersWidth
        {
            get { return bordersWidth; }
            set
            {
                bordersWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbordersWidth = value.AsString();
                }
                else
                {
                    DfBordersWidth val = (DfBordersWidth)value;
                    string borderTopWidth = "medium ";
                    string borderRightWidth = "medium ";
                    string borderBottomWidth = "medium ";
                    string borderLeftWidth = "medium";
                    if (val.BorderTopWidth != null)
                    {
                        if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderTopWidth = val.BorderTopWidth.AsString() + " ";
                        }
                        else if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderTopWidth = val.BorderTopWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderRightWidth != null)
                    {
                        if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderRightWidth = val.BorderRightWidth.AsString() + " ";
                        }
                        else if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderRightWidth = val.BorderRightWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderBottomWidth != null)
                    {
                        if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderBottomWidth = val.BorderBottomWidth.AsString() + " ";
                        }
                        else if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderBottomWidth = val.BorderBottomWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (val.BorderLeftWidth != null)
                    {
                        if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderLeftWidth = val.BorderLeftWidth.AsString() + " ";
                        }
                        else if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderLeftWidth = val.BorderLeftWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    resbordersWidth = borderTopWidth + borderRightWidth + borderBottomWidth + borderLeftWidth;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderWidth'] = '" + resbordersWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string rescolumnWidth { get; set; }
        private IValue columnWidth;
        [ContextProperty("ШиринаКолонок", "ColumnWidth")]
        public IValue ColumnWidth
        {
            get { return columnWidth; }
            set
            {
                columnWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnWidth = value.AsString();
                }
                else
                {
                    rescolumnWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnWidth'] = '" + rescolumnWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resoutlineWidth { get; set; }
        private IValue outlineWidth;
        [ContextProperty("ШиринаКонтура", "OutlineWidth")]
        public IValue OutlineWidth
        {
            get { return outlineWidth; }
            set
            {
                outlineWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resoutlineWidth = value.AsString();
                }
                else
                {
                    resoutlineWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['outlineWidth'] = '" + resoutlineWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderLeftWidth { get; set; }
        private IValue borderLeftWidth;
        [ContextProperty("ШиринаЛевойГраницы", "BorderLeftWidth")]
        public IValue BorderLeftWidth
        {
            get { return borderLeftWidth; }
            set
            {
                borderLeftWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderLeftWidth = value.AsString();
                }
                else
                {
                    resborderLeftWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderLeftWidth'] = '" + resborderLeftWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderBottomWidth { get; set; }
        private IValue borderBottomWidth;
        [ContextProperty("ШиринаНижнейГраницы", "BorderBottomWidth")]
        public IValue BorderBottomWidth
        {
            get { return borderBottomWidth; }
            set
            {
                borderBottomWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderBottomWidth = value.AsString();
                }
                else
                {
                    resborderBottomWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottomWidth'] = '" + resborderBottomWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string reswordWrap { get; set; }
        private string wordWrap;
        [ContextProperty("ПереносСлов", "WordWrap")]
        public string WordWrap
        {
            get { return wordWrap; }
            set
            {
                wordWrap = value;
                reswordWrap = wordWrap;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['wordWrap'] = '" + reswordWrap + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        public string resborderRightWidth { get; set; }
        private IValue borderRightWidth;
        [ContextProperty("ШиринаПравойГраницы", "BorderRightWidth")]
        public IValue BorderRightWidth
        {
            get { return borderRightWidth; }
            set
            {
                borderRightWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderRightWidth = value.AsString();
                }
                else
                {
                    resborderRightWidth = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderRightWidth'] = '" + resborderRightWidth + "';";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + DeclarativeForms.funDelimiter;
                }
            }
        }

        [ContextMethod("Копировать", "Copy")]
        public void Copy(DfStyle p1)
        {
            PropertyInfo[] PropertyInfo = this.GetType().GetProperties();
            for (int i = 0; i < PropertyInfo.Length; i++)
            {
                string propName = this.GetType().GetProperty(PropertyInfo[i].Name).Name;
                if (propName == "Owner" ||
                    propName == "Name" ||
                    propName == "IsIndexed" ||
                    propName == "DataType" ||
                    propName == "SystemType" ||
                    propName == "Item" ||
                    propName == "DynamicMethodSignatures"
                    )
                {
                    continue;
                }
                dynamic propValue = p1.GetType().GetProperty(propName).GetValue(p1);
                if (propValue == null)
                {
                    continue;
                }
                if (propValue.GetType().ToString() == "System.Int32")
                {
                    if (propValue != 0)
                    {
                        this[propName].SetValue(this, propValue);
                    }
                }
                else
                {
                    this[propName].SetValue(this, propValue);
                }
            }
        }
    }
}
