using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using System.Runtime.InteropServices;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.HostedScript.Library.Binary;
using System.Collections.Concurrent;

namespace osdf
{
    [ContextClass("ДекларативныеФормы", "DeclarativeForms")]
    public class DeclarativeForms : AutoContext<DeclarativeForms>
    {
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static StructureImpl shareStructure = new StructureImpl();
        public DfEventArgs eventArgs;
        public static DeclarativeForms instance;
        private static object syncRoot = new Object();
        public static string _oscriptPath = "";
        public static string _nw = "";
        public static string strFunctions = "";
        public static int port = 3333;
        public static Hashtable hashtable = new Hashtable();
        private static DfForm form = new DfForm();

        public static DeclarativeForms getInstance()
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                    {
                        instance = new DeclarativeForms();
                    }
                }
            }
            return instance;
        }

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
            _nw = pathStartupScript + separator + "nwjs" + separator + "nw.exe";
            _oscriptPath = pathStartupScript + separator + "oscript" + separator + "bin" + separator + "oscript.exe";

            DeclarativeForms inst = getInstance();
            inst.InjectGlobalProperty(shareStructure, "ОбщаяСтруктура", false);
            shareStructure.Insert("ДФ", inst);
            return inst;
        }

        public static SystemGlobalContext GlobalContext()
        {
            return GlobalsManager.GetGlobalContext<SystemGlobalContext>();
        }

        [ContextMethod("Диалог", "Dialog")]
        public DfDialog Dialog(string p1 = "Диалог")
        {
            return new DfDialog(p1);
        }

        [ContextMethod("СообщитьОЗапускеФормы", "InformLaunchForm")]
        public void Test()
        {
            FunctionString += "sendPost('mainFormТест');";
        }

        [ContextMethod("Тест", "Test")]
        public void Test(IValue p1, string p2)
        {
            dynamic obj = p1;
            string objRus = p1.GetType().GetCustomAttribute<ContextClassAttribute>().GetName().Replace("Дф", "");
            string methodRus = "";
            string methodEn = "";

            System.Reflection.PropertyInfo[] myPropertyInfo = p1.GetType().GetProperties();
            for (int i = 0; i < myPropertyInfo.Length; i++)
            {
                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
                {
                    methodRus = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
                    methodEn = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
                    if (methodRus == p2)
                    {
                        break;
                    }
                }
            }

            dynamic res = "";
            if (events.ContainsKey(methodRus)) // Если это событие.
            {
                res = "event";
            }
            else // Если это свойство.
            {
                try
                {
                    System.Reflection.PropertyInfo pi = obj.GetType().GetProperty(methodEn);
                    res = pi.GetValue(obj); // Объединять со следующей строкой нельзя!!! (res = pi.GetValue(obj).Name;) Не будет работать.
                    res = res.Name;
                }
                catch { }
            }

            string answer = objRus + "." + methodRus + "=" + res;
            bool isProperty;

            //tail=0 isProperty=1 jsMethodEn=2
            answer += (string)DeclarativeForms.namesRusProps[methodRus][0];
            isProperty = (bool)DeclarativeForms.namesRusProps[methodRus][1];
            methodEn = (string)DeclarativeForms.namesRusProps[methodRus][2];

            if (!isProperty)
            {
                //doTestAttribute(nameElement, method, answer, objRus, methodRus)
                string strFunc = "doTestAttribute(\u0022" + obj.Name + "\u0022, \u0022" + methodEn + "\u0022, \u0022" + answer + "\u0022, \u0022" + objRus + "\u0022, \u0022" + methodRus + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
            else
            {
                //doTestProperty(nameElement, method, answer, objRus, methodRus)
                string strFunc = "doTestProperty(\u0022" + obj.Name + "\u0022, \u0022" + methodEn + "\u0022, \u0022" + answer + "\u0022, \u0022" + objRus + "\u0022, \u0022" + methodRus + "\u0022)";
                DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ";";
            }
        }

        [ContextMethod("Элемент", "Element")]
        public DfElement Element(string p1)
        {
            return new DfElement(p1);
        }

        [ContextMethod("Абзац", "Paragraph")]
        public DfParagraph Paragraph(string p1 = "Абзац")
        {
            return new DfParagraph(p1);
        }

        [ContextMethod("Кнопка", "Button")]
        public DfButton Button(string p1 = "Кнопка")
        {
            return new DfButton(p1);
        }

        private static DfColor df_Color = new DfColor();
        [ContextProperty("Цвет", "Color")]
        public DfColor Color
        {
            get { return df_Color; }
        }

        [ContextMethod("Цвет", "Color")]
        public IValue Color2(IValue p1 = null, int p2 = 0, int p3 = 0)
        {
            if (p1 != null)
            {
                if (p1.SystemType.Name == "Строка")
                {
                    DfColor DfColor1 = new DfColor();
                    int NumberProp1 = DfColor1.FindProperty(p1.AsString());
                    string obj1 = DfColor1.GetPropValue(NumberProp1).AsString();
                    return ValueFactory.Create(obj1);
                }
                if (p1.SystemType.Name == "Число")
                {
                    string res = "rgb(" + Convert.ToString(p1.AsNumber()) + ", " + Convert.ToString(p2) + ", " + Convert.ToString(p3) + ")";
                    return ValueFactory.Create(res);
                }
            }
            return new DfColor();
        }

        private static DfDisplayType df_DisplayType = new DfDisplayType();
        [ContextProperty("ТипОтображения", "DisplayType")]
        public DfDisplayType DisplayType
        {
            get { return df_DisplayType; }
        }

        private static DfFormPosition df_FormPosition = new DfFormPosition();
        [ContextProperty("ПозицияФормы", "FormPosition")]
        public DfFormPosition FormPosition
        {
            get { return df_FormPosition; }
        }

        private static DfMenuType df_MenuType = new DfMenuType();
        [ContextProperty("ТипМеню", "MenuType")]
        public DfMenuType MenuType
        {
            get { return df_MenuType; }
        }

        private static DfMenuItemType df_MenuItemType = new DfMenuItemType();
        [ContextProperty("ТипЭлементаМеню", "MenuItemType")]
        public DfMenuItemType MenuItemType
        {
            get { return df_MenuItemType; }
        }

        private static DfMouseButtons df_MouseButtons = new DfMouseButtons();
        [ContextProperty("КнопкиМыши", "MouseButtons")]
        public DfMouseButtons MouseButtons
        {
            get { return df_MouseButtons; }
        }

        [ContextMethod("ЭлементМеню", "MenuItem")]
        public DfMenuItem MenuItem(string label = "меню", string type = "normal", DfMenu menu = null, string key = null, string modifiers = null)
        {
            if (menu != null)
            {
                if (key != null)
                {
                    if (modifiers != null)
                    {
                        return new DfMenuItem(label, type, menu, key, modifiers);
                    }
                    else
                    {
                        return new DfMenuItem(label, type, menu, key);
                    }
                }
                else
                {
                    return new DfMenuItem(label, type, menu);
                }
            }
            else
            {
                if (key != null)
                {
                    if (modifiers != null)
                    {
                        return new DfMenuItem(label, type, key, modifiers);
                    }
                    else
                    {
                        return new DfMenuItem(label, type, key);
                    }
                }
                else
                {
                    return new DfMenuItem(label, type);
                }
            }
        }

        [ContextMethod("Меню", "Menu")]
        public DfMenu Menu(string type)
        {
            return new DfMenu(type);
        }

        [ContextProperty("СтрокаФункций", "FunctionString")]
        public string FunctionString
        {
            get { return strFunctions; }
            set { strFunctions = value; }
        }

        [ContextProperty("oscriptПуть", "oscriptPath")]
        public string oscriptPath
        {
            get { return _oscriptPath; }
            set { _oscriptPath = value; }
        }

        [ContextProperty("nwПуть", "nwPath")]
        public string nwPath
        {
            get { return _nw; }
            set { _nw = value; }
        }

        [ContextProperty("Порт", "Port")]
        public int Port
        {
            get { return port; }
            set { port = value; }
        }

        [ContextProperty("ОбщаяСтруктура", "ShareStructure")]
        public StructureImpl ShareStructure
        {
            get { return shareStructure; }
        }

        [ContextMethod("ВвестиГлобальноеСвойство", "InjectGlobalProperty")]
        public void InjectGlobalProperty(IValue obj, string name, bool onlyRead)
        {
            GlobalContext().EngineInstance.Environment.InjectGlobalProperty(obj, name, onlyRead);
        }

        [ContextMethod("ЗагрузитьСценарии", "LoadScripts")]
        public StructureImpl LoadScripts(string folderName)
        {
            StructureImpl scripts = new StructureImpl();
            StructureImpl attachByPath = new StructureImpl();
            StructureImpl extContext = new StructureImpl();
            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, "").Replace(".os", "").Replace(separator, "");
            shareStructure.Insert("Сценарии", scripts);
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            // Создаем файл startserver.os
            File.WriteAllText(pathStartupScript + separator + "Классы" + separator + "startserver.os", Startserver.startserver, System.Text.Encoding.UTF8);

            // Создаем файл server
            File.WriteAllText(pathStartupScript + separator + "Классы" + separator + "server", Server.server, System.Text.Encoding.UTF8);

            // Создаем файл package.json
            System.IO.File.WriteAllText(pathStartupScript + separator + "package.json", Packagejson.packagejson, System.Text.Encoding.UTF8);

            // Создаем файл index.html
            System.IO.File.WriteAllText(pathStartupScript + separator + "index.html", Indexhtml.indexhtml, System.Text.Encoding.UTF8);

            // Создаем файл main.js
            System.IO.File.WriteAllText(pathStartupScript + separator + "main.js", Mainjs.mainjs, System.Text.Encoding.UTF8);

            // Создаем в этом каталоге файл стиля (имя_скрипта).css
            // ...

            bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
            if (isWin)
            {
                if (folderName == @".\")
                {
                    string path = @".\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @".\Модули\"; if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"..\")
                {
                    string path = @"..\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"..\Модули\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@".\") || folderName.Contains(@"..\")))
                {
                    string[] result2 = folderName.Split(new string[] { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            else
            {
                if (folderName == @"./")
                {
                    string path = @"./Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"./Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"../")
                {
                    string path = @"../Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"../Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@"./") || folderName.Contains(@"../")))
                {
                    string[] result2 = folderName.Split(new string[]
                    { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            foreach (var item in attachByPath)
            {
                IRuntimeContextInstance inst = GlobalContext().LoadScript(item.Value.AsString(), extContext);
                scripts.Insert(item.Key.AsString(), (IValue)inst);
            }
            return scripts;
        }

        [ContextProperty("Форма", "Form")]
        public DfForm Form
        {
            get { return form; }
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public IValue EventArgs
        {
            get { return eventArgs; }
        }

        private IValue sender;
        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender
        {
            get { return sender; }
            set { sender = value; }
        }

        public static void AddToHashtable(dynamic p1, dynamic p2)
        {
            if (!DeclarativeForms.hashtable.ContainsKey(p1))
            {
                DeclarativeForms.hashtable.Add(p1, p2);
            }
            else
            {
                if (!((object)DeclarativeForms.hashtable[p1]).Equals(p2))
                {
                    DeclarativeForms.hashtable[p1] = p2;
                }
            }
        }

        [ContextMethod("НайтиЭлемент", "FindElement")]
        public IValue FindElement(object nameObject)
        {
            try
            {
                return (IValue)DeclarativeForms.hashtable[nameObject];
            }
            catch
            {
                return null;
            }
        }

        [ContextMethod("ОбработатьСообщение", "ProcessMessage")]
        public void ProcessMessage(string p1)
        {
            string[] zapros = p1.Split(new string[] { "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
            string strZapros = zapros[zapros.Length - 1];
            if (strZapros == "mainFormТест")
            {
                GlobalContext().Echo("Форма запустилась");
            }
            else
            {
                string[] massiv = strZapros.Split(new string[] { "|||" }, StringSplitOptions.RemoveEmptyEntries);
                //GlobalContext().Echo("Сообщение.Текст = " + p1);
                //GlobalContext().Echo("СтрЗапроса = " + strZapros);
                if (!(massiv.Length < 2))
                {
                    string nameElement = massiv[0];
                    string nameEvent = massiv[1];
                    if (massiv.Length == 2) // Для событий без аргументов.
                    {
                        try
                        {
                            Sender = FindElement(nameElement);
                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent));
                        }
                        catch
                        {
                            if (nameElement == "mainForm" && nameEvent == "loaded")
                            {
                                // Ничего не делаем.
                            }
                            else
                            {
                                GlobalContext().Echo("Не обработано событие = " + nameEvent);
                            }
                        }
                    }
                    else // Для событий с аргументами.
                    {
                        try
                        {
                            DfEventArgs eventArgs = CreateEventArgs(strZapros);
                            Sender = FindElement(nameElement);
                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent), eventArgs);
                        }
                        catch
                        {
                            GlobalContext().Echo("Не найден = " + nameElement);
                        }
                    }
                }
                else
                {
                    string resTest = "";
                    try
                    {
                        string[] massiv2 = massiv[0].Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                        string nameClass = FindElement(massiv2[0]).AsString().Replace("Дф", "");

                        if (events.ContainsKey(massiv2[1])) // Если это событие.
                        {
                            resTest = nameClass + " " + massiv2[1];
                            GlobalContext().Echo(resTest);
                        }
                        else // Это свойство.
                        {
                            resTest = strZapros.Replace(massiv2[0], nameClass);
                            if (resTest != "Неопределено")
                            {
                                if (!resTest.Contains("!!!"))
                                {
                                    GlobalContext().Echo(resTest);
                                }
                            }
                        }
                    }
                    catch { }
                    if (resTest.Contains("!!!"))
                    {
                        GlobalContext().Echo("Ошибка: " + resTest);
                    }
                }
            }

            ////////Это часть кода файла server, который я перенес сюда
            ////////Можно сделать обработку запроса и на server по своему усмотрению, не выполняя ДФ.ОбработатьСообщение(Сообщение.Текст);
            ////// Запрос = СтрРазделить(Сообщение.Текст, Символы.ПС);
            ////// СтрЗапроса = Запрос.Получить(Запрос.Количество() - 1);
            ////// Если СтрЗапроса = "mainFormТест" Тогда
            ////	// // Сообщить("Форма запустилась");
            ////// Иначе
            ////	// Массив = РазобратьСтроку(СтрЗапроса, "|||");
            ////	// // Сообщить("Сообщение.Текст = " + Сообщение.Текст);
            ////	// Сообщить("СтрЗапроса = " + СтрЗапроса);
            ////	// Если Массив.Количество() > 2 Тогда
            ////		// ИмяЭлемента = Массив[0];
            ////		// ИмяСобытия = Массив[1];
            ////		// Попытка
            ////			// // АргументыСобытия = ДФ.СоздатьАргументыСобытия(СтрЗапроса);
            ////			// ДФ.Отправитель = ДФ.НайтиЭлемент(ИмяЭлемента);
            ////			// ДФ.Выполнить(ДФ.НайтиЭлемент(ИмяЭлемента)[Массив[1]]);
            ////		// Исключение
            ////			// Сообщить("Не найден = " + ИмяЭлемента);
            ////		// КонецПопытки;
            ////	// Иначе // Это тест. Обработаем результат тестирования, присланный из формы.
            ////		// РезультатТеста = "";
            ////		// Попытка
            ////			// Массив2 = СтрРазделить(Массив[0], " ");
            ////			// ИмяКласса = СтрЗаменить(ТипЗнч(ДФ.НайтиЭлемент(Массив2[0])), "Дф", "");
            ////			// Если Массив2[1] = "ДвойноеНажатие" 
            ////				// или Массив2[1] = "Нажатие" 
            ////			// Тогда // Это событие.
            ////				// РезультатТеста = ИмяКласса + " " + Массив2[1];
            ////				// Сообщить("" + РезультатТеста);
            ////			// Иначе // Это свойство.
            ////				// РезультатТеста = СтрЗаменить(СтрЗапроса, Массив2[0], ИмяКласса);
            ////				// Если Не (РезультатТеста = "Неопределено") Тогда
            ////					// Если Не (СтрНайти(РезультатТеста, "!!!") > 0) Тогда
            ////						// Сообщить("" + РезультатТеста);
            ////					// КонецЕсли;
            ////				// КонецЕсли;
            ////			// КонецЕсли;
            ////		// Исключение
            ////		// КонецПопытки;
            ////		// Если СтрНайти(РезультатТеста, "!!!") > 0 Тогда
            ////			// Сообщить("Ошибка: " + РезультатТеста);
            ////		// КонецЕсли;
            ////	// КонецЕсли;
            ////// КонецЕсли;
        }

        public DfEventArgs CreateEventArgs(string p1)
        {
            DfEventArgs DfEventArgs1 = new DfEventArgs();
            //СтрЗапроса = drflsifoeq0t|||mouseup|||which3|||clientX282|||clientY251|||button2
            //GlobalContext().Echo("p1 = " + p1);
            string[] str1 = p1.Split(new string[] { "|||" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 2; i < str1.Length; i++)
            {
                //GlobalContext().Echo("str1[i] = " + str1[i]);
                try
                {
                    string[] str2 = str1[i].Split(new string[] { "=" }, StringSplitOptions.RemoveEmptyEntries);
                    //GlobalContext().Echo("str2[i] = " + str2[0]);
                    //GlobalContext().Echo("str2[i] = " + str2[1]);
                    DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), ValueFactory.Create(str2[1]));
                    //GlobalContext().Echo(str2[0] + " = " + DfEventArgs1.GetPropValue(DfEventArgs1.FindProperty(str2[0]))   );
                }
                catch { }
            }
            return DfEventArgs1;
        }

        [ContextMethod("Выполнить", "Execute")]
        public IValue Execute(DfAction p1, DfEventArgs p2 = null)
        {
            if (p2 != null)
            {
                eventArgs = p2;
            }
            else
            {
                eventArgs = new DfEventArgs();
            }
            eventArgs.Parameter = p1.Parameter;
            eventArgs.Sender = Sender;

            DfAction Action1 = p1;
            IRuntimeContextInstance script = Action1.Script;
            string method = Action1.MethodName;
            ReflectorContext reflector = new ReflectorContext();
            IValue res = null;
            try
            {
                res = reflector.CallMethod(script, method, null);
            }
            catch { }
            return res;
        }

        [ContextMethod("Действие", "Action")]
        public DfAction Action(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            return new DfAction(script, methodName, param);
        }

        public static dynamic DefineTypeIValue(dynamic p1)
        {
            if (p1.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
            {
                return p1.AsString();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
            {
                return p1.AsNumber();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.BooleanValue))
            {
                return p1.AsBoolean();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.DateValue))
            {
                return p1.AsDate();
            }
            else
            {
                return p1;
            }
        }

        public static dynamic GetEventParameter(dynamic dll_objEvent)
        {
            if (dll_objEvent != null)
            {
                dynamic eventType = dll_objEvent.GetType();
                if (eventType == typeof(DelegateAction))
                {
                    return null;
                }
                else if (eventType == typeof(DfAction))
                {
                    return ((DfAction)dll_objEvent).Parameter;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public static string ParseBetween(string p1, string p2 = null, string p3 = null)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //возвращает строку, ограниченную p2 и p3
            string str1 = p1;
            int Position1;
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                if (Position1 >= 0)
                {
                    return str1.Substring(Position1 + p2.Length);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                if (Position1 > 0)
                {
                    return str1.Substring(0, Position1 - 1);
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = str1.Substring(Position1 + p2.Length);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                        {
                            return Стр2.Substring(0, SumPosition2 - 1);
                        }
                        try
                        {
                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
                            SumPosition2 = SumPosition2 + Position2 + 1;
                        }
                        catch
                        {
                            break;
                        }
                    }
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            return null;
        }

        public static DfArrayList StrFindBetween(string p1, string p2 = null, string p3 = null, bool p4 = true, bool p5 = true)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //p4 - не включать p2 и p3 в результат
            //p5 - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
            //функция возвращает массив строк
            string str1 = p1;
            int Position1;
            DfArrayList DfArrayList1 = new DfArrayList();
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1))));
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                int SumPosition1 = Position1;
                while (Position1 > 0)
                {
                    DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(0, SumPosition1 - 1) : str1.Substring(0, SumPosition1 - 1 + p3.Length))));
                    try
                    {
                        Position1 = str1.Substring(SumPosition1 + 1).IndexOf(p3) + 1;
                        SumPosition1 = SumPosition1 + Position1 + 1;
                    }
                    catch
                    {
                        break;
                    }
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = (p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (p5)
                        {
                            if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                            {
                                DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                            }
                        }
                        else
                        {
                            DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                        }
                        try
                        {
                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
                            SumPosition2 = SumPosition2 + Position2 + 1;
                        }
                        catch
                        {
                            break;

                        }
                    }
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            return DfArrayList1;
        }

        // Для конструктора DfElement. Имена классов.
        public static Dictionary<string, string> namesRusClass = new Dictionary<string, string>
            {
                {"Абзац", "p"},
                {"p", "p"},
                {"Диалог", "dialog"},
                {"dialog", "dialog"},
                {"Кнопка", "button"},
                {"button", "button"},
                //{"div", "div"},
                //{"progress", "progress"},
                //{"details", "details"},
                //{"", ""},
            };

        // Для метода Test. Имена свойств.
        public static Dictionary<string, object[]> namesRusProps = new Dictionary<string, object[]>
            {
                // methodRus tail isProperty jsMethodEn
                {"Ширина", new object[3] { "px", false, "width" } },
                {"Высота", new object[3] { "px", false, "height" } },
                {"ДвойноеНажатие", new object[3] { "", true, "dblclick" } },
                {"Нажатие", new object[3] { "", true, "click" } },
                {"ПриОтпусканииМыши", new object[3] { "", true, "mouseup" } },
                {"ЦветФона", new object[3] { "", false, "background-color" } },
                {"Текст", new object[3] { "", true, "innerText" } },
                {"Родитель", new object[3] { "", true, "parent" } }

            };

        // Для метода Test. Имена событий.
        public static Dictionary<string, string> events = new Dictionary<string, string>
            {
                {"ДвойноеНажатие", "DoubleClick" },
                {"Нажатие", "click" },
                {"ПриОтпусканииМыши", "dblclick" },
                {"Загружена", "loaded" },

            };
    }
}
