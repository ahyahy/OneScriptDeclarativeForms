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
            DeclarativeForms.SendStrFunc(strFunc);
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
		
        public string restransition { get; set; }
        public IValue transition { get; set; }
        [ContextProperty("Переход", "Transition")]
        public IValue Transition
        {
            get { return transition; }
            set
            {
                transition = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restransition = value.AsString();
                    if (Owner != null)
                    {
                        string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transition'] = '" + restransition + "';";
                        DeclarativeForms.SendStrFunc(strFunc);
                    }
                }
                else
                {
                    DfTransition val = (DfTransition)value;
                    if (val.TransitionProperty != null)
                    {
                        TransitionProperty = val.TransitionProperty.AsString();
                    }
                    if (val.TransitionDuration != null)
                    {
                        TransitionDuration = val.TransitionDuration;
                    }
                    if (val.TransitionTimingFunction != null)
                    {
                        TransitionTimingFunction = val.TransitionTimingFunction.AsString();
                    }
                    if (val.TransitionDelay != null)
                    {
                        TransitionDelay = val.TransitionDelay;
                    }
                }
            }
        }

        public string resobjectPosition { get; set; }
        public IValue objectPosition { get; set; }
        [ContextProperty("ПозицияОбъекта", "ObjectPosition")]
        public IValue ObjectPosition
        {
            get { return objectPosition; }
            set
            {
                objectPosition = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resobjectPosition = value.AsString();
                }
                else
                {
                    DfPoint val = (DfPoint)value;
                    if (val.X != 0 && val.Y != 0)
                    {
                        resobjectPosition = val.X.ToString() + "px " + val.Y.ToString() + "px";
                    }
                    else
                    {
                        resobjectPosition = "0px 0px";
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['objectPosition'] = '" + resobjectPosition + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resclip { get; set; }
        public IValue clip { get; set; }
        [ContextProperty("Обрезка", "Clip")]
        public IValue Clip
        {
            get { return clip; }
            set
            {
                clip = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resclip = value.AsString();
                }
                else
                {
                    DfRectangle val = (DfRectangle)value;
                    if (val.X != null && val.Y != null && val.Width != null && val.Height != null)
                    {
                        decimal x1 = val.X.AsNumber() + val.Width.AsNumber();
                        decimal y1 = val.Y.AsNumber();
                        decimal y2 = val.Y.AsNumber() + val.Height.AsNumber();
                        decimal x2 = val.X.AsNumber();
                        resclip = "rect(" + Convert.ToInt32(y1).ToString() + "px, " +
                            Convert.ToInt32(x1).ToString() + "px, " +
                            Convert.ToInt32(y2).ToString() + "px, " +
                            Convert.ToInt32(x2).ToString() + "px)";
                    }
                    else
                    {
                        resclip = "auto";
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['clip'] = '" + resclip + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reswordSpacing { get; set; }
        public IValue wordSpacing { get; set; }
        [ContextProperty("ИнтервалСлов", "WordSpacing")]
        public IValue WordSpacing
        {
            get { return wordSpacing; }
            set
            {
                wordSpacing = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    reswordSpacing = value.AsString();
                }
                else
                {
                    reswordSpacing = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['wordSpacing'] = '" + reswordSpacing + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransitionDuration { get; set; }
        public IValue transitionDuration { get; set; }
        [ContextProperty("ВремяПерехода", "TransitionDuration")]
        public IValue TransitionDuration
        {
            get { return transitionDuration; }
            set
            {
                transitionDuration = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restransitionDuration = value.AsString();
                }
                else
                {
                    restransitionDuration = value.AsNumber().ToString() + "ms";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transitionDuration'] = '" + restransitionDuration + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransitionDelay { get; set; }
        public IValue transitionDelay { get; set; }
        [ContextProperty("ЗадержкаПерехода", "TransitionDelay")]
        public IValue TransitionDelay
        {
            get { return transitionDelay; }
            set
            {
                transitionDelay = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restransitionDelay = value.AsString();
                }
                else
                {
                    restransitionDelay = value.AsNumber().ToString() + "ms";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transitionDelay'] = '" + restransitionDelay + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextIndent { get; set; }
        public IValue textIndent { get; set; }
        [ContextProperty("ОтступТекста", "TextIndent")]
        public IValue TextIndent
        {
            get { return textIndent; }
            set
            {
                textIndent = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restextIndent = value.AsString();
                }
                else
                {
                    restextIndent = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textIndent'] = '" + restextIndent + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resorder { get; set; }
        public IValue order { get; set; }
        [ContextProperty("Порядок", "Order")]
        public IValue Order
        {
            get { return order; }
            set
            {
                order = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resorder = value.AsString();
                }
                else
                {
                    resorder = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['order'] = '" + resorder + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restabSize { get; set; }
        public IValue tabSize { get; set; }
        [ContextProperty("ДлинаТабуляции", "TabSize")]
        public IValue TabSize
        {
            get { return tabSize; }
            set
            {
                tabSize = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    restabSize = value.AsString();
                }
                else
                {
                    restabSize = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['tabSize'] = '" + restabSize + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoutlineOffset { get; set; }
        public IValue outlineOffset { get; set; }
        [ContextProperty("СмещениеКонтура", "OutlineOffset")]
        public IValue OutlineOffset
        {
            get { return outlineOffset; }
            set
            {
                outlineOffset = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resoutlineOffset = value.AsString();
                }
                else
                {
                    resoutlineOffset = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['outlineOffset'] = '" + resoutlineOffset + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resminWidth { get; set; }
        public IValue minWidth { get; set; }
        [ContextProperty("МинимальнаяШирина", "MinWidth")]
        public IValue MinWidth
        {
            get { return minWidth; }
            set
            {
                minWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resminWidth = value.AsString();
                }
                else
                {
                    resminWidth = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['minWidth'] = '" + resminWidth + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmaxWidth { get; set; }
        public IValue maxWidth { get; set; }
        [ContextProperty("МаксимальнаяШирина", "MaxWidth")]
        public IValue MaxWidth
        {
            get { return maxWidth; }
            set
            {
                maxWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmaxWidth = value.AsString();
                }
                else
                {
                    resmaxWidth = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['maxWidth'] = '" + resmaxWidth + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmaxHeight { get; set; }
        public IValue maxHeight { get; set; }
        [ContextProperty("МаксимальнаяВысота", "MaxHeight")]
        public IValue MaxHeight
        {
            get { return maxHeight; }
            set
            {
                maxHeight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resmaxHeight = value.AsString();
                }
                else
                {
                    resmaxHeight = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['maxHeight'] = '" + resmaxHeight + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reslineHeight { get; set; }
        public IValue lineHeight { get; set; }
        [ContextProperty("ВысотаСтроки", "LineHeight")]
        public IValue LineHeight
        {
            get { return lineHeight; }
            set
            {
                lineHeight = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    reslineHeight = value.AsString();
                }
                else
                {
                    reslineHeight = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['lineHeight'] = '" + reslineHeight + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resletterSpacing { get; set; }
        public IValue letterSpacing { get; set; }
        [ContextProperty("ИнтервалСимволов", "LetterSpacing")]
        public IValue LetterSpacing
        {
            get { return letterSpacing; }
            set
            {
                letterSpacing = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resletterSpacing = value.AsString();
                }
                else
                {
                    resletterSpacing = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['letterSpacing'] = '" + resletterSpacing + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resflex { get; set; }
        public IValue flex { get; set; }
        [ContextProperty("Гибкость", "Flex")]
        public IValue Flex
        {
            get { return flex; }
            set
            {
                flex = value;
                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resflex = value.AsString();
                }
                else
                {
                    resflex = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flex'] = '" + resflex + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resflexShrink { get; set; }
        public IValue flexShrink { get; set; }
        [ContextProperty("Уменьшение", "FlexShrink")]
        public IValue FlexShrink
        {
            get { return flexShrink; }
            set
            {
                flexShrink = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resflexShrink = value.AsString();
                }
                else
                {
                    resflexShrink = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flexShrink'] = '" + resflexShrink + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resflexGrow { get; set; }
        public IValue flexGrow { get; set; }
        [ContextProperty("Увеличение", "FlexGrow")]
        public IValue FlexGrow
        {
            get { return flexGrow; }
            set
            {
                flexGrow = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resflexGrow = value.AsString();
                }
                else
                {
                    resflexGrow = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flexGrow'] = '" + resflexGrow + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resflexBasis { get; set; }
        public IValue flexBasis { get; set; }
        [ContextProperty("БазоваяДлина", "FlexBasis")]
        public IValue FlexBasis
        {
            get { return flexBasis; }
            set
            {
                flexBasis = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resflexBasis = value.AsString();
                }
                else
                {
                    resflexBasis = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['flexBasis'] = '" + resflexBasis + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnSpan { get; set; }
        public IValue columnSpan { get; set; }
        [ContextProperty("ДиапазонКолонокЭлемента", "ColumnSpan")]
        public IValue ColumnSpan
        {
            get { return columnSpan; }
            set
            {
                columnSpan = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnSpan = value.AsString();
                }
                else
                {
                    if (value.AsNumber() == -1)
                    {
                        rescolumnSpan = "all";
                    }
                    else
                    {
                        rescolumnSpan = value.AsNumber().ToString();
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnSpan'] = '" + rescolumnSpan + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnRuleWidth { get; set; }
        public IValue columnRuleWidth { get; set; }
        [ContextProperty("ШиринаРазделителяКолонок", "ColumnRuleWidth")]
        public IValue ColumnRuleWidth
        {
            get { return columnRuleWidth; }
            set
            {
                columnRuleWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnRuleWidth = value.AsString();
                }
                else
                {
                    rescolumnRuleWidth = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnRuleWidth'] = '" + rescolumnRuleWidth + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnGap { get; set; }
        public IValue columnGap { get; set; }
        [ContextProperty("ИнтервалКолонок", "ColumnGap")]
        public IValue ColumnGap
        {
            get { return columnGap; }
            set
            {
                columnGap = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    rescolumnGap = value.AsString();
                }
                else
                {
                    rescolumnGap = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnGap'] = '" + rescolumnGap + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resvisibility { get; set; }
        public string visibility { get; set; }
        [ContextProperty("Видимость", "Visibility")]
        public string Visibility
        {
            get { return visibility; }
            set
            {
                visibility = value;
                resvisibility = visibility;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['visibility'] = '" + resvisibility + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resuserSelect { get; set; }
        public string userSelect { get; set; }
        [ContextProperty("ВыделениеПользователем", "UserSelect")]
        public string UserSelect
        {
            get { return userSelect; }
            set
            {
                userSelect = value;
                resuserSelect = userSelect;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['userSelect'] = '" + resuserSelect + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransitionTimingFunction { get; set; }
        public string transitionTimingFunction { get; set; }
        [ContextProperty("ФункцияПерехода", "TransitionTimingFunction")]
        public string TransitionTimingFunction
        {
            get { return transitionTimingFunction; }
            set
            {
                transitionTimingFunction = value;
                restransitionTimingFunction = transitionTimingFunction;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transitionTimingFunction'] = '" + restransitionTimingFunction + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransitionProperty { get; set; }
        public string transitionProperty { get; set; }
        [ContextProperty("СвойствоПерехода", "TransitionProperty")]
        public string TransitionProperty
        {
            get { return transitionProperty; }
            set
            {
                transitionProperty = value;
                restransitionProperty = transitionProperty;
                if (transitionProperty != "all")
                {
                    string[] result = transitionProperty.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    string prop = "";
                    if (result.Length > 0)
                    {
                        prop += (string)DeclarativeForms.namesStyleProps[result[0].Trim()][1];
                        for (int i = 1; i < result.Length; i++)
                        {
                            prop += ", " + (string)DeclarativeForms.namesStyleProps[result[i].Trim()][1];
                        }
                    }
                    restransitionProperty = prop;
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transitionProperty'] = '" + restransitionProperty + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextTransform { get; set; }
        public string textTransform { get; set; }
        [ContextProperty("ПрописныеТекста", "TextTransform")]
        public string TextTransform
        {
            get { return textTransform; }
            set
            {
                textTransform = value;
                restextTransform = textTransform;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textTransform'] = '" + restextTransform + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextOverflow { get; set; }
        public string textOverflow { get; set; }
        [ContextProperty("ПереполнениеТекста", "TextOverflow")]
        public string TextOverflow
        {
            get { return textOverflow; }
            set
            {
                textOverflow = value;
                restextOverflow = textOverflow;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textOverflow'] = '" + restextOverflow + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextDecorationStyle { get; set; }
        public string textDecorationStyle { get; set; }
        [ContextProperty("ОформлениеТекстаСтиль", "TextDecorationStyle")]
        public string TextDecorationStyle
        {
            get { return textDecorationStyle; }
            set
            {
                textDecorationStyle = value;
                restextDecorationStyle = textDecorationStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textDecorationStyle'] = '" + restextDecorationStyle + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextDecorationLine { get; set; }
        public string textDecorationLine { get; set; }
        [ContextProperty("ОформлениеТекстаЛиния", "TextDecorationLine")]
        public string TextDecorationLine
        {
            get { return textDecorationLine; }
            set
            {
                textDecorationLine = value;
                restextDecorationLine = textDecorationLine;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textDecorationLine'] = '" + restextDecorationLine + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextDecorationColor { get; set; }
        public string textDecorationColor { get; set; }
        [ContextProperty("ОформлениеТекстаЦвет", "TextDecorationColor")]
        public string TextDecorationColor
        {
            get { return textDecorationColor; }
            set
            {
                textDecorationColor = value;
                restextDecorationColor = textDecorationColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['textDecorationColor'] = '" + restextDecorationColor + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resresize { get; set; }
        public string resize { get; set; }
        [ContextProperty("ИзменяемыйРазмер", "Resize")]
        public string Resize
        {
            get { return resize; }
            set
            {
                resize = value;
                resresize = resize;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['resize'] = '" + resresize + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resobjectFit { get; set; }
        public string objectFit { get; set; }
        [ContextProperty("ВписываниеОбъекта", "ObjectFit")]
        public string ObjectFit
        {
            get { return objectFit; }
            set
            {
                objectFit = value;
                resobjectFit = objectFit;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['objectFit'] = '" + resobjectFit + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reslistStyleType { get; set; }
        public string listStyleType { get; set; }
        [ContextProperty("ТипСтиляСписка", "ListStyleType")]
        public string ListStyleType
        {
            get { return listStyleType; }
            set
            {
                listStyleType = value;
                reslistStyleType = listStyleType;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['listStyleType'] = '" + reslistStyleType + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reslistStylePosition { get; set; }
        public string listStylePosition { get; set; }
        [ContextProperty("ПозицияСтиляСписка", "ListStylePosition")]
        public string ListStylePosition
        {
            get { return listStylePosition; }
            set
            {
                listStylePosition = value;
                reslistStylePosition = listStylePosition;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['listStylePosition'] = '" + reslistStylePosition + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reslistStyleImage { get; set; }
        public string listStyleImage { get; set; }
        [ContextProperty("КартинкаСтиляСписка", "ListStyleImage")]
        public string ListStyleImage
        {
            get { return listStyleImage; }
            set
            {
                listStyleImage = value;
                reslistStyleImage = "url('" + listStyleImage
                    .Replace("url(\u0022", "")
                    .Replace("\u0022)", "")
                    .Replace("url('", "")
                    .Replace("')", "")
                    .Replace(" ", "%20") +
                    "') ";
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['listStyleImage'] = \u0022" + reslistStyleImage + "\u0022;";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfontWeight { get; set; }
        public string fontWeight { get; set; }
        [ContextProperty("ЖирностьШрифта", "FontWeight")]
        public string FontWeight
        {
            get { return fontWeight; }
            set
            {
                fontWeight = value;
                resfontWeight = fontWeight;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['fontWeight'] = '" + resfontWeight + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfontVariant { get; set; }
        public string fontVariant { get; set; }
        [ContextProperty("ВариантШрифта", "FontVariant")]
        public string FontVariant
        {
            get { return fontVariant; }
            set
            {
                fontVariant = value;
                resfontVariant = fontVariant;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['fontVariant'] = '" + resfontVariant + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfontStyle { get; set; }
        public string fontStyle { get; set; }
        [ContextProperty("СтильШрифта", "FontStyle")]
        public string FontStyle
        {
            get { return fontStyle; }
            set
            {
                fontStyle = value;
                resfontStyle = fontStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['fontStyle'] = '" + resfontStyle + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resemptyCells { get; set; }
        public string emptyCells { get; set; }
        [ContextProperty("ПустыеЯчейки", "EmptyCells")]
        public string EmptyCells
        {
            get { return emptyCells; }
            set
            {
                emptyCells = value;
                resemptyCells = emptyCells;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['emptyCells'] = '" + resemptyCells + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescursor { get; set; }
        public string cursor { get; set; }
        [ContextProperty("Курсор", "Cursor")]
        public string Cursor
        {
            get { return cursor; }
            set
            {
                cursor = value;
                rescursor = cursor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['cursor'] = '" + rescursor + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnRuleStyle { get; set; }
        public string columnRuleStyle { get; set; }
        [ContextProperty("СтильРазделителяКолонок", "ColumnRuleStyle")]
        public string ColumnRuleStyle
        {
            get { return columnRuleStyle; }
            set
            {
                columnRuleStyle = value;
                rescolumnRuleStyle = columnRuleStyle;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnRuleStyle'] = '" + rescolumnRuleStyle + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnRuleColor { get; set; }
        public string columnRuleColor { get; set; }
        [ContextProperty("ЦветРазделителяКолонок", "ColumnRuleColor")]
        public string ColumnRuleColor
        {
            get { return columnRuleColor; }
            set
            {
                columnRuleColor = value;
                rescolumnRuleColor = columnRuleColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnRuleColor'] = '" + rescolumnRuleColor + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnFill { get; set; }
        public string columnFill { get; set; }
        [ContextProperty("ЗаполнениеКолонок", "ColumnFill")]
        public string ColumnFill
        {
            get { return columnFill; }
            set
            {
                columnFill = value;
                rescolumnFill = columnFill;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['columnFill'] = '" + rescolumnFill + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescaretColor { get; set; }
        public string caretColor { get; set; }
        [ContextProperty("ЦветКурсора", "CaretColor")]
        public string CaretColor
        {
            get { return caretColor; }
            set
            {
                caretColor = value;
                rescaretColor = caretColor;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['caretColor'] = '" + rescaretColor + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescaptionSide { get; set; }
        public string captionSide { get; set; }
        [ContextProperty("ПоложениеЗаголовка", "CaptionSide")]
        public string CaptionSide
        {
            get { return captionSide; }
            set
            {
                captionSide = value;
                rescaptionSide = captionSide;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['captionSide'] = '" + rescaptionSide + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string rescssFloat { get; set; }
        public string cssFloat { get; set; }
        [ContextProperty("ГоризонтальноеВыравнивание", "CssFloat")]
        public string CssFloat
        {
            get { return cssFloat; }
            set
            {
                cssFloat = value;
                rescssFloat = cssFloat;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['cssFloat'] = '" + rescssFloat + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resclear { get; set; }
        public string clear { get; set; }
        [ContextProperty("Несвободно", "Clear")]
        public string Clear
        {
            get { return clear; }
            set
            {
                clear = value;
                resclear = clear;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['clear'] = '" + resclear + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resboxSizing { get; set; }
        public string boxSizing { get; set; }
        [ContextProperty("Калибровка", "BoxSizing")]
        public string BoxSizing
        {
            get { return boxSizing; }
            set
            {
                boxSizing = value;
                resboxSizing = boxSizing;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['boxSizing'] = '" + resboxSizing + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resborderSpacing { get; set; }
        public IValue borderSpacing { get; set; }
        [ContextProperty("ИнтервалГраницы", "BorderSpacing")]
        public IValue BorderSpacing
        {
            get { return borderSpacing; }
            set
            {
                borderSpacing = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderSpacing = value.AsString();
                }
                else
                {
                    DfSize val = (DfSize)value;
                    if (val.Width != null && val.Height != null)
                    {
                        resborderSpacing = val.Width.AsNumber().ToString() + "px " + val.Height.AsNumber().ToString() + "px";
                    }
                    else
                    {
                        resborderSpacing = "0px";
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderSpacing'] = '" + resborderSpacing + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resborderImageRepeat { get; set; }
        public string borderImageRepeat { get; set; }
        [ContextProperty("МозаикаКартинкиГраницы", "BorderImageRepeat")]
        public string BorderImageRepeat
        {
            get { return borderImageRepeat; }
            set
            {
                borderImageRepeat = value;
                resborderImageRepeat = borderImageRepeat;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImageRepeat'] = '" + resborderImageRepeat + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderImageOutset { get; set; }
        public IValue borderImageOutset { get; set; }
        [ContextProperty("СмещениеКартинкиГраницы", "BorderImageOutset")]
        public IValue BorderImageOutset
        {
            get { return borderImageOutset; }
            set
            {
                borderImageOutset = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderImageOutset = value.AsString();
                }
                else
                {
                    resborderImageOutset = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImageOutset'] = '" + resborderImageOutset + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderImageSlice { get; set; }
        public IValue borderImageSlice { get; set; }
        [ContextProperty("НарезкаКартинкиГраницы", "BorderImageSlice")]
        public IValue BorderImageSlice
        {
            get { return borderImageSlice; }
            set
            {
                borderImageSlice = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderImageSlice = value.AsString();
                }
                else
                {
                    resborderImageSlice = value.AsNumber().ToString();
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImageSlice'] = '" + resborderImageSlice + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderImageSource { get; set; }
        public string borderImageSource { get; set; }
        [ContextProperty("ИсточникКартинкиГраницы", "BorderImageSource")]
        public string BorderImageSource
        {
            get { return borderImageSource; }
            set
            {
                borderImageSource = value;
                if (value.Contains("gradient"))
                {
                    resborderImageSource = borderImageSource;
                }
                else
                {
                    resborderImageSource = "url('" + borderImageSource
                        .Replace("url(\u0022", "")
                        .Replace("\u0022)", "")
                        .Replace("url('", "")
                        .Replace("')", "")
                        .Replace(" ", "%20") +
                        "') ";
                }
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImageSource'] = \u0022" + resborderImageSource + "\u0022;";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderImageWidth { get; set; }
        public IValue borderImageWidth { get; set; }
        [ContextProperty("ШиринаКартинкиГраницы", "BorderImageWidth")]
        public IValue BorderImageWidth
        {
            get { return borderImageWidth; }
            set
            {
                borderImageWidth = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderImageWidth = value.AsString();
                }
                else if (value.GetType() == typeof(DfSize))
                {
                    DfSize val = (DfSize)value;
                    if (val.Width != null && val.Height != null)
                    {
                        resborderImageWidth = val.Width.AsNumber().ToString() + "px " + val.Height.AsNumber().ToString() + "px";
                    }
                }
                else
                {
                    resborderImageWidth = value.AsNumber().ToString() + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImageWidth'] = '" + resborderImageWidth + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resborderTopRightRadius { get; set; }
        public IValue borderTopRightRadius { get; set; }
        [ContextProperty("ПравыйРадиусВерхнейГраницы", "BorderTopRightRadius")]
        public IValue BorderTopRightRadius
        {
            get { return borderTopRightRadius; }
            set
            {
                borderTopRightRadius = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderTopRightRadius = value.AsString();
                }
                else
                {
                    resborderTopRightRadius = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTopRightRadius'] = '" + resborderTopRightRadius + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderTopLeftRadius { get; set; }
        public IValue borderTopLeftRadius { get; set; }
        [ContextProperty("ЛевыйРадиусВерхнейГраницы", "BorderTopLeftRadius")]
        public IValue BorderTopLeftRadius
        {
            get { return borderTopLeftRadius; }
            set
            {
                borderTopLeftRadius = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderTopLeftRadius = value.AsString();
                }
                else
                {
                    resborderTopLeftRadius = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderTopLeftRadius'] = '" + resborderTopLeftRadius + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }		

        public string resborderBottomLeftRadius { get; set; }
        public IValue borderBottomLeftRadius { get; set; }
        [ContextProperty("ЛевыйРадиусНижнейГраницы", "BorderBottomLeftRadius")]
        public IValue BorderBottomLeftRadius
        {
            get { return borderBottomLeftRadius; }
            set
            {
                borderBottomLeftRadius = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderBottomLeftRadius = value.AsString();
                }
                else
                {
                    resborderBottomLeftRadius = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottomLeftRadius'] = '" + resborderBottomLeftRadius + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderBottomRightRadius { get; set; }
        public IValue borderBottomRightRadius { get; set; }
        [ContextProperty("ПравыйРадиусНижнейГраницы", "BorderBottomRightRadius")]
        public IValue BorderBottomRightRadius
        {
            get { return borderBottomRightRadius; }
            set
            {
                borderBottomRightRadius = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resborderBottomRightRadius = value.AsString();
                }
                else
                {
                    resborderBottomRightRadius = value.AsNumber().ToString().Replace(",", ".") + "px";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderBottomRightRadius'] = '" + resborderBottomRightRadius + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resbackgroundPosition { get; set; }
        public string backgroundPosition { get; set; }
        [ContextProperty("ПоложениеКартинки", "BackgroundPosition")]
        public string BackgroundPosition
        {
            get { return backgroundPosition; }
            set
            {
                backgroundPosition = value;
                resbackgroundPosition = backgroundPosition;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundPosition'] = '" + resbackgroundPosition + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundOrigin { get; set; }
        public string backgroundOrigin { get; set; }
        [ContextProperty("ОбластьКартинки", "BackgroundOrigin")]
        public string BackgroundOrigin
        {
            get { return backgroundOrigin; }
            set
            {
                backgroundOrigin = value;
                resbackgroundOrigin = backgroundOrigin;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundOrigin'] = '" + resbackgroundOrigin + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundClip { get; set; }
        public string backgroundClip { get; set; }
        [ContextProperty("ОбластьРисования", "BackgroundClip")]
        public string BackgroundClip
        {
            get { return backgroundClip; }
            set
            {
                backgroundClip = value;
                resbackgroundClip = backgroundClip;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundClip'] = '" + resbackgroundClip + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundAttachment { get; set; }
        public string backgroundAttachment { get; set; }
        [ContextProperty("ФоновоеВложение", "BackgroundAttachment")]
        public string BackgroundAttachment
        {
            get { return backgroundAttachment; }
            set
            {
                backgroundAttachment = value;
                resbackgroundAttachment = backgroundAttachment;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['backgroundAttachment'] = '" + resbackgroundAttachment + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string resbackground { get; set; }
        public IValue background { get; set; }
        [ContextProperty("Фон", "Background")]
        public IValue Background
        {
            get { return background; }
            set
            {
                background = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resbackground = value.AsString();
                    if (Owner != null)
                    {
                        string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['background'] = '" + resbackground + "';";
                        DeclarativeForms.SendStrFunc(strFunc);
                    }
                }
                else
                {
                    DfBackground val = (DfBackground)value;

                    if (val.BackgroundColor != null)
                    {
                        BackgroundColor = val.BackgroundColor.AsString();
                    }
                    if (val.BackgroundImage != null)
                    {
                        BackgroundImage = val.BackgroundImage.AsString();
                    }
                    if (val.BackgroundRepeat != null)
                    {
                        BackgroundRepeat = val.BackgroundRepeat.AsString();
                    }
                    if (val.BackgroundPosition != null)
                    {
                        BackgroundPosition = val.BackgroundPosition.AsString();
                    }
                    if (val.BackgroundOrigin != null)
                    {
                        BackgroundOrigin = val.BackgroundOrigin.AsString();
                    }
                    if (val.BackgroundClip != null)
                    {
                        BackgroundClip = val.BackgroundClip.AsString();
                    }
                    if (val.BackgroundSize != null)
                    {
                        BackgroundSize = val.BackgroundSize;
                    }
                    if (val.BackgroundAttachment != null)
                    {
                        BackgroundAttachment = val.BackgroundAttachment.AsString();
                    }
                }
            }
        }

        public string resanimationDuration { get; set; }
        public IValue animationDuration { get; set; }
        [ContextProperty("ДлительностьАнимации", "AnimationDuration")]
        public IValue AnimationDuration
        {
            get { return animationDuration; }
            set
            {
                animationDuration = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resanimationDuration = value.AsString();
                }
                else
                {
                    resanimationDuration = value.AsNumber().ToString().Replace(",", ".") + "ms";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationDuration'] = '" + resanimationDuration + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationDelay { get; set; }
        public IValue animationDelay { get; set; }
        [ContextProperty("ЗадержкаАнимации", "AnimationDelay")]
        public IValue AnimationDelay
        {
            get { return animationDelay; }
            set
            {
                animationDelay = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resanimationDelay = value.AsString();
                }
                else
                {
                    resanimationDelay = value.AsNumber().ToString().Replace(",", ".") + "ms";
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationDelay'] = '" + resanimationDelay + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }
		
        public string reszIndex { get; set; }
        public IValue zIndex { get; set; }
        [ContextProperty("ЗетИндекс", "ZIndex")]
        public IValue ZIndex
        {
            get { return zIndex; }
            set
            {
                zIndex = value;
                if (value == null)
                {
                    reszIndex = "auto";
                }
                else if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    reszIndex = value.AsString();
                }
                else
                {
                    reszIndex = value.AsNumber().ToString().Replace(",", ".");
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['zIndex'] = '" + reszIndex + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationIterationCount { get; set; }
        public IValue animationIterationCount { get; set; }
        [ContextProperty("КоличествоПовторов", "AnimationIterationCount")]
        public IValue AnimationIterationCount
        {
            get { return animationIterationCount; }
            set
            {
                animationIterationCount = value;

                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                {
                    resanimationIterationCount = value.AsString();
                }
                else
                {
                    if (value.AsNumber() == -1)
                    {
                        resanimationIterationCount = "infinite ";
                    }
                    else
                    {
                        resanimationIterationCount = value.AsNumber().ToString().Replace(",", ".");
                    }
                }

                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationIterationCount'] = '" + resanimationIterationCount + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationPlayState { get; set; }
        public string animationPlayState { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationTimingFunction { get; set; }
        public string animationTimingFunction { get; set; }
        [ContextProperty("ФункцияСинхронизации", "AnimationTimingFunction")]
        public string AnimationTimingFunction
        {
            get { return animationTimingFunction; }
            set
            {
                animationTimingFunction = value;
                resanimationTimingFunction = animationTimingFunction;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationTimingFunction'] = '" + resanimationTimingFunction + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationFillMode { get; set; }
        public string animationFillMode { get; set; }
        [ContextProperty("ЗаливкаАнимации", "AnimationFillMode")]
        public string AnimationFillMode
        {
            get { return animationFillMode; }
            set
            {
                animationFillMode = value;
                resanimationFillMode = animationFillMode;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationFillMode'] = '" + resanimationFillMode + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationDirection { get; set; }
        public string animationDirection { get; set; }
        [ContextProperty("НаправлениеАнимации", "AnimationDirection")]
        public string AnimationDirection
        {
            get { return animationDirection; }
            set
            {
                animationDirection = value;
                resanimationDirection = animationDirection;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationDirection'] = '" + resanimationDirection + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resanimationName { get; set; }
        public string animationName { get; set; }
        [ContextProperty("ИмяАнимации", "AnimationName")]
        public string AnimationName
        {
            get { return animationName; }
            set
            {
                animationName = value;
                resanimationName = animationName;
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['animationName'] = '" + resanimationName + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
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
        public string TranslateY(DfTranslateY p1)
        {
            string res;
            string y = "0px";
            if (p1.Y != null)
            {
                y = p1.Y.AsNumber().ToString() + "px";
            }
            res = "translateY(" + y + ")";
            return res;
        }
        public string TranslateX(DfTranslateX p1)
        {
            string res;
            string x = "0px";
            if (p1.X != null)
            {
                x = p1.X.AsNumber().ToString() + "px";
            }
            res = "translateX(" + x + ")";
            return res;
        }
        public string Translate(DfTranslate p1)
        {
            string res;
            string x = "0px";
            string y = "0px";
            if (p1.X != null)
            {
                x = p1.X.AsNumber().ToString() + "px";
            }
            if (p1.Y != null)
            {
                y = p1.Y.AsNumber().ToString() + "px";
            }
            res = "translate(" + x + ", " + y + ")";
            return res;
        }
        public string ScaleX(DfScaleX p1)
        {
            string res;
            string x = "1";
            if (p1.X != null)
            {
                x = p1.X.AsNumber().ToString();
            }
            res = "scaleX(" + x + ")";
            return res;
        }
        public string ScaleY(DfScaleY p1)
        {
            string res;
            string y = "1";
            if (p1.Y != null)
            {
                y = p1.Y.AsNumber().ToString();
            }
            res = "scaleY(" + y + ")";
            return res;
        }
        public string ScaleZ(DfScaleZ p1)
        {
            string res;
            string z = "1";
            if (p1.Z != null)
            {
                z = p1.Z.AsNumber().ToString();
            }
            res = "scaleZ(" + z + ")";
            return res;
        }
        public string RotateZ(DfRotateZ p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "rotateZ(" + angle + "deg)";
            return res;
        }
        public string Skew(DfSkew p1)
        {
            string res;
            string angleX = "0";
            string angleY = "0";
            if (p1.AngleX != null)
            {
                angleX = p1.AngleX.AsString();
            }
            if (p1.AngleY != null)
            {
                angleY = p1.AngleY.AsString();
            }
            res = "skew(" + angleX + "deg, " + angleY + "deg)";
            return res;
        }
        public string SkewX(DfSkewX p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "skewX(" + angle + "deg)";
            return res;
        }
        public string SkewY(DfSkewY p1)
        {
            string res;
            string angle = "0";
            if (p1.Angle != null)
            {
                angle = p1.Angle.AsString();
            }
            res = "skewY(" + angle + "deg)";
            return res;
        }
        public string TransformPerspective(DfPerspective p1)
        {
            string res;
            string ratio = "0";
            if (p1.Ratio != null)
            {
                ratio = p1.Ratio.AsString();
            }
            res = "perspective(" + ratio + "px)";
            return res;
        }
        public string Matrix(DfMatrix p1)
        {
            string res;
            string scaleX = "1";
            string transformY = "0";
            string transformX = "0";
            string scaleY = "1";
            string offsetX = "0";
            string offsetY = "0";
            if (p1.ScaleX != null)
            {
                scaleX = p1.ScaleX.AsString();
            }
            if (p1.TransformY != null)
            {
                transformY = p1.TransformY.AsString();
            }
            if (p1.TransformX != null)
            {
                transformX = p1.TransformX.AsString();
            }
            if (p1.ScaleY != null)
            {
                scaleY = p1.ScaleY.AsString();
            }
            if (p1.OffsetX != null)
            {
                offsetX = p1.OffsetX.AsString();
            }
            if (p1.OffsetY != null)
            {
                offsetY = p1.OffsetY.AsString();
            }
            res = "matrix(" + scaleX + ", " + transformY + ", "  + transformX +  ", " + scaleY + ", " + offsetX + ", " + offsetY + ")";
            return res;
        }
        public string Matrix3D(DfMatrix3D p1)
        {
            string res = "matrix3d(";
            res += p1["Number" + 1];
            for (int i = 1; i < 16; i++)
            {
                res += ", " + p1["Number" + (i + 1)];
            }
            res += ")";
            return res;
        }

        public string restransform { get; set; }
        public IValue transform { get; set; }
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
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateY))
                            {
                                restransform = restransform + " " + TranslateY((DfTranslateY)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateX))
                            {
                                restransform = restransform + " " + TranslateX((DfTranslateX)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslate))
                            {
                                restransform = restransform + " " + Translate((DfTranslate)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleX))
                            {
                                restransform = restransform + " " + ScaleX((DfScaleX)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleY))
                            {
                                restransform = restransform + " " + ScaleY((DfScaleY)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleZ))
                            {
                                restransform = restransform + " " + ScaleZ((DfScaleZ)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateZ))
                            {
                                restransform = restransform + " " + RotateZ((DfRotateZ)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkew))
                            {
                                restransform = restransform + " " + Skew((DfSkew)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkewX))
                            {
                                restransform = restransform + " " + SkewX((DfSkewX)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkewY))
                            {
                                restransform = restransform + " " + SkewY((DfSkewY)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfPerspective))
                            {
                                restransform = restransform + " " + TransformPerspective((DfPerspective)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfMatrix))
                            {
                                restransform = restransform + " " + Matrix((DfMatrix)ArrayImpl1.Get(i));
                            }
                            if (ArrayImpl1.Get(i).GetType() == typeof(DfMatrix3D))
                            {
                                restransform = restransform + " " + Matrix3D((DfMatrix3D)ArrayImpl1.Get(i));
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
                    if (transform.GetType() == typeof(DfTranslateY))
                    {
                        restransform = TranslateY((DfTranslateY)transform);
                    }
                    if (transform.GetType() == typeof(DfTranslateX))
                    {
                        restransform = TranslateX((DfTranslateX)transform);
                    }
                    if (transform.GetType() == typeof(DfTranslate))
                    {
                        restransform = Translate((DfTranslate)transform);
                    }
                    if (transform.GetType() == typeof(DfScaleX))
                    {
                        restransform = ScaleX((DfScaleX)transform);
                    }
                    if (transform.GetType() == typeof(DfScaleY))
                    {
                        restransform = ScaleY((DfScaleY)transform);
                    }
                    if (transform.GetType() == typeof(DfScaleZ))
                    {
                        restransform = ScaleZ((DfScaleZ)transform);
                    }
                    if (transform.GetType() == typeof(DfRotateZ))
                    {
                        restransform = RotateZ((DfRotateZ)transform);
                    }
                    if (transform.GetType() == typeof(DfSkew))
                    {
                        restransform = Skew((DfSkew)transform);
                    }
                    if (transform.GetType() == typeof(DfSkewX))
                    {
                        restransform = SkewX((DfSkewX)transform);
                    }
                    if (transform.GetType() == typeof(DfSkewY))
                    {
                        restransform = SkewY((DfSkewY)transform);
                    }
                    if (transform.GetType() == typeof(DfPerspective))
                    {
                        restransform = TransformPerspective((DfPerspective)transform);
                    }
                    if (transform.GetType() == typeof(DfMatrix))
                    {
                        restransform = Matrix((DfMatrix)transform);
                    }
                    if (transform.GetType() == typeof(DfMatrix3D))
                    {
                        restransform = Matrix3D((DfMatrix3D)transform);
                    }
                }
                if (Owner != null)
                {
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['transform'] = '" + restransform + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundSize { get; set; }
        public IValue backgroundSize { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfontSize { get; set; }
        public IValue fontSize { get; set; }
        [ContextProperty("РазмерШрифта", "FontSize")]
        public IValue FontSize
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resminHeight { get; set; }
        public IValue minHeight { get; set; }
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
                    string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['minHeight'] = '" + resminHeight + "';";
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resopacity { get; set; }
        public IValue opacity { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransformOrigin { get; set; }
        public IValue transformOrigin { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restransformStyle { get; set; }
        public string transformStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resperspectiveOrigin { get; set; }
        public IValue perspectiveOrigin { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resperspective { get; set; }
        public IValue perspective { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundRepeat { get; set; }
        public string backgroundRepeat { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfontFamily { get; set; }
        public string fontFamily { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextShadow { get; set; }
        public IValue textShadow { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundImage { get; set; }
        public string backgroundImage { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoffset { get; set; }
        public IValue offset { get; set; }
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

        public DfFrames frames { get; set; }
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
                DeclarativeForms.SendStrFunc(strFunc);
            }
        }

        public string resanimation { get; set; }
        public IValue animation { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resalignSelf { get; set; }
        public string alignSelf { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resalignContent { get; set; }
        public string alignContent { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resflexDirection { get; set; }
        public string flexDirection { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resflexWrap { get; set; }
        public string flexWrap { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderRadius { get; set; }
        public IValue borderRadius { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }

            }
        }

        public string resmarginTop { get; set; }
        public IValue marginTop { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmarginLeft { get; set; }
        public IValue marginLeft { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmarginBottom { get; set; }
        public IValue marginBottom { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmarginRight { get; set; }
        public IValue marginRight { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfont { get; set; }
        public IValue font { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resfilter { get; set; }
        public IValue filter { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resposition { get; set; }
        public string position { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restop { get; set; }
        public IValue top { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbottom { get; set; }
        public IValue bottom { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resleft { get; set; }
        public IValue left { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resright { get; set; }
        public IValue right { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resjustifyContent { get; set; }
        public string justifyContent { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resdisplay { get; set; }
        public string display { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resalignItems { get; set; }
        public string alignItems { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resboxShadow { get; set; }
        public IValue boxShadow { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reslistStyle { get; set; }
        public IValue listStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnRule { get; set; }
        public IValue columnRule { get; set; }
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
                    string columnRuleColor;
                    if (Owner != null)
                    {
                        columnRuleColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        columnRuleColor = BackgroundColor;
                    }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resverticalAlign { get; set; }
        public IValue verticalAlign { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderTop { get; set; }
        public IValue borderTop { get; set; }
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
                    string borderTopColor;
                    if (Owner != null)
                    {
                        borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderTopColor = BackgroundColor;
                    }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resheight { get; set; }
        public IValue height { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reshorizontalTextAlign { get; set; }
        public string horizontalTextAlign { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderCollapse { get; set; }
        public string borderCollapse { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborders { get; set; }
        public IValue borders { get; set; }
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
                    string borderColor;
                    if (Owner != null)
                    {
                        borderColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderColor = BackgroundColor;
                    }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string respadding { get; set; }
        public IValue padding { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string respaddingTop { get; set; }
        public IValue paddingTop { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string respaddingLeft { get; set; }
        public IValue paddingLeft { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string respaddingBottom { get; set; }
        public IValue paddingBottom { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string respaddingRight { get; set; }
        public IValue paddingRight { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
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
        public IValue borderImage { get; set; }
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
                    if (Owner != null)
                    {
                        string strFunc = "mapKeyEl.get('" + ((dynamic)Owner).ItemKey + "').style['borderImage'] = '" + resborderImage + "';";
                        DeclarativeForms.SendStrFunc(strFunc);
                    }
                }
                else
                {
                    DfBorderImage val = (DfBorderImage)value;
                    if (val.BorderImageSource != null)
                    {
                        BorderImageSource = val.BorderImageSource.AsString();
                    }
                    if (val.BorderImageSlice != null)
                    {
                        BorderImageSlice = val.BorderImageSlice;
                    }
                    if (val.BorderImageWidth != null)
                    {
                        BorderImageWidth = val.BorderImageWidth;
                    }
                    if (val.BorderImageOutset != null)
                    {
                        BorderImageOutset = val.BorderImageOutset;
                    }
                    if (val.BorderImageRepeat != null)
                    {
                        BorderImageRepeat = val.BorderImageRepeat.AsString();
                    }
                }
            }
        }

        public string rescolumnCount { get; set; }
        public IValue columnCount { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumns { get; set; }
        public IValue columns { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoutline { get; set; }
        public IValue outline { get; set; }
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
                    string outlineColor;
                    if (Owner != null)
                    {
                        outlineColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        outlineColor = BackgroundColor;
                    }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderLeft { get; set; }
        public IValue borderLeft { get; set; }
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
                    string borderLeftColor;
                    if (Owner != null)
                    {
                        borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderLeftColor = BackgroundColor;
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderRight { get; set; }
        public IValue borderRight { get; set; }
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
                    string borderRightColor;
                    if (Owner != null)
                    {
                        borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderRightColor = BackgroundColor;
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderBottom { get; set; }
        public IValue borderBottom { get; set; }
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
                    string borderBottomColor;
                    if (Owner != null)
                    {
                        borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderBottomColor = BackgroundColor;
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resmargin { get; set; }
        public IValue margin { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoverflow { get; set; }
        public string overflow { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoverflowY { get; set; }
        public string overflowY { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoverflowX { get; set; }
        public string overflowX { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reswhiteSpace { get; set; }
        public string whiteSpace { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restableLayout { get; set; }
        public string tableLayout { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbordersStyle { get; set; }
        public IValue bordersStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoutlineStyle { get; set; }
        public string outlineStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderTopStyle { get; set; }
        public string borderTopStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderRightStyle { get; set; }
        public string borderRightStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderBottomStyle { get; set; }
        public string borderBottomStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderLeftStyle { get; set; }
        public string borderLeftStyle { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string restextColor { get; set; }
        public string textColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderTopColor { get; set; }
        public string borderTopColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbordersColor { get; set; }
        public IValue bordersColor { get; set; }
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
                    string borderTopColor;
                    if (Owner != null)
                    {
                        borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    }
                    else
                    {
                        borderTopColor = BackgroundColor + " ";
                    }
                    string borderRightColor;
                    if (Owner != null)
                    {
                        borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    }
                    else
                    {
                        borderRightColor = BackgroundColor + " ";
                    }
                    string borderBottomColor;
                    if (Owner != null)
                    {
                        borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    }
                    else
                    {
                        borderBottomColor = BackgroundColor + " ";
                    }
                    string borderLeftColor;
                    if (Owner != null)
                    {
                        borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    }
                    else
                    {
                        borderLeftColor = BackgroundColor;
                    }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderLeftColor { get; set; }
        public string borderLeftColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderBottomColor { get; set; }
        public string borderBottomColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderRightColor { get; set; }
        public string borderRightColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoutlineColor { get; set; }
        public string outlineColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbackgroundColor { get; set; }
        public string backgroundColor { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reswidth { get; set; }
        public IValue width { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderTopWidth { get; set; }
        public IValue borderTopWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resbordersWidth { get; set; }
        public IValue bordersWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string rescolumnWidth { get; set; }
        public IValue columnWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resoutlineWidth { get; set; }
        public IValue outlineWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderLeftWidth { get; set; }
        public IValue borderLeftWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderBottomWidth { get; set; }
        public IValue borderBottomWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string reswordWrap { get; set; }
        public string wordWrap { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
                }
            }
        }

        public string resborderRightWidth { get; set; }
        public IValue borderRightWidth { get; set; }
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
                    DeclarativeForms.SendStrFunc(strFunc);
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
