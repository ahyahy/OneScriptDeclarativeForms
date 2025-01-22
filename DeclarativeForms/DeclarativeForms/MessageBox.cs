using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.IO;
using System.Reflection;
using System;

namespace osdf
{
    [ContextClass("ДфОкноСообщений", "DfMessageBox")]
    public class DfMessageBox : AutoContext<DfMessageBox>
    {
        public DfMessageBox(string p1 = null, string p2 = null, DfPoint p3 = null)
        {
            if (p1 != null)
            {
                Title = p1;
            }
            if (p2 != null)
            {
                Text = p2;
            }
            if (p3 != null)
            {
                Position = p3;
            }
            ItemKey = "d" + Path.GetRandomFileName().Replace(".", "");
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        public PropertyInfo this[string p1]
        {
            get { return this.GetType().GetProperty(p1); }
        }

        public DfPoint position { get; set; } = new DfPoint(-1, -1);
        [ContextProperty("Позиция", "Position")]
        public DfPoint Position
        {
            get { return position; }
            set
            {
                if (value != null)
                {
                    position = value;
                }
                else
                {
                    position = new DfPoint(-1, -1);
                }
            }
        }

        public string headerColor { get; set; } = "rgb(175, 238, 238)";
        [ContextProperty("ЦветЗаголовка", "HeaderColor")]
        public string HeaderColor
        {
            get { return headerColor; }
            set { headerColor = value; }
        }

        public string headerTextColor { get; set; } = "rgb(0, 0, 0)";
        [ContextProperty("ЦветТекстаЗаголовка", "HeaderTextColor")]
        public string HeaderTextColor
        {
            get { return headerTextColor; }
            set { headerTextColor = value; }
        }

        public string textColor { get; set; } = "rgb(0, 0, 0)";
        [ContextProperty("ЦветТекста", "TextColor")]
        public string TextColor
        {
            get { return textColor; }
            set { textColor = value; }
        }

        public string backgroundColor { get; set; } = "rgb(211, 211, 211)";
        [ContextProperty("ЦветФона", "BackgroundColor")]
        public string BackgroundColor
        {
            get { return backgroundColor; }
            set { backgroundColor = value; }
        }

        public string fontStyle { get; set; } = "";
        [ContextProperty("СтильШрифта", "FontStyle")]
        public string FontStyle
        {
            get { return fontStyle; }
            set { fontStyle = value; }
        }

        public string fontVariant { get; set; } = "";
        [ContextProperty("ВариантШрифта", "FontVariant")]
        public string FontVariant
        {
            get { return fontVariant; }
            set { fontVariant = value; }
        }

        public string fontWeight { get; set; } = "";
        [ContextProperty("ЖирностьШрифта", "FontWeight")]
        public string FontWeight
        {
            get { return fontWeight; }
            set { fontWeight = value; }
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
                    reslineHeight = value.AsNumber().ToString().Replace(",", ".");
                }
            }
        }

        public string fontFamily { get; set; } = "";
        [ContextProperty("СемействоШрифтов", "FontFamily")]
        public string FontFamily
        {
            get { return fontFamily; }
            set { fontFamily = value; }
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            private set { itemKey = value; }
        }

        public int width { get; set; } = 400;
        [ContextProperty("Ширина", "Width")]
        public int Width
        {
            get { return width; }
            set { width = value; }
        }

        public int height { get; set; } = 200;
        [ContextProperty("Высота", "Height")]
        public int Height
        {
            get { return height; }
            set { height = value; }
        }

        public string title { get; set; } = "Сообщение";
        [ContextProperty("Заголовок", "Title")]
        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        public string text { get; set; } = "Сообщение...";
        [ContextProperty("Текст", "Text")]
        public string Text
        {
            get { return text; }
            set { text = value.Replace("\u000A", @"<br>"); }
        }

        public int _interval { get; set; } = 60000;
        [ContextProperty("Интервал", "Interval")]
        public int Interval
        {
            get { return _interval; }
            set { _interval = value; }
        }

        [ContextMethod("Показать", "Show")]
        public void Show()
        {
            // Создаем сообщение.
            string strFunc = @"
nw.Window.open('mes.html', {
   width: " + Width + @",
   height: " + Height + @",
   show: false,
   show_in_taskbar: false,
   frame: false,
   position: 'center'
}, function(new_win){

new_win.setAlwaysOnTop(true);
new_win.setShowInTaskbar(false);

new_win.on('closed', function () {
    new_win = null;
});

new_win.on('loaded', function () {
    let document1 = new_win.window.document;

    let div1 = document1.createElement('div');
    div1.innerHTML = `
<div style=""display: flex; justify-content: space-between; position: sticky; top: 0; height: 21px; background-color: " + HeaderColor + @";"">
    <span style=""color: " + HeaderTextColor + @";"">" + Title + @"</span>
    <div>
        <span style=""color: " + HeaderTextColor + @";"">" + DateTime.Now.ToString() + @"</span>
        <button style=""-webkit-app-region: no-drag; float: right;"" onclick=""nw.Window.get().close(true);"">Х</button>
    </div>
</div>
`;
    document1.body.appendChild(div1);

    let div2 = document1.createElement('div');
    div2.innerHTML = `
<div>
    <div style=""-webkit-app-region: no-drag; padding: 10px; word-break: break-all;"">
        <span style=""color: " + TextColor + @"; font-family: " + FontFamily + @"; font-style: " + FontStyle + @"; font-variant: " + FontVariant + @"; font-weight: " + FontWeight + @"; font-size: " + resfontSize + @"; line-height: " + reslineHeight + @";"">" + Text + @"</span>
    </div>
</div>
`;
    document1.body.appendChild(div2);

    document1.body.style.backgroundColor = '" + BackgroundColor + @"';
});

let x = " + Position.X + @";
let y = " + Position.Y + @";
if (x >= 0 && y >=0)
{
    new_win.moveTo(x, y);
}

if (" + Interval + @" >= 0)
{
    setTimeout(() => {
        try
        {
            new_win.close(true);
        }
        catch{}
    }, " + Interval + @");
}

new_win.show();

});
";
            DeclarativeForms.SendStrFunc(strFunc);
        }
    }
}
