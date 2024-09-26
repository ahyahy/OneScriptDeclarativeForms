using System;
using System.IO;
using System.Collections.Generic;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using ScriptEngine.HostedScript.Library;

namespace osdf
{
    [ContextClass("ДфФорма", "DfForm")]
    public class DfForm : AutoContext<DfForm>
    {
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static IRuntimeContextInstance startupScript = DeclarativeForms.GlobalContext().StartupScript();
        private static string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
        public static Dictionary<string, object> props = new Dictionary<string, object>();
        private static DfBody body = new DfBody();

        public DfForm()
        {
            ItemKey = "mainForm";
            DeclarativeForms.AddToHashtable(ItemKey, this);
        }

        private string itemKey;
        [ContextProperty("КлючЭлемента", "ItemKey")]
        public string ItemKey
        {
            get { return itemKey; }
            set { itemKey = value; }
        }

        private int width;
        [ContextProperty("Ширина", "Width")]
        public int Width
        {
            private get { return width; }
            set
            {
                width = value;
                props["width"] = "\u0022width\u0022: " + width.ToString() + ",";
            }
        }

        private int height;
        [ContextProperty("Высота", "Height")]
        public int Height
        {
            private get { return height; }
            set
            {
                height = value;
                props["height"] = "\u0022height\u0022: " + height.ToString() + ",";
            }
        }

        private string title;
        [ContextProperty("Заголовок", "Title")]
        public string Title
        {
            private get { return title; }
            set
            {
                title = value;
                props["title"] = "\u0022title\u0022: " + "\u0022" + title + "\u0022,";
            }
        }

        private string icon;
        [ContextProperty("Значок", "Icon")]
        public string Icon
        {
            private get { return icon; }
            set
            {
                icon = value;
                props["icon"] = "\u0022icon\u0022: " + "\u0022" + icon + "\u0022,";
            }
        }

        private bool resizable;
        [ContextProperty("ИзменяемыйРазмер", "Resizable")]
        public bool Resizable
        {
            private get { return resizable; }
            set
            {
                resizable = value;
                props["resizable"] = "\u0022resizable\u0022: " + resizable.ToString().ToLower() + ",";
            }
        }

        private bool kiosk;
        [ContextProperty("Киоск", "Kiosk")]
        public bool Kiosk
        {
            private get { return kiosk; }
            set
            {
                kiosk = value;
                props["kiosk"] = "\u0022kiosk\u0022: " + kiosk.ToString().ToLower() + ",";
            }
        }

        private int max_height;
        [ContextProperty("МаксимальнаяВысота", "MaxHeight")]
        public int MaxHeight
        {
            private get { return max_height; }
            set
            {
                max_height = value;
                props["max_height"] = "\u0022max_height\u0022: " + max_height.ToString() + ",";
            }
        }

        private int max_width;
        [ContextProperty("МаксимальнаяШирина", "MaxWidth")]
        public int MaxWidth
        {
            private get { return max_width; }
            set
            {
                max_width = value;
                props["max_width"] = "\u0022max_width\u0022: " + max_width.ToString() + ",";
            }
        }

        private int min_height;
        [ContextProperty("МинимальнаяВысота", "MinHeight")]
        public int MinHeight
        {
            private get { return min_height; }
            set
            {
                min_height = value;
                props["min_height"] = "\u0022min_height\u0022: " + min_height.ToString() + ",";
            }
        }

        private int min_width;
        [ContextProperty("МинимальнаяШирина", "MinWidth")]
        public int MinWidth
        {
            private get { return min_width; }
            set
            {
                min_width = value;
                props["min_width"] = "\u0022min_width\u0022: " + min_width.ToString() + ",";
            }
        }

        private bool show;
        [ContextProperty("Показать", "Show")]
        public bool Show
        {
            private get { return show; }
            set
            {
                show = value;
                props["show"] = "\u0022show\u0022: " + show.ToString().ToLower() + ",";
            }
        }

        private bool show_in_taskbar;
        [ContextProperty("ПоказатьВПанели", "ShowInTaskbar")]
        public bool ShowInTaskbar
        {
            private get { return show_in_taskbar; }
            set
            {
                show_in_taskbar = value;
                props["show_in_taskbar"] = "\u0022show_in_taskbar\u0022: " + show_in_taskbar.ToString().ToLower() + ",";
            }
        }

        private bool fullscreen;
        [ContextProperty("Полноэкранный", "Fullscreen")]
        public bool Fullscreen
        {
            private get { return fullscreen; }
            set
            {
                fullscreen = value;
                props["fullscreen"] = "\u0022fullscreen\u0022: " + fullscreen.ToString().ToLower() + ",";
            }
        }

        private bool transparent;
        [ContextProperty("Прозрачный", "Transparent")]
        public bool Transparent
        {
            private get { return transparent; }
            set
            {
                transparent = value;
                props["transparent"] = "\u0022transparent\u0022: " + transparent.ToString().ToLower() + ",";
            }
        }

        private bool frame;
        [ContextProperty("Фрейм", "Frame")]
        public bool Frame
        {
            private get { return frame; }
            set
            {
                frame = value;
                props["frame"] = "\u0022frame\u0022: " + frame.ToString().ToLower() + ",";
            }
        }

        private string position;
        [ContextProperty("Позиция", "Position")]
        public string Position
        {
            private get { return position; }
            set
            {
                position = value;
                props["position"] = "\u0022position\u0022: " + "\u0022" + position + "\u0022,";
            }
        }

        public DfAction loaded;
        [ContextProperty("Загружена", "Loaded")]
        public DfAction Loaded
        {
            get { return loaded; }
            set { loaded = value; }
        }

        [ContextMethod("Открыть", "Open")]
        public void Open()
        {
            // Сформируем package.json
            string resStr = "            ";
            foreach (KeyValuePair<string, object> entry in props)
            {
                resStr = resStr + "            " + entry.Value + Environment.NewLine;
            }

            string str = osdf.Packagejson.packagejson;
            string strFind = osdf.DeclarativeForms.StrFindBetween(str, "window\u0022: {", "}", false).Get(0).AsString();
            resStr = resStr.Trim();
            if (resStr.Length > 0)
            {
                resStr = resStr.Substring(0, resStr.Length - 1);
            }
            string strReplace = "window\u0022: {" + Environment.NewLine + "            " + resStr + Environment.NewLine + "        }";
            str = str.Replace(strFind, strReplace);
            osdf.Packagejson.packagejson = str;

            bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
            string folderName = @".\";
            if (!isWin)
            {
                folderName = @"./";
            }

            DeclarativeForms.instance.LoadScripts(folderName);
            string pathNW = DeclarativeForms._nw;

            System.Diagnostics.Process process = new System.Diagnostics.Process();

            DeclarativeForms.process = process;

            process.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
            process.StartInfo.FileName = "\u0022" + pathNW + "\u0022";
            process.StartInfo.Arguments = "\u0022" + pathStartupScript + separator;
            process.Start();
            process.WaitForExit();

            Environment.Exit(0);
        }

        public DfMenu menu;
        [ContextProperty("Меню", "Menu")]
        public DfMenu Menu
        {
            get { return menu; }
            set
            {
                menu = value;
                //setMenu(name)
                string strFunc = "setMenu(\u0022" + menu.ItemKey + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        [ContextProperty("Контент", "Body")]
        public DfBody Body
        {
            get { return body; }
        }

        private ArrayImpl children = new ArrayImpl();
        [ContextProperty("Элементы", "Children")]
        public ArrayImpl Children
        {
            get { return children; }
        }

        [ContextMethod("ДобавитьДочерний", "АppendChild")]
        public IValue АppendChild(IValue p1)
        {
            string strFunc = "document.body.appendChild(mapKeyEl.get(\u0022" + ((dynamic)p1).ItemKey + "\u0022));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            ((dynamic)p1).Parent = this;
            return p1;
        }
		
        [ContextMethod("УдалитьДочерний", "RemoveChild")]
        public void RemoveChild(IValue p1)
        {
            string strFunc = "document.body.removeChild(mapKeyEl.get(\u0022" + ((dynamic)p1.AsObject()).ItemKey + "\u0022));";
            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
        }
    }
}
