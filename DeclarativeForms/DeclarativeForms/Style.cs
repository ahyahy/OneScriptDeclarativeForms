using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.IO;
using System.Reflection;

namespace osdf
{
    [ContextClass("ДфСтиль", "DfStyle")]
    public class DfStyle : AutoContext<DfStyle>
    {
        public DfStyle()
        {
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            string strFunc = "createElement(\u0022" + "style" + "\u0022, \u0022" + ItemKey + "\u0022)";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
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
		
        private DfFont font;
        [ContextProperty("Шрифт", "Font")]
        public DfFont Font
        {
            get { return font; }
            set
            {
                font = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
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
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "font" + "\u0022, \u0022" + res + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }
		
        private IValue filter;
        [ContextProperty("Фильтр", "Filter")]
        public IValue Filter
        {
            get { return filter; }
            set
            {
                filter = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    DfImagesFilter imagesFilter = (DfImagesFilter)filter.AsObject();
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
                    if (imagesFilter.Blur != null)
                    {
                        blur = "blur(" + imagesFilter.Blur.AsNumber() + "px) ";
                    }
                    if (imagesFilter.Brightness != null)
                    {
                        brightness = "brightness(" + imagesFilter.Brightness.AsNumber() + "%) ";
                    }
                    if (imagesFilter.Contrast != null)
                    {
                        contrast = "contrast(" + imagesFilter.Contrast.AsNumber() + "%) ";
                    }
                    if (imagesFilter.DropShadow != null)
                    {
                        DfBoxShadow boxShadow = (DfBoxShadow)imagesFilter.DropShadow.AsObject();
                        string x = "";
                        string y = "";
                        string _blur = "";
                        string spread = "";
                        string color = "";
                        if (boxShadow.X != null)
                        {
                            x = "" + boxShadow.X.AsNumber() + "px ";
                        }
                        if (boxShadow.Y != null)
                        {
                            y = "" + boxShadow.Y.AsNumber() + "px ";
                        }
                        if (boxShadow.Blur != null)
                        {
                            _blur = "" + boxShadow.Blur.AsNumber() + "px ";
                        }
                        if (boxShadow.Spread != null)
                        {
                            //spread = "" + boxShadow.Spread.AsNumber() + "px ";
                            // Не поддерживается множеством браузеров. Не используем.
                            spread = "";
                        }
                        if (boxShadow.Color != null)
                        {
                            color = boxShadow.Color.AsString() + "";
                        }
                        dropShadow = "drop-shadow(" + x + y + _blur + spread + color + ") ";
                    }
                    if (imagesFilter.Grayscale != null)
                    {
                        grayscale = "grayscale(" + imagesFilter.Grayscale.AsNumber() + "%) ";
                    }
                    if (imagesFilter.HueRotate != null)
                    {
                        hueRotate = "hue-rotate(" + imagesFilter.HueRotate.AsNumber() + "deg) ";
                    }
                    if (imagesFilter.Invert != null)
                    {
                        invert = "invert(" + imagesFilter.Invert.AsNumber() + "%) ";
                    }
                    if (imagesFilter.Opacity != null)
                    {
                        opacity = "opacity(" + imagesFilter.Opacity.AsNumber() + "%) ";
                    }
                    if (imagesFilter.Saturate != null)
                    {
                        saturate = "saturate(" + imagesFilter.Saturate.AsNumber() + ") ";
                    }
                    if (imagesFilter.Sepia != null)
                    {
                        sepia = "sepia(" + imagesFilter.Sepia.AsNumber() + "%) ";
                    }
                    string res = blur + brightness + contrast + dropShadow + grayscale + hueRotate + invert + opacity + saturate + sepia;
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "filter" + "\u0022, \u0022" + res + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }
		
        private string position;
        [ContextProperty("Позиция", "Position")]
        public string Position
        {
            get { return position; }
            set
            {
                position = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "position" + "\u0022, \u0022" + position + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string justifyContent;
        [ContextProperty("РасположениеСодержимого", "JustifyContent")]
        public string JustifyContent
        {
            get { return justifyContent; }
            set
            {
                justifyContent = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "justifyContent" + "\u0022, \u0022" + justifyContent + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string display;
        [ContextProperty("Отображать", "Display")]
        public string Display
        {
            get { return display; }
            set
            {
                display = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "display" + "\u0022, \u0022" + display + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string alignItems;
        [ContextProperty("ВыравниваниеЭлементов", "AlignItems")]
        public string AlignItems
        {
            get { return alignItems; }
            set
            {
                alignItems = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "alignItems" + "\u0022, \u0022" + alignItems + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBoxShadow boxShadow;
        [ContextProperty("Тень", "BoxShadow")]
        public DfBoxShadow BoxShadow
        {
            get { return boxShadow; }
            set
            {
                boxShadow = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string x = "0px ";
                    string y = "0px ";
                    string blur = "0px ";
                    string spread = "0px ";
                    string color = "rgb(0, 0, 0) ";
                    string inset = "";
                    if (boxShadow.X != null)
                    {
                        x = "" + boxShadow.X.AsNumber() + "px ";
                    }
                    if (boxShadow.Y != null)
                    {
                        y = "" + boxShadow.Y.AsNumber() + "px ";
                    }
                    if (boxShadow.Blur != null)
                    {
                        blur = "" + boxShadow.Blur.AsNumber() + "px ";
                    }
                    if (boxShadow.Spread != null)
                    {
                        spread = "" + boxShadow.Spread.AsNumber() + "px ";
                    }
                    if (boxShadow.Color != null)
                    {
                        color = boxShadow.Color.AsString() + " ";
                    }
                    if (boxShadow.Inset)
                    {
                        inset = "inset";
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "boxShadow" + "\u0022, \u0022" + x + y + blur + spread + color + inset + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfListStyle listStyle;
        [ContextProperty("СтильСписка", "ListStyle")]
        public DfListStyle ListStyle
        {
            get { return listStyle; }
            set
            {
                listStyle = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string listStyleType = "decimal ";
                    string listStylePosition = "outside ";
                    string listStyleImage = "none";
                    if (listStyle.ListStyleType != null)
                    {
                        listStyleType = listStyle.ListStyleType.AsString() + " ";
                    }
                    if (listStyle.ListStylePosition != null)
                    {
                        listStylePosition = listStyle.ListStylePosition.AsString() + " ";
                    }
                    if (listStyle.ListStyleImage != null)
                    {
                        listStyleImage = "url('" + listStyle.ListStyleImage.AsString() + "') ";
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "listStyle" + "\u0022, \u0022" + listStyleType + listStylePosition + listStyleImage + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfColumnRule columnRule;
        [ContextProperty("РазделительКолонок", "ColumnRule")]
        public DfColumnRule ColumnRule
        {
            get { return columnRule; }
            set
            {
                columnRule = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string columnRuleWidth = "medium ";
                    string columnRuleStyle = "none ";
                    string columnRuleColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (columnRule.ColumnRuleWidth != null)
                    {
                        if (columnRule.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            columnRuleWidth = columnRule.ColumnRuleWidth.AsString() + " ";
                        }
                        else if (columnRule.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            columnRuleWidth = columnRule.ColumnRuleWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (columnRule.ColumnRuleStyle != null)
                    {
                        columnRuleStyle = columnRule.ColumnRuleStyle.AsString() + " ";
                    }
                    if (columnRule.ColumnRuleColor != null)
                    {
                        columnRuleColor = columnRule.ColumnRuleColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "columnRule" + "\u0022, \u0022" + columnRuleWidth + columnRuleStyle + columnRuleColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }



        private string verticalAlign;
        [ContextProperty("ВертикальноеВыравнивание", "VerticalAlign")]
        public string VerticalAlign
        {
            get { return verticalAlign; }
            set
            {
                verticalAlign = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "verticalAlign" + "\u0022, \u0022" + verticalAlign + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorderTop borderTop;
        [ContextProperty("ВерхняяГраница", "BorderTop")]
        public DfBorderTop BorderTop
        {
            get { return borderTop; }
            set
            {
                borderTop = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderTopWidth = "medium ";
                    string borderTopStyle = "none ";
                    string borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (borderTop.BorderTopWidth != null)
                    {
                        if (borderTop.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderTopWidth = borderTop.BorderTopWidth.AsString() + " ";
                        }
                        else if (borderTop.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderTopWidth = borderTop.BorderTopWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (borderTop.BorderTopStyle != null)
                    {
                        borderTopStyle = borderTop.BorderTopStyle.AsString() + " ";
                    }
                    if (borderTop.BorderTopColor != null)
                    {
                        borderTopColor = borderTop.BorderTopColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderTop" + "\u0022, \u0022" + borderTopWidth + borderTopStyle + borderTopColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int height;
        [ContextProperty("Высота", "Height")]
        public int Height
        {
            get { return height; }
            set
            {
                height = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "height" + "\u0022, \u0022" + height + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string horizontalTextAlign;
        [ContextProperty("ГоризонтальноеВыравниваниеТекста", "HorizontalTextAlign")]
        public string HorizontalTextAlign
        {
            get { return horizontalTextAlign; }
            set
            {
                horizontalTextAlign = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "textAlign" + "\u0022, \u0022" + horizontalTextAlign + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderCollapse;
        [ContextProperty("ГраницаСвернута", "BorderCollapse")]
        public string BorderCollapse
        {
            get { return borderCollapse; }
            set
            {
                borderCollapse = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderCollapse" + "\u0022, \u0022" + borderCollapse + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorders borders;
        [ContextProperty("Границы", "Borders")]
        public DfBorders Borders
        {
            get { return borders; }
            set
            {
                borders = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderWidth = "medium ";
                    string borderStyle = "none ";
                    string borderColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (borders.BorderWidth != null)
                    {
                        if (borders.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderWidth = borders.BorderWidth.AsString() + " ";
                        }
                        else if (borders.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderWidth = borders.BorderWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (borders.BorderStyle != null)
                    {
                        borderStyle = borders.BorderStyle.AsString() + " ";
                    }
                    if (borders.BorderColor != null)
                    {
                        borderColor = borders.BorderColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "border" + "\u0022, \u0022" + borderWidth + borderStyle + borderColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfPadding padding;
        [ContextProperty("Заполнение", "Padding")]
        public DfPadding Padding
        {
            get { return padding; }
            set
            {
                padding = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string paddingTop = "0px ";
                    string paddingRight = "0px ";
                    string paddingBottom = "0px ";
                    string paddingLeft = "0px";
                    if (padding.PaddingTop != null)
                    {
                        paddingTop = padding.PaddingTop.AsNumber().ToString() + "px ";
                    }
                    if (padding.PaddingRight != null)
                    {
                        paddingRight = padding.PaddingRight.AsNumber().ToString() + "px ";
                    }
                    if (padding.PaddingBottom != null)
                    {
                        paddingBottom = padding.PaddingBottom.AsNumber().ToString() + "px ";
                    }
                    if (padding.PaddingLeft != null)
                    {
                        paddingLeft = padding.PaddingLeft.AsNumber().ToString() + "px";
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "padding" + "\u0022, \u0022" + paddingTop + paddingRight + paddingBottom + paddingLeft + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int paddingTop;
        [ContextProperty("ЗаполнениеСверху", "PaddingTop")]
        public int PaddingTop
        {
            get { return paddingTop; }
            set
            {
                paddingTop = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "paddingTop" + "\u0022, \u0022" + paddingTop + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int paddingLeft;
        [ContextProperty("ЗаполнениеСлева", "PaddingLeft")]
        public int PaddingLeft
        {
            get { return paddingLeft; }
            set
            {
                paddingLeft = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "paddingLeft" + "\u0022, \u0022" + paddingLeft + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int paddingBottom;
        [ContextProperty("ЗаполнениеСнизу", "PaddingBottom")]
        public int PaddingBottom
        {
            get { return paddingBottom; }
            set
            {
                paddingBottom = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "paddingBottom" + "\u0022, \u0022" + paddingBottom + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int paddingRight;
        [ContextProperty("ЗаполнениеСправа", "PaddingRight")]
        public int PaddingRight
        {
            get { return paddingRight; }
            set
            {
                paddingRight = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "paddingRight" + "\u0022, \u0022" + paddingRight + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            set { itemKey = value; }
        }

        private string borderImageSource;
        [ContextProperty("ИсточникКартинкиГраницы", "BorderImageSource")]
        public string BorderImageSource
        {
            get { return borderImageSource; }
            set
            {
                borderImageSource = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ItemKey + "\u0022, \u0022" + "borderImageSource" + "\u0022, \u0022" + borderImageSource + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorderImage borderImage;
        [ContextProperty("КартинкаГраницы", "BorderImage")]
        public DfBorderImage BorderImage
        {
            get { return borderImage; }
            set
            {
                borderImage = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderImageSource = "none ";
                    string borderImageSlice = "100 ";
                    string borderImageWidth = "1 ";
                    string borderImageOutset = "0 ";
                    string borderImageRepeat = "stretch";
                    if (borderImage.BorderImageSource != null)
                    {
                        borderImageSource = "url('" + borderImage.BorderImageSource.AsString() + "') ";
                    }
                    if (borderImage.BorderImageSlice != null)
                    {
                        borderImageSlice = borderImage.BorderImageSlice.AsNumber().ToString() + " ";
                    }
                    if (borderImage.BorderImageWidth != null)
                    {
                        borderImageWidth = borderImage.BorderImageWidth.AsNumber().ToString() + " ";
                    }
                    if (borderImage.BorderImageOutset != null)
                    {
                        borderImageOutset = borderImage.BorderImageOutset.AsNumber().ToString() + " ";
                    }
                    if (borderImage.BorderImageRepeat != null)
                    {
                        borderImageRepeat = borderImage.BorderImageRepeat.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderImage" + "\u0022, \u0022" + borderImageSource + borderImageSlice + borderImageWidth + borderImageOutset + borderImageRepeat + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int columnCount;
        [ContextProperty("КоличествоКолонок", "ColumnCount")]
        public int ColumnCount
        {
            get { return columnCount; }
            set
            {
                columnCount = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "columnCount" + "\u0022, \u0022" + columnCount + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfColumns columns;
        [ContextProperty("КолонкиЭлемента", "Columns")]
        public DfColumns Columns
        {
            get { return columns; }
            set
            {
                columns = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string columnWidth = "auto ";
                    string columnCount = "auto";
                    if (columns.ColumnWidth != null)
                    {
                        if (columns.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            columnWidth = columns.ColumnWidth.AsString() + " ";
                        }
                        else if (columns.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            columnWidth = columns.ColumnWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (columns.ColumnCount != null)
                    {
                        columnCount = columns.ColumnCount.AsNumber().ToString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "columns" + "\u0022, \u0022" + columnWidth + columnCount + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfOutline outline;
        [ContextProperty("Контур", "Outline")]
        public DfOutline Outline
        {
            get { return outline; }
            set
            {
                outline = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string outlineWidth = "medium ";
                    string outlineStyle = "none ";
                    string outlineColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (outline.OutlineWidth != null)
                    {
                        if (outline.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            outlineWidth = outline.OutlineWidth.AsString() + " ";
                        }
                        else if (outline.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            outlineWidth = outline.OutlineWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (outline.OutlineStyle != null)
                    {
                        outlineStyle = outline.OutlineStyle.AsString() + " ";
                    }
                    if (outline.OutlineColor != null)
                    {
                        outlineColor = outline.OutlineColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "outline" + "\u0022, \u0022" + outlineWidth + outlineStyle + outlineColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorderLeft borderLeft;
        [ContextProperty("ЛеваяГраница", "BorderLeft")]
        public DfBorderLeft BorderLeft
        {
            get { return borderLeft; }
            set
            {
                borderLeft = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderLeftWidth = "medium ";
                    string borderLeftStyle = "none ";
                    string borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (borderLeft.BorderLeftWidth != null)
                    {
                        if (borderLeft.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderLeftWidth = borderLeft.BorderLeftWidth.AsString() + " ";
                        }
                        else if (borderLeft.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderLeftWidth = borderLeft.BorderLeftWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (borderLeft.BorderLeftStyle != null)
                    {
                        borderLeftStyle = borderLeft.BorderLeftStyle.AsString() + " ";
                    }
                    if (borderLeft.BorderLeftColor != null)
                    {
                        borderLeftColor = borderLeft.BorderLeftColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderLeft" + "\u0022, \u0022" + borderLeftWidth + borderLeftStyle + borderLeftColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorderRight borderRight;
        [ContextProperty("ПраваяГраница", "BorderRight")]
        public DfBorderRight BorderRight
        {
            get { return borderRight; }
            set
            {
                borderRight = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderRightWidth = "medium ";
                    string borderRightStyle = "none ";
                    string borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (borderRight.BorderRightWidth != null)
                    {
                        if (borderRight.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderRightWidth = borderRight.BorderRightWidth.AsString() + " ";
                        }
                        else if (borderRight.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderRightWidth = borderRight.BorderRightWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (borderRight.BorderRightStyle != null)
                    {
                        borderRightStyle = borderRight.BorderRightStyle.AsString() + " ";
                    }
                    if (borderRight.BorderRightColor != null)
                    {
                        borderRightColor = borderRight.BorderRightColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderRight" + "\u0022, \u0022" + borderRightWidth + borderRightStyle + borderRightColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfBorderBottom borderBottom;
        [ContextProperty("НижняяГраница", "BorderBottom")]
        public DfBorderBottom BorderBottom
        {
            get { return borderBottom; }
            set
            {
                borderBottom = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderBottomWidth = "medium ";
                    string borderBottomStyle = "none ";
                    string borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (borderBottom.BorderBottomWidth != null)
                    {
                        if (borderBottom.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderBottomWidth = borderBottom.BorderBottomWidth.AsString() + " ";
                        }
                        else if (borderBottom.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderBottomWidth = borderBottom.BorderBottomWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (borderBottom.BorderBottomStyle != null)
                    {
                        borderBottomStyle = borderBottom.BorderBottomStyle.AsString() + " ";
                    }
                    if (borderBottom.BorderBottomColor != null)
                    {
                        borderBottomColor = borderBottom.BorderBottomColor.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderBottom" + "\u0022, \u0022" + borderBottomWidth + borderBottomStyle + borderBottomColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private DfMargin margin;
        [ContextProperty("Отступ", "Margin")]
        public DfMargin Margin
        {
            get { return margin; }
            set
            {
                margin = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string marginTop = "0px ";
                    string marginRight = "0px ";
                    string marginBottom = "0px ";
                    string marginLeft = "0px ";
                    string auto = "";
                    if (margin.MarginTop != 0)
                    {
                        marginTop = margin.MarginTop + "px ";
                    }
                    if (margin.MarginRight != 0)
                    {
                        marginRight = margin.MarginRight + "px ";
                    }
                    if (margin.MarginBottom != 0)
                    {
                        marginBottom = margin.MarginBottom + "px ";
                    }
                    if (margin.MarginLeft != 0)
                    {
                        marginLeft = margin.MarginLeft + "px ";
                    }
                    if (margin.Auto)
                    {
                        auto = "auto";
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "margin" + "\u0022, \u0022" + marginTop + marginRight + marginBottom + marginLeft + auto + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderImageRepeat;
        [ContextProperty("МозаикаКартинкиГраницы", "BorderImageRepeat")]
        public string BorderImageRepeat
        {
            get { return borderImageRepeat; }
            set
            {
                borderImageRepeat = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ItemKey + "\u0022, \u0022" + "borderImageRepeat" + "\u0022, \u0022" + borderImageRepeat + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int borderImageSlice;
        [ContextProperty("НарезкаКартинкиГраницы", "BorderImageSlice")]
        public int BorderImageSlice
        {
            get { return borderImageSlice; }
            set
            {
                borderImageSlice = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ItemKey + "\u0022, \u0022" + "borderImageSlice" + "\u0022, \u0022" + borderImageSlice + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string overflow;
        [ContextProperty("Переполнение", "Overflow")]
        public string Overflow
        {
            get { return overflow; }
            set
            {
                overflow = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "overflow" + "\u0022, \u0022" + overflow + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string overflowY;
        [ContextProperty("ПереполнениеИгрек", "OverflowY")]
        public string OverflowY
        {
            get { return overflowY; }
            set
            {
                overflowY = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "overflowY" + "\u0022, \u0022" + overflowY + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string overflowX;
        [ContextProperty("ПереполнениеИкс", "OverflowX")]
        public string OverflowX
        {
            get { return overflowX; }
            set
            {
                overflowX = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "overflowX" + "\u0022, \u0022" + overflowX + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string tableLayout;
        [ContextProperty("РазмещениеВТаблице", "TableLayout")]
        public string TableLayout
        {
            get { return tableLayout; }
            set
            {
                tableLayout = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "tableLayout" + "\u0022, \u0022" + tableLayout + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int borderImageOutset;
        [ContextProperty("СмещениеКартинкиГраницы", "BorderImageOutset")]
        public int BorderImageOutset
        {
            get { return borderImageOutset; }
            set
            {
                borderImageOutset = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ItemKey + "\u0022, \u0022" + "borderImageOutset" + "\u0022, \u0022" + borderImageOutset + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderTopStyle;
        [ContextProperty("СтильВерхнейГраницы", "BorderTopStyle")]
        public string BorderTopStyle
        {
            get { return borderTopStyle; }
            set { borderTopStyle = value; }
        }

        private DfBordersStyle bordersStyle;
        [ContextProperty("СтильГраниц", "BordersStyle")]
        public DfBordersStyle BordersStyle
        {
            get { return bordersStyle; }
            set
            {
                bordersStyle = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderTopStyle = "none ";
                    string borderRightStyle = "none ";
                    string borderBottomStyle = "none ";
                    string borderLeftStyle = "none";
                    if (bordersStyle.BorderTopStyle != null)
                    {
                        borderTopStyle = bordersStyle.BorderTopStyle.AsString() + " ";
                    }
                    if (bordersStyle.BorderRightStyle != null)
                    {
                        borderRightStyle = bordersStyle.BorderRightStyle.AsString() + " ";
                    }
                    if (bordersStyle.BorderBottomStyle != null)
                    {
                        borderBottomStyle = bordersStyle.BorderBottomStyle.AsString() + " ";
                    }
                    if (bordersStyle.BorderLeftStyle != null)
                    {
                        borderLeftStyle = bordersStyle.BorderLeftStyle.AsString();
                    }
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderStyle" + "\u0022, \u0022" + borderTopStyle + borderRightStyle + borderBottomStyle + borderLeftStyle + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string outlineStyle;
        [ContextProperty("СтильКонтура", "OutlineStyle")]
        public string OutlineStyle
        {
            get { return outlineStyle; }
            set
            {
                outlineStyle = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "outlineStyle" + "\u0022, \u0022" + outlineStyle + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderLeftStyle;
        [ContextProperty("СтильЛевойГраницы", "BorderLeftStyle")]
        public string BorderLeftStyle
        {
            get { return borderLeftStyle; }
            set { borderLeftStyle = value; }
        }

        private string borderBottomStyle;
        [ContextProperty("СтильНижнейГраницы", "BorderBottomStyle")]
        public string BorderBottomStyle
        {
            get { return borderBottomStyle; }
            set { borderBottomStyle = value; }
        }

        private string borderRightStyle;
        [ContextProperty("СтильПравойГраницы", "BorderRightStyle")]
        public string BorderRightStyle
        {
            get { return borderRightStyle; }
            set { borderRightStyle = value; }
        }

        private string borderTopColor;
        [ContextProperty("ЦветВерхнейГраницы", "BorderTopColor")]
        public string BorderTopColor
        {
            get { return borderTopColor; }
            set { borderTopColor = value; }
        }
		
        private DfBordersColor bordersColor;
        [ContextProperty("ЦветГраниц", "BordersColor")]
        public DfBordersColor BordersColor
        {
            get { return bordersColor; }
            set
            {
                bordersColor = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + " ";
                    string borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
                    if (bordersColor.BorderTopColor != null)
                    {
                        borderTopColor = bordersColor.BorderTopColor.AsString() + " ";
                    }
                    if (bordersColor.BorderRightColor != null)
                    {
                        borderRightColor = bordersColor.BorderRightColor.AsString() + " ";
                    }
                    if (bordersColor.BorderBottomColor != null)
                    {
                        borderBottomColor = bordersColor.BorderBottomColor.AsString() + " ";
                    }
                    if (bordersColor.BorderLeftColor != null)
                    {
                        borderLeftColor = bordersColor.BorderLeftColor.AsString();
                    }
                    string res = borderTopColor + borderRightColor + borderBottomColor + borderLeftColor;
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderColor" + "\u0022, \u0022" + res + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string outlineColor;
        [ContextProperty("ЦветКонтура", "OutlineColor")]
        public string OutlineColor
        {
            get { return outlineColor; }
            set
            {
                outlineColor = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "outlineColor" + "\u0022, \u0022" + outlineColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderLeftColor;
        [ContextProperty("ЦветЛевойГраницы", "BorderLeftColor")]
        public string BorderLeftColor
        {
            get { return borderLeftColor; }
            set { borderLeftColor = value; }
        }

        private string borderBottomColor;
        [ContextProperty("ЦветНижнейГраницы", "BorderBottomColor")]
        public string BorderBottomColor
        {
            get { return borderBottomColor; }
            set { borderBottomColor = value; }
        }

        private string borderRightColor;
        [ContextProperty("ЦветПравойГраницы", "BorderRightColor")]
        public string BorderRightColor
        {
            get { return borderRightColor; }
            set { borderRightColor = value; }
        }

        private string backgroundColor;
        [ContextProperty("ЦветФона", "BackgroundColor")]
        public string BackgroundColor
        {
            get { return backgroundColor; }
            set
            {
                backgroundColor = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "backgroundColor" + "\u0022, \u0022" + backgroundColor + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
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
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "width" + "\u0022, \u0022" + width + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderTopWidth;
        [ContextProperty("ШиринаВерхнейГраницы", "BorderTopWidth")]
        public string BorderTopWidth
        {
            get { return borderTopWidth; }
            set { borderTopWidth = value; }
        }

        private DfBordersWidth bordersWidth;
        [ContextProperty("ШиринаГраниц", "BordersWidth")]
        public DfBordersWidth BordersWidth
        {
            get { return bordersWidth; }
            set
            {
                bordersWidth = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string borderTopWidth = "medium ";
                    string borderRightWidth = "medium ";
                    string borderBottomWidth = "medium ";
                    string borderLeftWidth = "medium";
                    if (bordersWidth.BorderTopWidth != null)
                    {
                        if (bordersWidth.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderTopWidth = bordersWidth.BorderTopWidth.AsString() + " ";
                        }
                        else if (bordersWidth.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderTopWidth = bordersWidth.BorderTopWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (bordersWidth.BorderRightWidth != null)
                    {
                        if (bordersWidth.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderRightWidth = bordersWidth.BorderRightWidth.AsString() + " ";
                        }
                        else if (bordersWidth.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderRightWidth = bordersWidth.BorderRightWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (bordersWidth.BorderBottomWidth != null)
                    {
                        if (bordersWidth.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderBottomWidth = bordersWidth.BorderBottomWidth.AsString() + " ";
                        }
                        else if (bordersWidth.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderBottomWidth = bordersWidth.BorderBottomWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    if (bordersWidth.BorderLeftWidth != null)
                    {
                        if (bordersWidth.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
                        {
                            borderLeftWidth = bordersWidth.BorderLeftWidth.AsString() + " ";
                        }
                        else if (bordersWidth.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
                        {
                            borderLeftWidth = bordersWidth.BorderLeftWidth.AsNumber().ToString() + "px ";
                        }
                    }
                    string res = borderTopWidth + borderRightWidth + borderBottomWidth + borderLeftWidth;
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "borderWidth" + "\u0022, \u0022" + res + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int borderImageWidth;
        [ContextProperty("ШиринаКартинкиГраницы", "BorderImageWidth")]
        public int BorderImageWidth
        {
            get { return borderImageWidth; }
            set
            {
                borderImageWidth = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ItemKey + "\u0022, \u0022" + "borderImageWidth" + "\u0022, \u0022" + borderImageWidth + "\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int columnWidth;
        [ContextProperty("ШиринаКолонок", "ColumnWidth")]
        public int ColumnWidth
        {
            get { return columnWidth; }
            set
            {
                columnWidth = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "columnWidth" + "\u0022, \u0022" + columnWidth + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private int outlineWidth;
        [ContextProperty("ШиринаКонтура", "OutlineWidth")]
        public int OutlineWidth
        {
            get { return outlineWidth; }
            set
            {
                outlineWidth = value;
                if (Owner != null)
                {
                    //setAttribute(nameElement, nameAttribute, valueAttribute)
                    string strFunc = "setAttribute(\u0022" + ((dynamic)Owner).ItemKey + "\u0022, \u0022" + "outlineWidth" + "\u0022, \u0022" + outlineWidth + "px\u0022)";
                    DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
                }
            }
        }

        private string borderLeftWidth;
        [ContextProperty("ШиринаЛевойГраницы", "BorderLeftWidth")]
        public string BorderLeftWidth
        {
            get { return borderLeftWidth; }
            set { borderLeftWidth = value; }
        }

        private string borderBottomWidth;
        [ContextProperty("ШиринаНижнейГраницы", "BorderBottomWidth")]
        public string BorderBottomWidth
        {
            get { return borderBottomWidth; }
            set { borderBottomWidth = value; }
        }

        private string borderRightWidth;
        [ContextProperty("ШиринаПравойГраницы", "BorderRightWidth")]
        public string BorderRightWidth
        {
            get { return borderRightWidth; }
            set { borderRightWidth = value; }
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
