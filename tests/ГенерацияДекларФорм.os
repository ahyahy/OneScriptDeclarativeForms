// Скрипт читает файлы справки в C:\444\OSDFormsRu\ и создает *.cs файлы в каталоге C:\444\ВыгрузкаДекларФорм\
// Из каталога C:\444\ВыгрузкаДекларФорм\ файлы *.cs можно скопировать в каталог проекта.

// Перем СтрДирективы, СтрШапка, СтрРазделОбъявленияПеременных, СтрКонструктор, СтрBase_obj, СтрСвойства, СтрМетоды, СтрПодвал, СтрВыгрузкиПеречислений;
// Перем СтрРазделОбъявленияПеременныхДляПеречисления, СтрСвойстваДляПеречисления, СтрМетодовСистема, СписокСтрМетодовСистема;
// Перем СписокЗамен, ИменаКалассовПеречислений;

Перем СтрРазделОбъявленияПеременных;
Перем КаталогСправки, КаталогВыгрузки;
Перем СловарьКлассов;
Перем СловарьСвойств;
Перем СловарьСобытий;

Функция ОтобратьФайлы(Фильтр)
	// Фильтр = Класс Конструктор Члены Свойства Свойство Методы Метод Перечисление
	М_Фильтр = Новый Массив;
	ВыбранныеФайлы = НайтиФайлы(КаталогСправки, "*.html", Истина);
	Найдено1 = 0;
	Для А = 0 По ВыбранныеФайлы.ВГраница() Цикл
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать(ВыбранныеФайлы[А].ПолноеИмя);
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, "<H1 class=dtH1", "/H1>", , );
		Если М.Количество() > 0 Тогда
			СтрЗаголовка= М[0];
			Если (СтрНайти(СтрЗаголовка, Фильтр + "<") > 0) или (СтрНайти(СтрЗаголовка, Фильтр + " <") > 0) Тогда
				Найдено1 = Найдено1 + 1;
				// // // Сообщить("================================================================================================");
				// // // Сообщить("" + ВыбранныеФайлы[А].ПолноеИмя + "=" + СтрЗаголовка);
				// Сообщить("" + СтрЗаголовка);
				М_Фильтр.Добавить(ВыбранныеФайлы[А].ПолноеИмя);
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Сообщить("Найдено1 (" + Фильтр + ") = " + Найдено1);
	Возврат М_Фильтр;
КонецФункции

Функция РазобратьСтроку(Строка, Разделитель)
	// Сообщить("==" + Строка);
	Стр = СтрЗаменить(Строка, Разделитель, Символы.ПС);
	М = Новый Массив;
	Если ПустаяСтрока(Стр) Тогда
		Возврат М;
	КонецЕсли;
	Для Ч = 1 По СтрЧислоСтрок(Стр) Цикл
		М.Добавить(СтрПолучитьСтроку(Стр, Ч));
	КонецЦикла;
	Возврат М;
КонецФункции

Функция СтрНайтиМежду(СтрПараметр, Фрагмент1 = Неопределено, Фрагмент2 = Неопределено, ИсключитьФрагменты = Истина, БезНаложения = Истина)
	//Стр - исходная строка
	//Фрагмент1 - подстрока поиска от которой ведем поиск
	//Фрагмент2 - подстрока поиска до которой ведем поиск
	//ИсключитьФрагменты - не включать Фрагмент1 и Фрагмент2 в результат
	//БезНаложения - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
	//функция возвращает массив строк
	Стр = СтрПараметр;
	М = Новый Массив;
	Если (Фрагмент1 <> Неопределено) и (Фрагмент2 = Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция)));
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	ИначеЕсли (Фрагмент1 = Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент2);
		СуммаПозиций = Позиция;
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, 1, СуммаПозиций - 1), Сред(Стр, 1, СуммаПозиций - 1 + СтрДлина(Фрагмент2))));
			Позиция = Найти(Сред(Стр, СуммаПозиций + 1), Фрагмент2);
			СуммаПозиций = СуммаПозиций + Позиция;
		КонецЦикла;
	ИначеЕсли (Фрагмент1 <> Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			Стр2 = ?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция));
			Позиция2 = Найти(Стр2, Фрагмент2);
			СуммаПозиций2 = Позиция2;
			Пока Позиция2 > 0 Цикл
				Если БезНаложения Тогда
					Если Найти(Сред(Стр2, 1, СуммаПозиций2 - 1), Фрагмент2) = 0 Тогда
						М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
					КонецЕсли;
				Иначе
					М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
				КонецЕсли;
				Позиция2 = Найти(Сред(Стр2, СуммаПозиций2 + 1), Фрагмент2);
				СуммаПозиций2 = СуммаПозиций2 + Позиция2;
			КонецЦикла;
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	КонецЕсли;
	
	Возврат М;
КонецФункции//СтрНайтиМежду

Функция Директивы(КлассАнгл)
	Если КлассАнгл = "DisplayType" 
		или КлассАнгл = "MenuItemType" 
		или КлассАнгл = "FormPosition" 
		или КлассАнгл = "MenuType" 
		или КлассАнгл = "MouseButtons" 
		или КлассАнгл = "Dir" 
		или КлассАнгл = "Target" 
		или КлассАнгл = "AreaShape" 
		или КлассАнгл = "Overflow" 
		или КлассАнгл = "GlobalCompositeOperation" 
		или КлассАнгл = "LineCap" 
		или КлассАнгл = "LineJoin" 
		или КлассАнгл = "MarkerType" 
		или КлассАнгл = "PatternRepeat" 
		или КлассАнгл = "SelectedFileType" 
		или КлассАнгл = "TextAlign" 
		или КлассАнгл = "TextBaseline" 
		или КлассАнгл = "TextWrap" 
		или КлассАнгл = "WhiteSpace" 
		или КлассАнгл = "Position" 
		или КлассАнгл = "FontVariant" 
		или КлассАнгл = "VerticalAlign" 
		или КлассАнгл = "Visibility" 
		или КлассАнгл = "ObjectFit" 
		или КлассАнгл = "UserSelect" 
		или КлассАнгл = "AlignSelf" 
		или КлассАнгл = "AlignContent" 
		или КлассАнгл = "AlignItems" 
		или КлассАнгл = "CssFloat" 
		или КлассАнгл = "HorizontalTextAlign" 
		или КлассАнгл = "BorderCollapse" 
		или КлассАнгл = "FontWeight" 
		или КлассАнгл = "AnimationFillMode" 
		или КлассАнгл = "ColumnFill" 
		или КлассАнгл = "Resize" 
		или КлассАнгл = "BoxSizing" 
		или КлассАнгл = "Cursor" 
		или КлассАнгл = "BackgroundRepeat" 
		или КлассАнгл = "BorderImageRepeat" 
		или КлассАнгл = "AnimationDirection" 
		или КлассАнгл = "FlexDirection" 
		или КлассАнгл = "Clear" 
		или КлассАнгл = "BackgroundOrigin" 
		или КлассАнгл = "BackgroundClip" 
		или КлассАнгл = "Display" 
		или КлассАнгл = "TextDecorationLine" 
		или КлассАнгл = "TextDecorationStyle" 
		или КлассАнгл = "AnimationPlayState" 
		или КлассАнгл = "FlexWrap" 
		или КлассАнгл = "WordWrap" 
		или КлассАнгл = "TextOverflow" 
		или КлассАнгл = "ListStylePosition" 
		или КлассАнгл = "CaptionSide" 
		или КлассАнгл = "BackgroundPosition" 
		или КлассАнгл = "TextTransform" 
		или КлассАнгл = "EmptyCells" 
		или КлассАнгл = "BackgroundSize" 
		или КлассАнгл = "TableLayout" 
		или КлассАнгл = "JustifyContent" 
		или КлассАнгл = "TransitionProperty" 
		или КлассАнгл = "OutlineStyle" 
		или КлассАнгл = "ColumnRuleStyle" 
		или КлассАнгл = "TransformStyle" 
		или КлассАнгл = "FontStyle" 
		или КлассАнгл = "ListStyleType" 
		или КлассАнгл = "BackgroundAttachment" 
		или КлассАнгл = "TransitionTimingFunction" 
		или КлассАнгл = "AnimationTimingFunction" 
		или КлассАнгл = "BorderWidth" 
		или КлассАнгл = "Rules" 
		или КлассАнгл = "BorderStyle" 
		
		Тогда
		Стр = 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Collections.Generic;
		|using System.Collections;
		|";
		Возврат Стр;
	ИначеЕсли КлассАнгл = "AdditionalDiv" 		
		или КлассАнгл = "Area" 		
		или КлассАнгл = "Audio" 		
		или КлассАнгл = "Body" 		
		или КлассАнгл = "BoldText" 		
		или КлассАнгл = "Button" 
		или КлассАнгл = "Canvas" 		
		или КлассАнгл = "Caption" 		
		или КлассАнгл = "CaptionMedia" 		
		или КлассАнгл = "Cell" 		
		или КлассАнгл = "CheckBox" 		
		или КлассАнгл = "Code" 		
		или КлассАнгл = "Colgroup" 		
		или КлассАнгл = "ColorSelection" 		
		или КлассАнгл = "Column" 		
		или КлассАнгл = "Datalist" 		
		или КлассАнгл = "DateSelection" 		
		или КлассАнгл = "DateTimeLocalSelection" 		
		или КлассАнгл = "DateTimeSelection" 		
		или КлассАнгл = "Definition" 		
		или КлассАнгл = "DeletedText" 		
		или КлассАнгл = "Dialog" 		
		или КлассАнгл = "DirectedText" 		
		или КлассАнгл = "Div" 		
		или КлассАнгл = "Element" 		
		или КлассАнгл = "ExpandableDiv" 		
		или КлассАнгл = "ExpandableDivHeader" 		
		или КлассАнгл = "FileSelection" 		
		или КлассАнгл = "Footer" 		
		или КлассАнгл = "Frame" 		
		или КлассАнгл = "Group" 		
		или КлассАнгл = "GroupTitle" 		
		или КлассАнгл = "H1" 		
		или КлассАнгл = "H2" 		
		или КлассАнгл = "H3" 		
		или КлассАнгл = "H4" 		
		или КлассАнгл = "H5" 		
		или КлассАнгл = "H6" 		
		или КлассАнгл = "Header" 		
		или КлассАнгл = "HeaderCell" 		
		или КлассАнгл = "Image" 		
		или КлассАнгл = "ItalicsText" 		
		или КлассАнгл = "Label" 		
		или КлассАнгл = "Line" 		
		или КлассАнгл = "Link" 		
		или КлассАнгл = "ListDefinition" 		
		или КлассАнгл = "ListItem" 		
		или КлассАнгл = "Map" 		
		или КлассАнгл = "MarkedText" 		
		или КлассАнгл = "MediaGroup" 		
		или КлассАнгл = "Meter" 		
		или КлассАнгл = "MonthSelection" 		
		или КлассАнгл = "NumberField" 		
		или КлассАнгл = "OrderedList" 		
		или КлассАнгл = "Outcome" 		
		или КлассАнгл = "Output" 		
		или КлассАнгл = "Paragraph" 
		или КлассАнгл = "Article" 
		или КлассАнгл = "PasswordField" 		
		или КлассАнгл = "PreformattedText" 		
		или КлассАнгл = "Progress" 		
		или КлассАнгл = "Radio" 		
		или КлассАнгл = "Range" 		
		или КлассАнгл = "SearchField" 		
		или КлассАнгл = "Select" 		
		или КлассАнгл = "SelectGroup" 		
		или КлассАнгл = "SelectItem" 		
		или КлассАнгл = "SmallText" 		
		или КлассАнгл = "SubText" 		
		или КлассАнгл = "SupText" 		
		или КлассАнгл = "Table" 		
		или КлассАнгл = "TableBody" 		
		или КлассАнгл = "TableHeader" 		
		или КлассАнгл = "TableRow" 		
		или КлассАнгл = "Term" 		
		или КлассАнгл = "TextArea" 		
		или КлассАнгл = "TextField" 		
		или КлассАнгл = "TimeSelection" 		
		или КлассАнгл = "Transfer" 		
		или КлассАнгл = "UnderlineText" 		
		или КлассАнгл = "UnorderedList" 		
		или КлассАнгл = "WeekSelection" 
		Тогда
		Стр = 
		"using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.IO;
		|using System.Reflection;
		|using System;
		|";
		Возврат Стр;
	ИначеЕсли КлассАнгл = "Script" 		
		Тогда
		Стр = 
		"using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.IO;
		|using System.Reflection;
		|";
		Возврат Стр;

	
		
	КонецЕсли;
	Возврат "";
КонецФункции//Директивы

Функция Шапка(КлассАнгл)
	Стр = "namespace osdf
	|{
	|    [ContextClass(""Дф" + СловарьКлассов(КлассАнгл)[0] + """, ""Df" + КлассАнгл + """)]
	|    public class Df" + КлассАнгл + " : AutoContext<Df" + КлассАнгл + ">
	|    {";
	Возврат Стр;
КонецФункции //Шапка

Функция РазделОбъявленияПеременных(КлассАнгл)
	Если КлассАнгл = "йййййййййййййййййй" Тогда
		Стр = 
		"        [DllImport(""User32.dll"")] static extern void mouse_event(uint dwFlags, int dx, int dy, int dwData, UIntPtr dwExtraInfo);
		|        private static object syncRoot = new Object();
		|		
		|        public static bool systemVersionIsMicrosoft = false;
		|        public static bool goOn = true;";
		
	Иначе
		Стр = "";
	КонецЕсли;
	Возврат Стр;
КонецФункции//РазделОбъявленияПеременных

Функция Конструктор(КлассАнгл)
	Если КлассАнгл = "TimeSelection" 
		или КлассАнгл = "DateSelection"
		или КлассАнгл = "DateTimeSelection"
		или КлассАнгл = "DateTimeLocalSelection"
		или КлассАнгл = "MonthSelection"
		или КлассАнгл = "WeekSelection"
		или КлассАнгл = "ColorSelection"
		или КлассАнгл = "Radio"
		или КлассАнгл = "PasswordField"
		или КлассАнгл = "SearchField"
		или КлассАнгл = "TextField"
		или КлассАнгл = "NumberField"
		или КлассАнгл = "Range"
		или КлассАнгл = "CheckBox"
		Тогда
		Стр = 
		"        public Df" + КлассАнгл + "()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('" + СловарьКлассов(КлассАнгл)[1] + "'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            strFunc = ""mapKeyEl.get('"" + ItemKey + ""').type = '" + СловарьКлассов(КлассАнгл)[2] + "';"";
		|            DeclarativeForms.SendStrFunc(strFunc);		
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "TableRow" Тогда
		Стр = 
		"        public DfTableRow()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('tr'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public DfTableRow(DfTable table, string method, int index)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get(\u0022"" + table.ItemKey + ""\u0022)."" + method + ""("" + index + ""));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "Cell" Тогда
		Стр = 
		"        public DfCell()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('td'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public DfCell(DfTableRow tableRow, string method, int index)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get(\u0022"" + tableRow.ItemKey + ""\u0022)."" + method + ""("" + index + ""));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "FileSelection" Тогда
		Стр = 
		"        public Df" + КлассАнгл + "()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('" + СловарьКлассов(КлассАнгл)[1] + "'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            strFunc = ""mapKeyEl.get('"" + ItemKey + ""').type = '" + СловарьКлассов(КлассАнгл)[2] + "';"";
		|            DeclarativeForms.SendStrFunc(strFunc);		
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "Table" Тогда
		Стр = 
		"        public DfTable()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('table'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|
		|            style.BorderCollapse = ""separate"";
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "Body" 
		Тогда
		Стр = 
		"        public DfBody()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.getElementsByTagName('body')[0]);"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "Script" 
		Тогда
		Стр = 
		"        public DfScript()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('script'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	ИначеЕсли КлассАнгл = "Canvas" 
		Тогда
		Стр = 
		"        public DfCanvas()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('canvas'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|
		|            Context2d = new DfContext2d(ItemKey);
		|            Context2d.Owner = this;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";


	Иначе
		Стр = 
		"        public Df" + КлассАнгл + "()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('" + СловарьКлассов(КлассАнгл)[1] + "'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            style = new DfStyle();
		|            style.Owner = this;
		|		
		|            offsetTop = ValueFactory.Create(0);
		|            offsetHeight = ValueFactory.Create(0);
		|            offsetLeft = ValueFactory.Create(0);
		|            offsetWidth = ValueFactory.Create(0);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|";
	КонецЕсли;
	Возврат Стр;
КонецФункции//Конструктор

Функция Свойства(ФайлСвойств, КлассАнгл)
	ТекстДокСвойств = Новый ТекстовыйДокумент;
	КаталогНаДиске = Новый Файл(ФайлСвойств);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат "";
	КонецЕсли;
	ТекстДокСвойств.Прочитать(ФайлСвойств);
	СтрТекстДокСвойств = ТекстДокСвойств.ПолучитьТекст();
	Если Не (СтрНайтиМежду(СтрТекстДокСвойств, "<H4 class=dtH4>Свойства</H4>", "</TBODY></TABLE>", Ложь, ).Количество() > 0) Тогда
		Возврат "";
	КонецЕсли;
	СтрТаблицаСвойств = СтрНайтиМежду(СтрТекстДокСвойств, "<H4 class=dtH4>Свойства</H4>", "</TBODY></TABLE>", Ложь, )[0];
	Массив1 = СтрНайтиМежду(СтрТаблицаСвойств, "<TR vAlign=top>", "</TD></TR>", Ложь, );
	// Сообщить("Массив1.Количество()=" + Массив1.Количество());
	Если Массив1.Количество() > 0 Тогда
		Стр = "";
		Для А = 0 По Массив1.ВГраница() Цикл
			//найдем первую ячейку строки таблицы
			М07 = СтрНайтиМежду(Массив1[А], "<TD width=""50%"">", "</TD>", Ложь, );
			СтрХ = М07[0];
			СтрХ = СтрЗаменить(СтрХ, "&nbsp;", " ");
			
			ИмяФайлаСвойства = КаталогСправки + "\" + СтрНайтиМежду(СтрХ, "<A href=""", """>", , )[0];
			ТекстДокСвойства = Новый ТекстовыйДокумент;
			ТекстДокСвойства.Прочитать(ИмяФайлаСвойства);
			СтрТекстДокСвойства = ТекстДокСвойства.ПолучитьТекст();
			СтрРаздела = СтрНайтиМежду(СтрТекстДокСвойства, "<H4 class=dtH4>Использование</H4>", "<H4 class=dtH4>Значение</H4>", , )[0];
			СтрИспользование = СтрНайтиМежду(СтрРаздела, "<P>", "</P>", , )[0];

			СвойствоАнгл = СтрНайтиМежду(СтрХ, "(", ")", , )[0];
			СвойствоРус = СтрНайтиМежду(СтрХ, ".html"">", " (", , )[0];
			КлассРус = СловарьКлассов(КлассАнгл)[0];
			Если (СвойствоРус = "вававававаа") 
				или (СвойствоРус = "Альфа") 
				или (СвойствоРус = "БазоваяДлина") 
				или (СвойствоРус = "БазоваяЛинияТекста") 
				или (СвойствоРус = "Верх") 
				или (СвойствоРус = "Видимость") 
				или (СвойствоРус = "ВписываниеОбъекта") 
				или (СвойствоРус = "ВыбранныйПоУмолчанию") 
				или (СвойствоРус = "ВыделениеПользователем") 
				или (СвойствоРус = "ВыравниваниеОтдельных") 
				или (СвойствоРус = "ВыравниваниеЭлементов") 
				или (СвойствоРус = "ГоризонтальноеВыравнивание") 
				или (СвойствоРус = "ДанныеРисунка") 
				или (СвойствоРус = "ДиапазонКолонокЭлемента") 
				или (СвойствоРус = "ДлительностьАнимацииДлинаТабуляции") 
				или (СвойствоРус = "Заголовок") 
				или (СвойствоРус = "ЗадержкаАнимации") 
				или (СвойствоРус = "ЗаливкаАнимации") 
				или (СвойствоРус = "ЗаполнениеКолонок") 
				или (СвойствоРус = "Значок") 
				или (СвойствоРус = "ИзменяемыйРазмер") 
				или (СвойствоРус = "ИнтервалГраницы") 
				или (СвойствоРус = "ИнтервалКолонок") 
				или (СвойствоРус = "ИнтервалСимволов") 
				или (СвойствоРус = "ИнтервалСлов") 
				или (СвойствоРус = "ИнтервалСтрок") 
				или (СвойствоРус = "Калибровка") 
				или (СвойствоРус = "КартинкаСтиляСписка") 
				или (СвойствоРус = "КоличествоПовторов") 
				или (СвойствоРус = "Композиция") 
				или (СвойствоРус = "Курсор") 
				или (СвойствоРус = "Лево") 
				или (СвойствоРус = "ЛевыйРадиусВерхнейГраницы") 
				или (СвойствоРус = "ЛевыйРадиусНижнейГраницы") 
				или (СвойствоРус = "МаксимальнаяВысота") 
				или (СвойствоРус = "МаксимальнаяШирина") 
				или (СвойствоРус = "МинимальнаяВысота") 
				или (СвойствоРус = "МинимальнаяШирина") 
				или (СвойствоРус = "МозаикаКартинки") 
				или (СвойствоРус = "НаправлениеАнимации") 
				или (СвойствоРус = "НаправлениеТекста") 
				или (СвойствоРус = "НаправлениеЭлементов") 
				или (СвойствоРус = "Начертание") 
				или (СвойствоРус = "Непрозрачность") 
				или (СвойствоРус = "Несвободно") 
				или (СвойствоРус = "Низ") 
				или (СвойствоРус = "ОбластьКартинки") 
				или (СвойствоРус = "ОбластьРисования") 
				или (СвойствоРус = "Отображать") 
				или (СвойствоРус = "ОтступТекста") 
				или (СвойствоРус = "ОформлениеТекстаЛиния") 
				или (СвойствоРус = "ОформлениеТекстаСтиль") 
				или (СвойствоРус = "ОформлениеТекстаЦвет") 
				или (СвойствоРус = "Перенос") 
				или (СвойствоРус = "ПереносГибких") 
				или (СвойствоРус = "ПереносСлов") 
				или (СвойствоРус = "ПереполнениеТекста") 
				или (СвойствоРус = "Перспектива") 
				или (СвойствоРус = "ПоведениеПрокрутки") 
				или (СвойствоРус = "ПозицияСтиляСписка") 
				или (СвойствоРус = "ПоложениеЗаголовка") 
				или (СвойствоРус = "ПомеченПоУмолчанию") 
				или (СвойствоРус = "Порядок") 
				или (СвойствоРус = "Постер") 
				или (СвойствоРус = "Право") 
				или (СвойствоРус = "ПравыйРадиусВерхнейГраницы") 
				или (СвойствоРус = "ПравыйРадиусНижнейГраницы") 
				или (СвойствоРус = "ПределСреза") 
				или (СвойствоРус = "Пробелы") 
				или (СвойствоРус = "ПрописныеТекста") 
				или (СвойствоРус = "ПустыеЯчейки") 
				или (СвойствоРус = "РазмытиеТени") 
				или (СвойствоРус = "РазрывСтраницыВнутри") 
				или (СвойствоРус = "РазрывСтраницыДо") 
				или (СвойствоРус = "РазрывСтраницыПосле") 
				или (СвойствоРус = "РасположениеСодержимого") 
				или (СвойствоРус = "СвойствоПерехода") 
				или (СвойствоРус = "СмещениеКонтура") 
				или (СвойствоРус = "СмещениеТениИгрек") 
				или (СвойствоРус = "СмещениеТениИкс") 
				или (СвойствоРус = "СтильЗаливки") 
				или (СвойствоРус = "СтильКонцовЛинии") 
				или (СвойствоРус = "СтильОбводки") 
				или (СвойствоРус = "СтильРазделителяКолонок") 
				или (СвойствоРус = "СтильСдвига") 
				или (СвойствоРус = "СтильУглаПересечения") 
				или (СвойствоРус = "ТекстСсылки") 
				или (СвойствоРус = "Тень") 
				или (СвойствоРус = "ТипСтиляСписка") 
				или (СвойствоРус = "Увеличение") 
				или (СвойствоРус = "Уменьшение") 
				или (СвойствоРус = "ФоновоеВложение") 
				или (СвойствоРус = "ФоновоеИзображение") 
				или (СвойствоРус = "ФункцияСинхронизации") 
				или (СвойствоРус = "ЦветКурсора") 
				или (СвойствоРус = "ЦветРазделителяКолонок") 
				или (СвойствоРус = "ЦветТекста") 
				или (СвойствоРус = "ЦветТени") 
				или (СвойствоРус = "ШиринаЛинии") 
				или (СвойствоРус = "ШиринаРазделителяКолонок") 
				или (СвойствоРус = "Шрифт") 
				или (СвойствоРус = "Гибкость") 
				или (СвойствоРус = "ДлинаТабуляции") 
				или (СвойствоРус = "ДлительностьАнимации") 
				или (СвойствоРус = "ЗадержкаПерехода") 
				или (СвойствоРус = "ИсточникПерспективы") 
				или (СвойствоРус = "ЛеваяГраница") 
				или (СвойствоРус = "НижняяГраница") 
				или (СвойствоРус = "Обрезка") 
				или (СвойствоРус = "Отступ") 
				или (СвойствоРус = "Переход") 
				или (СвойствоРус = "ПозицияОбъекта") 
				или (СвойствоРус = "ПоложениеКартинки") 
				или (СвойствоРус = "ПраваяГраница") 
				или (СвойствоРус = "РадиусГраницы") 
				или (СвойствоРус = "РазделительКолонок") 
				или (СвойствоРус = "РазмерКартинки") 
				или (СвойствоРус = "Сдвиг") 
				или (СвойствоРус = "СдвигИсточника") 
				или (СвойствоРус = "ТеньТекста") 
				или (СвойствоРус = "Фильтр") 
				или (СвойствоРус = "ФункцияПерехода") 
				или (СвойствоРус = "ВремяПерехода") 
				
				Тогда

			ИначеЕсли (СвойствоРус = "Значение") и (КлассАнгл = "ColorSelection") Тогда
				Стр = Стр +
				"        public IValue _value { get; set; }
				|        [ContextProperty(""Значение"", ""Value"")]
				|        public IValue Value
				|        {
				|            get { return _value; }
				|            set
				|            {
				|                _value = value;
				|                string str1 = _value.AsString().Replace("" "", """").Replace(""rgb("", """").Replace("")"", """");
				|                string[] result1 = str1.Split(new string[] { "","" }, StringSplitOptions.RemoveEmptyEntries);
				|                string hexValue = Int32.Parse(result1[0]).ToString(""X"") + Int32.Parse(result1[1]).ToString(""X"") + Int32.Parse(result1[2]).ToString(""X"");
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['value'] = '#"" + hexValue + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Значение") и (КлассАнгл = "NumberField") Тогда
				Стр = Стр +
				"        public IValue _value { get; set; }
				|        [ContextProperty(""Значение"", ""Value"")]
				|        public IValue Value
				|        {
				|            get { return _value; }
				|            set
				|            {
				|                _value = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['value'] = '"" + _value.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Шаг") и (КлассАнгл = "NumberField") Тогда
				Стр = Стр +
				"        public IValue step { get; set; }
				|        [ContextProperty(""Шаг"", ""Step"")]
				|        public IValue Step
				|        {
				|            get { return step; }
				|            set
				|            {
				|                step = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['step'] = '"" + step.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Значение") и (КлассАнгл = "Progress"
				или КлассАнгл = "Meter"
				) 
				Тогда
				Стр = Стр +
				"        public IValue _value { get; set; }
				|        [ContextProperty(""Значение"", ""Value"")]
				|        public IValue Value
				|        {
				|            get { return _value; }
				|            set
				|            {
				|                _value = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['value'] = "" + (_value.AsNumber() / 100).ToString().Replace("","", ""."") + "";"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Значение") и (КлассАнгл = "Range") Тогда
				Стр = Стр +
				"        public IValue _value { get; set; }
				|        [ContextProperty(""Значение"", ""Value"")]
				|        public IValue Value
				|        {
				|            get { return _value; }
				|            set
				|            {
				|                _value = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['value'] = '"" + _value.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Шаг") и (КлассАнгл = "Range") Тогда
				Стр = Стр +
				"        public IValue step { get; set; }
				|        [ContextProperty(""Шаг"", ""Step"")]
				|        public IValue Step
				|        {
				|            get { return step; }
				|            set
				|            {
				|                step = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['step'] = '"" + step.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Форма") и (КлассАнгл = "Area") Тогда
				Стр = Стр +
				"        public IValue form { get; set; }
				|        [ContextProperty(""Форма"", ""Shape"")]
				|        public IValue Shape
				|        {
				|            get { return form; }
				|            set
				|            {
				|                form = value;
				|                string strForm = ""default"";
				|                string strCoords = """";
				|                if (value.GetType() == typeof(DfCircle))
				|                {
				|                    strForm = ""circle"";
				|                    strCoords = strCoords + ((DfCircle)value).X + "","" + ((DfCircle)value).Y + "","" + ((DfCircle)value).Radius;
				|                }
				|                else if (value.GetType() == typeof(DfPolygon))
				|                {
				|                    strForm = ""poly"";
				|                    ArrayImpl p1 = ((DfPolygon)value).Coordinates;
				|                    for (int i = 0; i < p1.Count(); i++)
				|                    {
				|                        DfPoint item = (DfPoint)p1.Get(i);
				|                        strCoords = strCoords + item.X + "","" + item.Y + "","";
				|
				|                    }
				|                    strCoords = strCoords.Substring(0, strCoords.Length - 1);
				|
				|                }
				|                else if (value.GetType() == typeof(DfRectangle))
				|                {
				|                    strForm = ""rect"";
				|                    string x1 = ((DfRectangle)value).X.AsNumber().ToString();
				|                    string y1 = ((DfRectangle)value).Y.AsNumber().ToString();
				|                    string x2 = (((DfRectangle)value).X.AsNumber() + ((DfRectangle)value).Width.AsNumber()).ToString();
				|                    string y2 = (((DfRectangle)value).Y.AsNumber() + ((DfRectangle)value).Height.AsNumber()).ToString();
				|                    strCoords = strCoords + x1 + "","" + y1 + "","" + x2 + "","" + y2;
				|                }
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['shape'] = '"" + strForm + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|
				|                strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['coords'] = '"" + strCoords + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Описание") и (КлассАнгл = "Area") Тогда
				Стр = Стр +
				"        public string _аlt { get; set; }
				|        [ContextProperty(""Описание"", ""Alt"")]
				|        public string Alt
				|        {
				|            get { return _аlt; }
				|            set
				|            {
				|                _аlt = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['аlt'] = '"" + _аlt + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Описание") и (КлассАнгл = "Image") Тогда
				Стр = Стр +
				"        public string _аlt { get; set; }
				|        [ContextProperty(""Описание"", ""Alt"")]
				|        public string Alt
				|        {
				|            get { return _аlt; }
				|            set
				|            {
				|                _аlt = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['аlt'] = '"" + _аlt + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "ИмяКарты") и (КлассАнгл = "Image") Тогда
				Стр = Стр +
				"        public string useMap { get; set; }
				|        [ContextProperty(""ИмяКарты"", ""UseMap"")]
				|        public string UseMap
				|        {
				|            get { return useMap; }
				|            set
				|            {
				|                useMap = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['useMap'] = '"" + ""#"" + useMap + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Громкость") и (КлассАнгл = "Audio") Тогда
				Стр = Стр +
				"        public IValue volume { get; set; }
				|        [ContextProperty(""Громкость"", ""Volume"")]
				|        public IValue Volume
				|        {
				|            get { return volume; }
				|            set
				|            {
				|                volume = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['volume'] = '"" + volume.AsString().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Скорость") и (КлассАнгл = "Audio") Тогда
				Стр = Стр +
				"        public IValue playbackRate { get; set; }
				|        [ContextProperty(""Скорость"", ""PlaybackRate"")]
				|        public IValue PlaybackRate
				|        {
				|            get { return playbackRate; }
				|            set
				|            {
				|                playbackRate = value;
				|                string res = playbackRate.AsNumber().ToString().Replace("","", ""."");
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['playbackRate'] = '"" + res + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Высота") и (КлассАнгл = "Canvas") Тогда
				Стр = Стр +
				"        public int height { get; set; }
				|        [ContextProperty(""Высота"", ""Height"")]
				|        public int Height
				|        {
				|            get { return height; }
				|            set
				|            {
				|                height = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['height'] = '"" + height + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Ширина") и (КлассАнгл = "Canvas") Тогда
				Стр = Стр +
				"        public int width { get; set; }
				|        [ContextProperty(""Ширина"", ""Width"")]
				|        public int Width
				|        {
				|            get { return width; }
				|            set
				|            {
				|                width = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['width'] = '"" + width + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Контекст2d") и (КлассАнгл = "Canvas") Тогда
				Стр = Стр +
				"        public DfContext2d context2d { get; set; }
				|        [ContextProperty(""Контекст2d"", ""Context2d"")]
				|        public DfContext2d Context2d
				|        {
				|            get { return context2d; }
				|            private set { context2d = value; }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "ИндексЯчейки") и (КлассАнгл = "Cell") Тогда
				Стр = Стр +
				"        public int cellIndex { get; set; }
				|        [ContextProperty(""ИндексЯчейки"", ""CellIndex"")]
				|        public int CellIndex
				|        {
				|            get { return cellIndex; }
				|            set
				|            {
				|                cellIndex = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['cellIndex'] = '"" + cellIndex + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Высота") и (КлассАнгл = "Image") Тогда
				Стр = Стр +
				"        public int height { get; set; }
				|        [ContextProperty(""Высота"", ""Height"")]
				|        public int Height
				|        {
				|            get { return height; }
				|            set
				|            {
				|                height = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['height'] = '"" + height + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Ширина") и (КлассАнгл = "Image") Тогда
				Стр = Стр +
				"        public int width { get; set; }
				|        [ContextProperty(""Ширина"", ""Width"")]
				|        public int Width
				|        {
				|            get { return width; }
				|            set
				|            {
				|                width = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['width'] = '"" + width + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Файлы") и (КлассАнгл = "FileSelection") Тогда
				Стр = Стр +
				"        public ArrayImpl files { get; set; }
				|        [ContextProperty(""Файлы"", ""Files"")]
				|        public ArrayImpl Files
				|        {
				|            get { return files; }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Области") и (КлассАнгл = "Map") Тогда
				Стр = Стр +
				"        public ArrayImpl areas { get; set; }
				|        [ContextProperty(""Области"", ""Areas"")]
				|        public ArrayImpl Areas
				|        {
				|            get { return areas; }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Оптимум") и (КлассАнгл = "Meter") Тогда
				Стр = Стр +
				"        public IValue optimum { get; set; }
				|        [ContextProperty(""Оптимум"", ""Optimum"")]
				|        public IValue Optimum
				|        {
				|            get { return optimum; }
				|            set
				|            {
				|                optimum = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['optimum'] = '"" + (optimum.AsNumber() / 100).ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Максимум") и (КлассАнгл = "Meter"
				или КлассАнгл = "Progress"
				) 
				Тогда
				Стр = Стр +
				"        public IValue max { get; set; }
				|        [ContextProperty(""Максимум"", ""Max"")]
				|        public IValue Max
				|        {
				|            get { return max; }
				|            set
				|            {
				|                max = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['max'] = '"" + (max.AsNumber() / 100).ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Минимум") и (КлассАнгл = "Meter") Тогда
				Стр = Стр +
				"        public IValue min { get; set; }
				|        [ContextProperty(""Минимум"", ""Min"")]
				|        public IValue Min
				|        {
				|            get { return min; }
				|            set
				|            {
				|                min = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['min'] = '"" + (min.AsNumber() / 100).ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
				
				
				
				
				
				
				
			ИначеЕсли (СвойствоРус = "Максимум") и (КлассАнгл = "NumberField"
				или КлассАнгл = "Range"
				) 
				Тогда
				Стр = Стр +
				"        public IValue max { get; set; }
				|        [ContextProperty(""Максимум"", ""Max"")]
				|        public IValue Max
				|        {
				|            get { return max; }
				|            set
				|            {
				|                max = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['max'] = '"" + max.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Минимум") и (КлассАнгл = "NumberField"
				или КлассАнгл = "Range"
				) 
				Тогда
				Стр = Стр +
				"        public IValue min { get; set; }
				|        [ContextProperty(""Минимум"", ""Min"")]
				|        public IValue Min
				|        {
				|            get { return min; }
				|            set
				|            {
				|                min = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['min'] = '"" + min.AsNumber().ToString().Replace("","", ""."") + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
				
				
				
				
				
				
				
				





			ИначеЕсли (СвойствоРус = "Максимум") и (КлассАнгл = "DateSelection"
				или КлассАнгл = "DateTimeLocalSelection"
				или КлассАнгл = "DateTimeSelection"
				или КлассАнгл = "DeclarativeForms"
				или КлассАнгл = "MonthSelection"
				или КлассАнгл = "TimeSelection"
				или КлассАнгл = "WeekSelection"
				) 
				Тогда
				Стр = Стр +
				"        public string max { get; set; }
				|        [ContextProperty(""Максимум"", ""Max"")]
				|        public string Max
				|        {
				|            get { return max; }
				|            set
				|            {
				|                max = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['max'] = '"" + max + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Минимум") и (КлассАнгл = "DateSelection"
				или КлассАнгл = "DateTimeLocalSelection"
				или КлассАнгл = "DateTimeSelection"
				или КлассАнгл = "DeclarativeForms"
				или КлассАнгл = "MonthSelection"
				или КлассАнгл = "TimeSelection"
				или КлассАнгл = "WeekSelection"
				) 
				Тогда
				Стр = Стр +
				"        public string min { get; set; }
				|        [ContextProperty(""Минимум"", ""Min"")]
				|        public string Min
				|        {
				|            get { return min; }
				|            set
				|            {
				|                min = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['min'] = '"" + min + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			ИначеЕсли (СвойствоРус = "Позиция") и (КлассАнгл = "Progress") Тогда
				Стр = Стр +
				"        public IValue position { get; set; }
				|        [ContextProperty(""Позиция"", ""Position"")]
				|        public decimal Position
				|        {
				|            get { return position.AsNumber() * 100; }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "Индекс") и (КлассАнгл = "SelectItem") Тогда
				Стр = Стр +
				"        public IValue index { get; set; }
				|        [ContextProperty(""Индекс"", ""Index"")]
				|        public int Index
				|        {
				|            get { return Convert.ToInt32(index.AsNumber()); }
				|        }
				|
				|";
			ИначеЕсли (СвойствоРус = "ЭлементыСписка") и (КлассАнгл = "Select") Тогда
				Стр = Стр +
				"        public ArrayImpl options { get; set; }
				|        [ContextProperty(""ЭлементыСписка"", ""Options"")]
				|        public ArrayImpl Options
				|        {
				|            get { return options; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "Ячейки") и (КлассАнгл = "TableRow") Тогда
				Стр = Стр +
				"        public ArrayImpl cells { get; set; }
				|        [ContextProperty(""Ячейки"", ""Cells"")]
				|        public ArrayImpl Cells
				|        {
				|            get { return cells; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "Строки") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        public ArrayImpl rows { get; set; }
				|        [ContextProperty(""Строки"", ""Rows"")]
				|        public ArrayImpl Rows
				|        {
				|            get { return rows; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "ОбластиТаблицы") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        public ArrayImpl tBodies { get; set; }
				|        [ContextProperty(""ОбластиТаблицы"", ""TBodies"")]
				|        public ArrayImpl TBodies
				|        {
				|            get { return tBodies; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "ИндексСтрокиВСекции") и (КлассАнгл = "TableRow") Тогда
				Стр = Стр +
				"        public IValue sectionRowIndex { get; set; }
				|        [ContextProperty(""ИндексСтрокиВСекции"", ""SectionRowIndex"")]
				|        public IValue SectionRowIndex
				|        {
				|            get { return sectionRowIndex; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "ИндексСтроки") и (КлассАнгл = "TableRow") Тогда
				Стр = Стр +
				"        public IValue rowIndex { get; set; }
				|        [ContextProperty(""ИндексСтроки"", ""RowIndex"")]
				|        public IValue RowIndex
				|        {
				|            get { return rowIndex; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "Итоги") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        public DfOutcome tFoot { get; set; }
				|        [ContextProperty(""Итоги"", ""TFoot"")]
				|        public DfOutcome TFoot
				|        {
				|            get { return tFoot; }
				|        }
				|        
				|";
			ИначеЕсли (СвойствоРус = "ШапкаТаблицы") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        public DfTableHeader tHead { get; set; }
				|        [ContextProperty(""ШапкаТаблицы"", ""TableHeader"")]
				|        public DfTableHeader TableHeader
				|        {
				|            get { return tHead; }
				|        }
				|        
				|";
				
			ИначеЕсли (СвойствоРус = "ШапкаТаблицы") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        public DfTableHeader tHead { get; set; }
				|        [ContextProperty(""ШапкаТаблицы"", ""TableHeader"")]
				|        public DfTableHeader TableHeader
				|        {
				|            get { return tHead; }
				|        }
				|        
				|";
				
				
				
				
				
				
				
				
				
				
				
				
			ИначеЕсли СвойствоРус = "Размер" Тогда
				Стр = Стр +
				"        public int size { get; set; }
				|        [ContextProperty(""Размер"", ""Size"")]
				|        public int Size
				|        {
				|            get { return size; }
				|            set
				|            {
				|                size = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['size'] = "" + size + "";"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "МаксимальнаяДлина" Тогда
				Стр = Стр +
				"        public int maxLength { get; set; }
				|        [ContextProperty(""МаксимальнаяДлина"", ""MaxLength"")]
				|        public int MaxLength
				|        {
				|            get { return maxLength; }
				|            set
				|            {
				|                maxLength = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['maxLength'] = "" + maxLength + "";"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "СмещениеВысота" Тогда
				Стр = Стр +
				"        public IValue offsetHeight { get; set; }
				|        [ContextProperty(""СмещениеВысота"", ""OffsetHeight"")]
				|        public int OffsetHeight
				|        {
				|            get { return Convert.ToInt32(offsetHeight.AsNumber()); }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "СмещениеШирина" Тогда
				Стр = Стр +
				"        public IValue offsetWidth { get; set; }
				|        [ContextProperty(""СмещениеШирина"", ""OffsetWidth"")]
				|        public int OffsetWidth
				|        {
				|            get { return Convert.ToInt32(offsetWidth.AsNumber()); }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "СмещениеВерх" Тогда
				Стр = Стр +
				"        public IValue offsetTop { get; set; }
				|        [ContextProperty(""СмещениеВерх"", ""OffsetTop"")]
				|        public int OffsetTop
				|        {
				|            get { return Convert.ToInt32(offsetTop.AsNumber()); }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "СмещениеЛево" Тогда
				Стр = Стр +
				"        public IValue offsetLeft { get; set; }
				|        [ContextProperty(""СмещениеЛево"", ""OffsetLeft"")]
				|        public int OffsetLeft
				|        {
				|            get { return Convert.ToInt32(offsetLeft.AsNumber()); }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "Стиль" Тогда
				Стр = Стр +
				"        public DfStyle style { get; set; }
				|        [ContextProperty(""Стиль"", ""Style"")]
				|        public DfStyle Style
				|        {
				|            get { return style; }
				|            set { style.Copy(value); }
				|        }
				|        
				|";
			ИначеЕсли СвойствоРус = "Элементы" Тогда
				Стр = Стр +
				"        private ArrayImpl children = new ArrayImpl();
				|        [ContextProperty(""Элементы"", ""Children"")]
				|        public ArrayImpl Children
				|        {
				|            get { return children; }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "КлючЭлемента" Тогда
				Стр = Стр +
				"        private string itemKey;
				|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
				|        public string ItemKey
				|        {
				|            get { return itemKey; }
				|            private set { itemKey = value; }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "Имя" Тогда
				Стр = Стр +
				"        public string name { get; set; }
				|        [ContextProperty(""Имя"", ""Name"")]
				|        public string Name
				|        {
				|            get { return name; }
				|            set
				|            {
				|                name = value;
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['name'] = '"" + name + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "Родитель" Тогда
				Стр = Стр +
				"        public IValue parent { get; set; }
				|        [ContextProperty(""Родитель"", ""Parent"")]
				|        public IValue Parent
				|        {
				|            get { return parent; }
				|            set
				|            {
				|                parent = value;
				|                string strFunc;
				|                if (parent.AsObject().GetPropValue(""ItemKey"").AsString() == ""mainForm"")
				|                {
				|                    strFunc = ""document.body.appendChild(mapKeyEl.get('"" + ItemKey + ""'));"";
				|                }
				|                else
				|                {
				|                    strFunc = ""mapKeyEl.get('"" + parent.AsObject().GetPropValue(""ItemKey"").AsString() + ""').appendChild(mapKeyEl.get('"" + ItemKey + ""'));"";
				|                }
				|                DeclarativeForms.SendStrFunc(strFunc);
				|                // Родителю добавим потомка.
				|                ArrayImpl ArrayImpl1 = ((dynamic)parent).Children;
				|                ArrayImpl1.Add(this);
				|            }
				|        }
				|
				|";
			ИначеЕсли СвойствоРус = "Текст" Тогда
				Стр = Стр +
				"        public IValue innerText { get; set; }
				|        [ContextProperty(""Текст"", ""Text"")]
				|        public IValue Text
				|        {
				|            get { return innerText; }
				|            set
				|            {
				|                innerText = value;
				|                string str = value.AsString();
				|                str = str.Replace(""\u005C"", @""\u005C""); // Обратная косая черта
				|                str = str.Replace(""\u003B"", @""\u003B""); // Точка с запятой.
				|                str = str.Replace(""\u000A"", @""\u000A""); // Перевод строки
				|                str = str.Replace(""\u007C"", @""\u007C""); // Знак |
				|                str = str.Replace(""\u0022"", @""\u0022""); // Кавычки.
				|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['innerText'] = '"" + str + ""';"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|
				|";

				
				
				
				
				
				
				
				
				
				
			Иначе
				ПриватИмяСвойства = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[0];
				ИмяСвойстваДляJS = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[1];
				Хвостик = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[2]; // Хвостик к значению свойства.
				ТипЗнач = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[3];
				
				Если ТипЗнач = "bool" Тогда
					ПриведениеКbool = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[4];
					Стр = Стр +
					"        public " + ТипЗнач + " " + ПриватИмяСвойства + " { get; set; }
					|        [ContextProperty(""" + СвойствоРус + """, """ + СвойствоАнгл + """)]
					|        public " + ТипЗнач + " " + СвойствоАнгл + "
					|        {
					|            get { return " + ПриватИмяСвойства + "; }
					|            set
					|            {
					|                " + ПриватИмяСвойства + " = value;
					|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['" + ИмяСвойстваДляJS + "'] = "" + " + ПриватИмяСвойства + ПриведениеКbool + Хвостик + " + "";"";
					|                DeclarativeForms.SendStrFunc(strFunc);
					|            }
					|        }
					|
					|";
				Иначе
					ПриведениеКbool = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[4];
					Стр = Стр +
					"        public " + ТипЗнач + " " + ПриватИмяСвойства + " { get; set; }
					|        [ContextProperty(""" + СвойствоРус + """, """ + СвойствоАнгл + """)]
					|        public " + ТипЗнач + " " + СвойствоАнгл + "
					|        {
					|            get { return " + ПриватИмяСвойства + "; }
					|            set
					|            {
					|                " + ПриватИмяСвойства + " = value;
					|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['" + ИмяСвойстваДляJS + "'] = '"" + " + ПриватИмяСвойства + ПриведениеКbool + Хвостик + " + ""';"";
					|                DeclarativeForms.SendStrFunc(strFunc);
					|            }
					|        }
					|
					|";
				КонецЕсли;
			КонецЕсли;
		КонецЦикла;
	Иначе
		Стр = "";
	КонецЕсли;
	
	Возврат Стр;
КонецФункции//Свойства

Функция События(ФайлСобытий, КлассАнгл)
	ТекстДокСобытия = Новый ТекстовыйДокумент;
	КаталогНаДиске = Новый Файл(ФайлСобытий);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат "";
	КонецЕсли;
	ТекстДокСобытия.Прочитать(ФайлСобытий);
	СтрТекстДокСобытия = ТекстДокСобытия.ПолучитьТекст();
	Если Не (СтрНайтиМежду(СтрТекстДокСобытия, "<H4 class=dtH4>События</H4>", "</TBODY></TABLE>", Ложь, ).Количество() > 0) Тогда
		Возврат "";
	КонецЕсли;
	СтрТаблицаСобытия = СтрНайтиМежду(СтрТекстДокСобытия, "<H4 class=dtH4>События</H4>", "</TBODY></TABLE>", Ложь, )[0];
	Массив1 = СтрНайтиМежду(СтрТаблицаСобытия, "<TR vAlign=top>", "</TD></TR>", Ложь, );
	// Сообщить("Массив1.Количество()=" + Массив1.Количество());
	Если Массив1.Количество() > 0 Тогда
		Стр = "";
		Для А = 0 По Массив1.ВГраница() Цикл
			//найдем первую ячейку строки таблицы
			М07 = СтрНайтиМежду(Массив1[А], "<TD width=""50%"">", "</TD>", Ложь, );
			СтрХ = М07[0];
			СтрХ = СтрЗаменить(СтрХ, "&nbsp;", " ");
			
			ИмяФайлаСобытия = КаталогСправки + "\" + СтрНайтиМежду(СтрХ, "<A href=""", """>", , )[0];
			ТекстДокСобытия = Новый ТекстовыйДокумент;
			ТекстДокСобытия.Прочитать(ИмяФайлаСобытия);
			СтрТекстДокСобытия = ТекстДокСобытия.ПолучитьТекст();
			СтрРаздела = СтрНайтиМежду(СтрТекстДокСобытия, "<H4 class=dtH4>Использование</H4>", "<H4 class=dtH4>Значение</H4>", , )[0];
			СтрИспользование = СтрНайтиМежду(СтрРаздела, "<P>", "</P>", , )[0];

			СвойствоАнгл = СтрНайтиМежду(СтрХ, "(", ")", , )[0];
			СвойствоРус = СтрНайтиМежду(СтрХ, ".html"">", " (", , )[0];
			Если СвойствоРус = "Нажатие" 
				или СвойствоРус = "ДвойноеНажатие"
				или СвойствоРус = "ПриОтпусканииМыши"
				или СвойствоРус = "Ввод"
				или СвойствоРус = "ПриИзменении"
				или СвойствоРус = "МышьНадЭлементом"
				или СвойствоРус = "МышьПокинулаЭлемент"
				или СвойствоРус = "ФокусПолучен"
				или СвойствоРус = "ФокусПотерян"
				
				Тогда
				ПриватИмяСвойства = СловарьСобытий(СвойствоАнгл)[1];
				ИмяСвойстваДляJS = СловарьСобытий(СвойствоАнгл)[2];
				Стр = Стр +
				"        public DfAction " + ПриватИмяСвойства + "  { get; set; }
				|        [ContextProperty(""" + СвойствоРус + """, """ + СвойствоАнгл + """)]
				|        public DfAction " + СвойствоАнгл + "
				|        {
				|            get { return " + ПриватИмяСвойства + "; }
				|            set
				|            {
				|                " + ПриватИмяСвойства + " = value;
				|                string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).addEventListener(\u0022" + ИмяСвойстваДляJS + "\u0022, doEvent);"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|            }
				|        }
				|        
				|";
			
			
			
			
			
			
				
			Иначе	
				Сообщить("444ошибка " + КлассАнгл);
			КонецЕсли;
		КонецЦикла;
	Иначе
		Стр = "";
	КонецЕсли;
	
	Возврат Стр;
КонецФункции//События

Функция Методы(ФайлМетодов, КлассАнгл)
	ТекстДокМетоды = Новый ТекстовыйДокумент;
	КаталогНаДиске = Новый Файл(ФайлМетодов);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат "";
	КонецЕсли;
	ТекстДокМетоды.Прочитать(ФайлМетодов);
	СтрТекстДокМетоды = ТекстДокМетоды.ПолучитьТекст();
	Если Не (СтрНайтиМежду(СтрТекстДокМетоды, "<H4 class=dtH4>Методы</H4>", "</TBODY></TABLE>", Ложь, ).Количество() > 0) Тогда
		Возврат "";
	КонецЕсли;
	СтрТаблицаМетоды = СтрНайтиМежду(СтрТекстДокМетоды, "<H4 class=dtH4>Методы</H4>", "</TBODY></TABLE>", Ложь, )[0];
	Массив1 = СтрНайтиМежду(СтрТаблицаМетоды, "<TR vAlign=top>", "</TD></TR>", Ложь, );
	//переберем строки таблицы
	Если Массив1.Количество() > 0 Тогда
		Стр = "";
		Для А = 0 По Массив1.ВГраница() Цикл
			//найдем первую ячейку строки таблицы
			М07 = СтрНайтиМежду(Массив1[А], "<TD width=""50%"">", "</TD>", Ложь, );
			СтрХ = М07[0];
			СтрХ = СтрЗаменить(СтрХ, "&nbsp;", " ");
			МетодАнгл = СтрНайтиМежду(СтрХ, "(", ")", , )[0];
			// Сообщить("=== " + ФайлМетодов + " =============================================================");
			МетодРус = СтрНайтиМежду(СтрХ, ".html"">", " (", , )[0];
			// Сообщить("МетодРус = " + МетодРус);
			// Сообщить("МетодАнгл = " + МетодАнгл);
			
			// методы нужно унифицировать в main.js
			
			Если (МетодРус = "Показать") и (КлассАнгл = "Dialog") Тогда
				Стр = Стр +
				"        [ContextMethod(""Показать"", ""Show"")]
				|        public void Show()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).show();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Закрыть") и (КлассАнгл = "Dialog") Тогда
				Стр = Стр +
				"        [ContextMethod(""Закрыть"", ""Close"")]
				|        public void Close()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).close();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ЗаполнитьПрямоугольник") и (КлассАнгл = "Canvas") Тогда
				Стр = Стр +
				"        [ContextMethod(""ЗаполнитьПрямоугольник"", ""FillRect"")]
				|        public void FillRect(int p1, int p2, int p3, int p4)
				|        {
				|            string strFunc = ""mapKeyEl.get('"" + NameCanvasContext + ""').fillRect("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Воспроизвести") и (КлассАнгл = "Audio") Тогда
				Стр = Стр +
				"        [ContextMethod(""Воспроизвести"", ""Play"")]
				|        public void Play()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).play();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Пауза") и (КлассАнгл = "Audio") Тогда
				Стр = Стр +
				"        [ContextMethod(""Пауза"", ""Pause"")]
				|        public void Pause()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).pause();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ШагВверх") и (
					КлассАнгл = "DateSelection"
					или КлассАнгл = "DateTimeLocalSelection"
					или КлассАнгл = "MonthSelection"
					или КлассАнгл = "NumberField"
					или КлассАнгл = "Range"
					или КлассАнгл = "WeekSelection" 
					или КлассАнгл = "TimeSelection" 
					) Тогда
				Стр = Стр +
				"        [ContextMethod(""ШагВверх"", ""StepUp"")]
				|        public void StepUp(int p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).stepUp("" + p1 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ШагВниз") и (
					КлассАнгл = "DateSelection" 
					или КлассАнгл = "DateTimeLocalSelection" 
					или КлассАнгл = "MonthSelection" 
					или КлассАнгл = "NumberField" 
					или КлассАнгл = "Range" 
					или КлассАнгл = "WeekSelection" 
					или КлассАнгл = "TimeSelection" 
					) Тогда
				Стр = Стр +
				"        [ContextMethod(""ШагВниз"", ""StepDown"")]
				|        public void StepDown(int p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).stepDown("" + p1 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Выбрать") и (
					КлассАнгл = "DateSelection" 
					или КлассАнгл = "DateTimeSelection" 
					или КлассАнгл = "MonthSelection" 
					или КлассАнгл = "NumberField" 
					или КлассАнгл = "PasswordField" 
					или КлассАнгл = "SearchField" 
					или КлассАнгл = "WeekSelection" 
					или КлассАнгл = "TimeSelection" 
					или КлассАнгл = "TextField" 
					или КлассАнгл = "TextArea" 
					) Тогда
				Стр = Стр +
				"        [ContextMethod(""Выбрать"", ""Select"")]
				|        public void Select()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).select();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ПоказатьМодально") и (КлассАнгл = "Dialog") Тогда
				Стр = Стр +
				"        [ContextMethod(""ПоказатьМодально"", ""ShowModal"")]
				|        public void ShowModal()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).showModal();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Добавить") и (КлассАнгл = "Select") Тогда
				Стр = Стр +
				"        [ContextMethod(""Добавить"", ""Add"")]
				|        public void Add(IValue p1, IValue p2 = null)
				|        {
				|            if (p2 != null)
				|            {
				|                string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).add(mapKeyEl.get(\u0022"" + ((dynamic)p1).ItemKey + ""\u0022), "" + p2 + "");"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|                Children.Add(p1);
				|            }
				|            else
				|            {
				|                string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).add(mapKeyEl.get(\u0022"" + ((dynamic)p1).ItemKey + ""\u0022));"";
				|                DeclarativeForms.SendStrFunc(strFunc);
				|                Children.Add(p1);
				|            }
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "Количество") и (КлассАнгл = "Select") Тогда
				Стр = Стр +
				"        public IValue length { get; set; }
				|        [ContextProperty(""Количество"", ""Length"")]
				|        public int Length
				|        {
				|            get { return Convert.ToInt32(length.AsNumber()); }
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьИзСписка") и (КлассАнгл = "Select") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьИзСписка"", ""RemoveFromList"")]
				|        public void RemoveFromList(int p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).remove("" + p1 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьЗаголовок") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьЗаголовок"", ""DeleteCaption"")]
				|        public void DeleteCaption()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).deleteCaption();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|				
				|            try
				|            {
				|                int num = -1;
				|                for (int i = 0; i < Children.Count(); i++)
				|                {
				|                    var item = Children.Get(i);
				|                    if (item.GetType() == typeof(osdf.DfCaption))
				|                    {
				|                        num = i;
				|                        break;
				|                    }
				|                }
				|                Children.Remove(num);
				|            }
				|            catch { }
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьШапку") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьШапку"", ""DeleteTHead"")]
				|        public void DeleteTHead()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).deleteTHead();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|				
				|            try
				|            {
				|                int num = -1;
				|                for (int i = 0; i < Children.Count(); i++)
				|                {
				|                    var item = Children.Get(i);
				|                    if (item.GetType() == typeof(osdf.DfTableHeader))
				|                    {
				|                        num = i;
				|                        break;
				|                    }
				|                }
				|                Children.Remove(num);
				|            }
				|            catch { }
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьИтоги") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьИтоги"", ""DeleteTFoot"")]
				|        public void DeleteTFoot()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).deleteTFoot();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|				
				|            try
				|            {
				|                int num = -1;
				|                for (int i = 0; i < Children.Count(); i++)
				|                {
				|                    var item = Children.Get(i);
				|                    if (item.GetType() == typeof(osdf.DfOutcome))
				|                    {
				|                        num = i;
				|                        break;
				|                    }
				|                }
				|                Children.Remove(num);
				|            }
				|            catch { }
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьСтроку") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьСтроку"", ""DeleteRow"")]
				|        public void DeleteRow(int p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).deleteRow("" + p1 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|
				|            // Если метод применяется к уже сформированной таблице, тогда ниже следующая актуализация свойства Таблица.Строки сработает.
				|            // Иначе не сработает. Вернее свойство Таблица.Строки будет не актуальным.
				|            // Это заготовка для актуализации свойств на стороне сценария на будущее.
				|            //////strFunc = """" +
				|            //////    ""let res;"" +
				|            //////    ""let el = mapKeyEl.get('"" + ItemKey + ""');"" +
				|            //////    ""try"" +
				|            //////    ""{"" +
				|            //////    ""    res = '';"" +
				|            //////    ""    if (el.rows.length > 0)"" +
				|            //////    ""    {"" +
				|            //////    ""        for (var i = 0; i < el.rows.length; i++)"" +
				|            //////    ""        {"" +
				|            //////    ""            res = res + mapElKey.get(el.rows[i]) + ';';"" +
				|            //////    ""        }"" +
				|            //////    ""    }"" +
				|            //////    ""    sendPost("" +
				|            //////    ""    '"" + ItemKey + ""' +"" +
				|            //////    ""    '"" + DeclarativeForms.paramDelimiter + ""' + 'v5v5v"" + """" + ""' +"" +
				|            //////    ""    '"" + DeclarativeForms.paramDelimiter + ""' + '"" + ""Строки"" + ""' +"" +
				|            //////    ""    '"" + DeclarativeForms.paramDelimiter + ""' + res +"" +
				|            //////    ""    '"" + DeclarativeForms.paramDelimiter + ""' + true);"" +
				|            //////    ""}"" +
				|            //////    ""catch (err)"" +
				|            //////    ""{"" +
				|            //////    ""    sendPost('!!! Ошибка7:' + err.message);"" +
				|            //////    ""}"" +
				|            //////    """";
				|            //////DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ВставитьСтроку") и (КлассАнгл = "Table") Тогда
				Стр = Стр +
				"        [ContextMethod(""ВставитьСтроку"", ""InsertRow"")]
				|        public DfTableRow InsertRow(int p1)
				|        {
				|            DfTableRow DfTableRow1 = new DfTableRow(this, ""insertRow"", p1);
				|            return DfTableRow1;
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "ВставитьЯчейку") и (КлассАнгл = "TableRow") Тогда
				Стр = Стр +
				"        [ContextMethod(""ВставитьЯчейку"", ""InsertCell"")]
				|        public DfCell InsertCell(int p1)
				|        {
				|            DfCell DfCell1 = new DfCell(this, ""insertCell"", p1);
				|            return DfCell1;
				|        }
				|        
				|";
			ИначеЕсли (МетодРус = "УдалитьЯчейку") и (КлассАнгл = "TableRow") Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьЯчейку"", ""DeleteCell"")]
				|        public void DeleteCell(int p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).deleteCell("" + p1 + "");"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
				
				
				
				
				
				
				
				
				
			ИначеЕсли МетодРус = "Анимация" Тогда
				Стр = Стр +
				"        [ContextMethod(""Анимация"", ""Animation"")]
				|        public DfAnimation Animation(DfFrames p1, DfAnimationOptions p2)
				|        {
				|            return new DfAnimation(ItemKey, p1, p2);
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "ПрокрутитьДо" Тогда
				Стр = Стр +
				"        [ContextMethod(""ПрокрутитьДо"", ""ScrollIntoView"")]
				|        public void ScrollIntoView(bool p1 = true)
				|        {
				|            string strFunc;
				|            if (!p1)
				|            {
				|                strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).scrollIntoView(false);"";
				|            }
				|            else
				|            {
				|                strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).scrollIntoView();"";
				|            }
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "СнятьФокус" Тогда
				Стр = Стр +
				"        [ContextMethod(""СнятьФокус"", ""Blur"")]
				|        public void Blur()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).blur();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "Фокус" Тогда
				Стр = Стр +
				"        [ContextMethod(""Фокус"", ""Focus"")]
				|        public void Focus()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).focus();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "Удалить" Тогда
				Стр = Стр +
				"        [ContextMethod(""Удалить"", ""Remove"")]
				|        public void Remove()
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).remove();"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|				
				|            try
				|            {
				|                ArrayImpl arr = (ArrayImpl)((dynamic)Parent).Children;
				|                IValue val1 = arr.Find(this);
				|                arr.Remove(Convert.ToInt32(val1.AsNumber()));
				|            }
				|            catch { }
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "ДобавитьДочерний" Тогда
				Стр = Стр +
				"        [ContextMethod(""ДобавитьДочерний"", ""AppendChild"")]
				|        public IValue AppendChild(IValue p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).appendChild(mapKeyEl.get(\u0022"" + ((dynamic)p1).ItemKey + ""\u0022));"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|            ((dynamic)p1).Parent = this;
				|            return p1;
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "УдалитьДочерний" Тогда
				Стр = Стр +
				"        [ContextMethod(""УдалитьДочерний"", ""RemoveChild"")]
				|        public void RemoveChild(IValue p1)
				|        {
				|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).removeChild(mapKeyEl.get(\u0022"" + ((dynamic)p1.AsObject()).ItemKey + ""\u0022));"";
				|            DeclarativeForms.SendStrFunc(strFunc);
				|				
				|            try
				|            {
				|                IValue val1 = Children.Find(p1);
				|                Children.Remove(Convert.ToInt32(val1.AsNumber()));
				|            }
				|            catch { }
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "Нажатие" Тогда
				Стр = Стр +
				"        [ContextMethod(""Нажатие"", ""Click"")]
				|        public void Click2()
				|        {
				|            while (!DeclarativeForms.webserverSendUploaded)
				|            {
				|                System.Threading.Thread.Sleep(300);
				|            }
				|            System.Threading.Thread.Sleep(1000);
				|            string strFunc = ""const event = new MouseEvent('click');"" +
				|                ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).dispatchEvent(event);"";
				|            DeclarativeForms.WebServerSendText(strFunc);
				|        }
				|        
				|";
			ИначеЕсли МетодРус = "ДвойноеНажатие" Тогда
				Стр = Стр +
				"        [ContextMethod(""ДвойноеНажатие"", ""DoubleClick"")]
				|        public void DoubleClick2()
				|        {
				|            while (!DeclarativeForms.webserverSendUploaded)
				|            {
				|                System.Threading.Thread.Sleep(300);
				|            }
				|            System.Threading.Thread.Sleep(1000);
				|            string strFunc = ""const event = new MouseEvent('dblclick');"" +
				|                ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).dispatchEvent(event);"";
				|            DeclarativeForms.WebServerSendText(strFunc);
				|        }
				|        
				|";
				
				
			
			
			
			Иначе
				
			КонецЕсли;
		КонецЦикла;
	Иначе
		Стр = "" + Символы.ПС;
	КонецЕсли;
	
	Возврат Стр;
КонецФункции//Методы

Функция Подвал()
	Стр = 
	"    }
	|}";
	Возврат Стр;
КонецФункции

Процедура ВыгрузкаДляДекларФорм()
	Таймер = ТекущаяУниверсальнаяДатаВМиллисекундах();
	
	УдалитьФайлы(КаталогВыгрузки, "*.cs");
	
	// Создадим файлы cs которые не нуждаются в сборке и неизменны. Остальные будем собирать анализируя справку.
	СоздатьФайлДФ("DeclarativeForms");
	СоздатьФайлДФ("ArrayList");
	СоздатьФайлДФ("Form");
	СоздатьФайлДФ("IndexhtmlWin");
	СоздатьФайлДФ("IndexhtmlWinBr");
	СоздатьФайлДФ("IndexhtmlLin");
	СоздатьФайлДФ("IndexhtmlLinBr");
	СоздатьФайлДФ("Packagejson");
	СоздатьФайлДФ("Color");
	СоздатьФайлДФ("Element");
	СоздатьФайлДФ("Menu");
	СоздатьФайлДФ("MenuItem");
	СоздатьФайлДФ("CubicBezier");
	СоздатьФайлДФ("BorderTop");
	СоздатьФайлДФ("Style");
	СоздатьФайлДФ("Borders");
	СоздатьФайлДФ("Action");
	СоздатьФайлДФ("EventArgs");
	СоздатьФайлДФ("Padding");
	СоздатьФайлДФ("BorderImage");
	СоздатьФайлДФ("Columns");
	СоздатьФайлДФ("Outline");
	СоздатьФайлДФ("Circle");
	СоздатьФайлДФ("BorderLeft");
	СоздатьФайлДФ("Scale");
	СоздатьФайлДФ("Scale3D");
	СоздатьФайлДФ("ScaleZ");
	СоздатьФайлДФ("ScaleY");
	СоздатьФайлДФ("ScaleX");
	СоздатьФайлДФ("Matrix");
	СоздатьФайлДФ("Matrix3D");
	СоздатьФайлДФ("Skew");
	СоздатьФайлДФ("SkewY");
	СоздатьФайлДФ("SkewX");
	СоздатьФайлДФ("BorderBottom");
	СоздатьФайлДФ("Margin");
	СоздатьФайлДФ("Translate");
	СоздатьФайлДФ("Translate3D");
	СоздатьФайлДФ("TranslateZ");
	СоздатьФайлДФ("TranslateY");
	СоздатьФайлДФ("TranslateX");
	СоздатьФайлДФ("Transition");
	СоздатьФайлДФ("Perspective");
	СоздатьФайлДФ("Rotate");
	СоздатьФайлДФ("Rotate3D");
	СоздатьФайлДФ("RotateZ");
	СоздатьФайлДФ("RotateY");
	СоздатьФайлДФ("RotateX");
	СоздатьФайлДФ("Polygon");
	СоздатьФайлДФ("BorderRight");
	СоздатьФайлДФ("Rectangle");
	СоздатьФайлДФ("BorderRadius");
	СоздатьФайлДФ("ColumnRule");
	СоздатьФайлДФ("Size");
	СоздатьФайлДФ("BordersStyle");
	СоздатьФайлДФ("ListStyle");
	СоздатьФайлДФ("BoxShadow");
	СоздатьФайлДФ("Point");
	СоздатьФайлДФ("TransformOrigin");
	СоздатьФайлДФ("ImagesFilter");
	СоздатьФайлДФ("BordersColor");
	СоздатьФайлДФ("BordersWidth");
	СоздатьФайлДФ("Font");
	СоздатьФайлДФ("Context2d");
	СоздатьФайлДФ("LinearGradient");
	СоздатьФайлДФ("Math");
	СоздатьФайлДФ("ImageData");
	СоздатьФайлДФ("RadialGradient");
	СоздатьФайлДФ("Animation");
	СоздатьФайлДФ("Frames");
	СоздатьФайлДФ("AnimationOptions");
	СоздатьФайлДФ("AnimationProperties");
	СоздатьФайлДФ("PerspectiveOrigin");
	СоздатьФайлДФ("Background");
	СоздатьФайлДФ("WebServerReceiving");
	СоздатьФайлДФ("WebServerSend");
	СоздатьФайлДФ("Timer");
	СоздатьФайлДФ("Tray");
	
	
	
	
	
	// Соберем и запишем файлы перечислений.
	ЗаписатьПеречисления();

	//===== Обработаем классы ==========================================================================================================================
	ВыбранныеФайлы = ОтобратьФайлы("Класс");
	Для А = 0 По ВыбранныеФайлы.ВГраница() Цикл
		// Пропустим неизменные классы.
		Если ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.DeclarativeForms.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Form.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Element.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Menu.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.MenuItem.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ArrayList.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Color.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.CubicBezier.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderTop.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Style.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Borders.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Action.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.EventArgs.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Padding.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderImage.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Columns.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Outline.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Circle.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderLeft.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Scale.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Scale3D.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ScaleZ.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ScaleY.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ScaleX.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Matrix.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Matrix3D.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Skew.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.SkewY.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.SkewX.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderBottom.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Margin.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Translate.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Translate3D.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.TranslateZ.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.TranslateY.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.TranslateX.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Transition.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Perspective.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Rotate.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Rotate3D.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.RotateZ.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.RotateY.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.RotateX.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Polygon.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderRight.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Rectangle.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BorderRadius.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ColumnRule.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Size.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BordersStyle.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ListStyle.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BoxShadow.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Point.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.TransformOrigin.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ImagesFilter.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BordersColor.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.BordersWidth.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Font.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Context2d.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.LinearGradient.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Math.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ImageData.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.RadialGradient.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Animation.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Frames.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.AnimationOptions.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.AnimationProperties.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.PerspectiveOrigin.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Background.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Wsserver.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Timer.html" 
			или ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.Tray.html" 
			
		Тогда
			Продолжить;
		КонецЕсли;
		
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать(ВыбранныеФайлы[А]);
		Стр = ТекстДок.ПолучитьТекст();
		
		// Сообщить("" + Стр);
		// Сообщить("=====================================================================================================");
		
		СтрЗаголовка = СтрНайтиМежду(Стр, "<H1 class=dtH1", "/H1>", , )[0];
		М01 = СтрНайтиМежду(СтрЗаголовка, "(", ")", , );
		Стр33 = СтрЗаголовка;
		Стр33 = СтрЗаменить(Стр33, "&nbsp;", " ");
		Стр33 = СтрЗаменить(Стр33, ">", "");
		М08 = РазобратьСтроку(Стр33, " ");
		ИмяФайлаВыгрузки = КаталогВыгрузки + "\" + М01[0] + ".cs";
		КлассАнгл = М01[0];
		КлассРус = М08[0];
		
		// Сообщить("ИмяФайлаВыгрузки = " + ИмяФайлаВыгрузки);
		// Сообщить("КлассАнгл = " + КлассАнгл);
		// Сообщить("КлассРус = " + КлассРус);
		
		// определим имя файлов событий, свойств, методов.
		ФайлСобытий = КаталогСправки + "\OSDForms." + КлассАнгл + "Events.html";
		ФайлСвойств = КаталогСправки + "\OSDForms." + КлассАнгл + "Properties.html";
		ФайлМетодов = КаталогСправки + "\OSDForms." + КлассАнгл + "Methods.html";
		СтрДирективы = Директивы(КлассАнгл);
		СтрШапка = Шапка(КлассАнгл);
		СтрРазделОбъявленияПеременных = РазделОбъявленияПеременных(КлассАнгл);
		СтрКонструктор = Конструктор(КлассАнгл);
		СтрСвойства = Свойства(ФайлСвойств, КлассАнгл);
		СтрСобытия = События(ФайлСобытий, КлассАнгл);
		СтрМетоды = Методы(ФайлМетодов, КлассАнгл);
		СтрПодвал = Подвал();
		
		// СортироватьСтрРазделОбъявленияПеременных();
		СтрВыгрузки = "";
		СтрВыгрузки = СтрВыгрузки + СтрДирективы + Символы.ПС;
		СтрВыгрузки = СтрВыгрузки + СтрШапка + Символы.ПС;
		СтрВыгрузки = СтрВыгрузки + СтрРазделОбъявленияПеременных + Символы.ПС;
		СтрВыгрузки = СтрВыгрузки + СтрКонструктор + Символы.ПС;
		СтрВыгрузки = СтрВыгрузки + СтрСвойства;
		СтрВыгрузки = СтрВыгрузки + СтрСобытия;
		СтрВыгрузки = СтрВыгрузки + СтрМетоды;
		СтрВыгрузки = СтрВыгрузки + СтрПодвал + Символы.ПС;
		
		
		ЗаписьТекста = Новый ЗаписьТекста();
		ЗаписьТекста.Открыть(ИмяФайлаВыгрузки,,,);
		ЗаписьТекста.Записать(СтрВыгрузки);
		ЗаписьТекста.Закрыть();

		
	КонецЦикла;
	//===== Закончили с классами ==========================================================================================================================
	// ЗавершитьРаботу(0);
	
	Сообщить("Выполнено за: " + ((ТекущаяУниверсальнаяДатаВМиллисекундах()-Таймер)/1000)/60 + " мин." + " " + ТекущаяДата());
КонецПроцедуры//ВыгрузкаДляДекларФорм

Процедура ЗаписатьПеречисления()
	ВыбранныеФайлы = ОтобратьФайлы("Перечисление");
	Для А = 0 По ВыбранныеФайлы.ВГраница() Цикл
		Если ВыбранныеФайлы[А] = КаталогСправки + "\OSDForms.ColorEnumeration.html" Тогда
			Продолжить;
		КонецЕсли;
		
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать(ВыбранныеФайлы[А]);
		Стр = ТекстДок.ПолучитьТекст();
		
		// Сообщить("" + Стр);
		// Сообщить("=====================================================================================================");
		
		СтрЗаголовка= СтрНайтиМежду(Стр, "<H1 class=dtH1", "/H1>", , )[0];
		М01 = СтрНайтиМежду(СтрЗаголовка, "(", ")", , );
		СтрЗаголовка = СтрЗаменить(СтрЗаголовка, "&nbsp;", " ");
		Стр33 = СтрНайтиМежду(СтрЗаголовка, ">", " Перечисление<", , )[0];
		Стр33 = СтрЗаменить(Стр33, "&nbsp;", " ");
		Стр33 = СтрЗаменить(Стр33, ">", "");
		М08 = РазобратьСтроку(Стр33, " ");
		ИмяФайлаВыгрузки = КаталогВыгрузки + "\" + М01[0] + ".cs";
		КлассАнгл = М01[0];
		КлассРус = М08[0];
		// Сообщить("====" + КлассРус);
		// Сообщить("====" + КлассАнгл);
		// Сообщить("=====================================================================================================");
		
		//находим текст таблицы
		СтрТаблица = СтрНайтиМежду(Стр, "</TH></TR>" + Символы.ПС + "  <TR vAlign=top>", "</TBODY></TABLE>", Ложь, );
		СтрТаблицыПеречисления = СтрНайтиМежду(СтрТаблица[0], "<TR vAlign=top>", "</TD></TR>", Ложь, );
		СтрРазделОбъявленияПеременныхДляПеречисления = "";
		СтрСвойстваДляПеречисления = "";
		
		СтрРазделОбъявленияПеременныхДляПеречисления = 
        "
		|        private List<IValue> _list;
		|
		|        public int Count()
		|        {
		|            return _list.Count;
		|        }
		|
		|        public CollectionEnumerator GetManagedIterator()
		|        {
		|            return new CollectionEnumerator(this);
		|        }
		|
		|        IEnumerator IEnumerable.GetEnumerator()
		|        {
		|            return ((IEnumerable<IValue>)_list).GetEnumerator();
		|        }
		|
		|        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
		|        {
		|            foreach (var item in _list)
		|            {
		|                yield return (item as IValue);
		|            }
		|        }
		|";
		
		СтрКонструктораДляПеречисления = 
		"        public Df" + КлассАнгл + "()
		|        {
		|            _list = new List<IValue>();";
		
		Для А02 = 0 По СтрТаблицыПеречисления.ВГраница() Цикл
			М12 = СтрНайтиМежду(СтрТаблицыПеречисления[А02], "<TD>", "</TD>", , );
			М14 = СтрНайтиМежду(М12[0], "<B>", "</B>", , );
			М13 = РазобратьСтроку(СтрЗаменить(М14[0], "&nbsp;", " "), " ");
			ИмяПеречАнгл = М01[0];
			ИмяПеречРус = М08[0];
			ИмяЧленаАнгл = М13[1];
			// Сообщить("==" + ИмяЧленаАнгл);
			// если здесь ошибка, тогда возможно есть лишний пробел в одном из значений перечисления
			ИмяЧленаАнгл = СтрНайтиМежду(ИмяЧленаАнгл, "(", ")", , )[0];
			ИмяЧленаРус = М13[0];
			ОписаниеЧлена = М12[1];
			Пока СтрЧислоВхождений(ОписаниеЧлена, Символы.ПС) > 0 Цикл
				ОписаниеЧлена = СтрЗаменить(ОписаниеЧлена, Символы.ПС, " ");
			КонецЦикла;
			Пока СтрЧислоВхождений(ОписаниеЧлена, Символы.Таб) > 0 Цикл
				ОписаниеЧлена = СтрЗаменить(ОписаниеЧлена, Символы.Таб, " ");
			КонецЦикла;
			Пока СтрЧислоВхождений(ОписаниеЧлена, "  ") > 0 Цикл
				ОписаниеЧлена = СтрЗаменить(ОписаниеЧлена, "  ", " ");
			КонецЦикла;
			ЗначениеЧлена = М12[2];
			// Сообщить("--------------");
			// Сообщить("ИмяПеречРус = " + ИмяПеречРус);
			// Сообщить("ИмяПеречАнгл = " + ИмяПеречАнгл);
			// Сообщить("ИмяЧленаРус = " + ИмяЧленаРус);
			// Сообщить("ИмяЧленаАнгл = " + ИмяЧленаАнгл);
			// Сообщить("ОписаниеЧлена = " + ОписаниеЧлена);
			// Сообщить("ЗначениеЧлена = " + ЗначениеЧлена);
			
			СтрСвойстваДляПеречисления = СтрСвойстваДляПеречисления + Символы.ПС + 
			"        [ContextProperty(""" + ИмяЧленаРус + """, """ + ИмяЧленаАнгл + """)]
			|        public string " + ИмяЧленаАнгл + "
			|        {
			|        	get { return """ + ЗначениеЧлена + """; }
			|        }" + ?(А02 = СтрТаблицыПеречисления.ВГраница(), "", Символы.ПС);
			
			
			СтрКонструктораДляПеречисления = СтрКонструктораДляПеречисления + "
			|            _list.Add(ValueFactory.Create(" + ИмяЧленаАнгл + "));";
			
		КонецЦикла;
		
		СтрКонструктораДляПеречисления = СтрКонструктораДляПеречисления + "
		|        }";
		
		СтрВыгрузкиПеречисленийШапка = Директивы(КлассАнгл);
		СтрВыгрузкиПеречислений = СтрВыгрузкиПеречисленийШапка + 
		"
		|namespace osdf
		|{
		|    [ContextClass(""Дф" + КлассРус + """, ""Df" + КлассАнгл + """)]
		|    public class Df" + КлассАнгл + " : AutoContext<Df" + КлассАнгл + ">, ICollectionContext, IEnumerable<IValue>
		|    {";
		СтрВыгрузкиПеречислений = СтрВыгрузкиПеречислений + СтрРазделОбъявленияПеременныхДляПеречисления + Символы.ПС;
		СтрВыгрузкиПеречислений = СтрВыгрузкиПеречислений + СтрКонструктораДляПеречисления + Символы.ПС;
		СтрВыгрузкиПеречислений = СтрВыгрузкиПеречислений + СтрСвойстваДляПеречисления + Символы.ПС;
		СтрВыгрузкиПеречислений = СтрВыгрузкиПеречислений + 
		"    }" + Символы.ПС + 
		"}";
	
		ТекстДокПеречислений = Новый ТекстовыйДокумент;
		ТекстДокПеречислений.УстановитьТекст(СтрВыгрузкиПеречислений);
		ТекстДокПеречислений.Записать(ИмяФайлаВыгрузки);
	КонецЦикла;
КонецПроцедуры//ЗаписатьПеречисления

Процедура СоздатьФайлДФ(ИмяФайлаДФ)
	СтрВыгрузки = "";
	Если Ложь Тогда
	// ИначеЕсли ИмяФайлаДФ = "" Тогда
		// СтрВыгрузки = СтрВыгрузки + 
		// "namespace osdf
		// |{
		
		// |    }
		// |}
		// |";
		// ТекстДокХХХ = Новый ТекстовыйДокумент;
		// ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		// ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
		
		
		
		
		
		
		
		
		
	ИначеЕсли ИмяФайлаДФ = "Tray" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЛоток"", ""DfTray"")]
		|    public class DfTray : AutoContext<DfTray>
		|    {
		|        public DfTray()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.Tray({ title: 'DeclarativeForms', icon: '' })); mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        public string title { get; set; }
		|        [ContextProperty(""Заголовок"", ""Title"")]
		|        public string Title
		|        {
		|            get { return title; }
		|            set
		|            {
		|                title = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['title'] = '"" + title + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string icon { get; set; }
		|        [ContextProperty(""Значок"", ""Icon"")]
		|        public string Icon
		|        {
		|            get { return icon; }
		|            set
		|            {
		|                icon = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['icon'] = '"" + icon + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string tooltip { get; set; }
		|        [ContextProperty(""Подсказка"", ""Tooltip"")]
		|        public string Tooltip
		|        {
		|            get { return tooltip; }
		|            set
		|            {
		|                tooltip = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['tooltip'] = '"" + tooltip + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public DfAction click { get; set; }
		|        [ContextProperty(""Нажатие"", ""Click"")]
		|        public DfAction Click
		|        {
		|            get { return click; }
		|            set
		|            {
		|                click = value;
		|                string strFunc = """" +
		|                    ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).on('click', function()"" +
		|                    ""{"" +
		|                    ""    sendPost('"" + ItemKey + DeclarativeForms.paramDelimiter + @""click');"" +
		|                    ""});"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public DfMenu menu;
		|        [ContextProperty(""Меню"", ""Menu"")]
		|        public DfMenu Menu
		|        {
		|            get { return menu; }
		|            set
		|            {
		|                menu = value;
		|                string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).menu = mapKeyEl.get(\u0022"" + menu.ItemKey + ""\u0022);"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextMethod(""Удалить"", ""Remove"")]
		|        public void Remove()
		|        {
		|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).remove();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Timer" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфТаймер"", ""DfTimer"")]
		|    public class DfTimer : AutoContext<DfTimer>
		|    {
		|        public DfTimer()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|            Interval = 1000;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private int interval;
		|        [ContextProperty(""Интервал"", ""Interval"")]
		|        public int Interval
		|        {
		|            get { return interval; }
		|            set { interval = value; }
		|        }
		|
		|        public bool enabled { get; set; } = false;
		|        [ContextProperty(""Активен"", ""Enabled"")]
		|        public bool Enabled
		|        {
		|            get { return enabled; }
		|            private set { enabled = value; }
		|        }
		|
		|        public DfAction tick;
		|        [ContextProperty(""ПриСрабатыванииТаймера"", ""Tick"")]
		|        public DfAction Tick
		|        {
		|            get { return tick; }
		|            set { tick = value; }
		|        }
		|
		|        [ContextMethod(""Начать"", ""Start"")]
		|        public void Start()
		|        {
		|            if (!Enabled)
		|            {
		|                string strFunc = ""startTimer('"" + ItemKey + ""', "" + Interval + "");"";
		|                if (!DeclarativeForms.strFunctions.Contains(ItemKey))
		|                {
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|            Enabled = true;
		|        }
		|
		|        [ContextMethod(""Остановить"", ""Stop"")]
		|        public void Stop()
		|        {
		|            if (Enabled)
		|            {
		|                string strFunc = ""stopTimer('"" + ItemKey + ""');"";
		|                if (!DeclarativeForms.strFunctions.Contains(ItemKey))
		|                {
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|            Enabled = false;
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "WebServerSend" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System;
		|using System.Net;
		|using System.Net.WebSockets;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine;
		|using System.Threading.Tasks;
		|using System.Collections.Concurrent;
		|using System.Threading;
		|using System.Text;
		|using System.IO;
		|
		|namespace osws
		|{
		|    [ContextClass(""ВебСерверОтправкиДекларФорм"", ""WebServerSendDeclarForms"")]
		|    public class WebServerSendDeclarForms : AutoContext<WebServerSendDeclarForms>
		|    {
		|        private static string iPAddress;
		|        private static int port;
		|        public static WebServerSendDeclarForms WebServer;
		|        public static WsSendMessageEventArgs Event = null;
		|        public static WsSendAction EventAction = null;
		|        public static ConcurrentQueue<WsSendMessageEventArgs> EventQueue = new ConcurrentQueue<WsSendMessageEventArgs>();
		|        // Это событие возникает при получении нового сообщения.
		|        public event EventHandler<WsSendEventArgs> ReceivedMessage;
		|        public static WebSocket _webSocket;
		|
		|        [ScriptConstructor]
		|        public static IRuntimeContextInstance Constructor()
		|        {
		|            WebServer = new WebServerSendDeclarForms();
		|            WebServer.ReceivedMessage += WebServer_ReceivedMessage;
		|            return WebServer;
		|        }
		|
		|        [ContextProperty(""АргументыСобытия"", ""EventArgs"")]
		|        public WsSendMessageEventArgs EventArgs
		|        {
		|            get { return Event; }
		|        }
		|
		|        public static bool goOn = true;
		|        [ContextProperty(""Продолжать"", ""GoOn"")]
		|        public bool GoOn
		|        {
		|            get { return goOn; }
		|            set { goOn = value; }
		|        }
		|
		|        [ContextMethod(""ПолучитьСобытие"", ""DoEvents"")]
		|        public DelegateAction DoEvents()
		|        {
		|            while (EventQueue.Count == 0)
		|            {
		|                System.Threading.Thread.Sleep(7);
		|            }
		|
		|            IValue Action1 = EventHandling();
		|            if (Action1.GetType() == typeof(WsSendAction))
		|            {
		|                return DelegateAction.Create(((WsSendAction)Action1).Script, ((WsSendAction)Action1).MethodName);
		|            }
		|            return (DelegateAction)Action1;
		|        }
		|
		|        public static WsSendAction EventHandling()
		|        {
		|            WsSendMessageEventArgs EventArgs1;
		|            EventQueue.TryDequeue(out EventArgs1);
		|            Event = EventArgs1;
		|            EventAction = EventArgs1.EventAction;
		|            return EventAction;
		|        }
		|
		|        [ContextMethod(""Начать"", ""Start"")]
		|        public void Start(string p1, int p2)
		|        {
		|            iPAddress = p1;
		|            port = p2;
		|
		|            Wsserver1();
		|        }
		|        public async void Wsserver1()
		|        {
		|            await WsserverStart();
		|        }
		|        static async Task WsserverStart()
		|        {
		|            var listener = new HttpListener();
		|            listener.Prefixes.Add(""http://"" + iPAddress + "":"" + port + ""/"");
		|            try
		|            {
		|                listener.Start();
		|                osdf.DeclarativeForms.webserverSendUploaded = true;
		|            }
		|            catch (Exception ex)
		|            {
		|                osdf.DeclarativeForms.GlobalContext().Echo(""ServerSend ex.Message = "" + ex.Message);
		|                return;
		|            }
		|
		|            //osdf.DeclarativeForms.GlobalContext().Echo(""WebServerSend Listening..."");
		|
		|            while (true)
		|            {
		|                var context = await listener.GetContextAsync();
		|                if (context.Request.IsWebSocketRequest)
		|                {
		|                    await ProcessWebSocketRequest(context);
		|                }
		|                else
		|                {
		|                    context.Response.StatusCode = 400;
		|                    context.Response.Close();
		|                }
		|            }
		|        }
		|
		|        static async Task ProcessWebSocketRequest(HttpListenerContext context)
		|        {
		|            var ws = await context.AcceptWebSocketAsync(subProtocol: null);
		|            _webSocket = ws.WebSocket;
		|            // osdf.DeclarativeForms.GlobalContext().Echo(""WebServerSend connected"");
		|
		|            try
		|            {
		|                await Echo(ws.WebSocket);
		|            }
		|            catch (Exception)
		|            {
		|                //osdf.DeclarativeForms.GlobalContext().Echo(""WebServerSend ex.Message = "" + ex.Message);
		|            }
		|        }
		|
		|        static async Task Echo(WebSocket ws)
		|        {
		|            var buffer = new ArraySegment<byte>(new byte[2048]);
		|            while (true)
		|            {
		|                if (ws.State != WebSocketState.Aborted)
		|                {
		|                    WebSocketReceiveResult result;
		|                    var ms = new MemoryStream();
		|                    do
		|                    {
		|                        result = await ws.ReceiveAsync(buffer, CancellationToken.None);
		|                        ms.Write(buffer.Array, buffer.Offset, result.Count);
		|                    } while (!result.EndOfMessage);
		|
		|                    ms.Seek(0, SeekOrigin.Begin);
		|                    if (result.MessageType == WebSocketMessageType.Text)
		|                    {
		|                        var reader = new StreamReader(ms, Encoding.UTF8);
		|                        string ts = await reader.ReadToEndAsync();
		|                        //////osdf.DeclarativeForms.GlobalContext().Echo(""4Received message: "" + ts);
		|                        WebServer.OnReceivedMessage(ts); // Без этой строки не будут работать события.
		|                    }
		|                    else if (result.MessageType == WebSocketMessageType.Close)
		|                    {
		|                        // osdf.DeclarativeForms.GlobalContext().Echo(""WebServerSend closed"");
		|                        break;
		|                    }
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""ОтправитьТекст"", ""SendText"")]
		|        public void SendText(string text)
		|        {
		|            SendText1(text);
		|        }
		|        public async void SendText1(string text)
		|        {
		|            await Send(text);
		|        }
		|        static async Task Send(string text)
		|        {
		|            if (_webSocket.State == WebSocketState.Open)
		|            {
		|                try
		|                {
		|                    var buffer = Encoding.UTF8.GetBytes(text);
		|                    await _webSocket.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Text, true, CancellationToken.None);
		|                    ////_server.OnSentMessage(mes);
		|                    //osdf.DeclarativeForms.GlobalContext().Echo(""Отправлено сервером отправки - "" + text);
		|                }
		|                catch (Exception ex)
		|                {
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""Не удалось отправить _webSocket.SendAsync = "" + ex.StackTrace);
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""text = "" + text);
		|                }
		|            }
		|        }
		|
		|        [ContextProperty(""ПриПолученииСообщения"", ""MessageReceived"")]
		|        public WsSendAction MessageReceived { get; set; }
		|
		|        [ContextMethod(""Действие"", ""Action"")]
		|        public WsSendAction Action(IRuntimeContextInstance script, string methodName)
		|        {
		|            return new WsSendAction(script, methodName);
		|        }
		|
		|        private static void WebServer_ReceivedMessage(object sender, WsSendEventArgs e)
		|        {
		|            if (WebServer.MessageReceived != null)
		|            {
		|                WsSendMessageEventArgs WsSendMessageEventArgs1 = new WsSendMessageEventArgs(e.MessageData);
		|                WsSendMessageEventArgs1.EventAction = WebServer.MessageReceived;
		|                WsSendMessageEventArgs1.Message = e.MessageData;
		|                EventQueue.Enqueue(WsSendMessageEventArgs1);
		|
		|                while (EventQueue.Count > 0)
		|                {
		|                    System.Threading.Thread.Sleep(5);
		|                }
		|            }
		|        }
		|
		|        // Вызывает событие MessageReceived.
		|        // ""message"" - Полученное сообщение.
		|        public void OnReceivedMessage(string message)
		|        {
		|            var handler = ReceivedMessage;
		|            if (handler != null)
		|            {
		|                handler(this, new WsSendEventArgs(message));
		|            }
		|        }
		|    }
		|
		|    public class WsSendEventArgs
		|    {
		|        public string MessageData { get; set; }
		|        public WsSendEventArgs(string messageData)
		|        {
		|            MessageData = messageData;
		|        }
		|    }
		|
		|    [ContextClass(""ВсОтправкиСообщениеАрг"", ""WsSendMessageEventArgs"")]
		|    public class WsSendMessageEventArgs : AutoContext<WsSendMessageEventArgs>
		|    {
		|        public WsSendMessageEventArgs(string p1)
		|        {
		|            message = p1;
		|        }
		|
		|        private WsSendAction eventAction;
		|        [ContextProperty(""Действие"", ""EventAction"")]
		|        public WsSendAction EventAction
		|        {
		|            get { return eventAction; }
		|            set { eventAction = value; }
		|        }
		|
		|        private string message;
		|        [ContextProperty(""Сообщение"", ""Message"")]
		|        public string Message
		|        {
		|            get { return message; }
		|            set { message = value; }
		|        }
		|    }
		|
		|    [ContextClass(""ВсОтправкиДействие"", ""WsSendAction"")]
		|    public class WsSendAction : AutoContext<WsSendAction>
		|    {
		|        public WsSendAction(IRuntimeContextInstance script, string methodName)
		|        {
		|            Script = script;
		|            MethodName = methodName;
		|        }
		|
		|        [ContextProperty(""ИмяМетода"", ""MethodName"")]
		|        public string MethodName { get; set; }
		|
		|        [ContextProperty(""Сценарий"", ""Script"")]
		|        public IRuntimeContextInstance Script { get; set; }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "WebServerReceiving" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System;
		|using System.Net;
		|using System.Net.WebSockets;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine;
		|using System.Threading.Tasks;
		|using System.Collections.Concurrent;
		|using System.Threading;
		|using System.Text;
		|using System.IO;
		|
		|namespace osws
		|{
		|    [ContextClass(""ВебСерверПолученияДекларФорм"", ""WebServerReceivingDeclarForms"")]
		|    public class WebServerReceivingDeclarForms : AutoContext<WebServerReceivingDeclarForms>
		|    {
		|        private static string iPAddress;
		|        private static int port;
		|        public static WebServerReceivingDeclarForms WebServer;
		|        public static WsReceivingMessageEventArgs Event = null;
		|        public static WsReceivingAction EventAction = null;
		|        public static ConcurrentQueue<WsReceivingMessageEventArgs> EventQueue = new ConcurrentQueue<WsReceivingMessageEventArgs>();
		|        // Это событие возникает при получении нового сообщения.
		|        public event EventHandler<WsReceivingEventArgs> ReceivedMessage;
		|        public static WebSocket _webSocket;
		|
		|        [ScriptConstructor]
		|        public static IRuntimeContextInstance Constructor()
		|        {
		|            WebServer = new WebServerReceivingDeclarForms();
		|            WebServer.ReceivedMessage += WebServer_ReceivedMessage;
		|            return WebServer;
		|        }
		|
		|        [ContextProperty(""АргументыСобытия"", ""EventArgs"")]
		|        public WsReceivingMessageEventArgs EventArgs
		|        {
		|            get { return Event; }
		|        }
		|
		|        public static bool goOn = true;
		|        [ContextProperty(""Продолжать"", ""GoOn"")]
		|        public bool GoOn
		|        {
		|            get { return goOn; }
		|            set { goOn = value; }
		|        }
		|
		|        [ContextMethod(""ПолучитьСобытие"", ""DoEvents"")]
		|        public DelegateAction DoEvents()
		|        {
		|            while (EventQueue.Count == 0)
		|            {
		|                System.Threading.Thread.Sleep(7);
		|            }
		|
		|            IValue Action1 = EventHandling();
		|            if (Action1.GetType() == typeof(WsReceivingAction))
		|            {
		|                return DelegateAction.Create(((WsReceivingAction)Action1).Script, ((WsReceivingAction)Action1).MethodName);
		|            }
		|            return (DelegateAction)Action1;
		|        }
		|
		|        public static WsReceivingAction EventHandling()
		|        {
		|            WsReceivingMessageEventArgs EventArgs1;
		|            EventQueue.TryDequeue(out EventArgs1);
		|            Event = EventArgs1;
		|            EventAction = EventArgs1.EventAction;
		|            return EventAction;
		|        }
		|
		|        [ContextMethod(""Начать"", ""Start"")]
		|        public void Start(string p1, int p2)
		|        {
		|            iPAddress = p1;
		|            port = p2;
		|
		|            Wsserver1();
		|        }
		|        public async void Wsserver1()
		|        {
		|            await WsserverStart();
		|        }
		|        static async Task WsserverStart()
		|        {
		|            var listener = new HttpListener();
		|            listener.Prefixes.Add(""http://"" + iPAddress + "":"" + port + ""/"");
		|            try
		|            {
		|                listener.Start();
		|                osdf.DeclarativeForms.webserverReceivingUploaded = true;
		|            }
		|            catch (Exception ex)
		|            {
		|                osdf.DeclarativeForms.GlobalContext().Echo(""ServerReceiving ex.Message = "" + ex.Message);
		|                return;
		|            }
		|
		|            //osdf.DeclarativeForms.GlobalContext().Echo(""WebServerReceiving Listening..."");
		|
		|            while (true)
		|            {
		|                var context = await listener.GetContextAsync();
		|                if (context.Request.IsWebSocketRequest)
		|                {
		|                    await ProcessWebSocketRequest(context);
		|                }
		|                else
		|                {
		|                    context.Response.StatusCode = 400;
		|                    context.Response.Close();
		|                }
		|            }
		|        }
		|
		|        static async Task ProcessWebSocketRequest(HttpListenerContext context)
		|        {
		|            var ws = await context.AcceptWebSocketAsync(subProtocol: null);
		|            _webSocket = ws.WebSocket;
		|            // osdf.DeclarativeForms.GlobalContext().Echo(""WebServerReceiving connected"");
		|
		|            if (!firstTime)
		|            {
		|                osdf.DeclarativeForms.TimeClietnConnected = osdf.DeclarativeForms.GlobalContext().CurrentUniversalDateInMilliseconds();
		|            }
		|
		|            try
		|            {
		|                await Echo(ws.WebSocket);
		|            }
		|            catch (Exception)
		|            {
		|                //osdf.DeclarativeForms.GlobalContext().Echo(""WebServerReceiving ex.Message = "" + ex.Message);
		|
		|                if (osdf.DeclarativeForms.instance.OpenInBrowser)
		|                {
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""Произошло не корректное обновление страницы ("" + osdf.DeclarativeForms.GlobalContext().CurrentUniversalDate() + "")."");
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""Повторно обновите страницу."");
		|                }
		|            }
		|        }
		|
		|        private static bool firstTime = true;
		|        static async Task Echo(WebSocket ws)
		|        {
		|            var buffer = new ArraySegment<byte>(new byte[2048]);
		|            while (true)
		|            {
		|                if (ws.State != WebSocketState.Aborted)
		|                {
		|                    WebSocketReceiveResult result;
		|                    var ms = new MemoryStream();
		|                    do
		|                    {
		|                        result = await ws.ReceiveAsync(buffer, CancellationToken.None);
		|                        ms.Write(buffer.Array, buffer.Offset, result.Count);
		|                    } while (!result.EndOfMessage);
		|
		|                    ms.Seek(0, SeekOrigin.Begin);
		|                    if (result.MessageType == WebSocketMessageType.Text)
		|                    {
		|                        var reader = new StreamReader(ms, Encoding.UTF8);
		|                        string ts = await reader.ReadToEndAsync();
		|                        //////osdf.DeclarativeForms.GlobalContext().Echo(""4Received message: "" + ts);
		|                        WebServer.OnReceivedMessage(ts); // Без этой строки не будут работать события.
		|
		|                        if (ts == ""mainForm|loaded"" && !firstTime) // строка нужна для запуска после перезагрузки
		|                        {
		|                            string message = osdf.DeclarativeForms.InitialStrFunctions;
		|                            var bytes = System.Text.Encoding.UTF8.GetBytes(message);
		|                            await ws.SendAsync(new ArraySegment<byte>(bytes, 0, bytes.Length), WebSocketMessageType.Text, true, CancellationToken.None);
		|                        }
		|                        firstTime = false;
		|                    }
		|                    else if (result.MessageType == WebSocketMessageType.Close)
		|                    {
		|                        // После закрытия соединения с клиентом возможно подключится новый клиент и через короткий промежуток. 
		|                        // Не больше 100 миллисекунд. Значит было произведено обновление страницы и закрывать программу не нужно.
		|                        // Если в течении секунды новый клиент не подключился, значит вкладка с программой была закрыта и
		|                        // следует закрыть программу.
		|
		|                        if (!firstTime)
		|                        {
		|                            osdf.DeclarativeForms.TimeClietnClosed = osdf.DeclarativeForms.GlobalContext().CurrentUniversalDateInMilliseconds();
		|                        }
		|
		|                        // osdf.DeclarativeForms.GlobalContext().Echo(""WebServerReceiving closed"");
		|                        break;
		|                    }
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""ОтправитьТекст"", ""SendText"")]
		|        public void SendText(string text)
		|        {
		|            SendText1(text);
		|        }
		|        public async void SendText1(string text)
		|        {
		|            await Send(text);
		|        }
		|        static async Task Send(string text)
		|        {
		|            if (_webSocket.State == WebSocketState.Open)
		|            {
		|                try
		|                {
		|                    var buffer = Encoding.UTF8.GetBytes(text);
		|                    await _webSocket.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Text, true, CancellationToken.None);
		|                    ////_server.OnSentMessage(mes);
		|                    //osdf.DeclarativeForms.GlobalContext().Echo(""Отправлено сервером получения - "" + text);
		|                }
		|                catch (Exception ex)
		|                {
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""Не удалось отправить _webSocket.SendAsync = "" + ex.StackTrace);
		|                    osdf.DeclarativeForms.GlobalContext().Echo(""text = "" + text);
		|                }
		|            }
		|        }
		|
		|        [ContextProperty(""ПриПолученииСообщения"", ""MessageReceived"")]
		|        public WsReceivingAction MessageReceived { get; set; }
		|
		|        [ContextMethod(""Действие"", ""Action"")]
		|        public WsReceivingAction Action(IRuntimeContextInstance script, string methodName)
		|        {
		|            return new WsReceivingAction(script, methodName);
		|        }
		|
		|        private static void WebServer_ReceivedMessage(object sender, WsReceivingEventArgs e)
		|        {
		|            if (WebServer.MessageReceived != null)
		|            {
		|                WsReceivingMessageEventArgs WsReceivingMessageEventArgs1 = new WsReceivingMessageEventArgs(e.MessageData);
		|                WsReceivingMessageEventArgs1.EventAction = WebServer.MessageReceived;
		|                WsReceivingMessageEventArgs1.Message = e.MessageData;
		|                EventQueue.Enqueue(WsReceivingMessageEventArgs1);
		|
		|                while (EventQueue.Count > 0)
		|                {
		|                    System.Threading.Thread.Sleep(5);
		|                }
		|            }
		|        }
		|
		|        // Вызывает событие MessageReceived.
		|        // ""message"" - Полученное сообщение.
		|        public void OnReceivedMessage(string message)
		|        {
		|            var handler = ReceivedMessage;
		|            if (handler != null)
		|            {
		|                handler(this, new WsReceivingEventArgs(message));
		|            }
		|        }
		|    }
		|
		|    public class WsReceivingEventArgs
		|    {
		|        public string MessageData { get; set; }
		|        public WsReceivingEventArgs(string messageData)
		|        {
		|            MessageData = messageData;
		|        }
		|    }
		|
		|    [ContextClass(""ВсПолученияСообщениеАрг"", ""WsReceivingMessageEventArgs"")]
		|    public class WsReceivingMessageEventArgs : AutoContext<WsReceivingMessageEventArgs>
		|    {
		|        public WsReceivingMessageEventArgs(string p1)
		|        {
		|            message = p1;
		|        }
		|
		|        private WsReceivingAction eventAction;
		|        [ContextProperty(""Действие"", ""EventAction"")]
		|        public WsReceivingAction EventAction
		|        {
		|            get { return eventAction; }
		|            set { eventAction = value; }
		|        }
		|
		|        private string message;
		|        [ContextProperty(""Сообщение"", ""Message"")]
		|        public string Message
		|        {
		|            get { return message; }
		|            set { message = value; }
		|        }
		|    }
		|
		|    [ContextClass(""ВсПолученияДействие"", ""WsReceivingAction"")]
		|    public class WsReceivingAction : AutoContext<WsReceivingAction>
		|    {
		|        public WsReceivingAction(IRuntimeContextInstance script, string methodName)
		|        {
		|            Script = script;
		|            MethodName = methodName;
		|        }
		|
		|        [ContextProperty(""ИмяМетода"", ""MethodName"")]
		|        public string MethodName { get; set; }
		|
		|        [ContextProperty(""Сценарий"", ""Script"")]
		|        public IRuntimeContextInstance Script { get; set; }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Background" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфФон"", ""DfBackground"")]
		|    public class DfBackground : AutoContext<DfBackground>
		|    {
		|        public DfBackground(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8)
		|        {
		|            BackgroundColor = p1;
		|            BackgroundImage = p2;
		|            BackgroundRepeat = p3;
		|            BackgroundPosition = p4;
		|            BackgroundOrigin = p5;
		|            BackgroundClip = p6;
		|            BackgroundSize = p7;
		|            BackgroundAttachment = p8;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue backgroundColor;
		|        [ContextProperty(""ЦветФона"", ""BackgroundColor"")]
		|        public IValue BackgroundColor
		|        {
		|            get { return backgroundColor; }
		|            set { backgroundColor = value; }
		|        }
		|
		|        private IValue backgroundImage;
		|        [ContextProperty(""ФоновоеИзображение"", ""BackgroundImage"")]
		|        public IValue BackgroundImage
		|        {
		|            get { return backgroundImage; }
		|            set { backgroundImage = value; }
		|        }
		|
		|        private IValue backgroundRepeat;
		|        [ContextProperty(""МозаикаКартинки"", ""BackgroundRepeat"")]
		|        public IValue BackgroundRepeat
		|        {
		|            get { return backgroundRepeat; }
		|            set { backgroundRepeat = value; }
		|        }
		|
		|        private IValue backgroundPosition;
		|        [ContextProperty(""ПоложениеКартинки"", ""BackgroundPosition"")]
		|        public IValue BackgroundPosition
		|        {
		|            get { return backgroundPosition; }
		|            set { backgroundPosition = value; }
		|        }
		|
		|        private IValue backgroundOrigin;
		|        [ContextProperty(""ОбластьКартинки"", ""BackgroundOrigin"")]
		|        public IValue BackgroundOrigin
		|        {
		|            get { return backgroundOrigin; }
		|            set { backgroundOrigin = value; }
		|        }
		|
		|        private IValue backgroundClip;
		|        [ContextProperty(""ОбластьРисования"", ""BackgroundClip"")]
		|        public IValue BackgroundClip
		|        {
		|            get { return backgroundClip; }
		|            set { backgroundClip = value; }
		|        }
		|
		|        private IValue backgroundSize;
		|        [ContextProperty(""РазмерКартинки"", ""BackgroundSize"")]
		|        public IValue BackgroundSize
		|        {
		|            get { return backgroundSize; }
		|            set { backgroundSize = value; }
		|        }
		|
		|        private IValue backgroundAttachment;
		|        [ContextProperty(""ФоновоеВложение"", ""BackgroundAttachment"")]
		|        public IValue BackgroundAttachment
		|        {
		|            get { return backgroundAttachment; }
		|            set { backgroundAttachment = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "PerspectiveOrigin" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфИсточникПерспективы"", ""DfPerspectiveOrigin"")]
		|    public class DfPerspectiveOrigin : AutoContext<DfPerspectiveOrigin>
		|    {
		|        public DfPerspectiveOrigin(IValue p1, IValue p2)
		|        {
		|            X = p1;
		|            Y = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "AnimationProperties" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфСвойстваАнимации"", ""DfAnimationProperties"")]
		|    public class DfAnimationProperties : AutoContext<DfAnimationProperties>
		|    {
		|        public DfAnimationProperties(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8)
		|        {
		|            AnimationName = p1;
		|            AnimationDuration = p2;
		|            AnimationTimingFunction = p3;
		|            AnimationDelay = p4;
		|            AnimationIterationCount = p5;
		|            AnimationDirection = p6;
		|            AnimationFillMode = p7;
		|            AnimationPlayState = p8;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private IValue animationDuration;
		|        [ContextProperty(""ДлительностьАнимации"", ""AnimationDuration"")]
		|        public IValue AnimationDuration
		|        {
		|            get { return animationDuration; }
		|            set { animationDuration = value; }
		|        }
		|
		|        private IValue animationDelay;
		|        [ContextProperty(""ЗадержкаАнимации"", ""AnimationDelay"")]
		|        public IValue AnimationDelay
		|        {
		|            get { return animationDelay; }
		|            set { animationDelay = value; }
		|        }
		|
		|        private IValue animationFillMode;
		|        [ContextProperty(""ЗаливкаАнимации"", ""AnimationFillMode"")]
		|        public IValue AnimationFillMode
		|        {
		|            get { return animationFillMode; }
		|            set { animationFillMode = value; }
		|        }
		|
		|        private IValue animationName;
		|        [ContextProperty(""ИмяАнимации"", ""AnimationName"")]
		|        public IValue AnimationName
		|        {
		|            get { return animationName; }
		|            set { animationName = value; }
		|        }
		|
		|        private IValue animationIterationCount;
		|        [ContextProperty(""КоличествоПовторов"", ""AnimationIterationCount"")]
		|        public IValue AnimationIterationCount
		|        {
		|            get { return animationIterationCount; }
		|            set { animationIterationCount = value; }
		|        }
		|
		|        private IValue animationDirection;
		|        [ContextProperty(""НаправлениеАнимации"", ""AnimationDirection"")]
		|        public IValue AnimationDirection
		|        {
		|            get { return animationDirection; }
		|            set { animationDirection = value; }
		|        }
		|
		|        private IValue animationPlayState;
		|        [ContextProperty(""Состояние"", ""AnimationPlayState"")]
		|        public IValue AnimationPlayState
		|        {
		|            get { return animationPlayState; }
		|            set { animationPlayState = value; }
		|        }
		|
		|        private IValue animationTimingFunction;
		|        [ContextProperty(""ФункцияСинхронизации"", ""AnimationTimingFunction"")]
		|        public IValue AnimationTimingFunction
		|        {
		|            get { return animationTimingFunction; }
		|            set { animationTimingFunction = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "AnimationOptions" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|using System.IO;
		|using System;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПараметрыАнимации"", ""DfAnimationOptions"")]
		|    public class DfAnimationOptions : AutoContext<DfAnimationOptions>
		|    {
		|        public DfAnimationOptions(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7)
		|        {
		|            string s = ""{ "";
		|            if (p1 != null)
		|            {
		|                Duration = Convert.ToInt32(p1.AsNumber());
		|                s += ""\u0022duration\u0022: "" + Duration;
		|            }
		|            if (p2 != null)
		|            {
		|                Easing = p2.AsString();
		|                s += "", \u0022easing\u0022: \u0022"" + Easing + ""\u0022"";
		|            }
		|            if (p3 != null)
		|            {
		|                Delay = Convert.ToInt32(p3.AsNumber());
		|                s += "", \u0022delay\u0022: "" + Delay;
		|            }
		|            if (p4 != null)
		|            {
		|                if (Convert.ToInt32(p4.AsNumber()) == -1)
		|                {
		|                    Iterations = -1;
		|                    s += "", \u0022iterations\u0022: \u0022Infinity\u0022"";
		|                }
		|                else
		|                {
		|                    Iterations = Convert.ToInt32(p4.AsNumber());
		|                    s += "", \u0022iterations\u0022: "" + Iterations;
		|                }
		|            }
		|            if (p5 != null)
		|            {
		|                Direction = p5.AsString();
		|                s += "", \u0022direction\u0022: \u0022"" + Direction + ""\u0022"";
		|            }
		|            if (p6 != null)
		|            {
		|                Fill = p6.AsString();
		|                s += "", \u0022fill\u0022: \u0022"" + Fill + ""\u0022"";
		|            }
		|            if (p7 != null)
		|            {
		|                EndDelay = Convert.ToInt32(p7.AsNumber());
		|                s += "", \u0022endDelay\u0022: "" + EndDelay;
		|            }
		|            s += "" }"";
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', JSON.parse('"" + s + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|
		|            strFunc = ""mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private int duration = 0;
		|        [ContextProperty(""Длительность"", ""Duration"")]
		|        public int Duration
		|        {
		|            get { return duration; }
		|            private set { duration = value; }
		|        }
		|
		|        private string easing;
		|        [ContextProperty(""ФункцияСинхронизации"", ""Easing"")]
		|        public string Easing
		|        {
		|            get { return easing; }
		|            private set { easing = value; }
		|        }
		|
		|        private int delay;
		|        [ContextProperty(""Задержка"", ""Delay"")]
		|        public int Delay
		|        {
		|            get { return delay; }
		|            private set { delay = value; }
		|        }
		|
		|        private int iterations;
		|        [ContextProperty(""КоличествоПовторов"", ""Iterations"")]
		|        public int Iterations
		|        {
		|            get { return iterations; }
		|            private set { iterations = value; }
		|        }
		|
		|        private string direction;
		|        [ContextProperty(""Направление"", ""Direction"")]
		|        public string Direction
		|        {
		|            get { return direction; }
		|            private set { direction = value; }
		|        }
		|
		|        private string fill;
		|        [ContextProperty(""Заливка"", ""Fill"")]
		|        public string Fill
		|        {
		|            get { return fill; }
		|            private set { fill = value; }
		|        }
		|
		|        private int endDelay;
		|        [ContextProperty(""ЗадержкаПосле"", ""EndDelay"")]
		|        public int EndDelay
		|        {
		|            get { return endDelay; }
		|            private set { endDelay = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Frames" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.HostedScript.Library;
		|using System.Reflection;
		|using System.IO;
		|using System.Linq;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКадры"", ""DfFrames"")]
		|    public class DfFrames : AutoContext<DfFrames>
		|    {
		|        public DfFrames()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', []);"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string name;
		|        [ContextProperty(""Имя"", ""Name"")]
		|        public string Name
		|        {
		|            get { return name; }
		|            set { name = value; }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        [ContextMethod(""Добавить"", ""Add"")]
		|        public void Add(DfStyle p1 = null)
		|        {
		|            // Получим свойства стиля и их значения.
		|            ArrayImpl arr = new ArrayImpl();
		|
		|            System.Reflection.PropertyInfo[] myPropertyInfo = p1.GetType().GetProperties();
		|            for (int i = 0; i < myPropertyInfo.Length; i++)
		|            {
		|                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
		|                {
		|                    string NameRu = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
		|                    string NameEn = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
		|                    try
		|                    {
		|                        if (NameEn != ""ItemKey"" && NameEn != ""Name"")
		|                        {
		|                            object propValue = p1.GetType().GetProperty(NameEn).GetValue(p1);
		|                            if (propValue != null)
		|                            {
		|                                string attr = DeclarativeForms.namesStyleProps[NameRu][2].ToString();
		|                                string attrCSS = DeclarativeForms.namesStyleProps[NameRu][3].ToString();
		|                                string attrValue = (string)p1.GetType().GetProperty(""res"" + attr).GetValue(p1);
		|                                if (attrValue.Contains(""px"")
		|                                     || attrValue.Contains(""rgb("")
		|                                     || attrValue.Contains(""scale("")
		|                                     || attrValue.Contains(""scale3d("")
		|                                     || attrValue.Contains(""scaleX("")
		|                                     || attrValue.Contains(""scaleY("")
		|                                     || attrValue.Contains(""scaleZ("")
		|                                     || attrValue.Contains(""skew("")
		|                                     || attrValue.Contains(""skewX("")
		|                                     || attrValue.Contains(""skewY("")
		|                                     || attrValue.Contains(""rotate("")
		|                                     || attrValue.Contains(""rotate3d("")
		|                                     || attrValue.Contains(""rotateX("")
		|                                     || attrValue.Contains(""rotateY("")
		|                                     || attrValue.Contains(""rotateZ("")
		|                                     || attrValue.Contains(""perspective("")
		|                                     || attrValue.Contains(""blur("")
		|                                     || attrValue.Contains(""brightness("")
		|                                     || attrValue.Contains(""contrast("")
		|                                     || attrValue.Contains(""shadow("")
		|                                     || attrValue.Contains(""invert("")
		|                                     || attrValue.Contains(""opacity("")
		|                                     || attrValue.Contains(""saturate("")
		|                                     || attrValue.Contains(""sepia("")
		|                                     || attrValue.Contains(""url("")
		|                                     || attrValue.Contains(""inset"")
		|                                     || attrValue.Contains(""decimal"")
		|                                     || attrValue.Contains(""outside"")
		|                                     || attrValue.Contains(""none"")
		|                                     || attrValue.Contains(""medium"")
		|                                     || attrValue.Contains(""baseline"")
		|                                     || attrValue.Contains(""stretch"")
		|                                     || attrValue.Contains(""auto"")		
		|                                    )
		|                                {
		|                                    arr.Add(ValueFactory.Create(""\u0022"" + attrCSS + ""\u0022: \u0022"" + attrValue + ""\u0022""));
		|                                }
		|                                else
		|                                {
		|                                    arr.Add(ValueFactory.Create(""\u0022"" + attrCSS + ""\u0022: "" + attrValue + "" ""));
		|                                }
		|                            }
		|                        }
		|                    }
		|                    catch { }
		|                }
		|            }
		|            string s = ""{ "";
		|            if (arr.Count() > 0)
		|            {
		|                s += arr.Get(0).AsString();
		|            }
		|            for (int i1 = 1; i1 < arr.Count(); i1++)
		|            {
		|                s += "", "" + arr.Get(i1).AsString();
		|            }
		|            s += "" }"";
		|
		|            if (s != ""{  }"")
		|            {
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')[mapKeyEl.get('"" + ItemKey + ""').length] = JSON.parse('"" + s + ""');"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Animation" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|using System.IO;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфАнимация"", ""DfAnimation"")]
		|    public class DfAnimation : AutoContext<DfAnimation>
		|    {
		|        public DfAnimation(string p1, DfFrames p2, DfAnimationOptions p3)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + p1 + ""').animate(mapKeyEl.get('"" + p2.ItemKey + ""'), mapKeyEl.get('"" + p3.ItemKey + ""')));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.strFunctions = DeclarativeForms.strFunctions + strFunc + ""; "";
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|		
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        [ContextMethod(""Завершить"", ""Finish"")]
		|        public void Finish()
		|        {
		|            string strFunc = """" +
		|                ""let el = mapKeyEl.get('"" + ItemKey + ""');"" +
		|                ""try"" +
		|                ""{"" +
		|                ""    el.finish();"" +
		|                ""}"" +
		|                ""catch { }"" +
		|                """";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Запустить"", ""Play"")]
		|        public void Play()
		|        {
		|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).play();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Отменить"", ""Cancel"")]
		|        public void Cancel()
		|        {
		|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).cancel();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Пауза"", ""Pause"")]
		|        public void Pause()
		|        {
		|            string strFunc = ""mapKeyEl.get(\u0022"" + ItemKey + ""\u0022).pause();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "RadialGradient" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфРадиальныйГрадиент"", ""DfRadialGradient"")]
		|    public class DfRadialGradient : AutoContext<DfRadialGradient>
		|    {
		|        public DfRadialGradient(string ownerItemKey, int p1, int p2, int p3, int p4, int p5, int p6)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + ownerItemKey + ""').createRadialGradient('"" + p1 + ""', '"" + p2 + ""', '"" + p3 + ""', '"" + p4 + ""', '"" + p5 + ""', '"" + p6 + ""'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private DfContext2d owner;
		|        public DfContext2d Owner
		|        {
		|            get { return owner; }
		|            set { owner = value; }
		|        }
		|
		|        [ContextMethod(""ДобавитьОстановкуГрадиента"", ""AddColorStop"")]
		|        public void AddColorStop(IValue p1, string p2)
		|        {
		|            string strFunc = @""
		|            mapKeyEl.get('"" + ItemKey + ""').addColorStop('"" + p1.AsNumber().ToString().Replace("","", ""."") + ""', '"" + p2 + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ImageData" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфДанныеРисунка"", ""DfImageData"")]
		|    public class DfImageData : AutoContext<DfImageData>
		|    {
		|        public DfImageData(string ownerItemKey, int p1, int p2)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + ownerItemKey + ""').createImageData("" + p1 + "", "" + p2 + ""));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            Width = p1;
		|            Height = p2;
		|        }
		|
		|        public DfImageData(string ownerItemKey, DfImageData p1)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + ownerItemKey + ""').createImageData(mapKeyEl.get('"" + p1.ItemKey + ""')));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            Width = p1.Width;
		|            Height = p1.Height;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private DfContext2d owner;
		|        public DfContext2d Owner
		|        {
		|            get { return owner; }
		|            set { owner = value; }
		|        }
		|
		|        public int height { get; set; }
		|        [ContextProperty(""Высота"", ""Height"")]
		|        public int Height
		|        {
		|            get { return height; }
		|            set
		|            {
		|                height = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['height'] = "" + height + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public int width { get; set; }
		|        [ContextProperty(""Ширина"", ""Width"")]
		|        public int Width
		|        {
		|            get { return width; }
		|            set
		|            {
		|                width = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['width'] = "" + width + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|		
		|        public string сolor { get; set; }
		|        [ContextProperty(""Цвет"", ""Color"")]
		|        public string Color
		|        {
		|            get { return сolor; }
		|            set
		|            {
		|                сolor = value;
		|                string strFunc = """" +
		|                    ""let el = mapKeyEl.get('"" + ItemKey + ""');"" +
		|                    ""const num = '"" + сolor + ""'.replace('rgb(', '').replace(')', '').replace(',', '').split(' ');"" +
		|                    ""for (let i = 0; i < el.data.length; i += 4)"" +
		|                    ""{"" +
		|                    ""    el.data[i + 0] = num[0];"" +
		|                    ""    el.data[i + 1] = num[1];"" +
		|                    ""    el.data[i + 2] = num[2];"" +
		|                    ""    el.data[i + 3] = 255;"" +
		|                    ""}"" +
		|                    """";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }		
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Math" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМатематика"", ""DfMath"")]
		|    public class DfMath : AutoContext<DfMath>
		|    {
		|        [ContextProperty(""Е"", ""E"")]
		|        public double E
		|        {
		|            get { return System.Math.E; }
		|        }
		|
		|        [ContextProperty(""Пи"", ""PI"")]
		|        public double PI
		|        {
		|            get { return System.Math.PI; }
		|        }
		|
		|        [ContextMethod(""Абсолютное"", ""Abs"")]
		|        public decimal Abs(decimal p1)
		|        {
		|            return System.Math.Abs(p1);
		|        }
		|
		|        [ContextMethod(""АКосинус"", ""Acos"")]
		|        public double Acos(double p1)
		|        {
		|            return System.Math.Acos(p1);
		|        }
		|
		|        [ContextMethod(""АСинус"", ""Asin"")]
		|        public double Asin(double p1)
		|        {
		|            return System.Math.Asin(p1);
		|        }
		|
		|        [ContextMethod(""АТангенс"", ""Atan"")]
		|        public double Atan(double p1)
		|        {
		|            return System.Math.Atan(p1);
		|        }
		|
		|        [ContextMethod(""АТангенс2"", ""Atan2"")]
		|        public double Atan2(double p1, double p2)
		|        {
		|            return System.Math.Atan2(p1, p2);
		|        }
		|
		|        [ContextMethod(""Большее"", ""Max"")]
		|        public decimal Max(decimal p1, decimal p2)
		|        {
		|            return System.Math.Max(p1, p2);
		|        }
		|
		|        [ContextMethod(""ГКосинус"", ""Cosh"")]
		|        public double Cosh(double p1)
		|        {
		|            return System.Math.Cosh(p1);
		|        }
		|
		|        [ContextMethod(""ГСинус"", ""Sinh"")]
		|        public double Sinh(double p1)
		|        {
		|            return System.Math.Sinh(p1);
		|        }
		|
		|        [ContextMethod(""ГТангенс"", ""Tanh"")]
		|        public double Tanh(double p1)
		|        {
		|            return System.Math.Tanh(p1);
		|        }
		|
		|        [ContextMethod(""Знак"", ""Sign"")]
		|        public int Sign(decimal p1)
		|        {
		|            return System.Math.Sign(p1);
		|        }
		|
		|        [ContextMethod(""ККорень"", ""Sqrt"")]
		|        public double Sqrt(double p1)
		|        {
		|            return System.Math.Sqrt(p1);
		|        }
		|
		|        [ContextMethod(""Косинус"", ""Cos"")]
		|        public double Cos(double p1)
		|        {
		|            return System.Math.Cos(p1);
		|        }
		|
		|        [ContextMethod(""Логарифм"", ""Log"")]
		|        public double Log(double p1)
		|        {
		|            return System.Math.Log(p1);
		|        }
		|
		|        [ContextMethod(""Логарифм10"", ""Log10"")]
		|        public double Log10(double p1)
		|        {
		|            return System.Math.Log10(p1);
		|        }
		|
		|        [ContextMethod(""Меньшее"", ""Min"")]
		|        public decimal Min(decimal p1, decimal p2)
		|        {
		|            return System.Math.Min(p1, p2);
		|        }
		|
		|        [ContextMethod(""НаибольшееЦелое"", ""Floor"")]
		|        public double Floor(double p1)
		|        {
		|            return System.Math.Floor(p1);
		|        }
		|
		|        [ContextMethod(""НаименьшееЦел"", ""Ceiling"")]
		|        public double Ceiling(double p1)
		|        {
		|            return System.Math.Ceiling(p1);
		|        }
		|
		|        [ContextMethod(""Окр"", ""Round"")]
		|        public double Round(double p1, int p2)
		|        {
		|            return System.Math.Round(p1, p2);
		|        }
		|
		|        [ContextMethod(""ОстатокДеления"", ""DivRem"")]
		|        public decimal DivRem(decimal p1, decimal p2)
		|        {
		|            return p1 % p2;
		|        }
		|
		|        [ContextMethod(""Синус"", ""Sin"")]
		|        public double Sin(double p1)
		|        {
		|            return System.Math.Sin(p1);
		|        }
		|
		|        [ContextMethod(""Случайное"", ""Random"")]
		|        public double Random()
		|        {
		|            return DeclarativeForms.Random.NextDouble();
		|        }
		|
		|        [ContextMethod(""Степень"", ""Pow"")]
		|        public double Pow(double p1, double p2)
		|        {
		|            return System.Math.Pow(p1, p2);
		|        }
		|
		|        [ContextMethod(""Тангенс"", ""Tan"")]
		|        public double Tan(double p1)
		|        {
		|            return System.Math.Tan(p1);
		|        }
		|
		|        [ContextMethod(""Целое"", ""Truncate"")]
		|        public decimal Truncate(decimal p1)
		|        {
		|            return System.Math.Truncate(p1);
		|        }
		|
		|        [ContextMethod(""Четное"", ""Even"")]
		|        public IValue Even(IValue p1)
		|        {
		|            if (p1.AsNumber() - (System.Math.Floor(p1.AsNumber())) > 0)
		|            {
		|                return null;
		|            }
		|            return ValueFactory.Create((p1.AsNumber() % 2) == 0);
		|        }
		|
		|        [ContextMethod(""Экспонента"", ""Exp"")]
		|        public double Exp(double p1)
		|        {
		|            return System.Math.Exp(p1);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "LinearGradient" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЛинейныйГрадиент"", ""DfLinearGradient"")]
		|    public class DfLinearGradient : AutoContext<DfLinearGradient>
		|    {
		|        public DfLinearGradient(string ownerItemKey, int p1, int p2, int p3, int p4)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + ownerItemKey + ""').createLinearGradient('"" + p1 + ""', '"" + p2 + ""', '"" + p3 + ""', '"" + p4 + ""'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private DfContext2d owner;
		|        public DfContext2d Owner
		|        {
		|            get { return owner; }
		|            set { owner = value; }
		|        }
		|
		|        [ContextMethod(""ДобавитьОстановкуГрадиента"", ""AddColorStop"")]
		|        public void AddColorStop(IValue p1, string p2)
		|        {
		|            string strFunc = @""
		|            mapKeyEl.get('"" + ItemKey + ""').addColorStop('"" + p1.AsNumber().ToString().Replace("","", ""."") + ""', '"" + p2 + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Context2d" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System;
		|using System.IO;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКонтекст2d"", ""DfContext2d"")]
		|    public class DfContext2d : AutoContext<DfContext2d>
		|    {
		|        public DfContext2d(string ownerItemKey)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', mapKeyEl.get('"" + ownerItemKey + ""').getContext('2d'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        private DfCanvas owner;
		|        public DfCanvas Owner
		|        {
		|            get { return owner; }
		|            set { owner = value; }
		|        }
		|
		|        [ContextMethod(""ЗаполнитьПрямоугольник"", ""FillRect"")]
		|        public void FillRect(int p1, int p2, int p3, int p4)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').fillRect("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Прямоугольник"", ""Rect"")]
		|        public void Rect(int p1, int p2, int p3, int p4)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').rect("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""СоздатьЛинейныйГрадиент"", ""CreateLinearGradient"")]
		|        public DfLinearGradient CreateLinearGradient(int p1, int p2, int p3, int p4)
		|        {
		|            DfLinearGradient DfLinearGradient1 = new DfLinearGradient(ItemKey, p1, p2, p3, p4);
		|            DfLinearGradient1.Owner = this;
		|            return DfLinearGradient1;
		|        }
		|
		|        public IValue fillStyle { get; set; }
		|        [ContextProperty(""СтильЗаполнения"", ""FillStyle"")]
		|        public IValue FillStyle
		|        {
		|            get { return fillStyle; }
		|            set
		|            {
		|                fillStyle = value;
		|                string strFunc;
		|                if (fillStyle.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['fillStyle'] = '"" + fillStyle + ""';"";
		|                }
		|                else
		|                {
		|                    strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['fillStyle'] = mapKeyEl.get('"" + ((dynamic)fillStyle).ItemKey + ""');"";
		|                }
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|		
		|        [ContextMethod(""НачатьПуть"", ""BeginPath"")]
		|        public void BeginPath()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').beginPath();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Начертить"", ""Stroke"")]
		|        public void Stroke()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').stroke();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Дуга"", ""Arc"")]
		|        public void Arc(int p1, int p2, int p3, IValue p4, IValue p5, bool p6 = false)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').arc("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4.AsNumber().ToString().Replace("","", ""."") + "", "" + p5.AsNumber().ToString().Replace("","", ""."") + "", "" + p6.ToString().ToLower() + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|		
		|        [ContextMethod(""ДугаМежду"", ""ArcTo"")]
		|        public void ArcTo(int p1, int p2, int p3, int p4, int p5)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').arcTo("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "", "" + p5 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""ПерейтиКТочке"", ""MoveTo"")]
		|        public void MoveTo(int p1, int p2)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').moveTo("" + p1 + "", "" + p2 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Линия"", ""LineTo"")]
		|        public void LineTo(int p1, int p2)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').lineTo("" + p1 + "", "" + p2 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""ДобавитьКубическуюБизье"", ""BezierCurveTo"")]
		|        public void BezierCurveTo(int p1, int p2, int p3, int p4, int p5, int p6)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').bezierCurveTo("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "", "" + p5 + "", "" + p6 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""ОчиститьПрямоугольник"", ""ClearRect"")]
		|        public void ClearRect(int p1, int p2, int p3, int p4)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').clearRect("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Обрезать"", ""Clip"")]
		|        public void Clip()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').clip();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""ЗакончитьПуть"", ""ClosePath"")]
		|        public void ClosePath()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').closePath();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""СоздатьДанныеРисунка"", ""CreateImageData"")]
		|        public DfImageData CreateImageData(IValue p1, int p2 = 0)
		|        {
		|            DfImageData DfImageData1;
		|            if (p1.GetType() == typeof(DfImageData))
		|            {
		|                DfImageData1 = new DfImageData(ItemKey, (DfImageData)p1);
		|            }
		|            else
		|            {
		|                DfImageData1 = new DfImageData(ItemKey, Convert.ToInt32(p1.AsNumber()), p2);
		|            }
		|            DfImageData1.Owner = this;
		|            return DfImageData1;
		|        }
		|
		|        [ContextMethod(""ПоместитьДанныеРисунка"", ""PutImageData"")]
		|        public void PutImageData(DfImageData p1, int p2, int p3, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').putImageData(mapKeyEl.get('"" + p1.ItemKey + ""'), "" + p2 + "", "" + p3 + "");"";
		|            if (p4 != null && p5 != null && p6 != null && p7 != null)
		|            {
		|                strFunc = @""mapKeyEl.get('"" + ItemKey + ""').putImageData(mapKeyEl.get('"" + p1.ItemKey + ""'), "" + p2 + "", "" + p3 + "", "" + p4 + "", "" + p5 + "", "" + p6 + "", "" + p7 + "");"";
		|            }
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Заполнить"", ""Fill"")]
		|        public void Fill()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').fill();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|		
		|        [ContextMethod(""Замостить"", ""Pave"")]
		|        public void Pave(DfImage p1, string p2, int p3, int p4, int p5, int p6)
		|        {
		|            string strFunc = """" +
		|                ""let img = mapKeyEl.get('"" + p1.ItemKey + ""');"" +
		|                ""let ctx = mapKeyEl.get('"" + ItemKey + ""');"" +
		|                ""img.onload = function()"" +
		|                ""{"" +
		|                ""    ctx.rect("" + p3 + "", "" + p4 + "", "" + p5 + "", "" + p6 + "");"" +
		|                ""    ctx.fillStyle = ctx.createPattern(img, '"" + p2 + ""');"" +
		|                ""    ctx.fill();"" +
		|                ""}"" +
		|                """";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""СоздатьРадиальныйГрадиент"", ""CreateRadialGradient"")]
		|        public DfRadialGradient CreateRadialGradient(int p1, int p2, int p3, int p4, int p5, int p6)
		|        {
		|            DfRadialGradient DfRadialGradient1 = new DfRadialGradient(ItemKey, p1, p2, p3, p4, p5, p6);
		|            DfRadialGradient1.Owner = this;
		|            return DfRadialGradient1;
		|        }
		|
		|        public DfFont font { get; set; }
		|        [ContextProperty(""Шрифт"", ""Font"")]
		|        public DfFont Font
		|        {
		|            get { return font; }
		|            set
		|            {
		|                font = value;
		|                if (Owner != null)
		|                {
		|                    string fontStyle = """";
		|                    string fontVariant = """";
		|                    string fontWeight = """";
		|                    string fontSize = ""100%"";
		|                    string lineHeight = ""100%"";
		|                    string fontFamily = """";
		|                    if (font.FontStyle != null)
		|                    {
		|                        fontStyle = font.FontStyle.AsString() + "" "";
		|                    }
		|                    if (font.FontVariant != null)
		|                    {
		|                        fontVariant = font.FontVariant.AsString() + "" "";
		|                    }
		|                    if (font.FontWeight != null)
		|                    {
		|                        fontWeight = font.FontWeight.AsString() + "" "";
		|                    }
		|                    if (font.FontSize != null)
		|                    {
		|                        fontSize = """" + font.FontSize.AsNumber() + ""px"";
		|                    }
		|                    if (font.LineHeight != null)
		|                    {
		|                        lineHeight = """" + font.LineHeight.AsNumber() + ""px"";
		|                    }
		|                    if (font.FontFamily != null)
		|                    {
		|                        fontFamily = font.FontFamily.AsString() + "" "";
		|                    }
		|                    string res = fontStyle + fontVariant + fontWeight + fontSize + ""/"" + lineHeight + "" "" + fontFamily;
		|                    string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['font'] = '"" + res + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""ЗаполнитьТекст"", ""FillText"")]
		|        public void FillText(string p1, int p2, int p3, IValue p4 = null)
		|        {
		|            string strFunc;
		|            if (p4 != null)
		|            {
		|                strFunc = @""mapKeyEl.get('"" + ItemKey + ""').fillText('"" + p1 + ""', "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            }
		|            else
		|            {
		|                strFunc = @""mapKeyEl.get('"" + ItemKey + ""').fillText('"" + p1 + ""', "" + p2 + "", "" + p3 + "");"";
		|            }
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public string direction { get; set; }
		|        [ContextProperty(""НаправлениеТекста"", ""Direction"")]
		|        public string Direction
		|        {
		|            get { return direction; }
		|            set
		|            {
		|                direction = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['direction'] = '"" + direction + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextMethod(""РисоватьИзображение"", ""DrawImage"")]
		|        public void DrawImage(DfImage p1, int p2, int p3, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null, IValue p9 = null)
		|        {
		|            string strFunc;
		|            if (p4 != null && p5 != null && p6 != null && p7 != null && p8 != null && p9 != null)
		|            {
		|                strFunc = """" +
		|                    ""let c = mapKeyEl.get('"" + Owner.ItemKey + ""');"" +
		|                    ""let ctx = c.getContext('2d');"" +
		|                    ""let img = mapKeyEl.get('"" + p1.ItemKey + ""');"" +
		|                    ""img.onload = function() { ctx.drawImage(img, "" + p6 + "", "" + p7 + "", "" + p8 + "", "" + p9 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "", "" + p5 + ""); }"" +
		|                    """";
		|            }
		|            else if (p4 != null && p5 != null)
		|            {
		|                strFunc = """" +
		|                    ""let c = mapKeyEl.get('"" + Owner.ItemKey + ""');"" +
		|                    ""let ctx = c.getContext('2d');"" +
		|                    ""let img = mapKeyEl.get('"" + p1.ItemKey + ""');"" +
		|                    ""img.onload = function() { ctx.drawImage(img, "" + p2 + "", "" + p3 + "", "" + p4 + "", "" + p5 + ""); }"" +
		|                    """";
		|            }
		|            else
		|            {
		|                strFunc = """" +
		|                    ""let c = mapKeyEl.get('"" + Owner.ItemKey + ""');"" +
		|                    ""let ctx = c.getContext('2d');"" +
		|                    ""let img = mapKeyEl.get('"" + p1.ItemKey + ""');"" +
		|                    ""img.onload = function() { ctx.drawImage(img, "" + p2 + "", "" + p3 + ""); }"" +
		|                    """";
		|            }
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""КопироватьДанныеРисунка"", ""CopyImageData"")]
		|        public void CopyImageData(int p1, int p2, int p3, int p4, int p5, int p6)
		|        {
		|            string strFunc = """" +
		|                ""let el = mapKeyEl.get('"" + ItemKey + ""');"" +
		|                ""let c = mapKeyEl.get('"" + Owner.ItemKey + ""');"" +
		|                ""let ctx = c.getContext('2d');"" +
		|                ""const imgData = ctx.getImageData("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"" +
		|                ""ctx.putImageData(imgData, "" + p5 + "", "" + p6 + "");"" +
		|                """";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public IValue globalAlpha { get; set; }
		|        [ContextProperty(""Альфа"", ""GlobalAlpha"")]
		|        public IValue GlobalAlpha
		|        {
		|            get { return globalAlpha; }
		|            set
		|            {
		|                globalAlpha = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['globalAlpha'] = "" + globalAlpha.AsNumber().ToString().Replace("","", ""."") + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string globalCompositeOperation { get; set; }
		|        [ContextProperty(""Композиция"", ""GlobalCompositeOperation"")]
		|        public string GlobalCompositeOperation
		|        {
		|            get { return globalCompositeOperation; }
		|            set
		|            {
		|                globalCompositeOperation = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['globalCompositeOperation'] = '"" + globalCompositeOperation + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string lineCap { get; set; }
		|        [ContextProperty(""СтильКонцовЛинии"", ""LineCap"")]
		|        public string LineCap
		|        {
		|            get { return lineCap; }
		|            set
		|            {
		|                lineCap = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['lineCap'] = '"" + lineCap + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public int lineWidth { get; set; }
		|        [ContextProperty(""ШиринаЛинии"", ""LineWidth"")]
		|        public int LineWidth
		|        {
		|            get { return lineWidth; }
		|            set
		|            {
		|                lineWidth = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['lineWidth'] = "" + lineWidth + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string lineJoin { get; set; }
		|        [ContextProperty(""СтильУглаПересечения"", ""LineJoin"")]
		|        public string LineJoin
		|        {
		|            get { return lineJoin; }
		|            set
		|            {
		|                lineJoin = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['lineJoin'] = '"" + lineJoin + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public int miterLimit { get; set; }
		|        [ContextProperty(""ПределСреза"", ""MiterLimit"")]
		|        public int MiterLimit
		|        {
		|            get { return miterLimit; }
		|            set
		|            {
		|                miterLimit = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['miterLimit'] = "" + miterLimit + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextMethod(""ДобавитьКвадратичнуюБизье"", ""QuadraticCurveTo"")]
		|        public void QuadraticCurveTo(int p1, int p2, int p3, int p4)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').quadraticCurveTo("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Восстановить"", ""Restore"")]
		|        public void Restore()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').restore();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Сохранить"", ""Save"")]
		|        public void Save()
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').save();"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Повернуть"", ""Rotate"")]
		|        public void Rotate(IValue p1)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').rotate("" + p1.AsNumber().ToString().Replace("","", ""."") + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Масштабировать"", ""Scale"")]
		|        public void Scale(IValue p1, IValue p2)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').scale("" + p1.AsNumber().ToString().Replace("","", ""."") + "", "" + p2.AsNumber().ToString().Replace("","", ""."") + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""РисоватьПрямоугольник"", ""StrokeRect"")]
		|        public void StrokeRect(int p1, int p2, int p3, int p4)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').strokeRect("" + p1 + "", "" + p2 + "", "" + p3 + "", "" + p4 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""УстановитьСдвиг"", ""SetTransform"")]
		|        public void SetTransform(IValue p1, IValue p2, IValue p3, IValue p4, int p5, int p6)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').setTransform("" + p1.AsNumber().ToString().Replace("","", ""."") + "", "" + p2.AsNumber().ToString().Replace("","", ""."") + "", "" + p3.AsNumber().ToString().Replace("","", ""."") + "", "" + p4.AsNumber().ToString().Replace("","", ""."") + "", "" + p5 + "", "" + p6 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public int shadowBlur { get; set; }
		|        [ContextProperty(""РазмытиеТени"", ""ShadowBlur"")]
		|        public int ShadowBlur
		|        {
		|            get { return shadowBlur; }
		|            set
		|            {
		|                shadowBlur = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['shadowBlur'] = "" + shadowBlur + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string shadowColor { get; set; }
		|        [ContextProperty(""ЦветТени"", ""ShadowColor"")]
		|        public string ShadowColor
		|        {
		|            get { return shadowColor; }
		|            set
		|            {
		|                shadowColor = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['shadowColor'] = '"" + shadowColor + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public int shadowOffsetX { get; set; }
		|        [ContextProperty(""СмещениеТениИкс"", ""ShadowOffsetX"")]
		|        public int ShadowOffsetX
		|        {
		|            get { return shadowOffsetX; }
		|            set
		|            {
		|                shadowOffsetX = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['shadowOffsetX'] = "" + shadowOffsetX + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public int shadowOffsetY { get; set; }
		|        [ContextProperty(""СмещениеТениИгрек"", ""ShadowOffsetY"")]
		|        public int ShadowOffsetY
		|        {
		|            get { return shadowOffsetY; }
		|            set
		|            {
		|                shadowOffsetY = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['shadowOffsetY'] = "" + shadowOffsetY + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public IValue strokeStyle { get; set; }
		|        [ContextProperty(""СтильОбводки"", ""StrokeStyle"")]
		|        public IValue StrokeStyle
		|        {
		|            get { return strokeStyle; }
		|            set
		|            {
		|                strokeStyle = value;
		|                string strFunc;
		|                if (strokeStyle.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['strokeStyle'] = '"" + strokeStyle + ""';"";
		|                }
		|                else
		|                {
		|                    strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['strokeStyle'] = mapKeyEl.get('"" + ((dynamic)strokeStyle).ItemKey + ""');"";
		|                }
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextMethod(""РисоватьТекст"", ""StrokeText"")]
		|        public void StrokeText(string p1, int p2, int p3, IValue p4 = null)
		|        {
		|            string strFunc;
		|            if (p4 != null)
		|            {
		|                strFunc = @""mapKeyEl.get('"" + ItemKey + ""').strokeText('"" + p1 + ""', "" + p2 + "", "" + p3 + "", "" + p4.AsNumber().ToString().Replace("","", ""."") + "");"";
		|            }
		|            else
		|            {
		|                strFunc = @""mapKeyEl.get('"" + ItemKey + ""').strokeText('"" + p1 + ""', "" + p2 + "", "" + p3 + "");"";
		|            }
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public string textAlign { get; set; }
		|        [ContextProperty(""ВыравниваниеТекста"", ""TextAlign"")]
		|        public string TextAlign
		|        {
		|            get { return textAlign; }
		|            set
		|            {
		|                textAlign = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['textAlign'] = '"" + textAlign + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string textBaseline { get; set; }
		|        [ContextProperty(""БазоваяЛинияТекста"", ""TextBaseline"")]
		|        public string TextBaseline
		|        {
		|            get { return textBaseline; }
		|            set
		|            {
		|                textBaseline = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['textBaseline'] = '"" + textBaseline + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextMethod(""Сдвинуть"", ""Transform"")]
		|        public void Transform(IValue p1, IValue p2, IValue p3, IValue p4, int p5, int p6)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').transform("" + p1.AsNumber().ToString().Replace("","", ""."") + "", "" + p2.AsNumber().ToString().Replace("","", ""."") + "", "" + p3.AsNumber().ToString().Replace("","", ""."") + "", "" + p4.AsNumber().ToString().Replace("","", ""."") + "", "" + p5 + "", "" + p6 + "");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Преобразовать"", ""Translate"")]
		|        public void Translate(int p1, int p2)
		|        {
		|            string strFunc = @""mapKeyEl.get('"" + ItemKey + ""').translate("" + p1 + "", "" + p2 +"");"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Font" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфШрифт"", ""DfFont"")]
		|    public class DfFont : AutoContext<DfFont>
		|    {
		|        public DfFont(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6)
		|        {
		|            FontStyle = p1;
		|            FontVariant = p2;
		|            FontWeight = p3;
		|            FontSize = p4;
		|            LineHeight = p5;
		|            FontFamily = p6;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue fontVariant;
		|        [ContextProperty(""ВариантШрифта"", ""FontVariant"")]
		|        public IValue FontVariant
		|        {
		|            get { return fontVariant; }
		|            set { fontVariant = value; }
		|        }
		|
		|        private IValue lineHeight;
		|        [ContextProperty(""ВысотаСтроки"", ""LineHeight"")]
		|        public IValue LineHeight
		|        {
		|            get { return lineHeight; }
		|            set { lineHeight = value; }
		|        }
		|
		|        private IValue fontWeight;
		|        [ContextProperty(""ЖирностьШрифта"", ""FontWeight"")]
		|        public IValue FontWeight
		|        {
		|            get { return fontWeight; }
		|            set { fontWeight = value; }
		|        }
		|
		|        private IValue fontSize;
		|        [ContextProperty(""РазмерШрифта"", ""FontSize"")]
		|        public IValue FontSize
		|        {
		|            get { return fontSize; }
		|            set { fontSize = value; }
		|        }
		|
		|        private IValue fontFamily;
		|        [ContextProperty(""СемействоШрифтов"", ""FontFamily"")]
		|        public IValue FontFamily
		|        {
		|            get { return fontFamily; }
		|            set { fontFamily = value; }
		|        }
		|
		|        private IValue fontStyle;
		|        [ContextProperty(""СтильШрифта"", ""FontStyle"")]
		|        public IValue FontStyle
		|        {
		|            get { return fontStyle; }
		|            set { fontStyle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BordersWidth" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфШиринаГраниц"", ""DfBordersWidth"")]
		|    public class DfBordersWidth : AutoContext<DfBordersWidth>
		|    {
		|        public DfBordersWidth(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            BorderTopWidth = p1;
		|            BorderRightWidth = p2;
		|            BorderBottomWidth = p3;
		|            BorderLeftWidth = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderTopWidth;
		|        [ContextProperty(""ШиринаВерхнейГраницы"", ""BorderTopWidth"")]
		|        public IValue BorderTopWidth
		|        {
		|            get { return borderTopWidth; }
		|            set { borderTopWidth = value; }
		|        }
		|
		|        private IValue borderLeftWidth;
		|        [ContextProperty(""ШиринаЛевойГраницы"", ""BorderLeftWidth"")]
		|        public IValue BorderLeftWidth
		|        {
		|            get { return borderLeftWidth; }
		|            set { borderLeftWidth = value; }
		|        }
		|
		|        private IValue borderBottomWidth;
		|        [ContextProperty(""ШиринаНижнейГраницы"", ""BorderBottomWidth"")]
		|        public IValue BorderBottomWidth
		|        {
		|            get { return borderBottomWidth; }
		|            set { borderBottomWidth = value; }
		|        }
		|
		|        private IValue borderRightWidth;
		|        [ContextProperty(""ШиринаПравойГраницы"", ""BorderRightWidth"")]
		|        public IValue BorderRightWidth
		|        {
		|            get { return borderRightWidth; }
		|            set { borderRightWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BordersColor" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЦветГраниц"", ""DfBordersColor"")]
		|    public class DfBordersColor : AutoContext<DfBordersColor>
		|    {
		|        public DfBordersColor(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            BorderTopColor = p1;
		|            BorderRightColor = p2;
		|            BorderBottomColor = p3;
		|            BorderLeftColor = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderTopColor;
		|        [ContextProperty(""ЦветВерхнейГраницы"", ""BorderTopColor"")]
		|        public IValue BorderTopColor
		|        {
		|            get { return borderTopColor; }
		|            set { borderTopColor = value; }
		|        }
		|
		|        private IValue borderLeftColor;
		|        [ContextProperty(""ЦветЛевойГраницы"", ""BorderLeftColor"")]
		|        public IValue BorderLeftColor
		|        {
		|            get { return borderLeftColor; }
		|            set { borderLeftColor = value; }
		|        }
		|
		|        private IValue borderBottomColor;
		|        [ContextProperty(""ЦветНижнейГраницы"", ""BorderBottomColor"")]
		|        public IValue BorderBottomColor
		|        {
		|            get { return borderBottomColor; }
		|            set { borderBottomColor = value; }
		|        }
		|
		|        private IValue borderRightColor;
		|        [ContextProperty(""ЦветПравойГраницы"", ""BorderRightColor"")]
		|        public IValue BorderRightColor
		|        {
		|            get { return borderRightColor; }
		|            set { borderRightColor = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ImagesFilter" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфФильтрИзображений"", ""DfImagesFilter"")]
		|    public class DfImagesFilter : AutoContext<DfImagesFilter>
		|    {
		|        public DfImagesFilter(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6, IValue p7, IValue p8, IValue p9, IValue p10)
		|        {
		|            Blur = p1;
		|            Brightness = p2;
		|            Contrast = p3;
		|            DropShadow = p4;
		|            Grayscale = p5;
		|            HueRotate = p6;
		|            Invert = p7;
		|            Opacity = p8;
		|            Saturate = p9;
		|            Sepia = p10;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue dropShadow;
		|        [ContextProperty(""Тень"", ""DropShadow"")]
		|        public IValue DropShadow
		|        {
		|            get { return dropShadow; }
		|            set { dropShadow = value; }
		|        }
		|
		|        private IValue opacity;
		|        [ContextProperty(""Непрозрачность"", ""Opacity"")]
		|        public IValue Opacity
		|        {
		|            get { return opacity; }
		|            set { opacity = value; }
		|        }
		|
		|        private IValue invert;
		|        [ContextProperty(""Инверсия"", ""Invert"")]
		|        public IValue Invert
		|        {
		|            get { return invert; }
		|            set { invert = value; }
		|        }
		|
		|        private IValue contrast;
		|        [ContextProperty(""Контраст"", ""Contrast"")]
		|        public IValue Contrast
		|        {
		|            get { return contrast; }
		|            set { contrast = value; }
		|        }
		|
		|        private IValue saturate;
		|        [ContextProperty(""Насыщенность"", ""Saturate"")]
		|        public IValue Saturate
		|        {
		|            get { return saturate; }
		|            set { saturate = value; }
		|        }
		|
		|        private IValue grayscale;
		|        [ContextProperty(""ОттенкиСерого"", ""Grayscale"")]
		|        public IValue Grayscale
		|        {
		|            get { return grayscale; }
		|            set { grayscale = value; }
		|        }
		|
		|        private IValue hueRotate;
		|        [ContextProperty(""ПоворотОттенка"", ""HueRotate"")]
		|        public IValue HueRotate
		|        {
		|            get { return hueRotate; }
		|            set { hueRotate = value; }
		|        }
		|
		|        private IValue blur;
		|        [ContextProperty(""Размытие"", ""Blur"")]
		|        public IValue Blur
		|        {
		|            get { return blur; }
		|            set { blur = value; }
		|        }
		|
		|        private IValue sepia;
		|        [ContextProperty(""Ретро"", ""Sepia"")]
		|        public IValue Sepia
		|        {
		|            get { return sepia; }
		|            set { sepia = value; }
		|        }
		|
		|        private IValue brightness;
		|        [ContextProperty(""Яркость"", ""Brightness"")]
		|        public IValue Brightness
		|        {
		|            get { return brightness; }
		|            set { brightness = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "TransformOrigin" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ТочкаСдвига"", ""DfTransformOrigin"")]
		|    public class DfTransformOrigin : AutoContext<DfTransformOrigin>
		|    {
		|        public DfTransformOrigin(int p1, int p2, int p3)
		|        {
		|            AxisX = p1;
		|            AxisY = p2;
		|            AxisZ = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private int axisZ;
		|        [ContextProperty(""ПоложениеЗет"", ""AxisZ"")]
		|        public int AxisZ
		|        {
		|            get { return axisZ; }
		|            set { axisZ = value; }
		|        }
		|
		|        private int axisY;
		|        [ContextProperty(""ПоложениеИгрек"", ""AxisY"")]
		|        public int AxisY
		|        {
		|            get { return axisY; }
		|            set { axisY = value; }
		|        }
		|
		|        private int axisX;
		|        [ContextProperty(""ПоложениеИкс"", ""AxisX"")]
		|        public int AxisX
		|        {
		|            get { return axisX; }
		|            set { axisX = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Point" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфТочка"", ""DfPoint"")]
		|    public class DfPoint : AutoContext<DfPoint>
		|    {
		|        public DfPoint(int p1, int p2)
		|        {
		|            X = p1;
		|            Y = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private int y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public int Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private int x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public int X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BoxShadow" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфТень"", ""DfBoxShadow"")]
		|    public class DfBoxShadow : AutoContext<DfBoxShadow>
		|    {
		|        public DfBoxShadow(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, bool p6)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Blur = p3;
		|            Spread = p4;
		|            Color = p5;
		|            Inset = p6;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue spread;
		|        [ContextProperty(""Величина"", ""Spread"")]
		|        public IValue Spread
		|        {
		|            get { return spread; }
		|            set { spread = value; }
		|        }
		|
		|        private bool inset;
		|        [ContextProperty(""Внутренняя"", ""Inset"")]
		|        public bool Inset
		|        {
		|            get { return inset; }
		|            set { inset = value; }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|
		|        private IValue blur;
		|        [ContextProperty(""Размытие"", ""Blur"")]
		|        public IValue Blur
		|        {
		|            get { return blur; }
		|            set { blur = value; }
		|        }
		|
		|        private IValue color;
		|        [ContextProperty(""Цвет"", ""Color"")]
		|        public IValue Color
		|        {
		|            get { return color; }
		|            set { color = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ListStyle" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфСтильСписка"", ""DfListStyle"")]
		|    public class DfListStyle : AutoContext<DfListStyle>
		|    {
		|        public DfListStyle(IValue p1, IValue p2, IValue p3)
		|        {
		|            ListStyleType = p1;
		|            ListStylePosition = p2;
		|            ListStyleImage = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue listStyleImage;
		|        [ContextProperty(""КартинкаСтиляСписка"", ""ListStyleImage"")]
		|        public IValue ListStyleImage
		|        {
		|            get { return listStyleImage; }
		|            set { listStyleImage = value; }
		|        }
		|
		|        private IValue listStylePosition;
		|        [ContextProperty(""ПозицияСтиляСписка"", ""ListStylePosition"")]
		|        public IValue ListStylePosition
		|        {
		|            get { return listStylePosition; }
		|            set { listStylePosition = value; }
		|        }
		|
		|        private IValue listStyleType;
		|        [ContextProperty(""ТипСтиляСписка"", ""ListStyleType"")]
		|        public IValue ListStyleType
		|        {
		|            get { return listStyleType; }
		|            set { listStyleType = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BordersStyle" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфСтильГраниц"", ""DfBordersStyle"")]
		|    public class DfBordersStyle : AutoContext<DfBordersStyle>
		|    {
		|        public DfBordersStyle(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            BorderTopStyle = p1;
		|            BorderRightStyle = p2;
		|            BorderBottomStyle = p3;
		|            BorderLeftStyle = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderTopStyle;
		|        [ContextProperty(""СтильВерхнейГраницы"", ""BorderTopStyle"")]
		|        public IValue BorderTopStyle
		|        {
		|            get { return borderTopStyle; }
		|            set { borderTopStyle = value; }
		|        }
		|
		|        private IValue borderLeftStyle;
		|        [ContextProperty(""СтильЛевойГраницы"", ""BorderLeftStyle"")]
		|        public IValue BorderLeftStyle
		|        {
		|            get { return borderLeftStyle; }
		|            set { borderLeftStyle = value; }
		|        }
		|
		|        private IValue borderBottomStyle;
		|        [ContextProperty(""СтильНижнейГраницы"", ""BorderBottomStyle"")]
		|        public IValue BorderBottomStyle
		|        {
		|            get { return borderBottomStyle; }
		|            set { borderBottomStyle = value; }
		|        }
		|
		|        private IValue borderRightStyle;
		|        [ContextProperty(""СтильПравойГраницы"", ""BorderRightStyle"")]
		|        public IValue BorderRightStyle
		|        {
		|            get { return borderRightStyle; }
		|            set { borderRightStyle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Size" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфРазмер"", ""DfSize"")]
		|    public class DfSize : AutoContext<DfSize>
		|    {
		|        public DfSize(IValue p1, IValue p2)
		|        {
		|            Width = p1;
		|            Height = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue height;
		|        [ContextProperty(""Высота"", ""Height"")]
		|        public IValue Height
		|        {
		|            get { return height; }
		|            set { height = value; }
		|        }
		|
		|        private IValue width;
		|        [ContextProperty(""Ширина"", ""Width"")]
		|        public IValue Width
		|        {
		|            get { return width; }
		|            set { width = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ColumnRule" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфРазделительКолонок"", ""DfColumnRule"")]
		|    public class DfColumnRule : AutoContext<DfColumnRule>
		|    {
		|        public DfColumnRule(IValue p1, IValue p2, IValue p3)
		|        {
		|            ColumnRuleWidth = p1;
		|            ColumnRuleStyle = p2;
		|            ColumnRuleColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue columnRuleWidth;
		|        [ContextProperty(""ШиринаРазделителяКолонок"", ""ColumnRuleWidth"")]
		|        public IValue ColumnRuleWidth
		|        {
		|            get { return columnRuleWidth; }
		|            set { columnRuleWidth = value; }
		|        }
		|
		|        private IValue columnRuleStyle;
		|        [ContextProperty(""СтильРазделителяКолонок"", ""ColumnRuleStyle"")]
		|        public IValue ColumnRuleStyle
		|        {
		|            get { return columnRuleStyle; }
		|            set { columnRuleStyle = value; }
		|        }
		|
		|        private IValue columnRuleColor;
		|        [ContextProperty(""ЦветРазделителяКолонок"", ""ColumnRuleColor"")]
		|        public IValue ColumnRuleColor
		|        {
		|            get { return columnRuleColor; }
		|            set { columnRuleColor = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderRadius" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфРадиусГраницы"", ""DfBorderRadius"")]
		|    public class DfBorderRadius : AutoContext<DfBorderRadius>
		|    {
		|        public DfBorderRadius(int p1, int p2, int p3, int p4)
		|        {
		|            BorderTopLeftRadius = p1;
		|            BorderTopRightRadius = p2;
		|            BorderBottomRightRadius = p3;
		|            BorderBottomLeftRadius = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private int borderTopLeftRadius;
		|        [ContextProperty(""ЛевыйРадиусВерхнейГраницы"", ""BorderTopLeftRadius"")]
		|        public int BorderTopLeftRadius
		|        {
		|            get { return borderTopLeftRadius; }
		|            set { borderTopLeftRadius = value; }
		|        }
		|
		|        private int borderBottomLeftRadius;
		|        [ContextProperty(""ЛевыйРадиусНижнейГраницы"", ""BorderBottomLeftRadius"")]
		|        public int BorderBottomLeftRadius
		|        {
		|            get { return borderBottomLeftRadius; }
		|            set { borderBottomLeftRadius = value; }
		|        }
		|
		|        private int borderTopRightRadius;
		|        [ContextProperty(""ПравыйРадиусВерхнейГраницы"", ""BorderTopRightRadius"")]
		|        public int BorderTopRightRadius
		|        {
		|            get { return borderTopRightRadius; }
		|            set { borderTopRightRadius = value; }
		|        }
		|
		|        private int borderBottomRightRadius;
		|        [ContextProperty(""ПравыйРадиусНижнейГраницы"", ""BorderBottomRightRadius"")]
		|        public int BorderBottomRightRadius
		|        {
		|            get { return borderBottomRightRadius; }
		|            set { borderBottomRightRadius = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Rectangle" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПрямоугольник"", ""DfRectangle"")]
		|    public class DfRectangle : AutoContext<DfRectangle>
		|    {
		|        public DfRectangle(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Width = p3;
		|            Height = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue height;
		|        [ContextProperty(""Высота"", ""Height"")]
		|        public IValue Height
		|        {
		|            get { return height; }
		|            set { height = value; }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|
		|        private IValue width;
		|        [ContextProperty(""Ширина"", ""Width"")]
		|        public IValue Width
		|        {
		|            get { return width; }
		|            set { width = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderRight" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПраваяГраница"", ""DfBorderRight"")]
		|    public class DfBorderRight : AutoContext<DfBorderRight>
		|    {
		|        public DfBorderRight(IValue p1, IValue p2, IValue p3)
		|        {
		|            BorderRightWidth = p1;
		|            BorderRightStyle = p2;
		|            BorderRightColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderRightStyle;
		|        [ContextProperty(""СтильПравойГраницы"", ""BorderRightStyle"")]
		|        public IValue BorderRightStyle
		|        {
		|            get { return borderRightStyle; }
		|            set { borderRightStyle = value; }
		|        }
		|
		|        private IValue borderRightColor;
		|        [ContextProperty(""ЦветПравойГраницы"", ""BorderRightColor"")]
		|        public IValue BorderRightColor
		|        {
		|            get { return borderRightColor; }
		|            set { borderRightColor = value; }
		|        }
		|
		|        private IValue borderRightWidth;
		|        [ContextProperty(""ШиринаПравойГраницы"", ""BorderRightWidth"")]
		|        public IValue BorderRightWidth
		|        {
		|            get { return borderRightWidth; }
		|            set { borderRightWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Polygon" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПолигон"", ""DfPolygon"")]
		|    public class DfPolygon : AutoContext<DfPolygon>
		|    {
		|        public DfPolygon(ArrayImpl p1)
		|        {
		|            Coordinates = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private ArrayImpl coordinates;
		|        [ContextProperty(""Координаты"", ""Coordinates"")]
		|        public ArrayImpl Coordinates
		|        {
		|            get { return coordinates; }
		|            set { coordinates = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "RotateX" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПоворотИкс"", ""DfRotateX"")]
		|    public class DfRotateX : AutoContext<DfRotateX>
		|    {
		|        public DfRotateX(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "RotateY" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПоворотИгрек"", ""DfRotateY"")]
		|    public class DfRotateY : AutoContext<DfRotateY>
		|    {
		|        public DfRotateY(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "RotateZ" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПоворотЗет"", ""DfRotateZ"")]
		|    public class DfRotateZ : AutoContext<DfRotateZ>
		|    {
		|        public DfRotateZ(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Rotate3D" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПоворот3Д"", ""DfRotate3D"")]
		|    public class DfRotate3D : AutoContext<DfRotate3D>
		|    {
		|        public DfRotate3D(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Z = p3;
		|            Angle = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue z;
		|        [ContextProperty(""Зет"", ""Z"")]
		|        public IValue Z
		|        {
		|            get { return z; }
		|            set { z = value; }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Rotate" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПоворот"", ""DfRotate"")]
		|    public class DfRotate : AutoContext<DfRotate>
		|    {
		|        public DfRotate(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Perspective" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПерспектива"", ""DfPerspective"")]
		|    public class DfPerspective : AutoContext<DfPerspective>
		|    {
		|        public DfPerspective(IValue p1)
		|        {
		|            Ratio = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue ratio;
		|        [ContextProperty(""Множитель"", ""Ratio"")]
		|        public IValue Ratio
		|        {
		|            get { return ratio; }
		|            set { ratio = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Transition" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПереход"", ""DfTransition"")]
		|    public class DfTransition : AutoContext<DfTransition>
		|    {
		|        public DfTransition(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            TransitionProperty = p1;
		|            TransitionDuration = p2;
		|            TransitionTimingFunction = p3;
		|            TransitionDelay = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue transitionDuration;
		|        [ContextProperty(""ВремяПерехода"", ""TransitionDuration"")]
		|        public IValue TransitionDuration
		|        {
		|            get { return transitionDuration; }
		|            set { transitionDuration = value; }
		|        }
		|
		|        private IValue transitionDelay;
		|        [ContextProperty(""ЗадержкаПерехода"", ""TransitionDelay"")]
		|        public IValue TransitionDelay
		|        {
		|            get { return transitionDelay; }
		|            set { transitionDelay = value; }
		|        }
		|
		|        private IValue transitionProperty;
		|        [ContextProperty(""СвойствоПерехода"", ""TransitionProperty"")]
		|        public IValue TransitionProperty
		|        {
		|            get { return transitionProperty; }
		|            set { transitionProperty = value; }
		|        }
		|
		|        private IValue transitionTimingFunction;
		|        [ContextProperty(""ФункцияПерехода"", ""TransitionTimingFunction"")]
		|        public IValue TransitionTimingFunction
		|        {
		|            get { return transitionTimingFunction; }
		|            set { transitionTimingFunction = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "TranslateX" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПереводИкс"", ""DfTranslateX"")]
		|    public class DfTranslateX : AutoContext<DfTranslateX>
		|    {
		|        public DfTranslateX(IValue p1)
		|        {
		|            X = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "TranslateY" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПереводИгрек"", ""DfTranslateY"")]
		|    public class DfTranslateY : AutoContext<DfTranslateY>
		|    {
		|        public DfTranslateY(IValue p1)
		|        {
		|            Y = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "TranslateZ" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПереводЗет"", ""DfTranslateZ"")]
		|    public class DfTranslateZ : AutoContext<DfTranslateZ>
		|    {
		|        public DfTranslateZ(IValue p1)
		|        {
		|            Z = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue z;
		|        [ContextProperty(""Зет"", ""Z"")]
		|        public IValue Z
		|        {
		|            get { return z; }
		|            set { z = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Translate3D" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПеревод3Д"", ""DfTranslate3D"")]
		|    public class DfTranslate3D : AutoContext<DfTranslate3D>
		|    {
		|        public DfTranslate3D(IValue p1, IValue p2, IValue p3)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Z = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue z;
		|        [ContextProperty(""Зет"", ""Z"")]
		|        public IValue Z
		|        {
		|            get { return z; }
		|            set { z = value; }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Translate" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфПеревод"", ""DfTranslate"")]
		|    public class DfTranslate : AutoContext<DfTranslate>
		|    {
		|        public DfTranslate(IValue p1, IValue p2)
		|        {
		|            X = p1;
		|            Y = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Margin" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфОтступ"", ""DfMargin"")]
		|    public class DfMargin : AutoContext<DfMargin>
		|    {
		|
		|        public DfMargin(int p1, int p2, int p3, int p4, bool p5)
		|        {
		|            MarginTop = p1;
		|            MarginRight = p2;
		|            MarginBottom = p3;
		|            MarginLeft = p4;
		|            Auto = p5;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private bool auto;
		|        [ContextProperty(""Авто"", ""Auto"")]
		|        public bool Auto
		|        {
		|            get { return auto; }
		|            set { auto = value; }
		|        }
		|
		|        private int marginTop;
		|        [ContextProperty(""ОтступСверху"", ""MarginTop"")]
		|        public int MarginTop
		|        {
		|            get { return marginTop; }
		|            set { marginTop = value; }
		|        }
		|
		|        private int marginLeft;
		|        [ContextProperty(""ОтступСлева"", ""MarginLeft"")]
		|        public int MarginLeft
		|        {
		|            get { return marginLeft; }
		|            set { marginLeft = value; }
		|        }
		|
		|        private int marginBottom;
		|        [ContextProperty(""ОтступСнизу"", ""MarginBottom"")]
		|        public int MarginBottom
		|        {
		|            get { return marginBottom; }
		|            set { marginBottom = value; }
		|        }
		|
		|        private int marginRight;
		|        [ContextProperty(""ОтступСправа"", ""MarginRight"")]
		|        public int MarginRight
		|        {
		|            get { return marginRight; }
		|            set { marginRight = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderBottom" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфНижняяГраница"", ""DfBorderBottom"")]
		|    public class DfBorderBottom : AutoContext<DfBorderBottom>
		|    {
		|        public DfBorderBottom(IValue p1, IValue p2, IValue p3)
		|        {
		|            BorderBottomWidth = p1;
		|            BorderBottomStyle = p2;
		|            BorderBottomColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderBottomStyle;
		|        [ContextProperty(""СтильНижнейГраницы"", ""BorderBottomStyle"")]
		|        public IValue BorderBottomStyle
		|        {
		|            get { return borderBottomStyle; }
		|            set { borderBottomStyle = value; }
		|        }
		|
		|        private IValue borderBottomColor;
		|        [ContextProperty(""ЦветНижнейГраницы"", ""BorderBottomColor"")]
		|        public IValue BorderBottomColor
		|        {
		|            get { return borderBottomColor; }
		|            set { borderBottomColor = value; }
		|        }
		|
		|        private IValue borderBottomWidth;
		|        [ContextProperty(""ШиринаНижнейГраницы"", ""BorderBottomWidth"")]
		|        public IValue BorderBottomWidth
		|        {
		|            get { return borderBottomWidth; }
		|            set { borderBottomWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "SkewX" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфНаклонИкс"", ""DfSkewX"")]
		|    public class DfSkewX : AutoContext<DfSkewX>
		|    {
		|        public DfSkewX(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "SkewY" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфНаклонИгрек"", ""DfSkewY"")]
		|    public class DfSkewY : AutoContext<DfSkewY>
		|    {
		|        public DfSkewY(IValue p1)
		|        {
		|            Angle = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angle;
		|        [ContextProperty(""Угол"", ""Angle"")]
		|        public IValue Angle
		|        {
		|            get { return angle; }
		|            set { angle = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Skew" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфНаклон"", ""DfSkew"")]
		|    public class DfSkew : AutoContext<DfSkew>
		|    {
		|        public DfSkew(IValue p1, IValue p2)
		|        {
		|            AngleX = p1;
		|            AngleY = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue angleY;
		|        [ContextProperty(""УголИгрек"", ""AngleY"")]
		|        public IValue AngleY
		|        {
		|            get { return angleY; }
		|            set { angleY = value; }
		|        }
		|
		|        private IValue angleX;
		|        [ContextProperty(""УголИкс"", ""AngleX"")]
		|        public IValue AngleX
		|        {
		|            get { return angleX; }
		|            set { angleX = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Matrix3D" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМатрица3Д"", ""DfMatrix3D"")]
		|    public class DfMatrix3D : AutoContext<DfMatrix3D>
		|    {
		|        public DfMatrix3D(ArrayImpl p1)
		|        {
		|            Number1 = p1.Get(0).AsNumber();
		|            Number2 = p1.Get(1).AsNumber();
		|            Number3 = p1.Get(2).AsNumber();
		|            Number4 = p1.Get(3).AsNumber();
		|
		|            Number5 = p1.Get(4).AsNumber();
		|            Number6 = p1.Get(5).AsNumber();
		|            Number7 = p1.Get(6).AsNumber();
		|            Number8 = p1.Get(7).AsNumber();
		|
		|            Number9 = p1.Get(8).AsNumber();
		|            Number10 = p1.Get(9).AsNumber();
		|            Number11 = p1.Get(10).AsNumber();
		|            Number12 = p1.Get(11).AsNumber();
		|
		|            Number13 = p1.Get(12).AsNumber();
		|            Number14 = p1.Get(13).AsNumber();
		|            Number15 = p1.Get(14).AsNumber();
		|            Number16 = p1.Get(15).AsNumber();
		|        }
		|
		|        public DfMatrix3D()
		|        {
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private decimal number1;
		|        [ContextProperty(""Число1"", ""Number1"")]
		|        public decimal Number1
		|        {
		|            get { return number1; }
		|            set { number1 = value; }
		|        }
		|
		|        private decimal number2;
		|        [ContextProperty(""Число2"", ""Number2"")]
		|        public decimal Number2
		|        {
		|            get { return number2; }
		|            set { number2 = value; }
		|        }
		|
		|        private decimal number3;
		|        [ContextProperty(""Число3"", ""Number3"")]
		|        public decimal Number3
		|        {
		|            get { return number3; }
		|            set { number3 = value; }
		|        }
		|
		|        private decimal number4;
		|        [ContextProperty(""Число4"", ""Number4"")]
		|        public decimal Number4
		|        {
		|            get { return number4; }
		|            set { number4 = value; }
		|        }
		|
		|        private decimal number5;
		|        [ContextProperty(""Число5"", ""Number5"")]
		|        public decimal Number5
		|        {
		|            get { return number5; }
		|            set { number5 = value; }
		|        }
		|
		|        private decimal number6;
		|        [ContextProperty(""Число6"", ""Number6"")]
		|        public decimal Number6
		|        {
		|            get { return number6; }
		|            set { number6 = value; }
		|        }
		|
		|        private decimal number7;
		|        [ContextProperty(""Число7"", ""Number7"")]
		|        public decimal Number7
		|        {
		|            get { return number7; }
		|            set { number7 = value; }
		|        }
		|
		|        private decimal number8;
		|        [ContextProperty(""Число8"", ""Number8"")]
		|        public decimal Number8
		|        {
		|            get { return number8; }
		|            set { number8 = value; }
		|        }
		|
		|        private decimal number9;
		|        [ContextProperty(""Число9"", ""Number9"")]
		|        public decimal Number9
		|        {
		|            get { return number9; }
		|            set { number9 = value; }
		|        }
		|
		|        private decimal number10;
		|        [ContextProperty(""Число10"", ""Number10"")]
		|        public decimal Number10
		|        {
		|            get { return number10; }
		|            set { number10 = value; }
		|        }
		|
		|        private decimal number11;
		|        [ContextProperty(""Число11"", ""Number11"")]
		|        public decimal Number11
		|        {
		|            get { return number11; }
		|            set { number11 = value; }
		|        }
		|
		|        private decimal number12;
		|        [ContextProperty(""Число12"", ""Number12"")]
		|        public decimal Number12
		|        {
		|            get { return number12; }
		|            set { number12 = value; }
		|        }
		|
		|        private decimal number13;
		|        [ContextProperty(""Число13"", ""Number13"")]
		|        public decimal Number13
		|        {
		|            get { return number13; }
		|            set { number13 = value; }
		|        }
		|
		|        private decimal number14;
		|        [ContextProperty(""Число14"", ""Number14"")]
		|        public decimal Number14
		|        {
		|            get { return number14; }
		|            set { number14 = value; }
		|        }
		|
		|        private decimal number15;
		|        [ContextProperty(""Число15"", ""Number15"")]
		|        public decimal Number15
		|        {
		|            get { return number15; }
		|            set { number15 = value; }
		|        }
		|
		|        private decimal number16;
		|        [ContextProperty(""Число16"", ""Number16"")]
		|        public decimal Number16
		|        {
		|            get { return number16; }
		|            set { number16 = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Matrix" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМатрица"", ""DfMatrix"")]
		|    public class DfMatrix : AutoContext<DfMatrix>
		|    {
		|        public DfMatrix(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5, IValue p6)
		|        {
		|            ScaleX = p1;
		|            OffsetY = p2;
		|            TransformX = p3;
		|            ScaleY = p4;
		|            OffsetX = p5;
		|            OffsetY = p6;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue scaleY;
		|        [ContextProperty(""МасштабИгрек"", ""ScaleY"")]
		|        public IValue ScaleY
		|        {
		|            get { return scaleY; }
		|            set { scaleY = value; }
		|        }
		|
		|        private IValue scaleX;
		|        [ContextProperty(""МасштабИкс"", ""ScaleX"")]
		|        public IValue ScaleX
		|        {
		|            get { return scaleX; }
		|            set { scaleX = value; }
		|        }
		|
		|        private IValue transformY;
		|        [ContextProperty(""СдвигИгрек"", ""TransformY"")]
		|        public IValue TransformY
		|        {
		|            get { return transformY; }
		|            set { transformY = value; }
		|        }
		|
		|        private IValue transformX;
		|        [ContextProperty(""СдвигИкс"", ""TransformX"")]
		|        public IValue TransformX
		|        {
		|            get { return transformX; }
		|            set { transformX = value; }
		|        }
		|
		|        private IValue offsetY;
		|        [ContextProperty(""СмещениеИгрек"", ""OffsetY"")]
		|        public IValue OffsetY
		|        {
		|            get { return offsetY; }
		|            set { offsetY = value; }
		|        }
		|
		|        private IValue offsetX;
		|        [ContextProperty(""СмещениеИкс"", ""OffsetX"")]
		|        public IValue OffsetX
		|        {
		|            get { return offsetX; }
		|            set { offsetX = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ScaleX" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМасштабИкс"", ""DfScaleX"")]
		|    public class DfScaleX : AutoContext<DfScaleX>
		|    {
		|        public DfScaleX(IValue p1)
		|        {
		|            X = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ScaleY" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМасштабИгрек"", ""DfScaleY"")]
		|    public class DfScaleY : AutoContext<DfScaleY>
		|    {
		|        public DfScaleY(IValue p1)
		|        {
		|            Y = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ScaleZ" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМасштабЗет"", ""DfScaleZ"")]
		|    public class DfScaleZ : AutoContext<DfScaleZ>
		|    {
		|        public DfScaleZ(IValue p1)
		|        {
		|            Z = p1;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue z;
		|        [ContextProperty(""Зет"", ""Z"")]
		|        public IValue Z
		|        {
		|            get { return z; }
		|            set { z = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Scale3D" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМасштаб3Д"", ""DfScale3D"")]
		|    public class DfScale3D : AutoContext<DfScale3D>
		|    {
		|        public DfScale3D(IValue p1, IValue p2, IValue p3)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Z = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue z;
		|        [ContextProperty(""Зет"", ""Z"")]
		|        public IValue Z
		|        {
		|            get { return z; }
		|            set { z = value; }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Scale" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМасштаб"", ""DfScale"")]
		|    public class DfScale : AutoContext<DfScale>
		|    {
		|        public DfScale(IValue p1, IValue p2)
		|        {
		|            X = p1;
		|            Y = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public IValue Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private IValue x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public IValue X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderLeft" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЛеваяГраница"", ""DfBorderLeft"")]
		|    public class DfBorderLeft : AutoContext<DfBorderLeft>
		|    {
		|        public DfBorderLeft(IValue p1, IValue p2, IValue p3)
		|        {
		|            borderLeftWidth = p1;
		|            BorderLeftStyle = p2;
		|            BorderLeftColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderLeftStyle;
		|        [ContextProperty(""СтильЛевойГраницы"", ""BorderLeftStyle"")]
		|        public IValue BorderLeftStyle
		|        {
		|            get { return borderLeftStyle; }
		|            set { borderLeftStyle = value; }
		|        }
		|
		|        private IValue borderLeftColor;
		|        [ContextProperty(""ЦветЛевойГраницы"", ""BorderLeftColor"")]
		|        public IValue BorderLeftColor
		|        {
		|            get { return borderLeftColor; }
		|            set { borderLeftColor = value; }
		|        }
		|
		|        private IValue borderLeftWidth;
		|        [ContextProperty(""ШиринаЛевойГраницы"", ""BorderLeftWidth"")]
		|        public IValue BorderLeftWidth
		|        {
		|            get { return borderLeftWidth; }
		|            set { borderLeftWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Circle" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКруг"", ""DfCircle"")]
		|    public class DfCircle : AutoContext<DfCircle>
		|    {
		|        public DfCircle(int p1, int p2, int p3)
		|        {
		|            X = p1;
		|            Y = p2;
		|            Radius = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private int y;
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public int Y
		|        {
		|            get { return y; }
		|            set { y = value; }
		|        }
		|
		|        private int x;
		|        [ContextProperty(""Икс"", ""X"")]
		|        public int X
		|        {
		|            get { return x; }
		|            set { x = value; }
		|        }
		|
		|        private int radius;
		|        [ContextProperty(""Радиус"", ""Radius"")]
		|        public int Radius
		|        {
		|            get { return radius; }
		|            set { radius = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Outline" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКонтур"", ""DfOutline"")]
		|    public class DfOutline : AutoContext<DfOutline>
		|    {
		|        public DfOutline(IValue p1, IValue p2, IValue p3)
		|        {
		|            OutlineWidth = p1;
		|            OutlineStyle = p2;
		|            OutlineColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue outlineStyle;
		|        [ContextProperty(""СтильКонтура"", ""OutlineStyle"")]
		|        public IValue OutlineStyle
		|        {
		|            get { return outlineStyle; }
		|            set { outlineStyle = value; }
		|        }
		|
		|        private IValue outlineColor;
		|        [ContextProperty(""ЦветКонтура"", ""OutlineColor"")]
		|        public IValue OutlineColor
		|        {
		|            get { return outlineColor; }
		|            set { outlineColor = value; }
		|        }
		|
		|        private IValue outlineWidth;
		|        [ContextProperty(""ШиринаКонтура"", ""OutlineWidth"")]
		|        public IValue OutlineWidth
		|        {
		|            get { return outlineWidth; }
		|            set { outlineWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Columns" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКолонкиЭлемента"", ""DfColumns"")]
		|    public class DfColumns : AutoContext<DfColumns>
		|    {
		|        public DfColumns(IValue p1, IValue p2)
		|        {
		|            ColumnWidth = p1;
		|            ColumnCount = p2;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue columnCount;
		|        [ContextProperty(""КоличествоКолонок"", ""ColumnCount"")]
		|        public IValue ColumnCount
		|        {
		|            get { return columnCount; }
		|            set { columnCount = value; }
		|        }
		|
		|        private IValue columnWidth;
		|        [ContextProperty(""ШиринаКолонок"", ""ColumnWidth"")]
		|        public IValue ColumnWidth
		|        {
		|            get { return columnWidth; }
		|            set { columnWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderImage" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфКартинкаГраницы"", ""DfBorderImage"")]
		|    public class DfBorderImage : AutoContext<DfBorderImage>
		|    {
		|        public DfBorderImage(IValue p1, IValue p2, IValue p3, IValue p4, IValue p5)
		|        {
		|            BorderImageSource = p1;
		|            BorderImageSlice = p2;
		|            BorderImageWidth = p3;
		|            BorderImageOutset = p4;
		|            BorderImageRepeat = p5;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderImageSource;
		|        [ContextProperty(""ИсточникКартинкиГраницы"", ""BorderImageSource"")]
		|        public IValue BorderImageSource
		|        {
		|            get { return borderImageSource; }
		|            set { borderImageSource = value; }
		|        }
		|
		|        private IValue borderImageRepeat;
		|        [ContextProperty(""МозаикаКартинкиГраницы"", ""BorderImageRepeat"")]
		|        public IValue BorderImageRepeat
		|        {
		|            get { return borderImageRepeat; }
		|            set { borderImageRepeat = value; }
		|        }
		|
		|        private IValue borderImageSlice;
		|        [ContextProperty(""НарезкаКартинкиГраницы"", ""BorderImageSlice"")]
		|        public IValue BorderImageSlice
		|        {
		|            get { return borderImageSlice; }
		|            set { borderImageSlice = value; }
		|        }
		|
		|        private IValue borderImageOutset;
		|        [ContextProperty(""СмещениеКартинкиГраницы"", ""BorderImageOutset"")]
		|        public IValue BorderImageOutset
		|        {
		|            get { return borderImageOutset; }
		|            set { borderImageOutset = value; }
		|        }
		|
		|        private IValue borderImageWidth;
		|        [ContextProperty(""ШиринаКартинкиГраницы"", ""BorderImageWidth"")]
		|        public IValue BorderImageWidth
		|        {
		|            get { return borderImageWidth; }
		|            set { borderImageWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Padding" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЗаполнение"", ""DfPadding"")]
		|    public class DfPadding : AutoContext<DfPadding>
		|    {
		|        public DfPadding(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            PaddingTop = p1;
		|            PaddingRight = p2;
		|            PaddingBottom = p3;
		|            PaddingLeft = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue paddingTop;
		|        [ContextProperty(""ЗаполнениеСверху"", ""PaddingTop"")]
		|        public IValue PaddingTop
		|        {
		|            get { return paddingTop; }
		|            set { paddingTop = value; }
		|        }
		|
		|        private IValue paddingLeft;
		|        [ContextProperty(""ЗаполнениеСлева"", ""PaddingLeft"")]
		|        public IValue PaddingLeft
		|        {
		|            get { return paddingLeft; }
		|            set { paddingLeft = value; }
		|        }
		|
		|        private IValue paddingBottom;
		|        [ContextProperty(""ЗаполнениеСнизу"", ""PaddingBottom"")]
		|        public IValue PaddingBottom
		|        {
		|            get { return paddingBottom; }
		|            set { paddingBottom = value; }
		|        }
		|
		|        private IValue paddingRight;
		|        [ContextProperty(""ЗаполнениеСправа"", ""PaddingRight"")]
		|        public IValue PaddingRight
		|        {
		|            get { return paddingRight; }
		|            set { paddingRight = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "EventArgs" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфАргументыСобытия"", ""DfEventArgs"")]
		|    public class DfEventArgs : AutoContext<DfEventArgs>
		|    {
		|        public DfEventArgs()
		|        {
		|        }
		|
		|        public bool _checked { get; set; }
		|        [ContextProperty(""Помечен"", ""Checked"")]
		|        public bool Checked
		|        {
		|            get { return _checked; }
		|            set { _checked = value; }
		|        }
		|
		|        public IValue listItem { get; set; }
		|        [ContextProperty(""ЭлементыСписка"", ""ListItem"")]
		|        public ArrayImpl ListItem
		|        {
		|            get { return (ArrayImpl)listItem; }
		|            set { listItem = ValueFactory.Create(value); }
		|        }
		|
		|        public IValue files { get; set; }
		|        [ContextProperty(""Файлы"", ""Files"")]
		|        public ArrayImpl Files
		|        {
		|            get { return (ArrayImpl)files; }
		|            set { files = ValueFactory.Create(value); }
		|        }
		|
		|        public IValue windowHeight { get; set; }
		|        [ContextProperty(""ВысотаОкна"", ""WindowHeight"")]
		|        public int WindowHeight
		|        {
		|            get { return Convert.ToInt32(windowHeight.AsNumber()); }
		|            set { windowHeight = ValueFactory.Create(value); }
		|        }
		|
		|        public IValue windowWidth { get; set; }
		|        [ContextProperty(""ШиринаОкна"", ""WindowWidth"")]
		|        public int WindowWidth
		|        {
		|            get { return Convert.ToInt32(windowWidth.AsNumber()); }
		|            set { windowWidth = ValueFactory.Create(value); }
		|        }
		|
		|        public IValue y { get; set; }
		|        [ContextProperty(""Игрек"", ""Y"")]
		|        public int Y
		|        {
		|            get { return Convert.ToInt32(y.AsNumber()); }
		|            set { y = ValueFactory.Create(value); }
		|        }
		|
		|        public IValue x { get; set; }
		|        [ContextProperty(""Икс"", ""X"")]
		|        public int X
		|        {
		|            get { return Convert.ToInt32(x.AsNumber()); }
		|            set { x = ValueFactory.Create(value); }
		|        }
		|
		|        public string button { get; set; }
		|        [ContextProperty(""Кнопка"", ""Button"")]
		|        public string Button
		|        {
		|            get { return button; }
		|            set { button = value; }
		|        }
		|
		|        private IValue sender = null;
		|        [ContextProperty(""Отправитель"", ""Sender"")]
		|        public IValue Sender
		|        {
		|            get { return sender; }
		|            set { sender = value; }
		|        }
		|
		|        private IValue parameter = null;
		|        [ContextProperty(""Параметр"", ""Parameter"")]
		|        public IValue Parameter
		|        {
		|            get { return parameter; }
		|            set { parameter = value; }
		|        }
		|
		|        private IValue _value { get; set; } = null;
		|        [ContextProperty(""Значение"", ""Value"")]
		|        public IValue Value
		|        {
		|            get { return _value; }
		|            set { _value = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Action" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.IO;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфДействие"", ""DfAction"")]
		|    public class DfAction : AutoContext<DfAction>
		|    {
		|        public DfAction(IRuntimeContextInstance script, string methodName, IValue param = null)
		|        {
		|            Script = script;
		|            MethodName = methodName;
		|            Parameter = param;
		|
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfAction()
		|        {
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        [ContextProperty(""ИмяМетода"", ""MethodName"")]
		|        public string MethodName { get; set; }
		|        
		|        [ContextProperty(""Параметр"", ""Parameter"")]
		|        public IValue Parameter { get; set; }
		|
		|        [ContextProperty(""Сценарий"", ""Script"")]
		|        public IRuntimeContextInstance Script { get; set; }				
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Borders" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфГраницы"", ""DfBorders"")]
		|    public class DfBorders : AutoContext<DfBorders>
		|    {
		|        public DfBorders(IValue p1, IValue p2, IValue p3)
		|        {
		|            BorderWidth = p1;
		|            BorderStyle = p2;
		|            BorderColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderStyle;
		|        [ContextProperty(""СтильГраницы"", ""BorderStyle"")]
		|        public IValue BorderStyle
		|        {
		|            get { return borderStyle; }
		|            set { borderStyle = value; }
		|        }
		|
		|        private IValue borderColor;
		|        [ContextProperty(""ЦветГраницы"", ""BorderColor"")]
		|        public IValue BorderColor
		|        {
		|            get { return borderColor; }
		|            set { borderColor = value; }
		|        }
		|
		|        private IValue borderWidth;
		|        [ContextProperty(""ШиринаГраницы"", ""BorderWidth"")]
		|        public IValue BorderWidth
		|        {
		|            get { return borderWidth; }
		|            set { borderWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Style" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.HostedScript.Library;
		|using ScriptEngine.Machine;
		|using System.IO;
		|using System.Reflection;
		|using System;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфСтиль"", ""DfStyle"")]
		|    public class DfStyle : AutoContext<DfStyle>
		|    {
		|        public DfStyle()
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', document.createElement('style'));"" + @""
		|mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        private IValue owner;
		|        public IValue Owner
		|        {
		|            get { return owner; }
		|            set { owner = value; }
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|		
		|        public string restransition { get; set; }
		|        public IValue transition { get; set; }
		|        [ContextProperty(""Переход"", ""Transition"")]
		|        public IValue Transition
		|        {
		|            get { return transition; }
		|            set
		|            {
		|                transition = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restransition = value.AsString();
		|                    if (Owner != null)
		|                    {
		|                        string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transition'] = '"" + restransition + ""';"";
		|                        DeclarativeForms.SendStrFunc(strFunc);
		|                    }
		|                }
		|                else
		|                {
		|                    DfTransition val = (DfTransition)value;
		|                    if (val.TransitionProperty != null)
		|                    {
		|                        TransitionProperty = val.TransitionProperty.AsString();
		|                    }
		|                    if (val.TransitionDuration != null)
		|                    {
		|                        TransitionDuration = val.TransitionDuration;
		|                    }
		|                    if (val.TransitionTimingFunction != null)
		|                    {
		|                        TransitionTimingFunction = val.TransitionTimingFunction.AsString();
		|                    }
		|                    if (val.TransitionDelay != null)
		|                    {
		|                        TransitionDelay = val.TransitionDelay;
		|                    }
		|                }
		|            }
		|        }
		|
		|        public string resobjectPosition { get; set; }
		|        public IValue objectPosition { get; set; }
		|        [ContextProperty(""ПозицияОбъекта"", ""ObjectPosition"")]
		|        public IValue ObjectPosition
		|        {
		|            get { return objectPosition; }
		|            set
		|            {
		|                objectPosition = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resobjectPosition = value.AsString();
		|                }
		|                else
		|                {
		|                    DfPoint val = (DfPoint)value;
		|                    if (val.X != 0 && val.Y != 0)
		|                    {
		|                        resobjectPosition = val.X.ToString() + ""px "" + val.Y.ToString() + ""px"";
		|                    }
		|                    else
		|                    {
		|                        resobjectPosition = ""0px 0px"";
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['objectPosition'] = '"" + resobjectPosition + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resclip { get; set; }
		|        public IValue clip { get; set; }
		|        [ContextProperty(""Обрезка"", ""Clip"")]
		|        public IValue Clip
		|        {
		|            get { return clip; }
		|            set
		|            {
		|                clip = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resclip = value.AsString();
		|                }
		|                else
		|                {
		|                    DfRectangle val = (DfRectangle)value;
		|                    if (val.X != null && val.Y != null && val.Width != null && val.Height != null)
		|                    {
		|                        decimal x1 = val.X.AsNumber() + val.Width.AsNumber();
		|                        decimal y1 = val.Y.AsNumber();
		|                        decimal y2 = val.Y.AsNumber() + val.Height.AsNumber();
		|                        decimal x2 = val.X.AsNumber();
		|                        resclip = ""rect("" + Convert.ToInt32(y1).ToString() + ""px, "" +
		|                            Convert.ToInt32(x1).ToString() + ""px, "" +
		|                            Convert.ToInt32(y2).ToString() + ""px, "" +
		|                            Convert.ToInt32(x2).ToString() + ""px)"";
		|                    }
		|                    else
		|                    {
		|                        resclip = ""auto"";
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['clip'] = '"" + resclip + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reswordSpacing { get; set; }
		|        public IValue wordSpacing { get; set; }
		|        [ContextProperty(""ИнтервалСлов"", ""WordSpacing"")]
		|        public IValue WordSpacing
		|        {
		|            get { return wordSpacing; }
		|            set
		|            {
		|                wordSpacing = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    reswordSpacing = value.AsString();
		|                }
		|                else
		|                {
		|                    reswordSpacing = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['wordSpacing'] = '"" + reswordSpacing + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransitionDuration { get; set; }
		|        public IValue transitionDuration { get; set; }
		|        [ContextProperty(""ВремяПерехода"", ""TransitionDuration"")]
		|        public IValue TransitionDuration
		|        {
		|            get { return transitionDuration; }
		|            set
		|            {
		|                transitionDuration = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restransitionDuration = value.AsString();
		|                }
		|                else
		|                {
		|                    restransitionDuration = value.AsNumber().ToString() + ""ms"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transitionDuration'] = '"" + restransitionDuration + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransitionDelay { get; set; }
		|        public IValue transitionDelay { get; set; }
		|        [ContextProperty(""ЗадержкаПерехода"", ""TransitionDelay"")]
		|        public IValue TransitionDelay
		|        {
		|            get { return transitionDelay; }
		|            set
		|            {
		|                transitionDelay = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restransitionDelay = value.AsString();
		|                }
		|                else
		|                {
		|                    restransitionDelay = value.AsNumber().ToString() + ""ms"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transitionDelay'] = '"" + restransitionDelay + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextIndent { get; set; }
		|        public IValue textIndent { get; set; }
		|        [ContextProperty(""ОтступТекста"", ""TextIndent"")]
		|        public IValue TextIndent
		|        {
		|            get { return textIndent; }
		|            set
		|            {
		|                textIndent = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restextIndent = value.AsString();
		|                }
		|                else
		|                {
		|                    restextIndent = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textIndent'] = '"" + restextIndent + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resorder { get; set; }
		|        public IValue order { get; set; }
		|        [ContextProperty(""Порядок"", ""Order"")]
		|        public IValue Order
		|        {
		|            get { return order; }
		|            set
		|            {
		|                order = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resorder = value.AsString();
		|                }
		|                else
		|                {
		|                    resorder = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['order'] = '"" + resorder + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restabSize { get; set; }
		|        public IValue tabSize { get; set; }
		|        [ContextProperty(""ДлинаТабуляции"", ""TabSize"")]
		|        public IValue TabSize
		|        {
		|            get { return tabSize; }
		|            set
		|            {
		|                tabSize = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restabSize = value.AsString();
		|                }
		|                else
		|                {
		|                    restabSize = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['tabSize'] = '"" + restabSize + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoutlineOffset { get; set; }
		|        public IValue outlineOffset { get; set; }
		|        [ContextProperty(""СмещениеКонтура"", ""OutlineOffset"")]
		|        public IValue OutlineOffset
		|        {
		|            get { return outlineOffset; }
		|            set
		|            {
		|                outlineOffset = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resoutlineOffset = value.AsString();
		|                }
		|                else
		|                {
		|                    resoutlineOffset = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['outlineOffset'] = '"" + resoutlineOffset + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resminWidth { get; set; }
		|        public IValue minWidth { get; set; }
		|        [ContextProperty(""МинимальнаяШирина"", ""MinWidth"")]
		|        public IValue MinWidth
		|        {
		|            get { return minWidth; }
		|            set
		|            {
		|                minWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resminWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resminWidth = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['minWidth'] = '"" + resminWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmaxWidth { get; set; }
		|        public IValue maxWidth { get; set; }
		|        [ContextProperty(""МаксимальнаяШирина"", ""MaxWidth"")]
		|        public IValue MaxWidth
		|        {
		|            get { return maxWidth; }
		|            set
		|            {
		|                maxWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmaxWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resmaxWidth = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['maxWidth'] = '"" + resmaxWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmaxHeight { get; set; }
		|        public IValue maxHeight { get; set; }
		|        [ContextProperty(""МаксимальнаяВысота"", ""MaxHeight"")]
		|        public IValue MaxHeight
		|        {
		|            get { return maxHeight; }
		|            set
		|            {
		|                maxHeight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmaxHeight = value.AsString();
		|                }
		|                else
		|                {
		|                    resmaxHeight = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['maxHeight'] = '"" + resmaxHeight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reslineHeight { get; set; }
		|        public IValue lineHeight { get; set; }
		|        [ContextProperty(""ВысотаСтроки"", ""LineHeight"")]
		|        public IValue LineHeight
		|        {
		|            get { return lineHeight; }
		|            set
		|            {
		|                lineHeight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    reslineHeight = value.AsString();
		|                }
		|                else
		|                {
		|                    reslineHeight = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['lineHeight'] = '"" + reslineHeight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resletterSpacing { get; set; }
		|        public IValue letterSpacing { get; set; }
		|        [ContextProperty(""ИнтервалСимволов"", ""LetterSpacing"")]
		|        public IValue LetterSpacing
		|        {
		|            get { return letterSpacing; }
		|            set
		|            {
		|                letterSpacing = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resletterSpacing = value.AsString();
		|                }
		|                else
		|                {
		|                    resletterSpacing = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['letterSpacing'] = '"" + resletterSpacing + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resflex { get; set; }
		|        public IValue flex { get; set; }
		|        [ContextProperty(""Гибкость"", ""Flex"")]
		|        public IValue Flex
		|        {
		|            get { return flex; }
		|            set
		|            {
		|                flex = value;
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resflex = value.AsString();
		|                }
		|                else
		|                {
		|                    resflex = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flex'] = '"" + resflex + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resflexShrink { get; set; }
		|        public IValue flexShrink { get; set; }
		|        [ContextProperty(""Уменьшение"", ""FlexShrink"")]
		|        public IValue FlexShrink
		|        {
		|            get { return flexShrink; }
		|            set
		|            {
		|                flexShrink = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resflexShrink = value.AsString();
		|                }
		|                else
		|                {
		|                    resflexShrink = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flexShrink'] = '"" + resflexShrink + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resflexGrow { get; set; }
		|        public IValue flexGrow { get; set; }
		|        [ContextProperty(""Увеличение"", ""FlexGrow"")]
		|        public IValue FlexGrow
		|        {
		|            get { return flexGrow; }
		|            set
		|            {
		|                flexGrow = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resflexGrow = value.AsString();
		|                }
		|                else
		|                {
		|                    resflexGrow = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flexGrow'] = '"" + resflexGrow + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resflexBasis { get; set; }
		|        public IValue flexBasis { get; set; }
		|        [ContextProperty(""БазоваяДлина"", ""FlexBasis"")]
		|        public IValue FlexBasis
		|        {
		|            get { return flexBasis; }
		|            set
		|            {
		|                flexBasis = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resflexBasis = value.AsString();
		|                }
		|                else
		|                {
		|                    resflexBasis = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flexBasis'] = '"" + resflexBasis + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnSpan { get; set; }
		|        public IValue columnSpan { get; set; }
		|        [ContextProperty(""ДиапазонКолонокЭлемента"", ""ColumnSpan"")]
		|        public IValue ColumnSpan
		|        {
		|            get { return columnSpan; }
		|            set
		|            {
		|                columnSpan = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnSpan = value.AsString();
		|                }
		|                else
		|                {
		|                    if (value.AsNumber() == -1)
		|                    {
		|                        rescolumnSpan = ""all"";
		|                    }
		|                    else
		|                    {
		|                        rescolumnSpan = value.AsNumber().ToString();
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnSpan'] = '"" + rescolumnSpan + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnRuleWidth { get; set; }
		|        public IValue columnRuleWidth { get; set; }
		|        [ContextProperty(""ШиринаРазделителяКолонок"", ""ColumnRuleWidth"")]
		|        public IValue ColumnRuleWidth
		|        {
		|            get { return columnRuleWidth; }
		|            set
		|            {
		|                columnRuleWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnRuleWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    rescolumnRuleWidth = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnRuleWidth'] = '"" + rescolumnRuleWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnGap { get; set; }
		|        public IValue columnGap { get; set; }
		|        [ContextProperty(""ИнтервалКолонок"", ""ColumnGap"")]
		|        public IValue ColumnGap
		|        {
		|            get { return columnGap; }
		|            set
		|            {
		|                columnGap = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnGap = value.AsString();
		|                }
		|                else
		|                {
		|                    rescolumnGap = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnGap'] = '"" + rescolumnGap + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resvisibility { get; set; }
		|        public string visibility { get; set; }
		|        [ContextProperty(""Видимость"", ""Visibility"")]
		|        public string Visibility
		|        {
		|            get { return visibility; }
		|            set
		|            {
		|                visibility = value;
		|                resvisibility = visibility;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['visibility'] = '"" + resvisibility + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resuserSelect { get; set; }
		|        public string userSelect { get; set; }
		|        [ContextProperty(""ВыделениеПользователем"", ""UserSelect"")]
		|        public string UserSelect
		|        {
		|            get { return userSelect; }
		|            set
		|            {
		|                userSelect = value;
		|                resuserSelect = userSelect;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['userSelect'] = '"" + resuserSelect + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransitionTimingFunction { get; set; }
		|        public string transitionTimingFunction { get; set; }
		|        [ContextProperty(""ФункцияПерехода"", ""TransitionTimingFunction"")]
		|        public string TransitionTimingFunction
		|        {
		|            get { return transitionTimingFunction; }
		|            set
		|            {
		|                transitionTimingFunction = value;
		|                restransitionTimingFunction = transitionTimingFunction;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transitionTimingFunction'] = '"" + restransitionTimingFunction + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransitionProperty { get; set; }
		|        public string transitionProperty { get; set; }
		|        [ContextProperty(""СвойствоПерехода"", ""TransitionProperty"")]
		|        public string TransitionProperty
		|        {
		|            get { return transitionProperty; }
		|            set
		|            {
		|                transitionProperty = value;
		|                restransitionProperty = transitionProperty;
		|                if (transitionProperty != ""all"")
		|                {
		|                    string[] result = transitionProperty.Split(new string[] { "","" }, StringSplitOptions.RemoveEmptyEntries);
		|                    string prop = """";
		|                    if (result.Length > 0)
		|                    {
		|                        prop += (string)DeclarativeForms.namesStyleProps[result[0].Trim()][1];
		|                        for (int i = 1; i < result.Length; i++)
		|                        {
		|                            prop += "", "" + (string)DeclarativeForms.namesStyleProps[result[i].Trim()][1];
		|                        }
		|                    }
		|                    restransitionProperty = prop;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transitionProperty'] = '"" + restransitionProperty + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextTransform { get; set; }
		|        public string textTransform { get; set; }
		|        [ContextProperty(""ПрописныеТекста"", ""TextTransform"")]
		|        public string TextTransform
		|        {
		|            get { return textTransform; }
		|            set
		|            {
		|                textTransform = value;
		|                restextTransform = textTransform;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textTransform'] = '"" + restextTransform + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextOverflow { get; set; }
		|        public string textOverflow { get; set; }
		|        [ContextProperty(""ПереполнениеТекста"", ""TextOverflow"")]
		|        public string TextOverflow
		|        {
		|            get { return textOverflow; }
		|            set
		|            {
		|                textOverflow = value;
		|                restextOverflow = textOverflow;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textOverflow'] = '"" + restextOverflow + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextDecorationStyle { get; set; }
		|        public string textDecorationStyle { get; set; }
		|        [ContextProperty(""ОформлениеТекстаСтиль"", ""TextDecorationStyle"")]
		|        public string TextDecorationStyle
		|        {
		|            get { return textDecorationStyle; }
		|            set
		|            {
		|                textDecorationStyle = value;
		|                restextDecorationStyle = textDecorationStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textDecorationStyle'] = '"" + restextDecorationStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextDecorationLine { get; set; }
		|        public string textDecorationLine { get; set; }
		|        [ContextProperty(""ОформлениеТекстаЛиния"", ""TextDecorationLine"")]
		|        public string TextDecorationLine
		|        {
		|            get { return textDecorationLine; }
		|            set
		|            {
		|                textDecorationLine = value;
		|                restextDecorationLine = textDecorationLine;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textDecorationLine'] = '"" + restextDecorationLine + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextDecorationColor { get; set; }
		|        public string textDecorationColor { get; set; }
		|        [ContextProperty(""ОформлениеТекстаЦвет"", ""TextDecorationColor"")]
		|        public string TextDecorationColor
		|        {
		|            get { return textDecorationColor; }
		|            set
		|            {
		|                textDecorationColor = value;
		|                restextDecorationColor = textDecorationColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textDecorationColor'] = '"" + restextDecorationColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resresize { get; set; }
		|        public string resize { get; set; }
		|        [ContextProperty(""ИзменяемыйРазмер"", ""Resize"")]
		|        public string Resize
		|        {
		|            get { return resize; }
		|            set
		|            {
		|                resize = value;
		|                resresize = resize;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['resize'] = '"" + resresize + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resobjectFit { get; set; }
		|        public string objectFit { get; set; }
		|        [ContextProperty(""ВписываниеОбъекта"", ""ObjectFit"")]
		|        public string ObjectFit
		|        {
		|            get { return objectFit; }
		|            set
		|            {
		|                objectFit = value;
		|                resobjectFit = objectFit;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['objectFit'] = '"" + resobjectFit + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reslistStyleType { get; set; }
		|        public string listStyleType { get; set; }
		|        [ContextProperty(""ТипСтиляСписка"", ""ListStyleType"")]
		|        public string ListStyleType
		|        {
		|            get { return listStyleType; }
		|            set
		|            {
		|                listStyleType = value;
		|                reslistStyleType = listStyleType;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['listStyleType'] = '"" + reslistStyleType + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reslistStylePosition { get; set; }
		|        public string listStylePosition { get; set; }
		|        [ContextProperty(""ПозицияСтиляСписка"", ""ListStylePosition"")]
		|        public string ListStylePosition
		|        {
		|            get { return listStylePosition; }
		|            set
		|            {
		|                listStylePosition = value;
		|                reslistStylePosition = listStylePosition;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['listStylePosition'] = '"" + reslistStylePosition + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reslistStyleImage { get; set; }
		|        public string listStyleImage { get; set; }
		|        [ContextProperty(""КартинкаСтиляСписка"", ""ListStyleImage"")]
		|        public string ListStyleImage
		|        {
		|            get { return listStyleImage; }
		|            set
		|            {
		|                listStyleImage = value;
		|                reslistStyleImage = ""url('"" + listStyleImage
		|                    .Replace(""url(\u0022"", """")
		|                    .Replace(""\u0022)"", """")
		|                    .Replace(""url('"", """")
		|                    .Replace(""')"", """")
		|                    .Replace("" "", ""%20"") +
		|                    ""') "";
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['listStyleImage'] = \u0022"" + reslistStyleImage + ""\u0022;"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfontWeight { get; set; }
		|        public string fontWeight { get; set; }
		|        [ContextProperty(""ЖирностьШрифта"", ""FontWeight"")]
		|        public string FontWeight
		|        {
		|            get { return fontWeight; }
		|            set
		|            {
		|                fontWeight = value;
		|                resfontWeight = fontWeight;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['fontWeight'] = '"" + resfontWeight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfontVariant { get; set; }
		|        public string fontVariant { get; set; }
		|        [ContextProperty(""ВариантШрифта"", ""FontVariant"")]
		|        public string FontVariant
		|        {
		|            get { return fontVariant; }
		|            set
		|            {
		|                fontVariant = value;
		|                resfontVariant = fontVariant;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['fontVariant'] = '"" + resfontVariant + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfontStyle { get; set; }
		|        public string fontStyle { get; set; }
		|        [ContextProperty(""СтильШрифта"", ""FontStyle"")]
		|        public string FontStyle
		|        {
		|            get { return fontStyle; }
		|            set
		|            {
		|                fontStyle = value;
		|                resfontStyle = fontStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['fontStyle'] = '"" + resfontStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resemptyCells { get; set; }
		|        public string emptyCells { get; set; }
		|        [ContextProperty(""ПустыеЯчейки"", ""EmptyCells"")]
		|        public string EmptyCells
		|        {
		|            get { return emptyCells; }
		|            set
		|            {
		|                emptyCells = value;
		|                resemptyCells = emptyCells;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['emptyCells'] = '"" + resemptyCells + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescursor { get; set; }
		|        public string cursor { get; set; }
		|        [ContextProperty(""Курсор"", ""Cursor"")]
		|        public string Cursor
		|        {
		|            get { return cursor; }
		|            set
		|            {
		|                cursor = value;
		|                rescursor = cursor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['cursor'] = '"" + rescursor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnRuleStyle { get; set; }
		|        public string columnRuleStyle { get; set; }
		|        [ContextProperty(""СтильРазделителяКолонок"", ""ColumnRuleStyle"")]
		|        public string ColumnRuleStyle
		|        {
		|            get { return columnRuleStyle; }
		|            set
		|            {
		|                columnRuleStyle = value;
		|                rescolumnRuleStyle = columnRuleStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnRuleStyle'] = '"" + rescolumnRuleStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnRuleColor { get; set; }
		|        public string columnRuleColor { get; set; }
		|        [ContextProperty(""ЦветРазделителяКолонок"", ""ColumnRuleColor"")]
		|        public string ColumnRuleColor
		|        {
		|            get { return columnRuleColor; }
		|            set
		|            {
		|                columnRuleColor = value;
		|                rescolumnRuleColor = columnRuleColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnRuleColor'] = '"" + rescolumnRuleColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnFill { get; set; }
		|        public string columnFill { get; set; }
		|        [ContextProperty(""ЗаполнениеКолонок"", ""ColumnFill"")]
		|        public string ColumnFill
		|        {
		|            get { return columnFill; }
		|            set
		|            {
		|                columnFill = value;
		|                rescolumnFill = columnFill;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnFill'] = '"" + rescolumnFill + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescaretColor { get; set; }
		|        public string caretColor { get; set; }
		|        [ContextProperty(""ЦветКурсора"", ""CaretColor"")]
		|        public string CaretColor
		|        {
		|            get { return caretColor; }
		|            set
		|            {
		|                caretColor = value;
		|                rescaretColor = caretColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['caretColor'] = '"" + rescaretColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescaptionSide { get; set; }
		|        public string captionSide { get; set; }
		|        [ContextProperty(""ПоложениеЗаголовка"", ""CaptionSide"")]
		|        public string CaptionSide
		|        {
		|            get { return captionSide; }
		|            set
		|            {
		|                captionSide = value;
		|                rescaptionSide = captionSide;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['captionSide'] = '"" + rescaptionSide + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string rescssFloat { get; set; }
		|        public string cssFloat { get; set; }
		|        [ContextProperty(""ГоризонтальноеВыравнивание"", ""CssFloat"")]
		|        public string CssFloat
		|        {
		|            get { return cssFloat; }
		|            set
		|            {
		|                cssFloat = value;
		|                rescssFloat = cssFloat;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['cssFloat'] = '"" + rescssFloat + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resclear { get; set; }
		|        public string clear { get; set; }
		|        [ContextProperty(""Несвободно"", ""Clear"")]
		|        public string Clear
		|        {
		|            get { return clear; }
		|            set
		|            {
		|                clear = value;
		|                resclear = clear;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['clear'] = '"" + resclear + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resboxSizing { get; set; }
		|        public string boxSizing { get; set; }
		|        [ContextProperty(""Калибровка"", ""BoxSizing"")]
		|        public string BoxSizing
		|        {
		|            get { return boxSizing; }
		|            set
		|            {
		|                boxSizing = value;
		|                resboxSizing = boxSizing;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['boxSizing'] = '"" + resboxSizing + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resborderSpacing { get; set; }
		|        public IValue borderSpacing { get; set; }
		|        [ContextProperty(""ИнтервалГраницы"", ""BorderSpacing"")]
		|        public IValue BorderSpacing
		|        {
		|            get { return borderSpacing; }
		|            set
		|            {
		|                borderSpacing = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderSpacing = value.AsString();
		|                }
		|                else
		|                {
		|                    DfSize val = (DfSize)value;
		|                    if (val.Width != null && val.Height != null)
		|                    {
		|                        resborderSpacing = val.Width.AsNumber().ToString() + ""px "" + val.Height.AsNumber().ToString() + ""px"";
		|                    }
		|                    else
		|                    {
		|                        resborderSpacing = ""0px"";
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderSpacing'] = '"" + resborderSpacing + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resborderImageRepeat { get; set; }
		|        public string borderImageRepeat { get; set; }
		|        [ContextProperty(""МозаикаКартинкиГраницы"", ""BorderImageRepeat"")]
		|        public string BorderImageRepeat
		|        {
		|            get { return borderImageRepeat; }
		|            set
		|            {
		|                borderImageRepeat = value;
		|                resborderImageRepeat = borderImageRepeat;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImageRepeat'] = '"" + resborderImageRepeat + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderImageOutset { get; set; }
		|        public IValue borderImageOutset { get; set; }
		|        [ContextProperty(""СмещениеКартинкиГраницы"", ""BorderImageOutset"")]
		|        public IValue BorderImageOutset
		|        {
		|            get { return borderImageOutset; }
		|            set
		|            {
		|                borderImageOutset = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderImageOutset = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderImageOutset = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImageOutset'] = '"" + resborderImageOutset + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderImageSlice { get; set; }
		|        public IValue borderImageSlice { get; set; }
		|        [ContextProperty(""НарезкаКартинкиГраницы"", ""BorderImageSlice"")]
		|        public IValue BorderImageSlice
		|        {
		|            get { return borderImageSlice; }
		|            set
		|            {
		|                borderImageSlice = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderImageSlice = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderImageSlice = value.AsNumber().ToString();
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImageSlice'] = '"" + resborderImageSlice + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderImageSource { get; set; }
		|        public string borderImageSource { get; set; }
		|        [ContextProperty(""ИсточникКартинкиГраницы"", ""BorderImageSource"")]
		|        public string BorderImageSource
		|        {
		|            get { return borderImageSource; }
		|            set
		|            {
		|                borderImageSource = value;
		|                if (value.Contains(""gradient""))
		|                {
		|                    resborderImageSource = borderImageSource;
		|                }
		|                else
		|                {
		|                    resborderImageSource = ""url('"" + borderImageSource
		|                        .Replace(""url(\u0022"", """")
		|                        .Replace(""\u0022)"", """")
		|                        .Replace(""url('"", """")
		|                        .Replace(""')"", """")
		|                        .Replace("" "", ""%20"") +
		|                        ""') "";
		|                }
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImageSource'] = \u0022"" + resborderImageSource + ""\u0022;"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderImageWidth { get; set; }
		|        public IValue borderImageWidth { get; set; }
		|        [ContextProperty(""ШиринаКартинкиГраницы"", ""BorderImageWidth"")]
		|        public IValue BorderImageWidth
		|        {
		|            get { return borderImageWidth; }
		|            set
		|            {
		|                borderImageWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderImageWidth = value.AsString();
		|                }
		|                else if (value.GetType() == typeof(DfSize))
		|                {
		|                    DfSize val = (DfSize)value;
		|                    if (val.Width != null && val.Height != null)
		|                    {
		|                        resborderImageWidth = val.Width.AsNumber().ToString() + ""px "" + val.Height.AsNumber().ToString() + ""px"";
		|                    }
		|                }
		|                else
		|                {
		|                    resborderImageWidth = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImageWidth'] = '"" + resborderImageWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resborderTopRightRadius { get; set; }
		|        public IValue borderTopRightRadius { get; set; }
		|        [ContextProperty(""ПравыйРадиусВерхнейГраницы"", ""BorderTopRightRadius"")]
		|        public IValue BorderTopRightRadius
		|        {
		|            get { return borderTopRightRadius; }
		|            set
		|            {
		|                borderTopRightRadius = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderTopRightRadius = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderTopRightRadius = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTopRightRadius'] = '"" + resborderTopRightRadius + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderTopLeftRadius { get; set; }
		|        public IValue borderTopLeftRadius { get; set; }
		|        [ContextProperty(""ЛевыйРадиусВерхнейГраницы"", ""BorderTopLeftRadius"")]
		|        public IValue BorderTopLeftRadius
		|        {
		|            get { return borderTopLeftRadius; }
		|            set
		|            {
		|                borderTopLeftRadius = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderTopLeftRadius = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderTopLeftRadius = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTopLeftRadius'] = '"" + resborderTopLeftRadius + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }		
		|
		|        public string resborderBottomLeftRadius { get; set; }
		|        public IValue borderBottomLeftRadius { get; set; }
		|        [ContextProperty(""ЛевыйРадиусНижнейГраницы"", ""BorderBottomLeftRadius"")]
		|        public IValue BorderBottomLeftRadius
		|        {
		|            get { return borderBottomLeftRadius; }
		|            set
		|            {
		|                borderBottomLeftRadius = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderBottomLeftRadius = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderBottomLeftRadius = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottomLeftRadius'] = '"" + resborderBottomLeftRadius + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderBottomRightRadius { get; set; }
		|        public IValue borderBottomRightRadius { get; set; }
		|        [ContextProperty(""ПравыйРадиусНижнейГраницы"", ""BorderBottomRightRadius"")]
		|        public IValue BorderBottomRightRadius
		|        {
		|            get { return borderBottomRightRadius; }
		|            set
		|            {
		|                borderBottomRightRadius = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderBottomRightRadius = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderBottomRightRadius = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottomRightRadius'] = '"" + resborderBottomRightRadius + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resbackgroundPosition { get; set; }
		|        public string backgroundPosition { get; set; }
		|        [ContextProperty(""ПоложениеКартинки"", ""BackgroundPosition"")]
		|        public string BackgroundPosition
		|        {
		|            get { return backgroundPosition; }
		|            set
		|            {
		|                backgroundPosition = value;
		|                resbackgroundPosition = backgroundPosition;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundPosition'] = '"" + resbackgroundPosition + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundOrigin { get; set; }
		|        public string backgroundOrigin { get; set; }
		|        [ContextProperty(""ОбластьКартинки"", ""BackgroundOrigin"")]
		|        public string BackgroundOrigin
		|        {
		|            get { return backgroundOrigin; }
		|            set
		|            {
		|                backgroundOrigin = value;
		|                resbackgroundOrigin = backgroundOrigin;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundOrigin'] = '"" + resbackgroundOrigin + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundClip { get; set; }
		|        public string backgroundClip { get; set; }
		|        [ContextProperty(""ОбластьРисования"", ""BackgroundClip"")]
		|        public string BackgroundClip
		|        {
		|            get { return backgroundClip; }
		|            set
		|            {
		|                backgroundClip = value;
		|                resbackgroundClip = backgroundClip;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundClip'] = '"" + resbackgroundClip + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundAttachment { get; set; }
		|        public string backgroundAttachment { get; set; }
		|        [ContextProperty(""ФоновоеВложение"", ""BackgroundAttachment"")]
		|        public string BackgroundAttachment
		|        {
		|            get { return backgroundAttachment; }
		|            set
		|            {
		|                backgroundAttachment = value;
		|                resbackgroundAttachment = backgroundAttachment;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundAttachment'] = '"" + resbackgroundAttachment + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string resbackground { get; set; }
		|        public IValue background { get; set; }
		|        [ContextProperty(""Фон"", ""Background"")]
		|        public IValue Background
		|        {
		|            get { return background; }
		|            set
		|            {
		|                background = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbackground = value.AsString();
		|                    if (Owner != null)
		|                    {
		|                        string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['background'] = '"" + resbackground + ""';"";
		|                        DeclarativeForms.SendStrFunc(strFunc);
		|                    }
		|                }
		|                else
		|                {
		|                    DfBackground val = (DfBackground)value;
		|
		|                    if (val.BackgroundColor != null)
		|                    {
		|                        BackgroundColor = val.BackgroundColor.AsString();
		|                    }
		|                    if (val.BackgroundImage != null)
		|                    {
		|                        BackgroundImage = val.BackgroundImage.AsString();
		|                    }
		|                    if (val.BackgroundRepeat != null)
		|                    {
		|                        BackgroundRepeat = val.BackgroundRepeat.AsString();
		|                    }
		|                    if (val.BackgroundPosition != null)
		|                    {
		|                        BackgroundPosition = val.BackgroundPosition.AsString();
		|                    }
		|                    if (val.BackgroundOrigin != null)
		|                    {
		|                        BackgroundOrigin = val.BackgroundOrigin.AsString();
		|                    }
		|                    if (val.BackgroundClip != null)
		|                    {
		|                        BackgroundClip = val.BackgroundClip.AsString();
		|                    }
		|                    if (val.BackgroundSize != null)
		|                    {
		|                        BackgroundSize = val.BackgroundSize;
		|                    }
		|                    if (val.BackgroundAttachment != null)
		|                    {
		|                        BackgroundAttachment = val.BackgroundAttachment.AsString();
		|                    }
		|                }
		|            }
		|        }
		|
		|        public string resanimationDuration { get; set; }
		|        public IValue animationDuration { get; set; }
		|        [ContextProperty(""ДлительностьАнимации"", ""AnimationDuration"")]
		|        public IValue AnimationDuration
		|        {
		|            get { return animationDuration; }
		|            set
		|            {
		|                animationDuration = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resanimationDuration = value.AsString();
		|                }
		|                else
		|                {
		|                    resanimationDuration = value.AsNumber().ToString().Replace("","", ""."") + ""ms"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationDuration'] = '"" + resanimationDuration + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationDelay { get; set; }
		|        public IValue animationDelay { get; set; }
		|        [ContextProperty(""ЗадержкаАнимации"", ""AnimationDelay"")]
		|        public IValue AnimationDelay
		|        {
		|            get { return animationDelay; }
		|            set
		|            {
		|                animationDelay = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resanimationDelay = value.AsString();
		|                }
		|                else
		|                {
		|                    resanimationDelay = value.AsNumber().ToString().Replace("","", ""."") + ""ms"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationDelay'] = '"" + resanimationDelay + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationIterationCount { get; set; }
		|        public IValue animationIterationCount { get; set; }
		|        [ContextProperty(""КоличествоПовторов"", ""AnimationIterationCount"")]
		|        public IValue AnimationIterationCount
		|        {
		|            get { return animationIterationCount; }
		|            set
		|            {
		|                animationIterationCount = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resanimationIterationCount = value.AsString();
		|                }
		|                else
		|                {
		|                    if (value.AsNumber() == -1)
		|                    {
		|                        resanimationIterationCount = ""infinite "";
		|                    }
		|                    else
		|                    {
		|                        resanimationIterationCount = value.AsNumber().ToString().Replace("","", ""."");
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationIterationCount'] = '"" + resanimationIterationCount + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationPlayState { get; set; }
		|        public string animationPlayState { get; set; }
		|        [ContextProperty(""Состояние"", ""AnimationPlayState"")]
		|        public string AnimationPlayState
		|        {
		|            get { return animationPlayState; }
		|            set
		|            {
		|                animationPlayState = value;
		|                resanimationPlayState = animationPlayState;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationPlayState'] = '"" + resanimationPlayState + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationTimingFunction { get; set; }
		|        public string animationTimingFunction { get; set; }
		|        [ContextProperty(""ФункцияСинхронизации"", ""AnimationTimingFunction"")]
		|        public string AnimationTimingFunction
		|        {
		|            get { return animationTimingFunction; }
		|            set
		|            {
		|                animationTimingFunction = value;
		|                resanimationTimingFunction = animationTimingFunction;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationTimingFunction'] = '"" + resanimationTimingFunction + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationFillMode { get; set; }
		|        public string animationFillMode { get; set; }
		|        [ContextProperty(""ЗаливкаАнимации"", ""AnimationFillMode"")]
		|        public string AnimationFillMode
		|        {
		|            get { return animationFillMode; }
		|            set
		|            {
		|                animationFillMode = value;
		|                resanimationFillMode = animationFillMode;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationFillMode'] = '"" + resanimationFillMode + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationDirection { get; set; }
		|        public string animationDirection { get; set; }
		|        [ContextProperty(""НаправлениеАнимации"", ""AnimationDirection"")]
		|        public string AnimationDirection
		|        {
		|            get { return animationDirection; }
		|            set
		|            {
		|                animationDirection = value;
		|                resanimationDirection = animationDirection;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationDirection'] = '"" + resanimationDirection + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resanimationName { get; set; }
		|        public string animationName { get; set; }
		|        [ContextProperty(""ИмяАнимации"", ""AnimationName"")]
		|        public string AnimationName
		|        {
		|            get { return animationName; }
		|            set
		|            {
		|                animationName = value;
		|                resanimationName = animationName;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animationName'] = '"" + resanimationName + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|		
		|        public string Rotate(DfRotate p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""rotate("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string RotateY(DfRotateY p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""rotateY("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string RotateX(DfRotateX p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""rotateX("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string Scale(DfScale p1)
		|        {
		|            string res;
		|            string x = ""1"";
		|            string y = ""1"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsString();
		|            }
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsString();
		|            }
		|            res = ""scale("" + x + "", "" + y + "")"";
		|            return res;
		|        }
		|        public string Rotate3D(DfRotate3D p1)
		|        {
		|            string res;
		|            string x = ""0"";
		|            string y = ""0"";
		|            string z = ""0"";
		|            string angle = ""0"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsString();
		|            }
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsString();
		|            }
		|            if (p1.Z != null)
		|            {
		|                z = p1.Z.AsString();
		|            }
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""rotate3d("" + x + "", "" + y + "", "" + z + "", "" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string Translate3D(DfTranslate3D p1)
		|        {
		|            string res;
		|            string x = ""0px"";
		|            string y = ""0px"";
		|            string z = ""0px"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsString() + ""px"";
		|            }
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsString() + ""px"";
		|            }
		|            if (p1.Z != null)
		|            {
		|                z = p1.Z.AsString() + ""px"";
		|            }
		|            res = ""translate3d("" + x + "", "" + y + "", "" + z + "")"";
		|            return res;
		|        }
		|        public string Scale3D(DfScale3D p1)
		|        {
		|            string res;
		|            string x = ""1"";
		|            string y = ""1"";
		|            string z = ""1"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsString();
		|            }
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsString();
		|            }
		|            if (p1.Z != null)
		|            {
		|                z = p1.Z.AsString();
		|            }
		|            res = ""scale3d("" + x + "", "" + y + "", "" + z + "")"";
		|            return res;
		|        }
		|        public string TranslateZ(DfTranslateZ p1)
		|        {
		|            string res;
		|            string z = ""0px"";
		|            if (p1.Z != null)
		|            {
		|                z = p1.Z.AsNumber().ToString() + ""px"";
		|            }
		|            res = ""translateZ("" + z + "")"";
		|            return res;
		|        }
		|        public string TranslateY(DfTranslateY p1)
		|        {
		|            string res;
		|            string y = ""0px"";
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsNumber().ToString() + ""px"";
		|            }
		|            res = ""translateY("" + y + "")"";
		|            return res;
		|        }
		|        public string TranslateX(DfTranslateX p1)
		|        {
		|            string res;
		|            string x = ""0px"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsNumber().ToString() + ""px"";
		|            }
		|            res = ""translateX("" + x + "")"";
		|            return res;
		|        }
		|        public string Translate(DfTranslate p1)
		|        {
		|            string res;
		|            string x = ""0px"";
		|            string y = ""0px"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsNumber().ToString() + ""px"";
		|            }
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsNumber().ToString() + ""px"";
		|            }
		|            res = ""translate("" + x + "", "" + y + "")"";
		|            return res;
		|        }
		|        public string ScaleX(DfScaleX p1)
		|        {
		|            string res;
		|            string x = ""1"";
		|            if (p1.X != null)
		|            {
		|                x = p1.X.AsNumber().ToString();
		|            }
		|            res = ""scaleX("" + x + "")"";
		|            return res;
		|        }
		|        public string ScaleY(DfScaleY p1)
		|        {
		|            string res;
		|            string y = ""1"";
		|            if (p1.Y != null)
		|            {
		|                y = p1.Y.AsNumber().ToString();
		|            }
		|            res = ""scaleY("" + y + "")"";
		|            return res;
		|        }
		|        public string ScaleZ(DfScaleZ p1)
		|        {
		|            string res;
		|            string z = ""1"";
		|            if (p1.Z != null)
		|            {
		|                z = p1.Z.AsNumber().ToString();
		|            }
		|            res = ""scaleZ("" + z + "")"";
		|            return res;
		|        }
		|        public string RotateZ(DfRotateZ p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""rotateZ("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string Skew(DfSkew p1)
		|        {
		|            string res;
		|            string angleX = ""0"";
		|            string angleY = ""0"";
		|            if (p1.AngleX != null)
		|            {
		|                angleX = p1.AngleX.AsString();
		|            }
		|            if (p1.AngleY != null)
		|            {
		|                angleY = p1.AngleY.AsString();
		|            }
		|            res = ""skew("" + angleX + ""deg, "" + angleY + ""deg)"";
		|            return res;
		|        }
		|        public string SkewX(DfSkewX p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""skewX("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string SkewY(DfSkewY p1)
		|        {
		|            string res;
		|            string angle = ""0"";
		|            if (p1.Angle != null)
		|            {
		|                angle = p1.Angle.AsString();
		|            }
		|            res = ""skewY("" + angle + ""deg)"";
		|            return res;
		|        }
		|        public string TransformPerspective(DfPerspective p1)
		|        {
		|            string res;
		|            string ratio = ""0"";
		|            if (p1.Ratio != null)
		|            {
		|                ratio = p1.Ratio.AsString();
		|            }
		|            res = ""perspective("" + ratio + ""px)"";
		|            return res;
		|        }
		|        public string Matrix(DfMatrix p1)
		|        {
		|            string res;
		|            string scaleX = ""1"";
		|            string transformY = ""0"";
		|            string transformX = ""0"";
		|            string scaleY = ""1"";
		|            string offsetX = ""0"";
		|            string offsetY = ""0"";
		|            if (p1.ScaleX != null)
		|            {
		|                scaleX = p1.ScaleX.AsString();
		|            }
		|            if (p1.TransformY != null)
		|            {
		|                transformY = p1.TransformY.AsString();
		|            }
		|            if (p1.TransformX != null)
		|            {
		|                transformX = p1.TransformX.AsString();
		|            }
		|            if (p1.ScaleY != null)
		|            {
		|                scaleY = p1.ScaleY.AsString();
		|            }
		|            if (p1.OffsetX != null)
		|            {
		|                offsetX = p1.OffsetX.AsString();
		|            }
		|            if (p1.OffsetY != null)
		|            {
		|                offsetY = p1.OffsetY.AsString();
		|            }
		|            res = ""matrix("" + scaleX + "", "" + transformY + "", ""  + transformX +  "", "" + scaleY + "", "" + offsetX + "", "" + offsetY + "")"";
		|            return res;
		|        }
		|        public string Matrix3D(DfMatrix3D p1)
		|        {
		|            string res = ""matrix3d("";
		|            res += p1[""Number"" + 1];
		|            for (int i = 1; i < 16; i++)
		|            {
		|                res += "", "" + p1[""Number"" + (i + 1)];
		|            }
		|            res += "")"";
		|            return res;
		|        }
		|
		|        public string restransform { get; set; }
		|        public IValue transform { get; set; }
		|        [ContextProperty(""Сдвиг"", ""Transform"")]
		|        public IValue Transform
		|        {
		|            get { return transform; }
		|            set
		|            {
		|                transform = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restransform = value.AsString();
		|                }
		|                else
		|                {
		|                    if (transform.GetType() == typeof(ArrayImpl))
		|                    {
		|                        ArrayImpl ArrayImpl1 = (ArrayImpl)value;
		|                        for (int i = 0; i < ArrayImpl1.Count(); i++)
		|                        {
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotate))
		|                            {
		|                                restransform = restransform + "" "" + Rotate((DfRotate)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateY))
		|                            {
		|                                restransform = restransform + "" "" + RotateY((DfRotateY)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateX))
		|                            {
		|                                restransform = restransform + "" "" + RotateX((DfRotateX)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScale))
		|                            {
		|                                restransform = restransform + "" "" + Scale((DfScale)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotate3D))
		|                            {
		|                                restransform = restransform + "" "" + Rotate3D((DfRotate3D)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslate3D))
		|                            {
		|                                restransform = restransform + "" "" + Translate3D((DfTranslate3D)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScale3D))
		|                            {
		|                                restransform = restransform + "" "" + Scale3D((DfScale3D)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateZ))
		|                            {
		|                                restransform = restransform + "" "" + TranslateZ((DfTranslateZ)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateY))
		|                            {
		|                                restransform = restransform + "" "" + TranslateY((DfTranslateY)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslateX))
		|                            {
		|                                restransform = restransform + "" "" + TranslateX((DfTranslateX)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfTranslate))
		|                            {
		|                                restransform = restransform + "" "" + Translate((DfTranslate)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleX))
		|                            {
		|                                restransform = restransform + "" "" + ScaleX((DfScaleX)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleY))
		|                            {
		|                                restransform = restransform + "" "" + ScaleY((DfScaleY)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfScaleZ))
		|                            {
		|                                restransform = restransform + "" "" + ScaleZ((DfScaleZ)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfRotateZ))
		|                            {
		|                                restransform = restransform + "" "" + RotateZ((DfRotateZ)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkew))
		|                            {
		|                                restransform = restransform + "" "" + Skew((DfSkew)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkewX))
		|                            {
		|                                restransform = restransform + "" "" + SkewX((DfSkewX)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfSkewY))
		|                            {
		|                                restransform = restransform + "" "" + SkewY((DfSkewY)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfPerspective))
		|                            {
		|                                restransform = restransform + "" "" + TransformPerspective((DfPerspective)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfMatrix))
		|                            {
		|                                restransform = restransform + "" "" + Matrix((DfMatrix)ArrayImpl1.Get(i));
		|                            }
		|                            if (ArrayImpl1.Get(i).GetType() == typeof(DfMatrix3D))
		|                            {
		|                                restransform = restransform + "" "" + Matrix3D((DfMatrix3D)ArrayImpl1.Get(i));
		|                            }
		|                        }
		|                    }
		|
		|                    if (transform.GetType() == typeof(DfRotate))
		|                    {
		|                        restransform = Rotate((DfRotate)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfRotateY))
		|                    {
		|                        restransform = RotateY((DfRotateY)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfRotateX))
		|                    {
		|                        restransform = RotateX((DfRotateX)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfRotate3D))
		|                    {
		|                        restransform = Rotate3D((DfRotate3D)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfScale))
		|                    {
		|                        restransform = Scale((DfScale)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslate3D))
		|                    {
		|                        restransform = Translate3D((DfTranslate3D)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslate3D))
		|                    {
		|                        restransform = Translate3D((DfTranslate3D)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfScale3D))
		|                    {
		|                        restransform = Scale3D((DfScale3D)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslateZ))
		|                    {
		|                        restransform = TranslateZ((DfTranslateZ)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslateY))
		|                    {
		|                        restransform = TranslateY((DfTranslateY)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslateX))
		|                    {
		|                        restransform = TranslateX((DfTranslateX)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfTranslate))
		|                    {
		|                        restransform = Translate((DfTranslate)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfScaleX))
		|                    {
		|                        restransform = ScaleX((DfScaleX)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfScaleY))
		|                    {
		|                        restransform = ScaleY((DfScaleY)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfScaleZ))
		|                    {
		|                        restransform = ScaleZ((DfScaleZ)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfRotateZ))
		|                    {
		|                        restransform = RotateZ((DfRotateZ)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfSkew))
		|                    {
		|                        restransform = Skew((DfSkew)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfSkewX))
		|                    {
		|                        restransform = SkewX((DfSkewX)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfSkewY))
		|                    {
		|                        restransform = SkewY((DfSkewY)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfPerspective))
		|                    {
		|                        restransform = TransformPerspective((DfPerspective)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfMatrix))
		|                    {
		|                        restransform = Matrix((DfMatrix)transform);
		|                    }
		|                    if (transform.GetType() == typeof(DfMatrix3D))
		|                    {
		|                        restransform = Matrix3D((DfMatrix3D)transform);
		|                    }
		|                }
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transform'] = '"" + restransform + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundSize { get; set; }
		|        public IValue backgroundSize { get; set; }
		|        [ContextProperty(""РазмерКартинки"", ""BackgroundSize"")]
		|        public IValue BackgroundSize
		|        {
		|            get { return backgroundSize; }
		|            set
		|            {
		|                backgroundSize = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbackgroundSize = value.AsString();
		|                }
		|                else
		|                {
		|                    DfSize val = (DfSize)value;
		|                    if (val.Width != null && val.Height != null)
		|                    {
		|                        resbackgroundSize = val.Width.AsNumber().ToString() + ""px "" + val.Height.AsNumber().ToString() + ""px"";
		|                    }
		|                    else
		|                    {
		|                        resbackgroundSize = ""auto"";
		|                    }
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundSize'] = '"" + resbackgroundSize + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfontSize { get; set; }
		|        public IValue fontSize { get; set; }
		|        [ContextProperty(""РазмерШрифта"", ""FontSize"")]
		|        public IValue FontSize
		|        {
		|            get { return fontSize; }
		|            set
		|            {
		|                fontSize = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resfontSize = value.AsString();
		|                }
		|                else
		|                {
		|                    resfontSize = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['fontSize'] = '"" + resfontSize + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resminHeight { get; set; }
		|        public IValue minHeight { get; set; }
		|        [ContextProperty(""МинимальнаяВысота"", ""MinHeight"")]
		|        public IValue MinHeight
		|        {
		|            get { return minHeight; }
		|            set
		|            {
		|                minHeight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resminHeight = value.AsString();
		|                }
		|                else
		|                {
		|                    resminHeight = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['minHeight'] = '"" + resminHeight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resopacity { get; set; }
		|        public IValue opacity { get; set; }
		|        [ContextProperty(""Непрозрачность"", ""Opacity"")]
		|        public IValue Opacity
		|        {
		|            get { return opacity; }
		|            set
		|            {
		|                opacity = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resopacity = value.AsString();
		|                }
		|                else
		|                {
		|                    resopacity = value.AsNumber().ToString().Replace("","", ""."");
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['opacity'] = '"" + resopacity + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransformOrigin { get; set; }
		|        public IValue transformOrigin { get; set; }
		|        [ContextProperty(""ТочкаСдвига"", ""TransformOrigin"")]
		|        public IValue TransformOrigin
		|        {
		|            get { return transformOrigin; }
		|            set
		|            {
		|                transformOrigin = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restransformOrigin = value.AsString();
		|                }
		|                else
		|                {
		|                    DfTransformOrigin val = (DfTransformOrigin)value;
		|                    string axisX = ""0"";
		|                    string axisY = ""0"";
		|                    string axisZ = ""0"";
		|                    if (val.AxisX != 0)
		|                    {
		|                        axisX = val.AxisX.ToString();
		|                    }
		|                    if (val.AxisY != 0)
		|                    {
		|                        axisY = val.AxisY.ToString();
		|                    }
		|                    if (val.AxisZ != 0)
		|                    {
		|                        axisZ = val.AxisZ.ToString();
		|                    }
		|                    restransformOrigin = axisX + "" "" + axisY + "" "" + axisZ + "" "";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transformOrigin'] = '"" + restransformOrigin + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restransformStyle { get; set; }
		|        public string transformStyle { get; set; }
		|        [ContextProperty(""СтильСдвига"", ""TransformStyle"")]
		|        public string TransformStyle
		|        {
		|            get { return transformStyle; }
		|            set
		|            {
		|                transformStyle = value;
		|                restransformStyle = transformStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['transformStyle'] = '"" + restransformStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resperspectiveOrigin { get; set; }
		|        public IValue perspectiveOrigin { get; set; }
		|        [ContextProperty(""ИсточникПерспективы"", ""PerspectiveOrigin"")]
		|        public IValue PerspectiveOrigin
		|        {
		|            get { return perspectiveOrigin; }
		|            set
		|            {
		|                perspectiveOrigin = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resperspectiveOrigin = value.AsString();
		|                }
		|                else
		|                {
		|                    DfPerspectiveOrigin val = (DfPerspectiveOrigin)value;
		|                    string x = ""0"";
		|                    string y = ""0"";
		|                    if (val.X != null)
		|                    {
		|                        x = val.X.ToString();
		|                    }
		|                    if (val.Y != null)
		|                    {
		|                        y = val.Y.ToString();
		|                    }
		|                    resperspectiveOrigin = x + ""px "" + y + ""px "";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['perspectiveOrigin'] = '"" + resperspectiveOrigin + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resperspective { get; set; }
		|        public IValue perspective { get; set; }
		|        [ContextProperty(""Перспектива"", ""Perspective"")]
		|        public IValue Perspective
		|        {
		|            get { return perspective; }
		|            set
		|            {
		|                perspective = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resperspective = value.AsString();
		|                }
		|                else
		|                {
		|                    resperspective = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['perspective'] = '"" + resperspective + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundRepeat { get; set; }
		|        public string backgroundRepeat { get; set; }
		|        [ContextProperty(""МозаикаКартинки"", ""BackgroundRepeat"")]
		|        public string BackgroundRepeat
		|        {
		|            get { return backgroundRepeat; }
		|            set
		|            {
		|                backgroundRepeat = value;
		|                resbackgroundRepeat = backgroundRepeat;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundRepeat'] = '"" + resbackgroundRepeat + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfontFamily { get; set; }
		|        public string fontFamily { get; set; }
		|        [ContextProperty(""СемействоШрифтов"", ""FontFamily"")]
		|        public string FontFamily
		|        {
		|            get { return fontFamily; }
		|            set
		|            {
		|                fontFamily = value;
		|                resfontFamily = fontFamily;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['fontFamily'] = '"" + resfontFamily + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextShadow { get; set; }
		|        public IValue textShadow { get; set; }
		|        [ContextProperty(""ТеньТекста"", ""TextShadow"")]
		|        public IValue TextShadow
		|        {
		|            get { return textShadow; }
		|            set
		|            {
		|                textShadow = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restextShadow = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBoxShadow val = (DfBoxShadow)value;
		|                    string x = ""0px "";
		|                    string y = ""0px "";
		|                    string blur = ""0px "";
		|                    string color = ""rgb(0, 0, 0) "";
		|                    if (val.X != null)
		|                    {
		|                        x = val.X.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Y != null)
		|                    {
		|                        y = val.Y.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Blur != null)
		|                    {
		|                        blur = val.Blur.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Color != null)
		|                    {
		|                        color = val.Color.AsString() + "" "";
		|                    }
		|                    restextShadow = x + y + blur + color;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textShadow'] = '"" + restextShadow + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundImage { get; set; }
		|        public string backgroundImage { get; set; }
		|        [ContextProperty(""ФоновоеИзображение"", ""BackgroundImage"")]
		|        public string BackgroundImage
		|        {
		|            get { return backgroundImage; }
		|            set
		|            {
		|                backgroundImage = value;
		|                if (value.Contains(""gradient""))
		|                {
		|                    resbackgroundImage = backgroundImage;
		|                }
		|                else
		|                {
		|                    resbackgroundImage = ""url('"" + backgroundImage
		|                        .Replace(""url(\u0022"", """")
		|                        .Replace(""\u0022)"", """")
		|                        .Replace(""url('"", """")
		|                        .Replace(""')"", """")
		|                        .Replace("" "", ""%20"") +
		|                        ""') "";
		|                }
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundImage'] = \u0022"" + resbackgroundImage + ""\u0022;"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoffset { get; set; }
		|        public IValue offset { get; set; }
		|        [ContextProperty(""Смещение"", ""Offset"")]
		|        public IValue Offset
		|        {
		|            get { return offset; }
		|            set
		|            {
		|                offset = value;
		|                resoffset = value.AsNumber().ToString().Replace("","", ""."");
		|            }
		|        }
		|
		|        public DfFrames frames { get; set; }
		|        [ContextProperty(""Кадры"", ""Frames"")]
		|        public DfFrames Frames
		|        {
		|            get { return frames; }
		|            set
		|            {
		|                frames = value;
		|                string strFunc = """" +
		|                    ""let s = '@keyframes "" + frames.Name + @"" { \u000A';"" +
		|                    ""let el = mapKeyEl.get('"" + frames.ItemKey + ""');"" +
		|                    ""for (var i = 0; i < el.length; i++)"" +
		|                    ""{"" +
		|                    ""   let item = el[i];"" +
		|                    ""   let offset = '';"" +
		|                    ""   let keys = Object.keys(item);"" +
		|                    ""   let subS = '';"" +
		|                    ""   for (var i1 = 0; i1 < keys.length; i1++)"" +
		|                    ""   {"" +
		|                    ""       let prop = keys[i1];"" +
		|                    ""       if (!prop.includes('offset'))"" +
		|                    ""       {"" +
		|                    ""           subS += prop + ': ';"" +
		|                    ""           subS += item[prop] + '; ';"" +
		|                    ""       }"" +
		|                    ""       else"" +
		|                    ""       {"" +
		|                    ""           offset = '' + (parseFloat(item[prop]) * 100) + '% ';"" +
		|                    ""       }"" +
		|                    ""   }"" +
		|                    ""   subS = offset + ' {' + subS;"" +
		|                    ""   s += subS;"" +
		|                    ""   s += '}"" + @""\u000A';"" +
		|                    ""}"" +
		|                    ""s += '}';"" +
		|                    //""alert(s);"" +
		|                    ""let el2 = mapKeyEl.get('"" + ItemKey + ""');"" +
		|                    ""var t = document.createTextNode(s);"" +
		|                    ""el2.appendChild(t);"" +
		|                    ""document.body.appendChild(el2);"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string resanimation { get; set; }
		|        public IValue animation { get; set; }
		|        [ContextProperty(""Анимация"", ""Animation"")]
		|        public IValue Animation
		|        {
		|            get { return animation; }
		|            set
		|            {
		|                animation = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resanimation = value.AsString();
		|                }
		|                else
		|                {
		|                    DfAnimationProperties val = (DfAnimationProperties)value;
		|                    string name = ""none "";
		|                    string duration = ""0ms "";
		|                    string timingFunction = ""ease "";
		|                    string delay = ""0ms "";
		|                    string iterationCount = ""1 "";
		|                    string direction = ""normal "";
		|                    string fillMode = ""none "";
		|                    string playState = ""running "";
		|                    if (val.AnimationName != null)
		|                    {
		|                        name = val.AnimationName + "" "";
		|                    }
		|                    if (val.AnimationDuration != null)
		|                    {
		|                        duration = val.AnimationDuration.AsNumber().ToString() + ""ms "";
		|                    }
		|                    if (val.AnimationTimingFunction != null)
		|                    {
		|                        timingFunction = val.AnimationTimingFunction.AsString() + "" "";
		|                    }
		|                    if (val.AnimationDelay != null)
		|                    {
		|                        delay = val.AnimationDelay.AsNumber().ToString() + ""ms "";
		|                    }
		|                    if (val.AnimationIterationCount != null)
		|                    {
		|                        if (Convert.ToInt32(val.AnimationIterationCount.AsNumber()) == -1)
		|                        {
		|                            iterationCount = ""infinite "";
		|                        }
		|                        else
		|                        {
		|                            iterationCount = val.AnimationIterationCount.AsNumber().ToString() + "" "";
		|                        }
		|                    }
		|                    if (val.AnimationDirection != null)
		|                    {
		|                        direction = val.AnimationDirection.AsString() + "" "";
		|                    }
		|                    if (val.AnimationFillMode != null)
		|                    {
		|                        fillMode = val.AnimationFillMode.AsString() + "" "";
		|                    }
		|                    if (val.AnimationPlayState != null)
		|                    {
		|                        playState = val.AnimationPlayState.AsString() + "" "";
		|                    }
		|                    resanimation = name + duration + timingFunction + delay + iterationCount + direction + fillMode + playState;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['animation'] = '"" + resanimation + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resalignSelf { get; set; }
		|        public string alignSelf { get; set; }
		|        [ContextProperty(""ВыравниваниеОтдельных"", ""AlignSelf"")]
		|        public string AlignSelf
		|        {
		|            get { return alignSelf; }
		|            set
		|            {
		|                alignSelf = value;
		|                resalignSelf = alignSelf;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['alignSelf'] = '"" + resalignSelf + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resalignContent { get; set; }
		|        public string alignContent { get; set; }
		|        [ContextProperty(""ВыравниваниеСодержимого"", ""AlignContent"")]
		|        public string AlignContent
		|        {
		|            get { return alignContent; }
		|            set
		|            {
		|                alignContent = value;
		|                resalignContent = alignContent;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['alignContent'] = '"" + resalignContent + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resflexDirection { get; set; }
		|        public string flexDirection { get; set; }
		|        [ContextProperty(""НаправлениеЭлементов"", ""FlexDirection"")]
		|        public string FlexDirection
		|        {
		|            get { return flexDirection; }
		|            set
		|            {
		|                flexDirection = value;
		|                resflexDirection = flexDirection;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flexDirection'] = '"" + resflexDirection + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resflexWrap { get; set; }
		|        public string flexWrap { get; set; }
		|        [ContextProperty(""ПереносГибких"", ""FlexWrap"")]
		|        public string FlexWrap
		|        {
		|            get { return flexWrap; }
		|            set
		|            {
		|                flexWrap = value;
		|                resflexWrap = flexWrap;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['flexWrap'] = '"" + resflexWrap + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderRadius { get; set; }
		|        public IValue borderRadius { get; set; }
		|        [ContextProperty(""РадиусГраницы"", ""BorderRadius"")]
		|        public IValue BorderRadius
		|        {
		|            get { return borderRadius; }
		|            set
		|            {
		|                borderRadius = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderRadius = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorderRadius val = (DfBorderRadius)value;
		|                    string borderTopLeftRadius = ""0px "";
		|                    string borderTopRightRadius = ""0px "";
		|                    string borderBottomRightRadius = ""0px "";
		|                    string borderBottomLeftRadius = ""0px "";
		|                    if (val.BorderTopLeftRadius != 0)
		|                    {
		|                        borderTopLeftRadius = val.BorderTopLeftRadius.ToString() + ""px "";
		|                    }
		|                    if (val.BorderTopRightRadius != 0)
		|                    {
		|                        borderTopRightRadius = val.BorderTopRightRadius.ToString() + ""px "";
		|                    }
		|                    if (val.BorderBottomRightRadius != 0)
		|                    {
		|                        borderBottomRightRadius = val.BorderBottomRightRadius.ToString() + ""px "";
		|                    }
		|                    if (val.BorderBottomLeftRadius != 0)
		|                    {
		|                        borderBottomLeftRadius = val.BorderBottomLeftRadius.ToString() + ""px "";
		|                    }
		|                    resborderRadius = borderTopLeftRadius + borderTopRightRadius + borderBottomRightRadius + borderBottomLeftRadius;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderRadius'] = '"" + resborderRadius + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|
		|            }
		|        }
		|
		|        public string resmarginTop { get; set; }
		|        public IValue marginTop { get; set; }
		|        [ContextProperty(""ОтступСверху"", ""MarginTop"")]
		|        public IValue MarginTop
		|        {
		|            get { return marginTop; }
		|            set
		|            {
		|                marginTop = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmarginTop = value.AsString();
		|                }
		|                else
		|                {
		|                    resmarginTop = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['marginTop'] = '"" + resmarginTop + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmarginLeft { get; set; }
		|        public IValue marginLeft { get; set; }
		|        [ContextProperty(""ОтступСлева"", ""MarginLeft"")]
		|        public IValue MarginLeft
		|        {
		|            get { return marginLeft; }
		|            set
		|            {
		|                marginLeft = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmarginLeft = value.AsString();
		|                }
		|                else
		|                {
		|                    resmarginLeft = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['marginLeft'] = '"" + resmarginLeft + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmarginBottom { get; set; }
		|        public IValue marginBottom { get; set; }
		|        [ContextProperty(""ОтступСнизу"", ""MarginBottom"")]
		|        public IValue MarginBottom
		|        {
		|            get { return marginBottom; }
		|            set
		|            {
		|                marginBottom = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmarginBottom = value.AsString();
		|                }
		|                else
		|                {
		|                    resmarginBottom = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['marginBottom'] = '"" + resmarginBottom + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmarginRight { get; set; }
		|        public IValue marginRight { get; set; }
		|        [ContextProperty(""ОтступСправа"", ""MarginRight"")]
		|        public IValue MarginRight
		|        {
		|            get { return marginRight; }
		|            set
		|            {
		|                marginRight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmarginRight = value.AsString();
		|                }
		|                else
		|                {
		|                    resmarginRight = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['marginRight'] = '"" + resmarginRight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfont { get; set; }
		|        public IValue font { get; set; }
		|        [ContextProperty(""Шрифт"", ""Font"")]
		|        public IValue Font
		|        {
		|            get { return font; }
		|            set
		|            {
		|                font = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resfont = value.AsString();
		|                }
		|                else
		|                {
		|                    DfFont val = (DfFont)value;
		|                    string fontStyle = """";
		|                    string fontVariant = """";
		|                    string fontWeight = """";
		|                    string fontSize = ""100%"";
		|                    string lineHeight = ""100%"";
		|                    string fontFamily = """";
		|                    if (val.FontStyle != null)
		|                    {
		|                        fontStyle = val.FontStyle.AsString() + "" "";
		|                    }
		|                    if (val.FontVariant != null)
		|                    {
		|                        fontVariant = val.FontVariant.AsString() + "" "";
		|                    }
		|                    if (val.FontWeight != null)
		|                    {
		|                        fontWeight = val.FontWeight.AsString() + "" "";
		|                    }
		|                    if (val.FontSize != null)
		|                    {
		|                        fontSize = val.FontSize.AsNumber().ToString() + ""px"";
		|                    }
		|                    if (val.LineHeight != null)
		|                    {
		|                        lineHeight = val.LineHeight.AsNumber().ToString() + ""px"";
		|                    }
		|                    if (val.FontFamily != null)
		|                    {
		|                        fontFamily = val.FontFamily.AsString() + "" "";
		|                    }
		|                    resfont = fontStyle + fontVariant + fontWeight + fontSize + ""/"" + lineHeight + "" "" + fontFamily;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['font'] = '"" + resfont + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resfilter { get; set; }
		|        public IValue filter { get; set; }
		|        [ContextProperty(""Фильтр"", ""Filter"")]
		|        public IValue Filter
		|        {
		|            get { return filter; }
		|            set
		|            {
		|                filter = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resfilter = value.AsString();
		|                }
		|                else
		|                {
		|                    DfImagesFilter val = (DfImagesFilter)value;
		|                    string blur = """";
		|                    string brightness = """";
		|                    string contrast = """";
		|                    string dropShadow = """";
		|                    string grayscale = """";
		|                    string hueRotate = """";
		|                    string invert = """";
		|                    string opacity = """";
		|                    string saturate = """";
		|                    string sepia = """";
		|                    if (val.Blur != null)
		|                    {
		|                        blur = ""blur("" + val.Blur.AsNumber().ToString() + ""px) "";
		|                    }
		|                    if (val.Brightness != null)
		|                    {
		|                        brightness = ""brightness("" + val.Brightness.AsNumber().ToString() + ""%) "";
		|                    }
		|                    if (val.Contrast != null)
		|                    {
		|                        contrast = ""contrast("" + val.Contrast.AsNumber().ToString() + ""%) "";
		|                    }
		|                    if (val.DropShadow != null)
		|                    {
		|                        DfBoxShadow boxShadow = (DfBoxShadow)val.DropShadow;
		|                        string x = """";
		|                        string y = """";
		|                        string _blur = """";
		|                        string spread = """";
		|                        string color = """";
		|                        if (boxShadow.X != null)
		|                        {
		|                            x = boxShadow.X.AsNumber().ToString() + ""px "";
		|                        }
		|                        if (boxShadow.Y != null)
		|                        {
		|                            y = boxShadow.Y.AsNumber().ToString() + ""px "";
		|                        }
		|                        if (boxShadow.Blur != null)
		|                        {
		|                            _blur = boxShadow.Blur.AsNumber().ToString() + ""px "";
		|                        }
		|                        if (boxShadow.Spread != null)
		|                        {
		|                            //spread = """" + boxShadow.Spread.AsNumber().ToString() + ""px "";
		|                            // Не поддерживается множеством браузеров. Не используем.
		|                            spread = """";
		|                        }
		|                        if (boxShadow.Color != null)
		|                        {
		|                            color = boxShadow.Color.AsString() + """";
		|                        }
		|                        dropShadow = ""drop-shadow("" + x + y + _blur + spread + color + "") "";
		|                    }
		|                    if (val.Grayscale != null)
		|                    {
		|                        grayscale = ""grayscale("" + val.Grayscale.AsNumber().ToString() + ""%) "";
		|                    }
		|                    if (val.HueRotate != null)
		|                    {
		|                        hueRotate = ""hue-rotate("" + val.HueRotate.AsNumber().ToString() + ""deg) "";
		|                    }
		|                    if (val.Invert != null)
		|                    {
		|                        invert = ""invert("" + val.Invert.AsNumber().ToString() + ""%) "";
		|                    }
		|                    if (val.Opacity != null)
		|                    {
		|                        opacity = ""opacity("" + val.Opacity.AsNumber().ToString() + ""%) "";
		|                    }
		|                    if (val.Saturate != null)
		|                    {
		|                        saturate = ""saturate("" + val.Saturate.AsNumber().ToString() + "") "";
		|                    }
		|                    if (val.Sepia != null)
		|                    {
		|                        sepia = ""sepia("" + val.Sepia.AsNumber().ToString() + ""%) "";
		|                    }
		|                    resfilter = blur + brightness + contrast + dropShadow + grayscale + hueRotate + invert + opacity + saturate + sepia;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['filter'] = '"" + resfilter + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resposition { get; set; }
		|        public string position { get; set; }
		|        [ContextProperty(""Позиция"", ""Position"")]
		|        public string Position
		|        {
		|            get { return position; }
		|            set
		|            {
		|                position = value;
		|                resposition = position;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['position'] = '"" + resposition + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restop { get; set; }
		|        public IValue top { get; set; }
		|        [ContextProperty(""Верх"", ""Top"")]
		|        public IValue Top
		|        {
		|            get { return top; }
		|            set
		|            {
		|                top = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    restop = value.AsString();
		|                }
		|                else
		|                {
		|                    restop = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['top'] = '"" + restop + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbottom { get; set; }
		|        public IValue bottom { get; set; }
		|        [ContextProperty(""Низ"", ""Bottom"")]
		|        public IValue Bottom
		|        {
		|            get { return bottom; }
		|            set
		|            {
		|                bottom = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbottom = value.AsString();
		|                }
		|                else
		|                {
		|                    resbottom = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['bottom'] = '"" + resbottom + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resleft { get; set; }
		|        public IValue left { get; set; }
		|        [ContextProperty(""Лево"", ""Left"")]
		|        public IValue Left
		|        {
		|            get { return left; }
		|            set
		|            {
		|                left = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resleft = value.AsString();
		|                }
		|                else
		|                {
		|                    resleft = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['left'] = '"" + resleft + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resright { get; set; }
		|        public IValue right { get; set; }
		|        [ContextProperty(""Право"", ""Right"")]
		|        public IValue Right
		|        {
		|            get { return right; }
		|            set
		|            {
		|                right = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resright = value.AsString();
		|                }
		|                else
		|                {
		|                    resright = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['right'] = '"" + resright + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resjustifyContent { get; set; }
		|        public string justifyContent { get; set; }
		|        [ContextProperty(""РасположениеСодержимого"", ""JustifyContent"")]
		|        public string JustifyContent
		|        {
		|            get { return justifyContent; }
		|            set
		|            {
		|                justifyContent = value;
		|                resjustifyContent = justifyContent;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['justifyContent'] = '"" + resjustifyContent + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resdisplay { get; set; }
		|        public string display { get; set; }
		|        [ContextProperty(""Отображать"", ""Display"")]
		|        public string Display
		|        {
		|            get { return display; }
		|            set
		|            {
		|                display = value;
		|                resdisplay = display;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['display'] = '"" + resdisplay + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resalignItems { get; set; }
		|        public string alignItems { get; set; }
		|        [ContextProperty(""ВыравниваниеЭлементов"", ""AlignItems"")]
		|        public string AlignItems
		|        {
		|            get { return alignItems; }
		|            set
		|            {
		|                alignItems = value;
		|                resalignItems = alignItems;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['alignItems'] = '"" + resalignItems + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resboxShadow { get; set; }
		|        public IValue boxShadow { get; set; }
		|        [ContextProperty(""Тень"", ""BoxShadow"")]
		|        public IValue BoxShadow
		|        {
		|            get { return boxShadow; }
		|            set
		|            {
		|                boxShadow = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resboxShadow = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBoxShadow val = (DfBoxShadow)value;
		|                    string x = ""0px "";
		|                    string y = ""0px "";
		|                    string blur = ""0px "";
		|                    string spread = ""0px "";
		|                    string color = ""rgb(0, 0, 0) "";
		|                    string inset = """";
		|                    if (val.X != null)
		|                    {
		|                        x = val.X.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Y != null)
		|                    {
		|                        y = val.Y.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Blur != null)
		|                    {
		|                        blur = val.Blur.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Spread != null)
		|                    {
		|                        spread = val.Spread.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.Color != null)
		|                    {
		|                        color = val.Color.AsString() + "" "";
		|                    }
		|                    if (val.Inset)
		|                    {
		|                        inset = ""inset"";
		|                    }
		|                    resboxShadow = x + y + blur + spread + color + inset;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['boxShadow'] = '"" + resboxShadow + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reslistStyle { get; set; }
		|        public IValue listStyle { get; set; }
		|        [ContextProperty(""СтильСписка"", ""ListStyle"")]
		|        public IValue ListStyle
		|        {
		|            get { return listStyle; }
		|            set
		|            {
		|                listStyle = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    reslistStyle = value.AsString();
		|                }
		|                else
		|                {
		|                    DfListStyle val = (DfListStyle)value;
		|                    string listStyleType = ""decimal "";
		|                    string listStylePosition = ""outside "";
		|                    string listStyleImage = ""none"";
		|                    if (val.ListStyleType != null)
		|                    {
		|                        listStyleType = val.ListStyleType.AsString() + "" "";
		|                    }
		|                    if (val.ListStylePosition != null)
		|                    {
		|                        listStylePosition = val.ListStylePosition.AsString() + "" "";
		|                    }
		|                    if (val.ListStyleImage != null)
		|                    {
		|                        listStyleImage = ""url('"" + val.ListStyleImage.AsString()
		|                            .Replace(""url(\u0022"", """")
		|                            .Replace(""\u0022)"", """")
		|                            .Replace(""url('"", """")
		|                            .Replace(""')"", """")
		|                            .Replace("" "", ""%20"") +
		|                            ""') "";
		|                    }
		|                    reslistStyle = listStyleType + listStylePosition + listStyleImage;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['listStyle'] = \u0022"" + reslistStyle + ""\u0022;"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnRule { get; set; }
		|        public IValue columnRule { get; set; }
		|        [ContextProperty(""РазделительКолонок"", ""ColumnRule"")]
		|        public IValue ColumnRule
		|        {
		|            get { return columnRule; }
		|            set
		|            {
		|                columnRule = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnRule = value.AsString();
		|                }
		|                else
		|                {
		|                    DfColumnRule val = (DfColumnRule)value;
		|                    string columnRuleWidth = ""medium "";
		|                    string columnRuleStyle = ""none "";
		|                    string columnRuleColor;
		|                    if (Owner != null)
		|                    {
		|                        columnRuleColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        columnRuleColor = BackgroundColor;
		|                    }
		|                    if (val.ColumnRuleWidth != null)
		|                    {
		|                        if (val.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            columnRuleWidth = val.ColumnRuleWidth.AsString() + "" "";
		|                        }
		|                        else if (val.ColumnRuleWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            columnRuleWidth = val.ColumnRuleWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.ColumnRuleStyle != null)
		|                    {
		|                        columnRuleStyle = val.ColumnRuleStyle.AsString() + "" "";
		|                    }
		|                    if (val.ColumnRuleColor != null)
		|                    {
		|                        columnRuleColor = val.ColumnRuleColor.AsString();
		|                    }
		|                    rescolumnRule = columnRuleWidth + columnRuleStyle + columnRuleColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnRule'] = '"" + rescolumnRule + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resverticalAlign { get; set; }
		|        public IValue verticalAlign { get; set; }
		|        [ContextProperty(""ВертикальноеВыравнивание"", ""VerticalAlign"")]
		|        public IValue VerticalAlign
		|        {
		|            get { return verticalAlign; }
		|            set
		|            {
		|                verticalAlign = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resverticalAlign = value.AsString();
		|                }
		|                else
		|                {
		|                    resverticalAlign = value.AsNumber().ToString() + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['verticalAlign'] = '"" + resverticalAlign + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderTop { get; set; }
		|        public IValue borderTop { get; set; }
		|        [ContextProperty(""ВерхняяГраница"", ""BorderTop"")]
		|        public IValue BorderTop
		|        {
		|            get { return borderTop; }
		|            set
		|            {
		|                borderTop = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderTop = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorderTop val = (DfBorderTop)value;
		|                    string borderTopWidth = ""medium "";
		|                    string borderTopStyle = ""none "";
		|                    string borderTopColor;
		|                    if (Owner != null)
		|                    {
		|                        borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderTopColor = BackgroundColor;
		|                    }
		|                    if (val.BorderTopWidth != null)
		|                    {
		|                        if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderTopWidth = val.BorderTopWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderTopWidth = val.BorderTopWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderTopStyle != null)
		|                    {
		|                        borderTopStyle = val.BorderTopStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderTopColor != null)
		|                    {
		|                        borderTopColor = val.BorderTopColor.AsString();
		|                    }
		|                    resborderTop = borderTopWidth + borderTopStyle + borderTopColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTop'] = '"" + resborderTop + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resheight { get; set; }
		|        public IValue height { get; set; }
		|        [ContextProperty(""Высота"", ""Height"")]
		|        public IValue Height
		|        {
		|            get { return height; }
		|            set
		|            {
		|                height = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resheight = value.AsString();
		|                }
		|                else
		|                {
		|                    resheight = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['height'] = '"" + resheight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reshorizontalTextAlign { get; set; }
		|        public string horizontalTextAlign { get; set; }
		|        [ContextProperty(""ГоризонтальноеВыравниваниеТекста"", ""HorizontalTextAlign"")]
		|        public string HorizontalTextAlign
		|        {
		|            get { return horizontalTextAlign; }
		|            set
		|            {
		|                horizontalTextAlign = value;
		|                reshorizontalTextAlign = horizontalTextAlign;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['textAlign'] = '"" + reshorizontalTextAlign + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderCollapse { get; set; }
		|        public string borderCollapse { get; set; }
		|        [ContextProperty(""ГраницаСвернута"", ""BorderCollapse"")]
		|        public string BorderCollapse
		|        {
		|            get { return borderCollapse; }
		|            set
		|            {
		|                borderCollapse = value;
		|                resborderCollapse = borderCollapse;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderCollapse'] = '"" + resborderCollapse + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborders { get; set; }
		|        public IValue borders { get; set; }
		|        [ContextProperty(""Границы"", ""Borders"")]
		|        public IValue Borders
		|        {
		|            get { return borders; }
		|            set
		|            {
		|                borders = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborders = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorders val = (DfBorders)value;
		|                    string borderWidth = ""medium "";
		|                    string borderStyle = ""none "";
		|                    string borderColor;
		|                    if (Owner != null)
		|                    {
		|                        borderColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderColor = BackgroundColor;
		|                    }
		|                    if (val.BorderWidth != null)
		|                    {
		|                        if (val.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderWidth = val.BorderWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderWidth = val.BorderWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderStyle != null)
		|                    {
		|                        borderStyle = val.BorderStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderColor != null)
		|                    {
		|                        borderColor = val.BorderColor.AsString();
		|                    }
		|                    resborders = borderWidth + borderStyle + borderColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['border'] = '"" + resborders + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string respadding { get; set; }
		|        public IValue padding { get; set; }
		|        [ContextProperty(""Заполнение"", ""Padding"")]
		|        public IValue Padding
		|        {
		|            get { return padding; }
		|            set
		|            {
		|                padding = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    respadding = value.AsString();
		|                }
		|                else
		|                {
		|                    DfPadding val = (DfPadding)value;
		|                    string paddingTop = ""0px "";
		|                    string paddingRight = ""0px "";
		|                    string paddingBottom = ""0px "";
		|                    string paddingLeft = ""0px"";
		|                    if (val.PaddingTop != null)
		|                    {
		|                        paddingTop = val.PaddingTop.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.PaddingRight != null)
		|                    {
		|                        paddingRight = val.PaddingRight.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.PaddingBottom != null)
		|                    {
		|                        paddingBottom = val.PaddingBottom.AsNumber().ToString() + ""px "";
		|                    }
		|                    if (val.PaddingLeft != null)
		|                    {
		|                        paddingLeft = val.PaddingLeft.AsNumber().ToString() + ""px"";
		|                    }
		|                    respadding = paddingTop + paddingRight + paddingBottom + paddingLeft;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['padding'] = '"" + respadding + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string respaddingTop { get; set; }
		|        public IValue paddingTop { get; set; }
		|        [ContextProperty(""ЗаполнениеСверху"", ""PaddingTop"")]
		|        public IValue PaddingTop
		|        {
		|            get { return paddingTop; }
		|            set
		|            {
		|                paddingTop = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    respaddingTop = value.AsString();
		|                }
		|                else
		|                {
		|                    respaddingTop = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['paddingTop'] = '"" + respaddingTop + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string respaddingLeft { get; set; }
		|        public IValue paddingLeft { get; set; }
		|        [ContextProperty(""ЗаполнениеСлева"", ""PaddingLeft"")]
		|        public IValue PaddingLeft
		|        {
		|            get { return paddingLeft; }
		|            set
		|            {
		|                paddingLeft = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    respaddingLeft = value.AsString();
		|                }
		|                else
		|                {
		|                    respaddingLeft = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['paddingLeft'] = '"" + respaddingLeft + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string respaddingBottom { get; set; }
		|        public IValue paddingBottom { get; set; }
		|        [ContextProperty(""ЗаполнениеСнизу"", ""PaddingBottom"")]
		|        public IValue PaddingBottom
		|        {
		|            get { return paddingBottom; }
		|            set
		|            {
		|                paddingBottom = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    respaddingBottom = value.AsString();
		|                }
		|                else
		|                {
		|                    respaddingBottom = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['paddingBottom'] = '"" + respaddingBottom + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string respaddingRight { get; set; }
		|        public IValue paddingRight { get; set; }
		|        [ContextProperty(""ЗаполнениеСправа"", ""PaddingRight"")]
		|        public IValue PaddingRight
		|        {
		|            get { return paddingRight; }
		|            set
		|            {
		|                paddingRight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    respaddingRight = value.AsString();
		|                }
		|                else
		|                {
		|                    respaddingRight = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['paddingRight'] = '"" + respaddingRight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|
		|        public string resborderImage { get; set; }
		|        public IValue borderImage { get; set; }
		|        [ContextProperty(""КартинкаГраницы"", ""BorderImage"")]
		|        public IValue BorderImage
		|        {
		|            get { return borderImage; }
		|            set
		|            {
		|                borderImage = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderImage = value.AsString();
		|                    if (Owner != null)
		|                    {
		|                        string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderImage'] = '"" + resborderImage + ""';"";
		|                        DeclarativeForms.SendStrFunc(strFunc);
		|                    }
		|                }
		|                else
		|                {
		|                    DfBorderImage val = (DfBorderImage)value;
		|                    if (val.BorderImageSource != null)
		|                    {
		|                        BorderImageSource = val.BorderImageSource.AsString();
		|                    }
		|                    if (val.BorderImageSlice != null)
		|                    {
		|                        BorderImageSlice = val.BorderImageSlice;
		|                    }
		|                    if (val.BorderImageWidth != null)
		|                    {
		|                        BorderImageWidth = val.BorderImageWidth;
		|                    }
		|                    if (val.BorderImageOutset != null)
		|                    {
		|                        BorderImageOutset = val.BorderImageOutset;
		|                    }
		|                    if (val.BorderImageRepeat != null)
		|                    {
		|                        BorderImageRepeat = val.BorderImageRepeat.AsString();
		|                    }
		|                }
		|            }
		|        }
		|
		|        public string rescolumnCount { get; set; }
		|        public IValue columnCount { get; set; }
		|        [ContextProperty(""КоличествоКолонок"", ""ColumnCount"")]
		|        public IValue ColumnCount
		|        {
		|            get { return columnCount; }
		|            set
		|            {
		|                columnCount = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnCount = value.AsString();
		|                }
		|                else
		|                {
		|                    rescolumnCount = value.AsNumber().ToString().Replace("","", ""."");
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnCount'] = '"" + rescolumnCount + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumns { get; set; }
		|        public IValue columns { get; set; }
		|        [ContextProperty(""КолонкиЭлемента"", ""Columns"")]
		|        public IValue Columns
		|        {
		|            get { return columns; }
		|            set
		|            {
		|                columns = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumns = value.AsString();
		|                }
		|                else
		|                {
		|                    DfColumns val = (DfColumns)value;
		|                    string columnWidth = ""auto "";
		|                    string columnCount = ""auto"";
		|                    if (val.ColumnWidth != null)
		|                    {
		|                        if (val.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            columnWidth = val.ColumnWidth.AsString() + "" "";
		|                        }
		|                        else if (val.ColumnWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            columnWidth = val.ColumnWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.ColumnCount != null)
		|                    {
		|                        columnCount = val.ColumnCount.AsNumber().ToString();
		|                    }
		|                    rescolumns = columnWidth + columnCount;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columns'] = '"" + rescolumns + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoutline { get; set; }
		|        public IValue outline { get; set; }
		|        [ContextProperty(""Контур"", ""Outline"")]
		|        public IValue Outline
		|        {
		|            get { return outline; }
		|            set
		|            {
		|                outline = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resoutline = value.AsString();
		|                }
		|                else
		|                {
		|                    DfOutline val = (DfOutline)value;
		|                    string outlineWidth = ""medium "";
		|                    string outlineStyle = ""none "";
		|                    string outlineColor;
		|                    if (Owner != null)
		|                    {
		|                        outlineColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        outlineColor = BackgroundColor;
		|                    }
		|                    if (val.OutlineWidth != null)
		|                    {
		|                        if (val.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            outlineWidth = val.OutlineWidth.AsString() + "" "";
		|                        }
		|                        else if (val.OutlineWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            outlineWidth = val.OutlineWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.OutlineStyle != null)
		|                    {
		|                        outlineStyle = val.OutlineStyle.AsString() + "" "";
		|                    }
		|                    if (val.OutlineColor != null)
		|                    {
		|                        outlineColor = val.OutlineColor.AsString();
		|                    }
		|                    resoutline = outlineWidth + outlineStyle + outlineColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['outline'] = '"" + resoutline + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderLeft { get; set; }
		|        public IValue borderLeft { get; set; }
		|        [ContextProperty(""ЛеваяГраница"", ""BorderLeft"")]
		|        public IValue BorderLeft
		|        {
		|            get { return borderLeft; }
		|            set
		|            {
		|                borderLeft = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderLeft = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorderLeft val = (DfBorderLeft)value;
		|                    string borderLeftWidth = ""medium "";
		|                    string borderLeftStyle = ""none "";
		|                    string borderLeftColor;
		|                    if (Owner != null)
		|                    {
		|                        borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderLeftColor = BackgroundColor;
		|                    }
		|                    if (val.BorderLeftWidth != null)
		|                    {
		|                        if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderLeftWidth = val.BorderLeftWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderLeftWidth = val.BorderLeftWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderLeftStyle != null)
		|                    {
		|                        borderLeftStyle = val.BorderLeftStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderLeftColor != null)
		|                    {
		|                        borderLeftColor = val.BorderLeftColor.AsString();
		|                    }
		|                    resborderLeft = borderLeftWidth + borderLeftStyle + borderLeftColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderLeft'] = '"" + resborderLeft + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderRight { get; set; }
		|        public IValue borderRight { get; set; }
		|        [ContextProperty(""ПраваяГраница"", ""BorderRight"")]
		|        public IValue BorderRight
		|        {
		|            get { return borderRight; }
		|            set
		|            {
		|                borderRight = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderRight = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorderRight val = (DfBorderRight)value;
		|                    string borderRightWidth = ""medium "";
		|                    string borderRightStyle = ""none "";
		|                    string borderRightColor;
		|                    if (Owner != null)
		|                    {
		|                        borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderRightColor = BackgroundColor;
		|                    }
		|                    if (val.BorderRightWidth != null)
		|                    {
		|                        if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderRightWidth = val.BorderRightWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderRightWidth = val.BorderRightWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderRightStyle != null)
		|                    {
		|                        borderRightStyle = val.BorderRightStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderRightColor != null)
		|                    {
		|                        borderRightColor = val.BorderRightColor.AsString();
		|                    }
		|                    resborderRight = borderRightWidth + borderRightStyle + borderRightColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderRight'] = '"" + resborderRight + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderBottom { get; set; }
		|        public IValue borderBottom { get; set; }
		|        [ContextProperty(""НижняяГраница"", ""BorderBottom"")]
		|        public IValue BorderBottom
		|        {
		|            get { return borderBottom; }
		|            set
		|            {
		|                borderBottom = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderBottom = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBorderBottom val = (DfBorderBottom)value;
		|                    string borderBottomWidth = ""medium "";
		|                    string borderBottomStyle = ""none "";
		|                    string borderBottomColor;
		|                    if (Owner != null)
		|                    {
		|                        borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderBottomColor = BackgroundColor;
		|                    }
		|                    if (val.BorderBottomWidth != null)
		|                    {
		|                        if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderBottomWidth = val.BorderBottomWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderBottomWidth = val.BorderBottomWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderBottomStyle != null)
		|                    {
		|                        borderBottomStyle = val.BorderBottomStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderBottomColor != null)
		|                    {
		|                        borderBottomColor = val.BorderBottomColor.AsString();
		|                    }
		|                    resborderBottom = borderBottomWidth + borderBottomStyle + borderBottomColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottom'] = '"" + resborderBottom + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resmargin { get; set; }
		|        public IValue margin { get; set; }
		|        [ContextProperty(""Отступ"", ""Margin"")]
		|        public IValue Margin
		|        {
		|            get { return margin; }
		|            set
		|            {
		|                margin = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resmargin = value.AsString();
		|                }
		|                else
		|                {
		|                    DfMargin val = (DfMargin)value;
		|                    string marginTop = """";
		|                    string marginRight = """";
		|                    string marginBottom = """";
		|                    string marginLeft = """";
		|                    string auto = """";
		|                    if (val.MarginTop != 0)
		|                    {
		|                        marginTop = val.MarginTop.ToString() + ""px "";
		|                    }
		|                    if (val.MarginRight != 0)
		|                    {
		|                        marginRight = val.MarginRight.ToString() + ""px "";
		|                    }
		|                    if (val.MarginBottom != 0)
		|                    {
		|                        marginBottom = val.MarginBottom.ToString() + ""px "";
		|                    }
		|                    if (val.MarginLeft != 0)
		|                    {
		|                        marginLeft = val.MarginLeft.ToString() + ""px "";
		|                    }
		|                    if (val.Auto)
		|                    {
		|                        auto = ""auto"";
		|                    }
		|                    resmargin = marginTop + marginRight + marginBottom + marginLeft + auto;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['margin'] = '"" + resmargin + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoverflow { get; set; }
		|        public string overflow { get; set; }
		|        [ContextProperty(""Переполнение"", ""Overflow"")]
		|        public string Overflow
		|        {
		|            get { return overflow; }
		|            set
		|            {
		|                overflow = value;
		|                resoverflow = overflow;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['overflow'] = '"" + resoverflow + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoverflowY { get; set; }
		|        public string overflowY { get; set; }
		|        [ContextProperty(""ПереполнениеИгрек"", ""OverflowY"")]
		|        public string OverflowY
		|        {
		|            get { return overflowY; }
		|            set
		|            {
		|                overflowY = value;
		|                resoverflowY = overflowY;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['overflowY'] = '"" + resoverflowY + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoverflowX { get; set; }
		|        public string overflowX { get; set; }
		|        [ContextProperty(""ПереполнениеИкс"", ""OverflowX"")]
		|        public string OverflowX
		|        {
		|            get { return overflowX; }
		|            set
		|            {
		|                overflowX = value;
		|                resoverflowX = overflowX;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['overflowX'] = '"" + resoverflowX + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reswhiteSpace { get; set; }
		|        public string whiteSpace { get; set; }
		|        [ContextProperty(""Пробелы"", ""WhiteSpace"")]
		|        public string WhiteSpace
		|        {
		|            get { return whiteSpace; }
		|            set
		|            {
		|                whiteSpace = value;
		|                reswhiteSpace = whiteSpace;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['whiteSpace'] = '"" + reswhiteSpace + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restableLayout { get; set; }
		|        public string tableLayout { get; set; }
		|        [ContextProperty(""РазмещениеВТаблице"", ""TableLayout"")]
		|        public string TableLayout
		|        {
		|            get { return tableLayout; }
		|            set
		|            {
		|                tableLayout = value;
		|                restableLayout = tableLayout;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['tableLayout'] = '"" + restableLayout + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbordersStyle { get; set; }
		|        public IValue bordersStyle { get; set; }
		|        [ContextProperty(""СтильГраниц"", ""BordersStyle"")]
		|        public IValue BordersStyle
		|        {
		|            get { return bordersStyle; }
		|            set
		|            {
		|                bordersStyle = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbordersStyle = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBordersStyle val = (DfBordersStyle)value;
		|                    string borderTopStyle = ""none "";
		|                    string borderRightStyle = ""none "";
		|                    string borderBottomStyle = ""none "";
		|                    string borderLeftStyle = ""none"";
		|                    if (val.BorderTopStyle != null)
		|                    {
		|                        borderTopStyle = val.BorderTopStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderRightStyle != null)
		|                    {
		|                        borderRightStyle = val.BorderRightStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderBottomStyle != null)
		|                    {
		|                        borderBottomStyle = val.BorderBottomStyle.AsString() + "" "";
		|                    }
		|                    if (val.BorderLeftStyle != null)
		|                    {
		|                        borderLeftStyle = val.BorderLeftStyle.AsString();
		|                    }
		|                    resbordersStyle = borderTopStyle + borderRightStyle + borderBottomStyle + borderLeftStyle;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderStyle'] = '"" + resbordersStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoutlineStyle { get; set; }
		|        public string outlineStyle { get; set; }
		|        [ContextProperty(""СтильКонтура"", ""OutlineStyle"")]
		|        public string OutlineStyle
		|        {
		|            get { return outlineStyle; }
		|            set
		|            {
		|                outlineStyle = value;
		|                resoutlineStyle = outlineStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['outlineStyle'] = '"" + resoutlineStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderTopStyle { get; set; }
		|        public string borderTopStyle { get; set; }
		|        [ContextProperty(""СтильВерхнейГраницы"", ""BorderTopStyle"")]
		|        public string BorderTopStyle
		|        {
		|            get { return borderTopStyle; }
		|            set
		|            {
		|                borderTopStyle = value;
		|                resborderTopStyle = borderTopStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTopStyle'] = '"" + resborderTopStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderRightStyle { get; set; }
		|        public string borderRightStyle { get; set; }
		|        [ContextProperty(""СтильПравойГраницы"", ""BorderRightStyle"")]
		|        public string BorderRightStyle
		|        {
		|            get { return borderRightStyle; }
		|            set
		|            {
		|                borderRightStyle = value;
		|                resborderRightStyle = borderRightStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderRightStyle'] = '"" + resborderRightStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderBottomStyle { get; set; }
		|        public string borderBottomStyle { get; set; }
		|        [ContextProperty(""СтильНижнейГраницы"", ""BorderBottomStyle"")]
		|        public string BorderBottomStyle
		|        {
		|            get { return borderBottomStyle; }
		|            set
		|            {
		|                borderBottomStyle = value;
		|                resborderBottomStyle = borderBottomStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottomStyle'] = '"" + resborderBottomStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderLeftStyle { get; set; }
		|        public string borderLeftStyle { get; set; }
		|        [ContextProperty(""СтильЛевойГраницы"", ""BorderLeftStyle"")]
		|        public string BorderLeftStyle
		|        {
		|            get { return borderLeftStyle; }
		|            set
		|            {
		|                borderLeftStyle = value;
		|                resborderLeftStyle = borderLeftStyle;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderLeftStyle'] = '"" + resborderLeftStyle + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string restextColor { get; set; }
		|        public string textColor { get; set; }
		|        [ContextProperty(""ЦветТекста"", ""TextColor"")]
		|        public string TextColor
		|        {
		|            get { return textColor; }
		|            set
		|            {
		|                textColor = value;
		|                restextColor = textColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['color'] = '"" + restextColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderTopColor { get; set; }
		|        public string borderTopColor { get; set; }
		|        [ContextProperty(""ЦветВерхнейГраницы"", ""BorderTopColor"")]
		|        public string BorderTopColor
		|        {
		|            get { return borderTopColor; }
		|            set
		|            {
		|                borderTopColor = value;
		|                resborderTopColor = borderTopColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTopColor'] = '"" + resborderTopColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbordersColor { get; set; }
		|        public IValue bordersColor { get; set; }
		|        [ContextProperty(""ЦветГраниц"", ""BordersColor"")]
		|        public IValue BordersColor
		|        {
		|            get { return bordersColor; }
		|            set
		|            {
		|                bordersColor = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbordersColor = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBordersColor val = (DfBordersColor)value;
		|                    string borderTopColor;
		|                    if (Owner != null)
		|                    {
		|                        borderTopColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + "" "";
		|                    }
		|                    else
		|                    {
		|                        borderTopColor = BackgroundColor + "" "";
		|                    }
		|                    string borderRightColor;
		|                    if (Owner != null)
		|                    {
		|                        borderRightColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + "" "";
		|                    }
		|                    else
		|                    {
		|                        borderRightColor = BackgroundColor + "" "";
		|                    }
		|                    string borderBottomColor;
		|                    if (Owner != null)
		|                    {
		|                        borderBottomColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor + "" "";
		|                    }
		|                    else
		|                    {
		|                        borderBottomColor = BackgroundColor + "" "";
		|                    }
		|                    string borderLeftColor;
		|                    if (Owner != null)
		|                    {
		|                        borderLeftColor = ((dynamic)Owner.AsObject()).Style.BackgroundColor;
		|                    }
		|                    else
		|                    {
		|                        borderLeftColor = BackgroundColor;
		|                    }
		|                    if (val.BorderTopColor != null)
		|                    {
		|                        borderTopColor = val.BorderTopColor.AsString() + "" "";
		|                    }
		|                    if (val.BorderRightColor != null)
		|                    {
		|                        borderRightColor = val.BorderRightColor.AsString() + "" "";
		|                    }
		|                    if (val.BorderBottomColor != null)
		|                    {
		|                        borderBottomColor = val.BorderBottomColor.AsString() + "" "";
		|                    }
		|                    if (val.BorderLeftColor != null)
		|                    {
		|                        borderLeftColor = val.BorderLeftColor.AsString();
		|                    }
		|                    resbordersColor = borderTopColor + borderRightColor + borderBottomColor + borderLeftColor;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderColor'] = '"" + resbordersColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderLeftColor { get; set; }
		|        public string borderLeftColor { get; set; }
		|        [ContextProperty(""ЦветЛевойГраницы"", ""BorderLeftColor"")]
		|        public string BorderLeftColor
		|        {
		|            get { return borderLeftColor; }
		|            set
		|            {
		|                borderLeftColor = value;
		|                resborderLeftColor = borderLeftColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderLeftColor'] = '"" + resborderLeftColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderBottomColor { get; set; }
		|        public string borderBottomColor { get; set; }
		|        [ContextProperty(""ЦветНижнейГраницы"", ""BorderBottomColor"")]
		|        public string BorderBottomColor
		|        {
		|            get { return borderBottomColor; }
		|            set
		|            {
		|                borderBottomColor = value;
		|                resborderBottomColor = borderBottomColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottomColor'] = '"" + resborderBottomColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderRightColor { get; set; }
		|        public string borderRightColor { get; set; }
		|        [ContextProperty(""ЦветПравойГраницы"", ""BorderRightColor"")]
		|        public string BorderRightColor
		|        {
		|            get { return borderRightColor; }
		|            set
		|            {
		|                borderRightColor = value;
		|                resborderRightColor = borderRightColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderRightColor'] = '"" + resborderRightColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoutlineColor { get; set; }
		|        public string outlineColor { get; set; }
		|        [ContextProperty(""ЦветКонтура"", ""OutlineColor"")]
		|        public string OutlineColor
		|        {
		|            get { return outlineColor; }
		|            set
		|            {
		|                outlineColor = value;
		|                resoutlineColor = outlineColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['outlineColor'] = '"" + resoutlineColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbackgroundColor { get; set; }
		|        public string backgroundColor { get; set; }
		|        [ContextProperty(""ЦветФона"", ""BackgroundColor"")]
		|        public string BackgroundColor
		|        {
		|            get { return backgroundColor; }
		|            set
		|            {
		|                backgroundColor = value;
		|                resbackgroundColor = backgroundColor;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['backgroundColor'] = '"" + resbackgroundColor + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reswidth { get; set; }
		|        public IValue width { get; set; }
		|        [ContextProperty(""Ширина"", ""Width"")]
		|        public IValue Width
		|        {
		|            get { return width; }
		|            set
		|            {
		|                width = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    reswidth = value.AsString();
		|                }
		|                else
		|                {
		|                    reswidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['width'] = '"" + reswidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderTopWidth { get; set; }
		|        public IValue borderTopWidth { get; set; }
		|        [ContextProperty(""ШиринаВерхнейГраницы"", ""BorderTopWidth"")]
		|        public IValue BorderTopWidth
		|        {
		|            get { return borderTopWidth; }
		|            set
		|            {
		|                borderTopWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderTopWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderTopWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderTopWidth'] = '"" + resborderTopWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resbordersWidth { get; set; }
		|        public IValue bordersWidth { get; set; }
		|        [ContextProperty(""ШиринаГраниц"", ""BordersWidth"")]
		|        public IValue BordersWidth
		|        {
		|            get { return bordersWidth; }
		|            set
		|            {
		|                bordersWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resbordersWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    DfBordersWidth val = (DfBordersWidth)value;
		|                    string borderTopWidth = ""medium "";
		|                    string borderRightWidth = ""medium "";
		|                    string borderBottomWidth = ""medium "";
		|                    string borderLeftWidth = ""medium"";
		|                    if (val.BorderTopWidth != null)
		|                    {
		|                        if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderTopWidth = val.BorderTopWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderTopWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderTopWidth = val.BorderTopWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderRightWidth != null)
		|                    {
		|                        if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderRightWidth = val.BorderRightWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderRightWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderRightWidth = val.BorderRightWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderBottomWidth != null)
		|                    {
		|                        if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderBottomWidth = val.BorderBottomWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderBottomWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderBottomWidth = val.BorderBottomWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    if (val.BorderLeftWidth != null)
		|                    {
		|                        if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                        {
		|                            borderLeftWidth = val.BorderLeftWidth.AsString() + "" "";
		|                        }
		|                        else if (val.BorderLeftWidth.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|                        {
		|                            borderLeftWidth = val.BorderLeftWidth.AsNumber().ToString() + ""px "";
		|                        }
		|                    }
		|                    resbordersWidth = borderTopWidth + borderRightWidth + borderBottomWidth + borderLeftWidth;
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderWidth'] = '"" + resbordersWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string rescolumnWidth { get; set; }
		|        public IValue columnWidth { get; set; }
		|        [ContextProperty(""ШиринаКолонок"", ""ColumnWidth"")]
		|        public IValue ColumnWidth
		|        {
		|            get { return columnWidth; }
		|            set
		|            {
		|                columnWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    rescolumnWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    rescolumnWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['columnWidth'] = '"" + rescolumnWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resoutlineWidth { get; set; }
		|        public IValue outlineWidth { get; set; }
		|        [ContextProperty(""ШиринаКонтура"", ""OutlineWidth"")]
		|        public IValue OutlineWidth
		|        {
		|            get { return outlineWidth; }
		|            set
		|            {
		|                outlineWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resoutlineWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resoutlineWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['outlineWidth'] = '"" + resoutlineWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderLeftWidth { get; set; }
		|        public IValue borderLeftWidth { get; set; }
		|        [ContextProperty(""ШиринаЛевойГраницы"", ""BorderLeftWidth"")]
		|        public IValue BorderLeftWidth
		|        {
		|            get { return borderLeftWidth; }
		|            set
		|            {
		|                borderLeftWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderLeftWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderLeftWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderLeftWidth'] = '"" + resborderLeftWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderBottomWidth { get; set; }
		|        public IValue borderBottomWidth { get; set; }
		|        [ContextProperty(""ШиринаНижнейГраницы"", ""BorderBottomWidth"")]
		|        public IValue BorderBottomWidth
		|        {
		|            get { return borderBottomWidth; }
		|            set
		|            {
		|                borderBottomWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderBottomWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderBottomWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderBottomWidth'] = '"" + resborderBottomWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string reswordWrap { get; set; }
		|        public string wordWrap { get; set; }
		|        [ContextProperty(""ПереносСлов"", ""WordWrap"")]
		|        public string WordWrap
		|        {
		|            get { return wordWrap; }
		|            set
		|            {
		|                wordWrap = value;
		|                reswordWrap = wordWrap;
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['wordWrap'] = '"" + reswordWrap + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        public string resborderRightWidth { get; set; }
		|        public IValue borderRightWidth { get; set; }
		|        [ContextProperty(""ШиринаПравойГраницы"", ""BorderRightWidth"")]
		|        public IValue BorderRightWidth
		|        {
		|            get { return borderRightWidth; }
		|            set
		|            {
		|                borderRightWidth = value;
		|
		|                if (value.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|                {
		|                    resborderRightWidth = value.AsString();
		|                }
		|                else
		|                {
		|                    resborderRightWidth = value.AsNumber().ToString().Replace("","", ""."") + ""px"";
		|                }
		|
		|                if (Owner != null)
		|                {
		|                    string strFunc = ""mapKeyEl.get('"" + ((dynamic)Owner).ItemKey + ""').style['borderRightWidth'] = '"" + resborderRightWidth + ""';"";
		|                    DeclarativeForms.SendStrFunc(strFunc);
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""Копировать"", ""Copy"")]
		|        public void Copy(DfStyle p1)
		|        {
		|            PropertyInfo[] PropertyInfo = this.GetType().GetProperties();
		|            for (int i = 0; i < PropertyInfo.Length; i++)
		|            {
		|                string propName = this.GetType().GetProperty(PropertyInfo[i].Name).Name;
		|                if (propName == ""Owner"" ||
		|                    propName == ""Name"" ||
		|                    propName == ""IsIndexed"" ||
		|                    propName == ""DataType"" ||
		|                    propName == ""SystemType"" ||
		|                    propName == ""Item"" ||
		|                    propName == ""DynamicMethodSignatures""
		|                    )
		|                {
		|                    continue;
		|                }
		|                dynamic propValue = p1.GetType().GetProperty(propName).GetValue(p1);
		|                if (propValue == null)
		|                {
		|                    continue;
		|                }
		|                if (propValue.GetType().ToString() == ""System.Int32"")
		|                {
		|                    if (propValue != 0)
		|                    {
		|                        this[propName].SetValue(this, propValue);
		|                    }
		|                }
		|                else
		|                {
		|                    this[propName].SetValue(this, propValue);
		|                }
		|            }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "BorderTop" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфВерхняяГраница"", ""DfBorderTop"")]
		|    public class DfBorderTop : AutoContext<DfBorderTop>
		|    {
		|        public DfBorderTop(IValue p1, IValue p2, IValue p3)
		|        {
		|            BorderTopWidth = p1;
		|            BorderTopStyle = p2;
		|            BorderTopColor = p3;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue borderTopStyle;
		|        [ContextProperty(""СтильВерхнейГраницы"", ""BorderTopStyle"")]
		|        public IValue BorderTopStyle
		|        {
		|            get { return borderTopStyle; }
		|            set { borderTopStyle = value; }
		|        }
		|
		|        private IValue borderTopColor;
		|        [ContextProperty(""ЦветВерхнейГраницы"", ""BorderTopColor"")]
		|        public IValue BorderTopColor
		|        {
		|            get { return borderTopColor; }
		|            set { borderTopColor = value; }
		|        }
		|
		|        private IValue borderTopWidth;
		|        [ContextProperty(""ШиринаВерхнейГраницы"", ""BorderTopWidth"")]
		|        public IValue BorderTopWidth
		|        {
		|            get { return borderTopWidth; }
		|            set { borderTopWidth = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "CubicBezier" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфБезьеКуб"", ""DfCubicBezier"")]
		|    public class DfCubicBezier : AutoContext<DfCubicBezier>
		|    {
		|        public DfCubicBezier(IValue p1, IValue p2, IValue p3, IValue p4)
		|        {
		|            Number1 = p1;
		|            Number2 = p2;
		|            Number3 = p3;
		|            Number4 = p4;
		|        }
		|
		|        public PropertyInfo this[string p1]
		|        {
		|            get { return this.GetType().GetProperty(p1); }
		|        }
		|
		|        private IValue number1;
		|        [ContextProperty(""Число1"", ""Number1"")]
		|        public IValue Number1
		|        {
		|            get { return number1; }
		|            set { number1 = value; }
		|        }
		|
		|        private IValue number2;
		|        [ContextProperty(""Число2"", ""Number2"")]
		|        public IValue Number2
		|        {
		|            get { return number2; }
		|            set { number2 = value; }
		|        }
		|
		|        private IValue number3;
		|        [ContextProperty(""Число3"", ""Number3"")]
		|        public IValue Number3
		|        {
		|            get { return number3; }
		|            set { number3 = value; }
		|        }
		|
		|        private IValue number4;
		|        [ContextProperty(""Число4"", ""Number4"")]
		|        public IValue Number4
		|        {
		|            get { return number4; }
		|            set { number4 = value; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "MenuItem" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System.IO;
		|using ScriptEngine.Machine.Contexts;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфЭлементМеню"", ""DfMenuItem"")]
		|    public class DfMenuItem : AutoContext<DfMenuItem>
		|    {
		|        public DfMenuItem(string label, string type)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""' }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfMenuItem(string label, string type, string key)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""', "" + @""
		|            key: '"" + key + ""' }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfMenuItem(string label, string type, string key, string modifiers)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""', "" + @""
		|            key: '"" + key + ""', "" + @""
		|            modifiers: '"" + modifiers + ""' }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfMenuItem(string label, string type, DfMenu menu)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""', "" + @""
		|            submenu: mapKeyEl.get('"" + menu.ItemKey + ""') }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            submenu = menu;
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfMenuItem(string label, string type, DfMenu menu, string key)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""', "" + @""
		|            submenu: mapKeyEl.get('"" + menu.ItemKey + ""'), "" + @""
		|            key: '"" + key + ""' }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            submenu = menu;
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        public DfMenuItem(string label, string type, DfMenu menu, string key, string modifiers)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.MenuItem({ "" + @""
		|            label: '"" + label + ""', "" + @""
		|            click: function() {{ sendPost('"" + ItemKey + ""' + '"" + DeclarativeForms.paramDelimiter + ""' + 'click') }}, "" + @""
		|            type: '"" + type + ""', "" + @""
		|            submenu: mapKeyEl.get('"" + menu.ItemKey + ""'), "" + @""
		|            key: '"" + key + ""', "" + @""
		|            modifiers: '"" + modifiers + ""' }));"" + @""
		|            mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            submenu = menu;
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        public DfAction сlick;
		|        [ContextProperty(""Нажатие"", ""Click"")]
		|        public DfAction Click
		|        {
		|            get { return сlick; }
		|            set { сlick = value; }
		|        }
		|
		|        public string label { get; set; }
		|        [ContextProperty(""Надпись"", ""Label"")]
		|        public string Label
		|        {
		|            get { return label; }
		|            set
		|            {
		|                label = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').label = '"" + label + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public DfMenu submenu { get; set; }
		|        [ContextProperty(""Подменю"", ""Submenu"")]
		|        public DfMenu Submenu
		|        {
		|            get { return submenu; }
		|            set
		|            {
		|                submenu = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').submenu = mapKeyEl.get('"" + submenu.ItemKey + ""');"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public bool enabled { get; set; }
		|        [ContextProperty(""Доступность"", ""Enabled"")]
		|        public bool Enabled
		|        {
		|            get { return enabled; }
		|            set
		|            {
		|                enabled = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['enabled'] = "" + enabled.ToString().ToLower() + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public string icon { get; set; }
		|        [ContextProperty(""Значок"", ""Icon"")]
		|        public string Icon
		|        {
		|            get { return icon; }
		|            set
		|            {
		|                icon = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['icon'] = '"" + icon + ""';"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        public bool _checked { get; set; }
		|        [ContextProperty(""Помечен"", ""Checked"")]
		|        public bool Checked
		|        {
		|            get { return _checked; }
		|            set
		|            {
		|                _checked = value;
		|                string strFunc = ""mapKeyEl.get('"" + ItemKey + ""')['checked'] = "" + _checked.ToString().ToLower() + "";"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Menu" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System.IO;
		|using ScriptEngine.Machine.Contexts;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфМеню"", ""DfMenu"")]
		|    public class DfMenu : AutoContext<DfMenu>
		|    {
		|        public DfMenu(string p1)
		|        {
		|            ItemKey = ""d"" + Path.GetRandomFileName().Replace(""."", """");
		|            string strFunc = """";
		|            if (p1 == ""contextmenu"")
		|            {
		|                strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.Menu({ type: 'contextmenu' })); mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            }
		|            else if (p1 == ""menubar"")
		|            {
		|                strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.Menu({ type: 'menubar' })); mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            }
		|            else if (p1 == ""none"")
		|            {
		|                strFunc = ""mapKeyEl.set('"" + ItemKey + ""', new gui.Menu()); mapElKey.set(mapKeyEl.get('"" + ItemKey + ""'), '"" + ItemKey + ""');"";
		|            }
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|
		|        [ContextMethod(""Добавить"", ""Append"")]
		|        public void Append(DfMenuItem p1)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').append(mapKeyEl.get('"" + p1.ItemKey + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        [ContextMethod(""Вставить"", ""Insert"")]
		|        public void Insert(DfMenuItem p1, int p2)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').insert(mapKeyEl.get('"" + p1.ItemKey + ""'), parseInt('"" + p2 + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|       [ContextMethod(""Показать"", ""Popup"")]
		|        public void Popup(int p1, int p2)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').popup(parseInt('"" + p1 + ""'), parseInt('"" + p2 + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|       [ContextMethod(""Удалить"", ""Remove"")]
		|        public void Remove(DfMenuItem p1)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').remove(mapKeyEl.get('"" + p1.ItemKey + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|       [ContextMethod(""УдалитьПоИндексу"", ""RemoveAt"")]
		|        public void RemoveAt(int p1)
		|        {
		|            string strFunc = ""mapKeyEl.get('"" + ItemKey + ""').removeAt(parseInt('"" + p1 + ""'));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|        }
		|
		|        public DfAction _сlick;
		|        [ContextProperty(""Нажатие"", ""Click"")]
		|        public DfAction Click
		|        {
		|            get { return _сlick; }
		|            set
		|            {
		|                _сlick = value;
		|                //setMenuClick(nameMenu)
		|                string strFunc = ""setMenuClick(\u0022"" + ItemKey + ""\u0022)"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|        [ContextProperty(""click"", ""click"")]
		|        public DfAction Click2
		|        {
		|            get { return _сlick; }
		|            set
		|            {
		|                _сlick = value;
		|                //setMenuClick(nameMenu)
		|                string strFunc = ""setMenuClick(\u0022"" + ItemKey + ""\u0022)"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Element" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Color" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Collections;
		|using System.Collections.Generic;
		|
		|namespace osdf
		|{
		|    [ContextClass (""ДфЦвет"", ""DfColor"")]
		|    public class DfColor : AutoContext<DfColor>, ICollectionContext, IEnumerable<IValue>
		|    {
		|        private List<IValue> _list;
		|
		|        public int Count()
		|        {
		|            return _list.Count;
		|        }
		|
		|        public CollectionEnumerator GetManagedIterator()
		|        {
		|            return new CollectionEnumerator(this);
		|        }
		|
		|        IEnumerator IEnumerable.GetEnumerator()
		|        {
		|            return ((IEnumerable<IValue>)_list).GetEnumerator();
		|        }
		|
		|        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
		|        {
		|            foreach (var item in _list)
		|            {
		|                yield return (item as IValue);
		|            }
		|        }
		|
		|        public DfColor()
		|        {
		|            _list = new List<IValue>();
		|            _list.Add(ValueFactory.Create(Aquamarine));
		|            _list.Add(ValueFactory.Create(AntiqueWhite));
		|            _list.Add(ValueFactory.Create(Beige));
		|            _list.Add(ValueFactory.Create(WhiteSmoke));
		|            _list.Add(ValueFactory.Create(White));
		|            _list.Add(ValueFactory.Create(NavajoWhite));
		|            _list.Add(ValueFactory.Create(Turquoise));
		|            _list.Add(ValueFactory.Create(Bisque));
		|            _list.Add(ValueFactory.Create(PaleTurquoise));
		|            _list.Add(ValueFactory.Create(Cornsilk));
		|            _list.Add(ValueFactory.Create(PaleGreen));
		|            _list.Add(ValueFactory.Create(PaleGoldenrod));
		|            _list.Add(ValueFactory.Create(CornflowerBlue));
		|            _list.Add(ValueFactory.Create(DeepSkyBlue));
		|            _list.Add(ValueFactory.Create(LightSlateGray));
		|            _list.Add(ValueFactory.Create(SlateBlue));
		|            _list.Add(ValueFactory.Create(YellowGreen));
		|            _list.Add(ValueFactory.Create(Yellow));
		|            _list.Add(ValueFactory.Create(DodgerBlue));
		|            _list.Add(ValueFactory.Create(SpringGreen));
		|            _list.Add(ValueFactory.Create(LawnGreen));
		|            _list.Add(ValueFactory.Create(GreenYellow));
		|            _list.Add(ValueFactory.Create(SeaGreen));
		|            _list.Add(ValueFactory.Create(Green));
		|            _list.Add(ValueFactory.Create(LimeGreen));
		|            _list.Add(ValueFactory.Create(ForestGreen));
		|            _list.Add(ValueFactory.Create(Goldenrod));
		|            _list.Add(ValueFactory.Create(Gold));
		|            _list.Add(ValueFactory.Create(Indigo));
		|            _list.Add(ValueFactory.Create(IndianRed));
		|            _list.Add(ValueFactory.Create(Firebrick));
		|            _list.Add(ValueFactory.Create(SaddleBrown));
		|            _list.Add(ValueFactory.Create(Coral));
		|            _list.Add(ValueFactory.Create(Maroon));
		|            _list.Add(ValueFactory.Create(Brown));
		|            _list.Add(ValueFactory.Create(RoyalBlue));
		|            _list.Add(ValueFactory.Create(Red));
		|            _list.Add(ValueFactory.Create(Crimson));
		|            _list.Add(ValueFactory.Create(Lavender));
		|            _list.Add(ValueFactory.Create(Azure));
		|            _list.Add(ValueFactory.Create(Lime));
		|            _list.Add(ValueFactory.Create(PaleVioletRed));
		|            _list.Add(ValueFactory.Create(Salmon));
		|            _list.Add(ValueFactory.Create(Linen));
		|            _list.Add(ValueFactory.Create(Magenta));
		|            _list.Add(ValueFactory.Create(Honeydew));
		|            _list.Add(ValueFactory.Create(Moccasin));
		|            _list.Add(ValueFactory.Create(Aqua));
		|            _list.Add(ValueFactory.Create(SeaShell));
		|            _list.Add(ValueFactory.Create(MintCream));
		|            _list.Add(ValueFactory.Create(SkyBlue));
		|            _list.Add(ValueFactory.Create(LightSkyBlue));
		|            _list.Add(ValueFactory.Create(OliveDrab));
		|            _list.Add(ValueFactory.Create(Olive));
		|            _list.Add(ValueFactory.Create(OrangeRed));
		|            _list.Add(ValueFactory.Create(Orange));
		|            _list.Add(ValueFactory.Create(Orchid));
		|            _list.Add(ValueFactory.Create(Sienna));
		|            _list.Add(ValueFactory.Create(PeachPuff));
		|            _list.Add(ValueFactory.Create(SandyBrown));
		|            _list.Add(ValueFactory.Create(PapayaWhip));
		|            _list.Add(ValueFactory.Create(MidnightBlue));
		|            _list.Add(ValueFactory.Create(PowderBlue));
		|            _list.Add(ValueFactory.Create(GhostWhite));
		|            _list.Add(ValueFactory.Create(Purple));
		|            _list.Add(ValueFactory.Create(Wheat));
		|            _list.Add(ValueFactory.Create(RosyBrown));
		|            _list.Add(ValueFactory.Create(LavenderBlush));
		|            _list.Add(ValueFactory.Create(Pink));
		|            _list.Add(ValueFactory.Create(LightSeaGreen));
		|            _list.Add(ValueFactory.Create(LightYellow));
		|            _list.Add(ValueFactory.Create(LightGoldenrodYellow));
		|            _list.Add(ValueFactory.Create(LightGreen));
		|            _list.Add(ValueFactory.Create(LightCoral));
		|            _list.Add(ValueFactory.Create(Peru));
		|            _list.Add(ValueFactory.Create(BlanchedAlmond));
		|            _list.Add(ValueFactory.Create(LemonChiffon));
		|            _list.Add(ValueFactory.Create(LightPink));
		|            _list.Add(ValueFactory.Create(LightGray));
		|            _list.Add(ValueFactory.Create(LightBlue));
		|            _list.Add(ValueFactory.Create(LightCyan));
		|            _list.Add(ValueFactory.Create(LightSalmon));
		|            _list.Add(ValueFactory.Create(Silver));
		|            _list.Add(ValueFactory.Create(CadetBlue));
		|            _list.Add(ValueFactory.Create(Gray));
		|            _list.Add(ValueFactory.Create(SlateGray));
		|            _list.Add(ValueFactory.Create(LightSteelBlue));
		|            _list.Add(ValueFactory.Create(Teal));
		|            _list.Add(ValueFactory.Create(BlueViolet));
		|            _list.Add(ValueFactory.Create(Blue));
		|            _list.Add(ValueFactory.Create(AliceBlue));
		|            _list.Add(ValueFactory.Create(SteelBlue));
		|            _list.Add(ValueFactory.Create(Plum));
		|            _list.Add(ValueFactory.Create(Ivory));
		|            _list.Add(ValueFactory.Create(OldLace));
		|            _list.Add(ValueFactory.Create(DarkSalmon));
		|            _list.Add(ValueFactory.Create(DarkSeaGreen));
		|            _list.Add(ValueFactory.Create(DarkOrchid));
		|            _list.Add(ValueFactory.Create(DarkSlateGray));
		|            _list.Add(ValueFactory.Create(DarkCyan));
		|            _list.Add(ValueFactory.Create(DarkGreen));
		|            _list.Add(ValueFactory.Create(DarkRed));
		|            _list.Add(ValueFactory.Create(DarkTurquoise));
		|            _list.Add(ValueFactory.Create(DarkMagenta));
		|            _list.Add(ValueFactory.Create(DarkGray));
		|            _list.Add(ValueFactory.Create(DarkBlue));
		|            _list.Add(ValueFactory.Create(DarkViolet));
		|            _list.Add(ValueFactory.Create(DarkSlateBlue));
		|            _list.Add(ValueFactory.Create(DarkGoldenrod));
		|            _list.Add(ValueFactory.Create(DarkOliveGreen));
		|            _list.Add(ValueFactory.Create(DarkOrange));
		|            _list.Add(ValueFactory.Create(DarkKhaki));
		|            _list.Add(ValueFactory.Create(Tomato));
		|            _list.Add(ValueFactory.Create(Gainsboro));
		|            _list.Add(ValueFactory.Create(MistyRose));
		|            _list.Add(ValueFactory.Create(DimGray));
		|            _list.Add(ValueFactory.Create(MediumAquamarine));
		|            _list.Add(ValueFactory.Create(MediumTurquoise));
		|            _list.Add(ValueFactory.Create(MediumSpringGreen));
		|            _list.Add(ValueFactory.Create(MediumSlateBlue));
		|            _list.Add(ValueFactory.Create(MediumSeaGreen));
		|            _list.Add(ValueFactory.Create(MediumOrchid));
		|            _list.Add(ValueFactory.Create(MediumBlue));
		|            _list.Add(ValueFactory.Create(MediumVioletRed));
		|            _list.Add(ValueFactory.Create(MediumPurple));
		|            _list.Add(ValueFactory.Create(Violet));
		|            _list.Add(ValueFactory.Create(Fuchsia));
		|            _list.Add(ValueFactory.Create(Khaki));
		|            _list.Add(ValueFactory.Create(Tan));
		|            _list.Add(ValueFactory.Create(BurlyWood));
		|            _list.Add(ValueFactory.Create(Navy));
		|            _list.Add(ValueFactory.Create(FloralWhite));
		|            _list.Add(ValueFactory.Create(Cyan));
		|            _list.Add(ValueFactory.Create(Black));
		|            _list.Add(ValueFactory.Create(Thistle));
		|            _list.Add(ValueFactory.Create(Chartreuse));
		|            _list.Add(ValueFactory.Create(Chocolate));
		|            _list.Add(ValueFactory.Create(Snow));
		|            _list.Add(ValueFactory.Create(HotPink));
		|        }
		|
		|        [ContextProperty(""Аквамариновый"", ""Aquamarine"")]
		|        public string Aquamarine
		|        {
		|            get { return ""rgb(127, 255, 212)""; }
		|        }
		|
		|        [ContextProperty(""АнтичныйБелый"", ""AntiqueWhite"")]
		|        public string AntiqueWhite
		|        {
		|            get { return ""rgb(250, 235, 215)""; }
		|        }
		|
		|        [ContextProperty(""Бежевый"", ""Beige"")]
		|        public string Beige
		|        {
		|            get { return ""rgb(245, 245, 220)""; }
		|        }
		|
		|        [ContextProperty(""БелаяДымка"", ""WhiteSmoke"")]
		|        public string WhiteSmoke
		|        {
		|            get { return ""rgb(245, 245, 245)""; }
		|        }
		|
		|        [ContextProperty(""Белый"", ""White"")]
		|        public string White
		|        {
		|            get { return ""rgb(255, 255, 255)""; }
		|        }
		|
		|        [ContextProperty(""БелыйНавахо"", ""NavajoWhite"")]
		|        public string NavajoWhite
		|        {
		|            get { return ""rgb(255, 222, 173)""; }
		|        }
		|
		|        [ContextProperty(""Бирюзовый"", ""Turquoise"")]
		|        public string Turquoise
		|        {
		|            get { return ""rgb(64, 224, 208)""; }
		|        }
		|
		|        [ContextProperty(""Бисквитный"", ""Bisque"")]
		|        public string Bisque
		|        {
		|            get { return ""rgb(255, 228, 196)""; }
		|        }
		|
		|        [ContextProperty(""БледноБирюзовый"", ""PaleTurquoise"")]
		|        public string PaleTurquoise
		|        {
		|            get { return ""rgb(175, 238, 238)""; }
		|        }
		|
		|        [ContextProperty(""БледноЖелтый"", ""Cornsilk"")]
		|        public string Cornsilk
		|        {
		|            get { return ""rgb(255, 248, 220)""; }
		|        }
		|
		|        [ContextProperty(""БледноЗеленый"", ""PaleGreen"")]
		|        public string PaleGreen
		|        {
		|            get { return ""rgb(152, 251, 152)""; }
		|        }
		|
		|        [ContextProperty(""БледноЗолотистый"", ""PaleGoldenrod"")]
		|        public string PaleGoldenrod
		|        {
		|            get { return ""rgb(238, 232, 170)""; }
		|        }
		|
		|        [ContextProperty(""Васильковый"", ""CornflowerBlue"")]
		|        public string CornflowerBlue
		|        {
		|            get { return ""rgb(100, 149, 237)""; }
		|        }
		|
		|        [ContextProperty(""ГлубокийРозовый"", ""DeepPink"")]
		|        public string DeepPink
		|        {
		|            get { return ""rgb(255, 20, 147)""; }
		|        }
		|
		|        [ContextProperty(""Голубой"", ""DeepSkyBlue"")]
		|        public string DeepSkyBlue
		|        {
		|            get { return ""rgb(0, 191, 255)""; }
		|        }
		|
		|        [ContextProperty(""ГрифельноСерый"", ""LightSlateGray"")]
		|        public string LightSlateGray
		|        {
		|            get { return ""rgb(119, 136, 153)""; }
		|        }
		|
		|        [ContextProperty(""ГрифельноСиний"", ""SlateBlue"")]
		|        public string SlateBlue
		|        {
		|            get { return ""rgb(106, 90, 205)""; }
		|        }
		|
		|        [ContextProperty(""ЖелтоЗеленый"", ""YellowGreen"")]
		|        public string YellowGreen
		|        {
		|            get { return ""rgb(154, 205, 50)""; }
		|        }
		|
		|        [ContextProperty(""Желтый"", ""Yellow"")]
		|        public string Yellow
		|        {
		|            get { return ""rgb(255, 255, 0)""; }
		|        }
		|
		|        [ContextProperty(""ЗащитноСиний"", ""DodgerBlue"")]
		|        public string DodgerBlue
		|        {
		|            get { return ""rgb(30, 144, 255)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленаяВесна"", ""SpringGreen"")]
		|        public string SpringGreen
		|        {
		|            get { return ""rgb(0, 255, 127)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленаяЛужайка"", ""LawnGreen"")]
		|        public string LawnGreen
		|        {
		|            get { return ""rgb(124, 252, 0)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленоЖелтый"", ""GreenYellow"")]
		|        public string GreenYellow
		|        {
		|            get { return ""rgb(173, 255, 47)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленоеМоре"", ""SeaGreen"")]
		|        public string SeaGreen
		|        {
		|            get { return ""rgb(46, 139, 87)""; }
		|        }
		|
		|        [ContextProperty(""Зеленый"", ""Green"")]
		|        public string Green
		|        {
		|            get { return ""rgb(0, 128, 0)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленыйЛайм"", ""LimeGreen"")]
		|        public string LimeGreen
		|        {
		|            get { return ""rgb(50, 205, 50)""; }
		|        }
		|
		|        [ContextProperty(""ЗеленыйЛесной"", ""ForestGreen"")]
		|        public string ForestGreen
		|        {
		|            get { return ""rgb(34, 139, 34)""; }
		|        }
		|
		|        [ContextProperty(""Золотарник"", ""Goldenrod"")]
		|        public string Goldenrod
		|        {
		|            get { return ""rgb(218, 165, 32)""; }
		|        }
		|
		|        [ContextProperty(""Золотой"", ""Gold"")]
		|        public string Gold
		|        {
		|            get { return ""rgb(255, 215, 0)""; }
		|        }
		|
		|        [ContextProperty(""Индиго"", ""Indigo"")]
		|        public string Indigo
		|        {
		|            get { return ""rgb(75, 0, 130)""; }
		|        }
		|
		|        [ContextProperty(""ИндийскийКрасный"", ""IndianRed"")]
		|        public string IndianRed
		|        {
		|            get { return ""rgb(205, 92, 92)""; }
		|        }
		|
		|        [ContextProperty(""Кирпичный"", ""Firebrick"")]
		|        public string Firebrick
		|        {
		|            get { return ""rgb(178, 34, 34)""; }
		|        }
		|
		|        [ContextProperty(""КожаноКоричневый"", ""SaddleBrown"")]
		|        public string SaddleBrown
		|        {
		|            get { return ""rgb(139, 69, 19)""; }
		|        }
		|
		|        [ContextProperty(""Коралловый"", ""Coral"")]
		|        public string Coral
		|        {
		|            get { return ""rgb(255, 127, 80)""; }
		|        }
		|
		|        [ContextProperty(""КоричневоМалиновый"", ""Maroon"")]
		|        public string Maroon
		|        {
		|            get { return ""rgb(128, 0, 0)""; }
		|        }
		|
		|        [ContextProperty(""Коричневый"", ""Brown"")]
		|        public string Brown
		|        {
		|            get { return ""rgb(165, 42, 42)""; }
		|        }
		|
		|        [ContextProperty(""КоролевскийСиний"", ""RoyalBlue"")]
		|        public string RoyalBlue
		|        {
		|            get { return ""rgb(65, 105, 225)""; }
		|        }
		|
		|        [ContextProperty(""Красный"", ""Red"")]
		|        public string Red
		|        {
		|            get { return ""rgb(255, 0, 0)""; }
		|        }
		|
		|        [ContextProperty(""Кровавый"", ""Crimson"")]
		|        public string Crimson
		|        {
		|            get { return ""rgb(220, 20, 60)""; }
		|        }
		|
		|        [ContextProperty(""Лаванда"", ""Lavender"")]
		|        public string Lavender
		|        {
		|            get { return ""rgb(230, 230, 250)""; }
		|        }
		|
		|        [ContextProperty(""Лазурный"", ""Azure"")]
		|        public string Azure
		|        {
		|            get { return ""rgb(240, 255, 255)""; }
		|        }
		|
		|        [ContextProperty(""Лайм"", ""Lime"")]
		|        public string Lime
		|        {
		|            get { return ""rgb(0, 255, 0)""; }
		|        }
		|
		|        [ContextProperty(""Лиловый"", ""PaleVioletRed"")]
		|        public string PaleVioletRed
		|        {
		|            get { return ""rgb(219, 112, 147)""; }
		|        }
		|
		|        [ContextProperty(""Лососевый"", ""Salmon"")]
		|        public string Salmon
		|        {
		|            get { return ""rgb(250, 128, 114)""; }
		|        }
		|
		|        [ContextProperty(""Льняной"", ""Linen"")]
		|        public string Linen
		|        {
		|            get { return ""rgb(250, 240, 230)""; }
		|        }
		|
		|        [ContextProperty(""Малиновый"", ""Magenta"")]
		|        public string Magenta
		|        {
		|            get { return ""rgb(255, 0, 255)""; }
		|        }
		|
		|        [ContextProperty(""Медовый"", ""Honeydew"")]
		|        public string Honeydew
		|        {
		|            get { return ""rgb(240, 255, 240)""; }
		|        }
		|
		|        [ContextProperty(""Мокасиновый"", ""Moccasin"")]
		|        public string Moccasin
		|        {
		|            get { return ""rgb(255, 228, 181)""; }
		|        }
		|
		|        [ContextProperty(""МорскаяВолна"", ""Aqua"")]
		|        public string Aqua
		|        {
		|            get { return ""rgb(0, 255, 255)""; }
		|        }
		|
		|        [ContextProperty(""МорскаяРакушка"", ""SeaShell"")]
		|        public string SeaShell
		|        {
		|            get { return ""rgb(255, 245, 238)""; }
		|        }
		|
		|        [ContextProperty(""МятноКремовый"", ""MintCream"")]
		|        public string MintCream
		|        {
		|            get { return ""rgb(245, 255, 250)""; }
		|        }
		|
		|        [ContextProperty(""НебесноГолубой"", ""SkyBlue"")]
		|        public string SkyBlue
		|        {
		|            get { return ""rgb(135, 206, 235)""; }
		|        }
		|
		|        [ContextProperty(""НебесноГолубойСветлый"", ""LightSkyBlue"")]
		|        public string LightSkyBlue
		|        {
		|            get { return ""rgb(135, 206, 250)""; }
		|        }
		|
		|        [ContextProperty(""НежноОливковый"", ""OliveDrab"")]
		|        public string OliveDrab
		|        {
		|            get { return ""rgb(107, 142, 35)""; }
		|        }
		|
		|        [ContextProperty(""Оливковый"", ""Olive"")]
		|        public string Olive
		|        {
		|            get { return ""rgb(128, 128, 0)""; }
		|        }
		|
		|        [ContextProperty(""ОранжевоКрасный"", ""OrangeRed"")]
		|        public string OrangeRed
		|        {
		|            get { return ""rgb(255, 69, 0)""; }
		|        }
		|
		|        [ContextProperty(""Оранжевый"", ""Orange"")]
		|        public string Orange
		|        {
		|            get { return ""rgb(255, 165, 0)""; }
		|        }
		|
		|        [ContextProperty(""Орхидея"", ""Orchid"")]
		|        public string Orchid
		|        {
		|            get { return ""rgb(218, 112, 214)""; }
		|        }
		|
		|        [ContextProperty(""Охра"", ""Sienna"")]
		|        public string Sienna
		|        {
		|            get { return ""rgb(160, 82, 45)""; }
		|        }
		|
		|        [ContextProperty(""Персиковый"", ""PeachPuff"")]
		|        public string PeachPuff
		|        {
		|            get { return ""rgb(255, 218, 185)""; }
		|        }
		|
		|        [ContextProperty(""Песочный"", ""SandyBrown"")]
		|        public string SandyBrown
		|        {
		|            get { return ""rgb(244, 164, 96)""; }
		|        }
		|
		|        [ContextProperty(""ПобегПапайи"", ""PapayaWhip"")]
		|        public string PapayaWhip
		|        {
		|            get { return ""rgb(255, 239, 213)""; }
		|        }
		|
		|        [ContextProperty(""ПолуночноСиний"", ""MidnightBlue"")]
		|        public string MidnightBlue
		|        {
		|            get { return ""rgb(25, 25, 112)""; }
		|        }
		|
		|        [ContextProperty(""ПороховаяСинь"", ""PowderBlue"")]
		|        public string PowderBlue
		|        {
		|            get { return ""rgb(176, 224, 230)""; }
		|        }
		|
		|        [ContextProperty(""ПризрачноБелый"", ""GhostWhite"")]
		|        public string GhostWhite
		|        {
		|            get { return ""rgb(248, 248, 255)""; }
		|        }
		|
		|        [ContextProperty(""Прозрачный"", ""Transparent"")]
		|        public string Transparent
		|        {
		|            get { return ""transparent""; }
		|        }
		|
		|        [ContextProperty(""Пурпурный"", ""Purple"")]
		|        public string Purple
		|        {
		|            get { return ""rgb(128, 0, 128)""; }
		|        }
		|
		|        [ContextProperty(""Пшеничный"", ""Wheat"")]
		|        public string Wheat
		|        {
		|            get { return ""rgb(245, 222, 179)""; }
		|        }
		|
		|        [ContextProperty(""РозовоКоричневый"", ""RosyBrown"")]
		|        public string RosyBrown
		|        {
		|            get { return ""rgb(188, 143, 143)""; }
		|        }
		|
		|        [ContextProperty(""РозовоЛавандовый"", ""LavenderBlush"")]
		|        public string LavenderBlush
		|        {
		|            get { return ""rgb(255, 240, 245)""; }
		|        }
		|
		|        [ContextProperty(""Розовый"", ""Pink"")]
		|        public string Pink
		|        {
		|            get { return ""rgb(255, 192, 203)""; }
		|        }
		|
		|        [ContextProperty(""СветлаяМорскаяВолна"", ""LightSeaGreen"")]
		|        public string LightSeaGreen
		|        {
		|            get { return ""rgb(32, 178, 170)""; }
		|        }
		|
		|        [ContextProperty(""СветлоЖелтый"", ""LightYellow"")]
		|        public string LightYellow
		|        {
		|            get { return ""rgb(255, 255, 224)""; }
		|        }
		|
		|        [ContextProperty(""СветлоЖелтыйЗолотистый"", ""LightGoldenrodYellow"")]
		|        public string LightGoldenrodYellow
		|        {
		|            get { return ""rgb(250, 250, 210)""; }
		|        }
		|
		|        [ContextProperty(""СветлоЗеленый"", ""LightGreen"")]
		|        public string LightGreen
		|        {
		|            get { return ""rgb(144, 238, 144)""; }
		|        }
		|
		|        [ContextProperty(""СветлоКоралловый"", ""LightCoral"")]
		|        public string LightCoral
		|        {
		|            get { return ""rgb(240, 128, 128)""; }
		|        }
		|
		|        [ContextProperty(""СветлоКоричневый"", ""Peru"")]
		|        public string Peru
		|        {
		|            get { return ""rgb(205, 133, 63)""; }
		|        }
		|
		|        [ContextProperty(""СветлоКремовый"", ""BlanchedAlmond"")]
		|        public string BlanchedAlmond
		|        {
		|            get { return ""rgb(255, 235, 205)""; }
		|        }
		|
		|        [ContextProperty(""СветлоЛимонный"", ""LemonChiffon"")]
		|        public string LemonChiffon
		|        {
		|            get { return ""rgb(255, 250, 205)""; }
		|        }
		|
		|        [ContextProperty(""СветлоРозовый"", ""LightPink"")]
		|        public string LightPink
		|        {
		|            get { return ""rgb(255, 182, 193)""; }
		|        }
		|
		|        [ContextProperty(""СветлоСерый"", ""LightGray"")]
		|        public string LightGray
		|        {
		|            get { return ""rgb(211, 211, 211)""; }
		|        }
		|
		|        [ContextProperty(""СветлоСиний"", ""LightBlue"")]
		|        public string LightBlue
		|        {
		|            get { return ""rgb(173, 216, 230)""; }
		|        }
		|
		|        [ContextProperty(""СветлыйЗеленоватоГолубой"", ""LightCyan"")]
		|        public string LightCyan
		|        {
		|            get { return ""rgb(224, 255, 255)""; }
		|        }
		|
		|        [ContextProperty(""СветлыйЛососевый"", ""LightSalmon"")]
		|        public string LightSalmon
		|        {
		|            get { return ""rgb(255, 160, 122)""; }
		|        }
		|
		|        [ContextProperty(""Серебристый"", ""Silver"")]
		|        public string Silver
		|        {
		|            get { return ""rgb(192, 192, 192)""; }
		|        }
		|
		|        [ContextProperty(""СероСиний"", ""CadetBlue"")]
		|        public string CadetBlue
		|        {
		|            get { return ""rgb(95, 158, 160)""; }
		|        }
		|
		|        [ContextProperty(""Серый"", ""Gray"")]
		|        public string Gray
		|        {
		|            get { return ""rgb(128, 128, 128)""; }
		|        }
		|
		|        [ContextProperty(""СерыйШифер"", ""SlateGray"")]
		|        public string SlateGray
		|        {
		|            get { return ""rgb(112, 128, 144)""; }
		|        }
		|
		|        [ContextProperty(""СинеГолубойСоСтальнымОттенком"", ""LightSteelBlue"")]
		|        public string LightSteelBlue
		|        {
		|            get { return ""rgb(176, 196, 222)""; }
		|        }
		|
		|        [ContextProperty(""СинеЗеленый"", ""Teal"")]
		|        public string Teal
		|        {
		|            get { return ""rgb(0, 128, 128)""; }
		|        }
		|
		|        [ContextProperty(""СинеФиолетовый"", ""BlueViolet"")]
		|        public string BlueViolet
		|        {
		|            get { return ""rgb(138, 43, 226)""; }
		|        }
		|
		|        [ContextProperty(""Синий"", ""Blue"")]
		|        public string Blue
		|        {
		|            get { return ""rgb(0, 0, 255)""; }
		|        }
		|
		|        [ContextProperty(""СинийЭлис"", ""AliceBlue"")]
		|        public string AliceBlue
		|        {
		|            get { return ""rgb(240, 248, 255)""; }
		|        }
		|
		|        [ContextProperty(""СиняяСталь"", ""SteelBlue"")]
		|        public string SteelBlue
		|        {
		|            get { return ""rgb(70, 130, 180)""; }
		|        }
		|
		|        [ContextProperty(""Сливовый"", ""Plum"")]
		|        public string Plum
		|        {
		|            get { return ""rgb(221, 160, 221)""; }
		|        }
		|
		|        [ContextProperty(""СлоноваяКость"", ""Ivory"")]
		|        public string Ivory
		|        {
		|            get { return ""rgb(255, 255, 240)""; }
		|        }
		|
		|        [ContextProperty(""СтароеКружево"", ""OldLace"")]
		|        public string OldLace
		|        {
		|            get { return ""rgb(253, 245, 230)""; }
		|        }
		|
		|        [ContextProperty(""ТемнаяЛососина"", ""DarkSalmon"")]
		|        public string DarkSalmon
		|        {
		|            get { return ""rgb(233, 150, 122)""; }
		|        }
		|
		|        [ContextProperty(""ТемнаяМорскаяВолна"", ""DarkSeaGreen"")]
		|        public string DarkSeaGreen
		|        {
		|            get { return ""rgb(143, 188, 139)""; }
		|        }
		|
		|        [ContextProperty(""ТемнаяОрхидея"", ""DarkOrchid"")]
		|        public string DarkOrchid
		|        {
		|            get { return ""rgb(153, 50, 204)""; }
		|        }
		|
		|        [ContextProperty(""ТемноАспидныйСерый"", ""DarkSlateGray"")]
		|        public string DarkSlateGray
		|        {
		|            get { return ""rgb(47, 79, 79)""; }
		|        }
		|
		|        [ContextProperty(""ТемноГолубой"", ""DarkCyan"")]
		|        public string DarkCyan
		|        {
		|            get { return ""rgb(0, 139, 139)""; }
		|        }
		|
		|        [ContextProperty(""ТемноЗеленый"", ""DarkGreen"")]
		|        public string DarkGreen
		|        {
		|            get { return ""rgb(0, 100, 0)""; }
		|        }
		|
		|        [ContextProperty(""ТемноКрасный"", ""DarkRed"")]
		|        public string DarkRed
		|        {
		|            get { return ""rgb(139, 0, 0)""; }
		|        }
		|
		|        [ContextProperty(""ТемноМандариновый"", ""DarkTurquoise"")]
		|        public string DarkTurquoise
		|        {
		|            get { return ""rgb(0, 206, 209)""; }
		|        }
		|
		|        [ContextProperty(""ТемноПурпурный"", ""DarkMagenta"")]
		|        public string DarkMagenta
		|        {
		|            get { return ""rgb(139, 0, 139)""; }
		|        }
		|
		|        [ContextProperty(""ТемноСерый"", ""DarkGray"")]
		|        public string DarkGray
		|        {
		|            get { return ""rgb(169, 169, 169)""; }
		|        }
		|
		|        [ContextProperty(""ТемноСиний"", ""DarkBlue"")]
		|        public string DarkBlue
		|        {
		|            get { return ""rgb(0, 0, 139)""; }
		|        }
		|
		|        [ContextProperty(""ТемноФиолетовый"", ""DarkViolet"")]
		|        public string DarkViolet
		|        {
		|            get { return ""rgb(148, 0, 211)""; }
		|        }
		|
		|        [ContextProperty(""ТемныйГрифельноСиний"", ""DarkSlateBlue"")]
		|        public string DarkSlateBlue
		|        {
		|            get { return ""rgb(72, 61, 139)""; }
		|        }
		|
		|        [ContextProperty(""ТемныйЗолотой"", ""DarkGoldenrod"")]
		|        public string DarkGoldenrod
		|        {
		|            get { return ""rgb(184, 134, 11)""; }
		|        }
		|
		|        [ContextProperty(""ТемныйОливковоЗеленый"", ""DarkOliveGreen"")]
		|        public string DarkOliveGreen
		|        {
		|            get { return ""rgb(85, 107, 47)""; }
		|        }
		|
		|        [ContextProperty(""ТемныйОранжевый"", ""DarkOrange"")]
		|        public string DarkOrange
		|        {
		|            get { return ""rgb(255, 140, 0)""; }
		|        }
		|
		|        [ContextProperty(""ТемныйХаки"", ""DarkKhaki"")]
		|        public string DarkKhaki
		|        {
		|            get { return ""rgb(189, 183, 107)""; }
		|        }
		|
		|        [ContextProperty(""Томатный"", ""Tomato"")]
		|        public string Tomato
		|        {
		|            get { return ""rgb(255, 99, 71)""; }
		|        }
		|
		|        [ContextProperty(""ТуманноБелый"", ""Gainsboro"")]
		|        public string Gainsboro
		|        {
		|            get { return ""rgb(220, 220, 220)""; }
		|        }
		|
		|        [ContextProperty(""ТусклоРозовый"", ""MistyRose"")]
		|        public string MistyRose
		|        {
		|            get { return ""rgb(255, 228, 225)""; }
		|        }
		|
		|        [ContextProperty(""ТусклоСерый"", ""DimGray"")]
		|        public string DimGray
		|        {
		|            get { return ""rgb(105, 105, 105)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйАквамарин"", ""MediumAquamarine"")]
		|        public string MediumAquamarine
		|        {
		|            get { return ""rgb(102, 205, 170)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйБирюзовый"", ""MediumTurquoise"")]
		|        public string MediumTurquoise
		|        {
		|            get { return ""rgb(72, 209, 204)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйВесеннеЗеленый"", ""MediumSpringGreen"")]
		|        public string MediumSpringGreen
		|        {
		|            get { return ""rgb(0, 250, 154)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйГрифельноСиний"", ""MediumSlateBlue"")]
		|        public string MediumSlateBlue
		|        {
		|            get { return ""rgb(123, 104, 238)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйМорскаяВолна"", ""MediumSeaGreen"")]
		|        public string MediumSeaGreen
		|        {
		|            get { return ""rgb(60, 179, 113)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйОрхидея"", ""MediumOrchid"")]
		|        public string MediumOrchid
		|        {
		|            get { return ""rgb(186, 85, 211)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйСиний"", ""MediumBlue"")]
		|        public string MediumBlue
		|        {
		|            get { return ""rgb(0, 0, 205)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйФиолетовоКрасный"", ""MediumVioletRed"")]
		|        public string MediumVioletRed
		|        {
		|            get { return ""rgb(199, 21, 133)""; }
		|        }
		|
		|        [ContextProperty(""УмеренныйФиолетовый"", ""MediumPurple"")]
		|        public string MediumPurple
		|        {
		|            get { return ""rgb(147, 112, 219)""; }
		|        }
		|
		|        [ContextProperty(""Фиолетовый"", ""Violet"")]
		|        public string Violet
		|        {
		|            get { return ""rgb(238, 130, 238)""; }
		|        }
		|
		|        [ContextProperty(""Фуксия"", ""Fuchsia"")]
		|        public string Fuchsia
		|        {
		|            get { return ""rgb(255, 0, 255)""; }
		|        }
		|
		|        [ContextProperty(""Хаки"", ""Khaki"")]
		|        public string Khaki
		|        {
		|            get { return ""rgb(240, 230, 140)""; }
		|        }
		|
		|        [ContextProperty(""ЦветЗагара"", ""Tan"")]
		|        public string Tan
		|        {
		|            get { return ""rgb(210, 180, 140)""; }
		|        }
		|
		|        [ContextProperty(""ЦветПлотнойДревесины"", ""BurlyWood"")]
		|        public string BurlyWood
		|        {
		|            get { return ""rgb(222, 184, 135)""; }
		|        }
		|
		|        [ContextProperty(""ЦветФормыМорскихОфицеров"", ""Navy"")]
		|        public string Navy
		|        {
		|            get { return ""rgb(0, 0, 128)""; }
		|        }
		|
		|        [ContextProperty(""ЦветочноБелый"", ""FloralWhite"")]
		|        public string FloralWhite
		|        {
		|            get { return ""rgb(255, 250, 240)""; }
		|        }
		|
		|        [ContextProperty(""Циан"", ""Cyan"")]
		|        public string Cyan
		|        {
		|            get { return ""rgb(0, 255, 255)""; }
		|        }
		|
		|        [ContextProperty(""Черный"", ""Black"")]
		|        public string Black
		|        {
		|            get { return ""rgb(0, 0, 0)""; }
		|        }
		|
		|        [ContextProperty(""Чертополох"", ""Thistle"")]
		|        public string Thistle
		|        {
		|            get { return ""rgb(216, 191, 216)""; }
		|        }
		|
		|        [ContextProperty(""Шартрез"", ""Chartreuse"")]
		|        public string Chartreuse
		|        {
		|            get { return ""rgb(127, 255, 0)""; }
		|        }
		|
		|        [ContextProperty(""Шоколадный"", ""Chocolate"")]
		|        public string Chocolate
		|        {
		|            get { return ""rgb(210, 105, 30)""; }
		|        }
		|
		|        [ContextProperty(""ЯркийБелый"", ""Snow"")]
		|        public string Snow
		|        {
		|            get { return ""rgb(255, 250, 250)""; }
		|        }
		|
		|        [ContextProperty(""ЯркоРозовый"", ""HotPink"")]
		|        public string HotPink
		|        {
		|            get { return ""rgb(255, 105, 180)""; }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Packagejson" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"namespace osdf
		|{
		|    public static class Packagejson
		|    {
		|        public static string packagejson = @""{
		|    """"main"""": """"index.html"""",
		|    """"name"""": """"DeclarativeForms"""",
		|        """"window"""": {
		|        }
		|}"";
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "IndexhtmlWin" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"namespace osdf
		|{
		|    public class IndexhtmlWin
		|    {
		|        public static string spacer = DeclarativeForms.paramDelimiter;
		|        public static string Indexhtml = @""<!DOCTYPE html>
		|<html>
		|	<head>
		|		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		|		<link rel='stylesheet' href='"" + DeclarativeForms.CSSPath + @""' />
		|
		|		<script type='text/javascript'>
		|            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
		|        </script>
		|
		|		<script type='text/javascript'>
		|function funFromString(func)
		|{
		|    let func2 = Function(func);
		|    func2();
		|}
		|function doEvent(event)
		|{
		|    if (event.type == 'mouseup')
		|    {
		|        let button;
		|        let eventButton = event.button;
		|        if (eventButton == 0)
		|        {
		|            button = 'left';
		|        }
		|        else if (eventButton == 1)
		|        {
		|            button = 'middle';
		|        }
		|        else if (eventButton == 2)
		|        {
		|            button = 'right';
		|        }
		|
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Button=' + button + 
		|        '"" + spacer + @""X=' + event.clientX + 
		|        '"" + spacer + @""Y=' + event.clientY);
		|    }
		|    else if (event.type == 'input')
		|    {
		|        let value = event.target.value;
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Value=' + value);
		|    }
		|    else if (event.type == 'change')
		|    {
		|        let x = mapKeyEl.get(mapElKey.get(event.target));
		|        //alert('nodeName = ' + event.target.nodeName + ' type = ' + event.target.type);
		|        if (event.target.nodeName == 'INPUT')
		|        {
		|            if (event.target.type == 'file')
		|            {
		|                let txt = '';
		|                if (x.files.length > 0)
		|                {
		|                    for (var i = 0; i < x.files.length; i++)
		|                    {
		|                        txt = txt + x.files[i].name + ';';
		|                    }
		|                } 
		|                else
		|                {
		|                    x.value = null;
		|                    txt = 'null';
		|                }
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Files=' + txt);
		|            }
		|            else if (event.target.type == 'checkbox')
		|            {
		|                let _checked = event.target.checked;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Checked=' + _checked);
		|            }
		|            else if (event.target.type == 'color')
		|            {
		|                let value = event.target.value;
		|                let r = parseInt(value[1] + value[2], 16);
		|                let g = parseInt(value[3] + value[4], 16);
		|                let b = parseInt(value[5] + value[6], 16);
		|                let value2 = 'rgb(' + r + ', ' + g + ', ' + b + ')';
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value2);
		|            }
		|            else
		|            {
		|                let value = event.target.value;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value);
		|            }
		|        }
		|        else if (event.target == 'SELECT')
		|        {
		|            let txt = '';
		|            var opt = event.target.options;
		|            if (opt.length > 0)
		|            {
		|                for (var i = 0; i < opt.length; i++)
		|                {
		|                    if (opt[i].selected)
		|                    {
		|                        txt = txt + mapElKey.get(opt[i]) + ';';
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                txt = 'null';
		|            }
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""ListItem=' + txt);
		|        }
		|        else
		|        {
		|            let value = event.target.value;
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""Value=' + value);
		|        }
		|    }
		|    else
		|    {
		|        sendPost(mapElKey.get(event.target) + '"" + spacer + @""' + event.type);
		|    }
		|}
		|function sendPost(str)
		|{
		|    try
		|    {
		|	    sendClient.send(str);
		|    }
		|    catch
		|    {
		|    }
		|}
		|function startTimer(nameEl, interval) {
		|    window.TimerId = window.setInterval(function(){
		|            sendPost(nameEl + '"" + spacer + @""tick');
		|        }, interval);
		|    mapKeyEl.set(nameEl, window.TimerId);
		|    mapElKey.set(mapKeyEl.get(nameEl), nameEl);
		|}
		|function stopTimer(nameEl) {
		|   window.clearInterval(mapKeyEl.get(nameEl));
		|}
		|		
		|var mapKeyEl = new Map();
		|var mapElKey = new Map();
		|var gui = require('nw.gui');
		|//document.addEventListener('DOMContentLoaded', function (event) { sleep(1000); sendPost('mainForm' + '"" + spacer + @""' + 'loaded'); });
		|
		|function getReceiveClient()
		|{
		|    var receiveClient1 = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portSendServer + @""/');
		|    receiveClient1.onopen = function(event) { receiveClient1.send('Hello from receiveClient'); };
		|    receiveClient1.onmessage = function (event)
		|    {
		|        var input = event.data;
		|        var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|        for (var i = 0; i < fields.length; i++)
		|        {
		|            var item = fields[i];
		|            if (item != '')
		|            {
		|                funFromString(item);
		|            }
		|        }
		|    };
		|    receiveClient1.onclose = function (event) {
		|        setTimeout(function() {
		|            receiveClient1 = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portSendServer + @""/');
		|        }, 2);
		|    };
		|    receiveClient1.onerror = function (error) {
		|	    //alert('websocket error ' + error);
		|    };
		|    return receiveClient1;
		|}
		|function getSendClient()
		|{
		|    var sendClient1 = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portReceivingServer + @""/');
		|    sendClient1.onopen = function(event) { 
		|        sendClient1.send('mainForm' + '"" + spacer + @""' + 'loaded'); 
		|    };
		|    sendClient1.onmessage = function (event)
		|    {
		|        var input = event.data;
		|        var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|        for (var i = 0; i < fields.length; i++)
		|        {
		|            var item = fields[i];
		|            if (item != '')
		|            {
		|                funFromString(item);
		|            }
		|        }
		|    };
		|    sendClient1.onclose = function (event) {
		|        setTimeout(function() {
		|            sendClient1 = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portReceivingServer + @""/');
		|        }, 2);
		|    };
		|    sendClient1.onerror = function (error) {
		|	    alert('websocket error ' + error);
		|    };
		|    return sendClient1;
		|}
		|nw.Window.get().on('resize', function(width, height)
		|{
		|    sendPost('mainForm' +
		|    '"" + spacer + @""' + 'resize' +
		|    '"" + spacer + @""WindowWidth=' + width +
		|    '"" + spacer + @""WindowHeight=' + height);
		|});
		|function sleep(milliseconds) {
		|    const date = Date.now();
		|    let currentDate = null;
		|    do {
		|        currentDate = Date.now();
		|    } while (currentDate - date < milliseconds);
		|}
		|nw.Window.get().on('close', function () {
		|    gui.App.quit();
		|});
		|function firstStart() {
		|    sendPost('formIsLoaded');
		|}
		|
		|var sendClient = getSendClient();
		|var receiveClient = getReceiveClient();
		|
		|        </script>
		|	</head>
		|	<body>
		|
		|    </body>
		|</html>
		|"";
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "IndexhtmlWinBr" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"namespace osdf
		|{
		|    public class IndexhtmlWinBr
		|    {
		|        public static string spacer = DeclarativeForms.paramDelimiter;
		|        public static string Indexhtml = @""<!DOCTYPE html>
		|<html>
		|	<head>
		|		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		|		<link rel='stylesheet' href='"" + DeclarativeForms.CSSPath + @""' />
		|
		|		<script type='text/javascript'>
		|            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
		|        </script>
		|
		|		<script type='text/javascript'>
		|function funFromString(func)
		|{
		|    let func2 = Function(func);
		|    func2();
		|}
		|function doEvent(event)
		|{
		|    if (event.type == 'mouseup')
		|    {
		|        let button;
		|        let eventButton = event.button;
		|        if (eventButton == 0)
		|        {
		|            button = 'left';
		|        }
		|        else if (eventButton == 1)
		|        {
		|            button = 'middle';
		|        }
		|        else if (eventButton == 2)
		|        {
		|            button = 'right';
		|        }
		|
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Button=' + button + 
		|        '"" + spacer + @""X=' + event.clientX + 
		|        '"" + spacer + @""Y=' + event.clientY);
		|    }
		|    else if (event.type == 'input')
		|    {
		|        let value = event.target.value;
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Value=' + value);
		|    }
		|    else if (event.type == 'change')
		|    {
		|        let x = mapKeyEl.get(mapElKey.get(event.target));
		|        //alert('nodeName = ' + event.target.nodeName + ' type = ' + event.target.type);
		|        if (event.target.nodeName == 'INPUT')
		|        {
		|            if (event.target.type == 'file')
		|            {
		|                let txt = '';
		|                if (x.files.length > 0)
		|                {
		|                    for (var i = 0; i < x.files.length; i++)
		|                    {
		|                        txt = txt + x.files[i].name + ';';
		|                    }
		|                } 
		|                else
		|                {
		|                    x.value = null;
		|                    txt = 'null';
		|                }
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Files=' + txt);
		|            }
		|            else if (event.target.type == 'checkbox')
		|            {
		|                let _checked = event.target.checked;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Checked=' + _checked);
		|            }
		|            else if (event.target.type == 'color')
		|            {
		|                let value = event.target.value;
		|                let r = parseInt(value[1] + value[2], 16);
		|                let g = parseInt(value[3] + value[4], 16);
		|                let b = parseInt(value[5] + value[6], 16);
		|                let value2 = 'rgb(' + r + ', ' + g + ', ' + b + ')';
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value2);
		|            }
		|            else
		|            {
		|                let value = event.target.value;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value);
		|            }
		|        }
		|        else if (event.target == 'SELECT')
		|        {
		|            let txt = '';
		|            var opt = event.target.options;
		|            if (opt.length > 0)
		|            {
		|                for (var i = 0; i < opt.length; i++)
		|                {
		|                    if (opt[i].selected)
		|                    {
		|                        txt = txt + mapElKey.get(opt[i]) + ';';
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                txt = 'null';
		|            }
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""ListItem=' + txt);
		|        }
		|        else
		|        {
		|            let value = event.target.value;
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""Value=' + value);
		|        }
		|    }
		|    else
		|    {
		|        sendPost(mapElKey.get(event.target) + '"" + spacer + @""' + event.type);
		|    }
		|}
		|function sendPost(str)
		|{
		|    try
		|    {
		|	    sendClient.send(str);
		|    }
		|    catch
		|    {
		|    }
		|}
		|function startTimer(nameEl, interval) {
		|    window.TimerId = window.setInterval(function(){
		|            sendPost(nameEl + '"" + spacer + @""tick');
		|        }, interval);
		|    mapKeyEl.set(nameEl, window.TimerId);
		|    mapElKey.set(mapKeyEl.get(nameEl), nameEl);
		|}
		|function stopTimer(nameEl) {
		|   window.clearInterval(mapKeyEl.get(nameEl));
		|}
		|
		|var mapKeyEl = new Map();
		|var mapElKey = new Map();
		|
		|document.addEventListener('DOMContentLoaded', function (event) { sendPost('mainForm' + '"" + spacer + @""' + 'loaded'); });
		|
		|var sendClient = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portReceivingServer + @""/');
		|sendClient.onopen = function(event) { sendClient.send('mainForm' + '"" + spacer + @""' + 'loaded'); };
		|sendClient.onmessage = function (event)
		|{
		|    var input = event.data;
		|    var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|    for (var i = 0; i < fields.length; i++)
		|    {
		|        var item = fields[i];
		|        if (item != '')
		|        {
		|            funFromString(item);
		|        }
		|    }
		|};
		|sendClient.onclose = function (event) {
		|    setTimeout(function() {
		|        sendClient = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portReceivingServer + @""/');
		|    }, 2);
		|};
		|sendClient.onerror = function (error) {
		|	//alert('websocket error ' + error);
		|};
		|
		|window.onbeforeunload = function(){
		|    let str = 'При обновлении страницы или переходе по ссылке в этом окне программа будет перезапущена или закрыта соответственно. Введенные данные могут не сохраниться.';
		|    setTimeout(function(){ alert(str); }, 1);
		|    if (event.target.nodeName.toLowerCase() === 'a')
		|    {
		|        return;
		|    }
		|    else
		|    {
		|        setTimeout(function(){ alert(str); }, 1);
		|        return false; // отменить действие браузера (переход по ссылке)
		|    }
		|};
		|
		|window.addEventListener('resize', function(event) {
		|    sendPost('mainForm' + 
		|    '"" + spacer + @""' + 'resize' + 
		|    '"" + spacer + @""WindowWidth=' + window.innerWidth + 
		|    '"" + spacer + @""WindowHeight=' + window.innerHeight);
		|}, true);
		|
		|//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);
		|
		|var receiveClient = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portSendServer + @""/');
		|receiveClient.onopen = function(event) { receiveClient.send('Hello from receiveClient'); };
		|receiveClient.onmessage = function (event)
		|{
		|    var input = event.data;
		|    var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|    for (var i = 0; i < fields.length; i++)
		|    {
		|        var item = fields[i];
		|        if (item != '')
		|        {
		|            funFromString(item);
		|        }
		|    }
		|};
		|receiveClient.onclose = function (event) {
		|    setTimeout(function() {
		|        receiveClient = new WebSocket('ws://127.0.0.1:"" + DeclarativeForms.portSendServer + @""/');
		|    }, 2);
		|};
		|receiveClient.onerror = function (error) {
		|	//alert('websocket error ' + error);
		|};
		|function firstStart() {
		|    sendPost('formIsLoaded');
		|}
		|
		|        </script>
		|	</head>
		|	<body>
		|
		|    </body>
		|</html>
		|"";
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "IndexhtmlLin" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"namespace osdf
		|{
		|    public class IndexhtmlLin
		|    {
		|        public static string spacer = DeclarativeForms.paramDelimiter;
		|        public static string Indexhtml = @""<!DOCTYPE html>
		|<html>
		|	<head>
		|		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		|		<link rel='stylesheet' href='"" + DeclarativeForms.CSSPath + @""' />
		|
		|		<script type='text/javascript'>
		|            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
		|        </script>
		|
		|		<script type='text/javascript'>
		|function funFromString(func)
		|{
		|    let func2 = Function(func);
		|    func2();
		|}
		|function doEvent(event)
		|{
		|    if (event.type == 'mouseup')
		|    {
		|        let button;
		|        let eventButton = event.button;
		|        if (eventButton == 0)
		|        {
		|            button = 'left';
		|        }
		|        else if (eventButton == 1)
		|        {
		|            button = 'middle';
		|        }
		|        else if (eventButton == 2)
		|        {
		|            button = 'right';
		|        }
		|
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Button=' + button + 
		|        '"" + spacer + @""X=' + event.clientX + 
		|        '"" + spacer + @""Y=' + event.clientY);
		|    }
		|    else if (event.type == 'input')
		|    {
		|        let value = event.target.value;
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Value=' + value);
		|    }
		|    else if (event.type == 'change')
		|    {
		|        let x = mapKeyEl.get(mapElKey.get(event.target));
		|        //alert('nodeName = ' + event.target.nodeName + ' type = ' + event.target.type);
		|        if (event.target.nodeName == 'INPUT')
		|        {
		|            if (event.target.type == 'file')
		|            {
		|                let txt = '';
		|                if (x.files.length > 0)
		|                {
		|                    for (var i = 0; i < x.files.length; i++)
		|                    {
		|                        txt = txt + x.files[i].name + ';';
		|                    }
		|                } 
		|                else
		|                {
		|                    x.value = null;
		|                    txt = 'null';
		|                }
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Files=' + txt);
		|            }
		|            else if (event.target.type == 'checkbox')
		|            {
		|                let _checked = event.target.checked;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Checked=' + _checked);
		|            }
		|            else if (event.target.type == 'color')
		|            {
		|                let value = event.target.value;
		|                let r = parseInt(value[1] + value[2], 16);
		|                let g = parseInt(value[3] + value[4], 16);
		|                let b = parseInt(value[5] + value[6], 16);
		|                let value2 = 'rgb(' + r + ', ' + g + ', ' + b + ')';
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value2);
		|            }
		|            else
		|            {
		|                let value = event.target.value;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value);
		|            }
		|        }
		|        else if (event.target == 'SELECT')
		|        {
		|            let txt = '';
		|            var opt = event.target.options;
		|            if (opt.length > 0)
		|            {
		|                for (var i = 0; i < opt.length; i++)
		|                {
		|                    if (opt[i].selected)
		|                    {
		|                        txt = txt + mapElKey.get(opt[i]) + ';';
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                txt = 'null';
		|            }
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""ListItem=' + txt);
		|        }
		|        else
		|        {
		|            let value = event.target.value;
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""Value=' + value);
		|        }
		|    }
		|    else
		|    {
		|        sendPost(mapElKey.get(event.target) + '"" + spacer + @""' + event.type);
		|    }
		|}
		|function sendPost(str)
		|{
		|    nodeClientSend = getConnSend();
		|    nodeClientSend.write(str);
		|}
		|nw.Window.get().on('resize', function(width, height)
		|{
		|    sendPost('mainForm' + 
		|    '"" + spacer + @""' + 'resize' + 
		|    '"" + spacer + @""WindowWidth=' + width + 
		|    '"" + spacer + @""WindowHeight=' + height);
		|});
		|function startTimer(nameEl, interval) {
		|    window.TimerId = window.setInterval(function(){
		|            sendPost(nameEl + '"" + spacer + @""tick');
		|        }, interval);
		|    mapKeyEl.set(nameEl, window.TimerId);
		|    mapElKey.set(mapKeyEl.get(nameEl), nameEl);
		|}
		|function stopTimer(nameEl) {
		|   window.clearInterval(mapKeyEl.get(nameEl));
		|}
		|		
		|// Начало блока клиентов.
		|function processData(data)
		|{
		|	var input = data;
		|    //alert('input = ' + input);
		|	var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|	for (var i = 0; i < fields.length; i++)
		|	{
		|		var item = fields[i];
		|		if (item != '')
		|		{
		|			try
		|			{
		|				funFromString(item);
		|			}
		|			catch
		|			{
		|				return;
		|			}    
		|		}
		|	}
		|}
		|var net = require('net'); // Импортируем сетевой модуль.
		|function getConnSend() // Создаем TCP-клиент для отправки сообщений.
		|{
		|    var option = {host:'127.0.0.1', port: "" + DeclarativeForms.portReceivingServer + @""}
		|    // Создайте TCP-клиент.
		|    var client = net.createConnection(option, function () {
		|        // alert('Локальный адрес подключения : ' + client.localAddress + ':' + client.localPort);
		|    });
		|    // client.setTimeout(1000); // Отключение по таймауту нам не нужно. Отключение сделает сервер.
		|    client.setEncoding('utf8');
		|    // При получении сообщения сервер отправляет обратно данные.
		|    client.on('data', function (data) {
		|        //alert('Данные возврата сервера : ' + data);
		|		processData(data);
		|    });
		|    client.on('close',function () {
		|         //alert('Сервер закрыл соединение.');
		|    });
		|    client.on('end',function () {
		|         //alert('Окончание передачи.');
		|    });
		|    client.on('timeout', function () {
		|        // alert('Таймаут подключения клиента.');
		|    });
		|    client.on('error', function (err) {
		|         //alert(JSON.stringify(err));
		|    });
		|    return client;
		|}
		|function getConnReceiving() // Создаем TCP-клиент для приема сообщений.
		|{
		|    var option = {host:'127.0.0.1', port: "" + DeclarativeForms.portReceivingServer + @""}
		|    // Создайте TCP-клиент.
		|    var client = net.createConnection(option, function () {
		|        // alert('Локальный адрес подключения : ' + client.localAddress + ':' + client.localPort);
		|    });
		|    // client.setTimeout(1000); // Отключение по таймауту нам не нужно. getConnReceiving должен быть постоянно на связи.
		|    client.setEncoding('utf8');
		|    // При получении сообщения или в произвольном порядке сервер отправляет данные.
		|    client.on('data', function (data) {
		|        //alert('Данные возврата сервера : ' + data);
		|		processData(data);
		|    });
		|    // Если постоянный клиент почему то отключился, мы его снова подключим.
		|    client.on('close',function () {
		|         //alert('Сервер закрыл соединение.');
		|        var nodeClientReceiving = getConnReceiving();
		|		nodeClientReceiving.write('ConstantClient5du4fsjiwixxf');
		|    });
		|    client.on('end',function () {
		|        // alert('Окончание передачи.');
		|    });
		|    client.on('timeout', function () {
		|        // alert('Таймаут подключения клиента.');
		|    });
		|    client.on('error', function (err) {
		|        // alert(JSON.stringify(err));
		|    });
		|    return client;
		|}
		|
		|// Создадим клиенты.
		|// По nodeClientReceiving мы в любом месте сможем послать команду форме из сценария.
		|// Соединение nodeClientReceiving будет постоянным и в случае разрыва произойдет переподключение.
		|// Клиент nodeClientSend создается только во время возникновения события.
		|// При возникновении события nodeClientSend посылает сообщение серверу и после отправки ответа сервер разрывает соединение.
		|var nodeClientSend = getConnSend();
		|var nodeClientReceiving = getConnReceiving();
		|nodeClientReceiving.write('ConstantClient5du4fsjiwixxf');
		|// Конец блока клиентов.
		|
		|var mapKeyEl = new Map();
		|var mapElKey = new Map();
		|var gui = require('nw.gui');
		|document.addEventListener('DOMContentLoaded', function (event) { nodeClientSend.write('mainForm' + '"" + spacer + @""' + 'loaded'); });
		|
		|function firstStart() {
		|    sendPost('formIsLoaded');
		|}
		|
		|        </script>
		|	</head>
		|	<body>
		|
		|    </body>
		|</html>
		|"";
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "IndexhtmlLinBr" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"namespace osdf
		|{
		|    public class IndexhtmlLinBr
		|    {
		|        public static string spacer = DeclarativeForms.paramDelimiter;
		|        public static string Indexhtml = @""<!DOCTYPE html>
		|<html>
		|	<head>
		|		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		|		<link rel='stylesheet' href='"" + DeclarativeForms.CSSPath + @""' />
		|
		|		<script type='text/javascript'>
		|            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
		|        </script>
		|
		|		<script type='text/javascript'>
		|function funFromString(func)
		|{
		|    let func2 = Function(func);
		|    func2();
		|}
		|function doEvent(event)
		|{
		|    if (event.type == 'mouseup')
		|    {
		|        let button;
		|        let eventButton = event.button;
		|        if (eventButton == 0)
		|        {
		|            button = 'left';
		|        }
		|        else if (eventButton == 1)
		|        {
		|            button = 'middle';
		|        }
		|        else if (eventButton == 2)
		|        {
		|            button = 'right';
		|        }
		|
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Button=' + button + 
		|        '"" + spacer + @""X=' + event.clientX + 
		|        '"" + spacer + @""Y=' + event.clientY);
		|    }
		|    else if (event.type == 'input')
		|    {
		|        let value = event.target.value;
		|        sendPost(
		|        mapElKey.get(event.target) + 
		|        '"" + spacer + @""' + event.type + 
		|        '"" + spacer + @""Value=' + value);
		|    }
		|    else if (event.type == 'change')
		|    {
		|        let x = mapKeyEl.get(mapElKey.get(event.target));
		|        //alert('nodeName = ' + event.target.nodeName + ' type = ' + event.target.type);
		|        if (event.target.nodeName == 'INPUT')
		|        {
		|            if (event.target.type == 'file')
		|            {
		|                let txt = '';
		|                if (x.files.length > 0)
		|                {
		|                    for (var i = 0; i < x.files.length; i++)
		|                    {
		|                        txt = txt + x.files[i].name + ';';
		|                    }
		|                } 
		|                else
		|                {
		|                    x.value = null;
		|                    txt = 'null';
		|                }
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Files=' + txt);
		|            }
		|            else if (event.target.type == 'checkbox')
		|            {
		|                let _checked = event.target.checked;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Checked=' + _checked);
		|            }
		|            else if (event.target.type == 'color')
		|            {
		|                let value = event.target.value;
		|                let r = parseInt(value[1] + value[2], 16);
		|                let g = parseInt(value[3] + value[4], 16);
		|                let b = parseInt(value[5] + value[6], 16);
		|                let value2 = 'rgb(' + r + ', ' + g + ', ' + b + ')';
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value2);
		|            }
		|            else
		|            {
		|                let value = event.target.value;
		|                sendPost(
		|                mapElKey.get(event.target) + 
		|                '"" + spacer + @""' + event.type + 
		|                '"" + spacer + @""Value=' + value);
		|            }
		|        }
		|        else if (event.target == 'SELECT')
		|        {
		|            let txt = '';
		|            var opt = event.target.options;
		|            if (opt.length > 0)
		|            {
		|                for (var i = 0; i < opt.length; i++)
		|                {
		|                    if (opt[i].selected)
		|                    {
		|                        txt = txt + mapElKey.get(opt[i]) + ';';
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                txt = 'null';
		|            }
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""ListItem=' + txt);
		|        }
		|        else
		|        {
		|            let value = event.target.value;
		|            sendPost(
		|            mapElKey.get(event.target) + 
		|            '"" + spacer + @""' + event.type + 
		|            '"" + spacer + @""Value=' + value);
		|        }
		|    }
		|    else
		|    {
		|        sendPost(mapElKey.get(event.target) + '"" + spacer + @""' + event.type);
		|    }
		|}
		|function sendPost(str)
		|{
		|    try
		|    {
		|	    sendClient.send(str);
		|    }
		|    catch
		|    {
		|    }
		|}
		|function startTimer(nameEl, interval) {
		|    window.TimerId = window.setInterval(function(){
		|            sendPost(nameEl + '"" + spacer + @""tick');
		|        }, interval);
		|    mapKeyEl.set(nameEl, window.TimerId);
		|    mapElKey.set(mapKeyEl.get(nameEl), nameEl);
		|}
		|function stopTimer(nameEl) {
		|   window.clearInterval(mapKeyEl.get(nameEl));
		|}
		|		
		|var mapKeyEl = new Map();
		|var mapElKey = new Map();
		|//var gui = require('nw.gui');
		|//document.addEventListener('DOMContentLoaded', function (event) { sendPost('mainForm' + '"" + spacer + @""' + 'loaded'); });
		|
		|//nw.Window.get().on('resize', function(width, height)
		|//{
		|//    sendPost('mainForm' +
		|//    '"" + spacer + @""' + 'resize' +
		|//    '"" + spacer + @""WindowWidth=' + width +
		|//    '"" + spacer + @""WindowHeight=' + height);
		|//});
		|
		|//alert('qqqqqqqqqqq');
		|//================================================================
		|const WebSocket = require('ws');
		|const serverSend = new WebSocket.Server({port: "" + DeclarativeForms.portReceivingServer + @""});
		|serverSend.on('connection', onConnect);
		|// обработчик подключения клиента
		|// параметр - подключенный клиент
		|var sendClient;
		|function onConnect(clientSend) {
		|    sendClient = clientSend;
		|    //alert('Connection opened');
		|
		|    //sendClient.send('mainForm' + '"" + spacer + @""' + 'loaded');
		|
		|    // обрабатываем входящие сообщения от клиента
		|    clientSend.on('message', function(message) {
		|        alert('clientSend message:' + message.toString());
		|        var input = message.toString();
		|        var fields = input.split('"" + DeclarativeForms.funDelimiter + @""');
		|        for (var i = 0; i < fields.length; i++)
		|        {
		|            var item = fields[i];
		|            if (item != '')
		|            {
		|                funFromString(item);
		|            }
		|        }
		|        //clientSend.send('Hello clientSend'); // отправка сообщения клиенту
		|        //sendClient.send('mainForm' + '"" + spacer + @""' + 'loaded');
		|    });
		|    // закрытие подключения
		|    clientSend.on('close', function() {
		|        //alert('Connection closed');
		|    });
		|}
		|//================================================================
		|
		|        </script>
		|	</head>
		|	<body>
		|
		|    </body>
		|</html>
		|"";
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "Form" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System;
		|using System.IO;
		|using System.Collections.Generic;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using ScriptEngine.HostedScript.Library;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДфФорма"", ""DfForm"")]
		|    public class DfForm : AutoContext<DfForm>
		|    {
		|        private static string separator = Path.DirectorySeparatorChar.ToString();
		|        private static IRuntimeContextInstance startupScript = DeclarativeForms.GlobalContext().StartupScript();
		|        private static string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|        public static Dictionary<string, object> props = new Dictionary<string, object>();
		|        private static DfBody body = new DfBody();
		|
		|        public DfForm()
		|        {
		|            ItemKey = ""mainForm"";
		|            DeclarativeForms.AddToHashtable(ItemKey, this);
		|        }
		|
		|        private string itemKey;
		|        [ContextProperty(""КлючЭлемента"", ""ItemKey"")]
		|        public string ItemKey
		|        {
		|            get { return itemKey; }
		|            private set { itemKey = value; }
		|        }
		|		
		|        public int windowHeight { get; set; }
		|        [ContextProperty(""ВысотаОкна"", ""WindowHeight"")]
		|        public int WindowHeight
		|        {
		|            get { return windowHeight; }
		|            private set { windowHeight = value; }
		|        }
		|
		|        public int windowWidth { get; set; }
		|        [ContextProperty(""ШиринаОкна"", ""WindowWidth"")]
		|        public int WindowWidth
		|        {
		|            get { return windowWidth; }
		|            private set { windowWidth = value; }
		|        }
		|
		|        private int startWidth;
		|        [ContextProperty(""НачальнаяШирина"", ""StartWidth"")]
		|        public int StartWidth
		|        {
		|            private get { return startWidth; }
		|            set
		|            {
		|                WindowWidth = value;
		|                startWidth = value;
		|                props[""width""] = ""\u0022width\u0022: "" + startWidth.ToString() + "","";
		|            }
		|        }
		|
		|        private int startheight;
		|        [ContextProperty(""НачальнаяВысота"", ""StartHeight"")]
		|        public int StartHeight
		|        {
		|            private get { return startheight; }
		|            set
		|            {
		|                WindowHeight = value;
		|                startheight = value;
		|                props[""height""] = ""\u0022height\u0022: "" + startheight.ToString() + "","";
		|            }
		|        }		
		|
		|        private string title;
		|        [ContextProperty(""Заголовок"", ""Title"")]
		|        public string Title
		|        {
		|            private get { return title; }
		|            set
		|            {
		|                title = value;
		|                props[""title""] = ""\u0022title\u0022: "" + ""\u0022"" + title + ""\u0022,"";
		|            }
		|        }
		|
		|        private string icon;
		|        [ContextProperty(""Значок"", ""Icon"")]
		|        public string Icon
		|        {
		|            private get { return icon; }
		|            set
		|            {
		|                icon = value;
		|                props[""icon""] = ""\u0022icon\u0022: "" + ""\u0022"" + icon + ""\u0022,"";
		|            }
		|        }
		|
		|        private bool resizable;
		|        [ContextProperty(""ИзменяемыйРазмер"", ""Resizable"")]
		|        public bool Resizable
		|        {
		|            private get { return resizable; }
		|            set
		|            {
		|                resizable = value;
		|                props[""resizable""] = ""\u0022resizable\u0022: "" + resizable.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private bool kiosk;
		|        [ContextProperty(""Киоск"", ""Kiosk"")]
		|        public bool Kiosk
		|        {
		|            private get { return kiosk; }
		|            set
		|            {
		|                kiosk = value;
		|                props[""kiosk""] = ""\u0022kiosk\u0022: "" + kiosk.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private int max_height;
		|        [ContextProperty(""МаксимальнаяВысота"", ""MaxHeight"")]
		|        public int MaxHeight
		|        {
		|            private get { return max_height; }
		|            set
		|            {
		|                max_height = value;
		|                props[""max_height""] = ""\u0022max_height\u0022: "" + max_height.ToString() + "","";
		|            }
		|        }
		|
		|        private int max_width;
		|        [ContextProperty(""МаксимальнаяШирина"", ""MaxWidth"")]
		|        public int MaxWidth
		|        {
		|            private get { return max_width; }
		|            set
		|            {
		|                max_width = value;
		|                props[""max_width""] = ""\u0022max_width\u0022: "" + max_width.ToString() + "","";
		|            }
		|        }
		|
		|        private int min_height;
		|        [ContextProperty(""МинимальнаяВысота"", ""MinHeight"")]
		|        public int MinHeight
		|        {
		|            private get { return min_height; }
		|            set
		|            {
		|                min_height = value;
		|                props[""min_height""] = ""\u0022min_height\u0022: "" + min_height.ToString() + "","";
		|            }
		|        }
		|
		|        private int min_width;
		|        [ContextProperty(""МинимальнаяШирина"", ""MinWidth"")]
		|        public int MinWidth
		|        {
		|            private get { return min_width; }
		|            set
		|            {
		|                min_width = value;
		|                props[""min_width""] = ""\u0022min_width\u0022: "" + min_width.ToString() + "","";
		|            }
		|        }
		|
		|        private bool show;
		|        [ContextProperty(""Показать"", ""Show"")]
		|        public bool Show
		|        {
		|            private get { return show; }
		|            set
		|            {
		|                show = value;
		|                props[""show""] = ""\u0022show\u0022: "" + show.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private bool show_in_taskbar;
		|        [ContextProperty(""ПоказатьВПанели"", ""ShowInTaskbar"")]
		|        public bool ShowInTaskbar
		|        {
		|            private get { return show_in_taskbar; }
		|            set
		|            {
		|                show_in_taskbar = value;
		|                props[""show_in_taskbar""] = ""\u0022show_in_taskbar\u0022: "" + show_in_taskbar.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private bool fullscreen;
		|        [ContextProperty(""Полноэкранный"", ""Fullscreen"")]
		|        public bool Fullscreen
		|        {
		|            private get { return fullscreen; }
		|            set
		|            {
		|                fullscreen = value;
		|                props[""fullscreen""] = ""\u0022fullscreen\u0022: "" + fullscreen.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private bool transparent;
		|        [ContextProperty(""Прозрачный"", ""Transparent"")]
		|        public bool Transparent
		|        {
		|            private get { return transparent; }
		|            set
		|            {
		|                transparent = value;
		|                props[""transparent""] = ""\u0022transparent\u0022: "" + transparent.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private bool frame;
		|        [ContextProperty(""Фрейм"", ""Frame"")]
		|        public bool Frame
		|        {
		|            private get { return frame; }
		|            set
		|            {
		|                frame = value;
		|                props[""frame""] = ""\u0022frame\u0022: "" + frame.ToString().ToLower() + "","";
		|            }
		|        }
		|
		|        private string position;
		|        [ContextProperty(""Позиция"", ""Position"")]
		|        public string Position
		|        {
		|            private get { return position; }
		|            set
		|            {
		|                position = value;
		|                props[""position""] = ""\u0022position\u0022: "" + ""\u0022"" + position + ""\u0022,"";
		|            }
		|        }
		|
		|        public DfAction loaded { get; set; }
		|        [ContextProperty(""Загружена"", ""Loaded"")]
		|        public DfAction Loaded
		|        {
		|            get { return loaded; }
		|            set { loaded = value; }
		|        }
		|		
		|        public DfAction resize { get; set; }
		|        [ContextProperty(""РазмерИзменен"", ""Resize"")]
		|        public DfAction Resize
		|        {
		|            get { return resize; }
		|            set { resize = value; }
		|        }		
		|
		|        [ContextMethod(""Открыть"", ""Open"")]
		|        public void Open()
		|        {
		|            DeclarativeForms.strFunctions += ""firstStart();"";
		|            bool isWin = System.Environment.OSVersion.VersionString.Contains(""Microsoft"");
		|            string folderName = @"".\"";
		|            if (!isWin)
		|            {
		|                folderName = @""./"";
		|            }
		|
		|            if (DeclarativeForms.openInBrowser)
		|            {
		|                DeclarativeForms.instance.LoadScripts(folderName);
		|
		|                if (osdf.DeclarativeForms.InitialStrFunctions == null)
		|                {
		|                    osdf.DeclarativeForms.InitialStrFunctions = osdf.DeclarativeForms.strFunctions;
		|                }
		|
		|                // Запустим index.html в браузере по умолчанию.
		|                string target = pathStartupScript + separator + ""index.html"";
		|                System.Diagnostics.Process process = new System.Diagnostics.Process();
		|                DeclarativeForms.process = process;
		|
		|                if (!isWin)
		|                {
		|                    ////process.StartInfo.FileName = ""firefox"";
		|                    ////process.StartInfo.FileName = ""chrome"";
		|                    process.StartInfo.FileName = ""yandex-browser-stable"";
		|                    process.StartInfo.Arguments = target;
		|                }
		|                else
		|                {
		|                    process.StartInfo.FileName = target;
		|                }
		|
		|                process.Start();
		|                process.WaitForExit();
		|                while (!((osdf.DeclarativeForms.TimeClietnConnected - osdf.DeclarativeForms.TimeClietnClosed) < 0))
		|                {
		|                    System.Threading.Thread.Sleep(3000);
		|                }
		|		
		|                Environment.Exit(0);
		|            }
		|            else
		|            {
		|                // Сформируем package.json
		|                string resStr = ""            "";
		|                foreach (KeyValuePair<string, object> entry in props)
		|                {
		|                    resStr = resStr + ""            "" + entry.Value + Environment.NewLine;
		|                }
		|
		|                string str = Packagejson.packagejson;
		|                string strFind = DeclarativeForms.StrFindBetween(str, ""window\u0022: {"", ""}"", false).Get(0).AsString();
		|                resStr = resStr.Trim();
		|                if (resStr.Length > 0)
		|                {
		|                    resStr = resStr.Substring(0, resStr.Length - 1);
		|                }
		|                string strReplace = ""window\u0022: {"" + Environment.NewLine + ""            "" + resStr + Environment.NewLine + ""        }"";
		|                str = str.Replace(strFind, strReplace);
		|                Packagejson.packagejson = str;
		|
		|                if (!DeclarativeForms.scriptsIsLoad)
		|                {
		|                    DeclarativeForms.instance.LoadScripts(folderName);
		|                }
		|
		|                System.Diagnostics.Process process = new System.Diagnostics.Process();
		|                DeclarativeForms.process = process;
		|                process.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
		|
		|                if (!isWin)
		|                {
		|                    process.StartInfo.FileName = DeclarativeForms._nw;
		|                    process.StartInfo.Arguments = pathStartupScript;
		|                    System.Threading.Thread.Sleep(2000);
		|                }
		|                else
		|                {
		|                    process.StartInfo.FileName = ""\u0022"" + DeclarativeForms._nw + ""\u0022"";
		|                    process.StartInfo.Arguments = ""\u0022"" + pathStartupScript + separator;
		|                }
		|
		|                process.Start();
		|                process.WaitForExit();
		|
		|                Environment.Exit(0);
		|            }
		|        }
		|
		|        public DfMenu menu;
		|        [ContextProperty(""Меню"", ""Menu"")]
		|        public DfMenu Menu
		|        {
		|            get { return menu; }
		|            set
		|            {
		|                menu = value;
		|                string strFunc = ""gui.Window.get().menu = mapKeyEl.get(\u0022"" + menu.ItemKey + ""\u0022);"";
		|                DeclarativeForms.SendStrFunc(strFunc);
		|            }
		|        }
		|
		|        [ContextProperty(""Контент"", ""Body"")]
		|        public DfBody Body
		|        {
		|            get { return body; }
		|        }
		|
		|        private ArrayImpl children = new ArrayImpl();
		|        [ContextProperty(""Элементы"", ""Children"")]
		|        public ArrayImpl Children
		|        {
		|            get { return children; }
		|        }
		|
		|        [ContextMethod(""ДобавитьДочерний"", ""AppendChild"")]
		|        public IValue AppendChild(IValue p1)
		|        {
		|            string strFunc = ""document.body.appendChild(mapKeyEl.get(\u0022"" + ((dynamic)p1).ItemKey + ""\u0022));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|            ((dynamic)p1).Parent = this;
		|            return p1;
		|        }
		|		
		|        [ContextMethod(""УдалитьДочерний"", ""RemoveChild"")]
		|        public void RemoveChild(IValue p1)
		|        {
		|            string strFunc = ""document.body.removeChild(mapKeyEl.get(\u0022"" + ((dynamic)p1.AsObject()).ItemKey + ""\u0022));"";
		|            DeclarativeForms.SendStrFunc(strFunc);
		|		
		|            try
		|            {
		|                IValue val1 = Children.Find(p1);
		|                Children.Remove(Convert.ToInt32(val1.AsNumber()));
		|            }
		|            catch { }
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "ArrayList" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System.Collections;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|
		|namespace osdf
		|{
		|    public class ArrayListEx : System.Collections.ArrayList
		|    {
		|        public osdf.ArrayList M_Object;
		|    }
		|
		|    public class ArrayList : IEnumerable, IEnumerator
		|    {
		|        public DfArrayList dll_obj;
		|        public System.Collections.IEnumerator Enumerator;
		|        public ArrayListEx M_ArrayList;
		|
		|        public ArrayList()
		|        {
		|            M_ArrayList = new ArrayListEx();
		|            M_ArrayList.M_Object = this;
		|        }
		|
		|        public ArrayList(osdf.ArrayList p1)
		|        {
		|            M_ArrayList = p1.M_ArrayList;
		|            M_ArrayList.M_Object = this;
		|        }
		|
		|        public ArrayList(System.Collections.ArrayList p1)
		|        {
		|            M_ArrayList = (ArrayListEx)p1;
		|            M_ArrayList.M_Object = this;
		|        }
		|
		|        public object Current
		|        {
		|            get { return Enumerator.Current; }
		|        }
		|
		|        public virtual int Count
		|        {
		|            get { return M_ArrayList.Count; }
		|        }
		|
		|        public void Reset()
		|        {
		|            Enumerator.Reset();
		|        }
		|
		|        public object this[int index]
		|        {
		|            get { return M_ArrayList[index]; }
		|            set { M_ArrayList[index] = value; }
		|        }
		|
		|        public object Add(object value)
		|        {
		|            M_ArrayList.Add(value);
		|            return value;
		|        }
		|
		|        public void Clear()
		|        {
		|            M_ArrayList.Clear();
		|        }
		|
		|        public bool Contains(object obj)
		|        {
		|            return M_ArrayList.Contains(obj);
		|        }
		|
		|        public System.Collections.IEnumerator GetEnumerator()
		|        {
		|            Enumerator = M_ArrayList.GetEnumerator();
		|            return (System.Collections.IEnumerator)this;
		|        }
		|
		|        public int IndexOf(object value)
		|        {
		|            return M_ArrayList.IndexOf(value);
		|        }
		|
		|        public object Insert(int index, object value)
		|        {
		|            M_ArrayList.Insert(index, value);
		|            return value;
		|        }
		|
		|        public bool MoveNext()
		|        {
		|            return Enumerator.MoveNext();
		|        }
		|
		|        public void Remove(object obj)
		|        {
		|            M_ArrayList.Remove(obj);
		|        }
		|
		|        public void Reverse()
		|        {
		|            M_ArrayList.Reverse();
		|        }
		|
		|        public void Sort(int p1, int p2)
		|        {
		|            System.Collections.IComparer myComparer = new ArrayListItemSorter(p1, p2);
		|            M_ArrayList.Sort(myComparer);
		|        }
		|
		|        public virtual void RemoveAt(int index)
		|        {
		|            M_ArrayList.RemoveAt(index);
		|        }
		|    }
		|
		|    public class ArrayListItemSorter : System.Collections.IComparer
		|    {
		|        private int sortOrder;
		|        private int sortType;
		|        private dynamic x2;
		|        private dynamic y2;
		|
		|        public ArrayListItemSorter(int p1, int p2)
		|        {
		|            sortType = p1;
		|            sortOrder = p2;
		|        }
		|
		|        public int Compare(object x, object y)
		|        {
		|            x2 = DeclarativeForms.DefineTypeIValue(x);
		|            y2 = DeclarativeForms.DefineTypeIValue(y);
		|            int num = 0;
		|            if (sortType == 3)//Boolean
		|            {
		|                if ((x2.GetType() != typeof(System.Boolean)) && (y2.GetType() != typeof(System.Boolean)))
		|                {
		|                    num = 0;
		|                }
		|                else if ((x2.GetType() != typeof(System.Boolean)) && (y2.GetType() == typeof(System.Boolean)))
		|                {
		|                    num = 1;
		|                }
		|                else if ((x2.GetType() == typeof(System.Boolean)) && (y2.GetType() != typeof(System.Boolean)))
		|                {
		|                    num = -1;
		|                }
		|                else
		|                {
		|                    num = ((System.Boolean)x2).CompareTo((System.Boolean)y2);
		|                    if (sortOrder == 0)
		|                    {
		|                        num = 0;
		|                    }
		|                    else if (sortOrder == 1)
		|                    {
		|                        
		|                    }
		|                    else if (sortOrder == 2)
		|                    {
		|                        num = -num;
		|                    }
		|                }
		|            }
		|            if (sortType == 2)//DateTime
		|            {
		|                if ((x2.GetType() != typeof(System.DateTime)) && (y2.GetType() != typeof(System.DateTime)))
		|                {
		|                    num = 0;
		|                }
		|                else if ((x2.GetType() != typeof(System.DateTime)) && (y2.GetType() == typeof(System.DateTime)))
		|                {
		|                    num = 1;
		|                }
		|                else if ((x2.GetType() == typeof(System.DateTime)) && (y2.GetType() != typeof(System.DateTime)))
		|                {
		|                    num = -1;
		|                }
		|                else
		|                {
		|                    num = ((System.DateTime)x2).CompareTo((System.DateTime)y2);
		|                    if (sortOrder == 0)
		|                    {
		|                        num = 0;
		|                    }
		|                    else if (sortOrder == 1)
		|                    {
		|
		|                    }
		|                    else if (sortOrder == 2)
		|                    {
		|                        num = -num;
		|                    }
		|                }
		|            }
		|            else if (sortType == 1)//Number
		|            {
		|                if ((x2.GetType() != typeof(System.Decimal)) && (y2.GetType() != typeof(System.Decimal)))
		|                {
		|                    num = 0;
		|                }
		|                else if ((x2.GetType() != typeof(System.Decimal)) && (y2.GetType() == typeof(System.Decimal)))
		|                {
		|                    num = 1;
		|                }
		|                else if ((x2.GetType() == typeof(System.Decimal)) && (y2.GetType() != typeof(System.Decimal)))
		|                {
		|                    num = -1;
		|                }
		|                else
		|                {
		|                    num = ((System.Decimal)x2).CompareTo((System.Decimal)y2);
		|                    if (sortOrder == 0)
		|                    {
		|                        num = 0;
		|                    }
		|                    else if (sortOrder == 1)
		|                    {
		|
		|                    }
		|                    else if (sortOrder == 2)
		|                    {
		|                        num = -num;
		|                    }
		|                }
		|            }
		|            else if (sortType == 0)// text
		|            {
		|                if ((x2.GetType() != typeof(System.String)) && (y2.GetType() != typeof(System.String)))
		|                {
		|                    num = 0;
		|                }
		|                else if ((x2.GetType() != typeof(System.String)) && (y2.GetType() == typeof(System.String)))
		|                {
		|                    num = 1;
		|                }
		|                else if ((x2.GetType() == typeof(System.String)) && (y2.GetType() != typeof(System.String)))
		|                {
		|                    num = -1;
		|                }
		|                else
		|                {
		|                    num = ((System.String)x2).CompareTo((System.String)y2);
		|                    if (sortOrder == 0)
		|                    {
		|                        num = 0;
		|                    }
		|                    else if (sortOrder == 1)
		|                    {
		|
		|                    }
		|                    else if (sortOrder == 2)
		|                    {
		|                        num = -num;
		|                    }
		|                }
		|            }
		|            return num;
		|        }
		|    }
		|
		|    public class DfArrayList : AutoContext<DfArrayList>
		|    {
		|        public DfArrayList()
		|        {
		|            ArrayList ArrayList1 = new ArrayList();
		|            ArrayList1.dll_obj = this;
		|            Base_obj = ArrayList1;
		|        }
		|		
		|        public DfArrayList(ArrayList p1)
		|        {
		|            ArrayList ArrayList1 = p1;
		|            ArrayList1.dll_obj = this;
		|            Base_obj = ArrayList1;
		|        }
		|        
		|        public ArrayList Base_obj;
		|        
		|        public int Count
		|        {
		|            get { return Base_obj.Count; }
		|        }
		|        
		|        public IValue Insert(int p1, IValue p2)
		|        {
		|            return (IValue)Base_obj.Insert(p1, p2);
		|        }
		|        
		|        public IValue Add(IValue p1 = null)
		|        {
		|            return (IValue)Base_obj.Add(p1);
		|        }
		|        
		|        public int IndexOf(IValue p1)
		|        {
		|            return Base_obj.IndexOf(p1);
		|        }
		|
		|        public void Reverse()
		|        {
		|            Base_obj.Reverse();
		|        }
		|					
		|        public void Clear()
		|        {
		|            Base_obj.Clear();
		|        }
		|					
		|        public bool Contains(IValue p1)
		|        {
		|            return Base_obj.Contains(p1);
		|        }
		|
		|        public void Sort(int p1 = 0, int p2 = 1)
		|        {
		|            Base_obj.Sort(p1, p2);
		|        }
		|
		|        public void Remove(IValue p1)
		|        {
		|            Base_obj.Remove(p1);
		|        }
		|
		|        public void RemoveAt(int p1)
		|        {
		|            Base_obj.RemoveAt(p1);
		|        }
		|
		|        public void Set(int p1, IValue p2)
		|        {
		|            Base_obj[p1] = p2;
		|        }
		|
		|        public IValue Get(int p1)
		|        {
		|            return (IValue)Base_obj[p1];
		|        }
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	ИначеЕсли ИмяФайлаДФ = "DeclarativeForms" Тогда
		СтрВыгрузки = СтрВыгрузки + 
		"using System;
		|using System.IO;
		|using System.Collections;
		|using System.Collections.Generic;
		|using System.Linq;
		|using ScriptEngine.Machine.Contexts;
		|using ScriptEngine.Machine;
		|using System.Reflection;
		|using ScriptEngine.HostedScript.Library;
		|using System.Collections.Concurrent;
		|
		|namespace osdf
		|{
		|    [ContextClass(""ДекларативныеФормы"", ""DeclarativeForms"")]
		|    public class DeclarativeForms : AutoContext<DeclarativeForms>
		|    {
		|        public static string funDelimiter = ""d1ziwjr520tq"";
		|        public static string paramDelimiter = ""|"";
		|        private static string separator = Path.DirectorySeparatorChar.ToString();
		|        private static StructureImpl shareStructure = new StructureImpl();
		|        public DfEventArgs eventArgs;
		|        public static DeclarativeForms instance;
		|        private static object syncRoot = new Object();
		|        public static string _oscriptPath = """";
		|        public static string _nw = """";
		|        public static string strFunctions = """";
		|
		|        public static string InitialStrFunctions { get; set; } = null; // Запомним интерфейс формы при запуске.
		|        public static long TimeClietnClosed { get; set; } // Время отключения клиента.
		|        public static long TimeClietnConnected { get; set; } // Время подключения клиента.
		|
		|        public static Hashtable hashtable = new Hashtable();
		|        private static DfForm form = new DfForm();
		|        public static System.Diagnostics.Process process;
		|        public static System.Random Random = new Random();
		|        public static bool scriptsIsLoad = false;
		|
		|        public static bool isWin = System.Environment.OSVersion.VersionString.Contains(""Microsoft"");
		|
		|        public static DeclarativeForms getInstance()
		|        {
		|            if (instance == null)
		|            {
		|                lock (syncRoot)
		|                {
		|                    if (instance == null)
		|                    {
		|                        instance = new DeclarativeForms();
		|                    }
		|                }
		|            }
		|            return instance;
		|        }
		|
		|        [ScriptConstructor]
		|        public static IRuntimeContextInstance Constructor()
		|        {
		|            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
		|            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Source"")).AsString();
		|            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|            if (isWin)
		|            {
		|                _nw = pathStartupScript + separator + ""nwjs"" + separator + ""nw.exe"";
		|            }
		|            else
		|            {
		|                _nw = pathStartupScript + separator + ""nwjslin"" + separator + ""nw"";
		|            }
		|            _oscriptPath = pathStartupScript + separator + ""oscript"" + separator + ""bin"" + separator + ""oscript.exe"";
		|
		|            DeclarativeForms inst = getInstance();
		|            inst.InjectGlobalProperty(shareStructure, ""ОбщаяСтруктура"", false);
		|            shareStructure.Insert(""ДФ"", inst);
		|            return inst;
		|        }
		|
		|        public static SystemGlobalContext GlobalContext()
		|        {
		|            return GlobalsManager.GetGlobalContext<SystemGlobalContext>();
		|        }
		|		
		|        public static void SendStrFunc(string strFunc)
		|        {
		|            strFunctions = strFunctions + strFunc + funDelimiter;
		|        }
		|
		|        public static bool displayStartupWarning = false;
		|        [ContextProperty(""ВыводитьПредупреждениеПриЗапуске"", ""DisplayStartupWarning"")]
		|        public bool DisplayStartupWarning
		|        {
		|            get { return displayStartupWarning; }
		|            set { displayStartupWarning = value; }
		|        }
		|
		|        public static bool openInBrowser = false;
		|        [ContextProperty(""ОткрытьВБраузере"", ""OpenInBrowser"")]
		|        public bool OpenInBrowser
		|        {
		|            get { return openInBrowser; }
		|            set
		|            {
		|                if (isWin)
		|                {
		|                    openInBrowser = value;
		|                }
		|            }
		|        }
		|		
		|        public static string CSSPath = ""styles.css"";
		|        private string _cssPath;
		|        [ContextProperty(""cssПуть"", ""cssPath"")]
		|        public string cssPath
		|        {
		|            get { return _cssPath; }
		|            set
		|            {
		|                _cssPath = value;
		|                CSSPath = _cssPath;
		|            }
		|        }
		|		
		|        [ContextMethod(""Лоток"", ""Tray"")]
		|        public DfTray Tray()
		|        {
		|            if (!openInBrowser)
		|            {
		|                return new DfTray();
		|            }
		|            else
		|            {
		|                GlobalContext().Echo(""Элемент Лоток недоступен при открытии программы в браузере."");
		|                return null;
		|            }
		|        }		
		|		
		|        [ContextMethod(""Таймер"", ""Timer"")]
		|        public DfTimer Timer()
		|        {
		|            return new DfTimer();
		|        }		
		|		
		|        [ContextMethod(""Фон"", ""Background"")]
		|        public DfBackground Background(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null)
		|        {
		|            return new DfBackground(p1, p2, p3, p4, p5, p6, p7, p8);
		|        }
		|
		|        [ContextMethod(""Скрипт"", ""Script"")]
		|        public DfScript Script()
		|        {
		|            return new DfScript();
		|        }
		|		
		|        [ContextMethod(""Математика"", ""Math"")]
		|        public DfMath Math()
		|        {
		|            return new DfMath();
		|        }
		|
		|        private static DfTextBaseline df_TextBaseline = new DfTextBaseline();
		|        [ContextProperty(""БазоваяЛинияТекста"", ""TextBaseline"")]
		|        public DfTextBaseline TextBaseline
		|        {
		|            get { return df_TextBaseline; }
		|        }
		|
		|        private static DfFontVariant df_FontVariant = new DfFontVariant();
		|        [ContextProperty(""ВариантШрифта"", ""FontVariant"")]
		|        public DfFontVariant FontVariant
		|        {
		|            get { return df_FontVariant; }
		|        }
		|
		|        private static DfVerticalAlign df_VerticalAlign = new DfVerticalAlign();
		|        [ContextProperty(""ВертикальноеВыравнивание"", ""VerticalAlign"")]
		|        public DfVerticalAlign VerticalAlign
		|        {
		|            get { return df_VerticalAlign; }
		|        }
		|
		|        private static DfVisibility df_Visibility = new DfVisibility();
		|        [ContextProperty(""Видимость"", ""Visibility"")]
		|        public DfVisibility Visibility
		|        {
		|            get { return df_Visibility; }
		|        }
		|
		|        private static DfObjectFit df_ObjectFit = new DfObjectFit();
		|        [ContextProperty(""ВписываниеОбъекта"", ""ObjectFit"")]
		|        public DfObjectFit ObjectFit
		|        {
		|            get { return df_ObjectFit; }
		|        }
		|
		|        private static DfUserSelect df_UserSelect = new DfUserSelect();
		|        [ContextProperty(""ВыделениеПользователем"", ""UserSelect"")]
		|        public DfUserSelect UserSelect
		|        {
		|            get { return df_UserSelect; }
		|        }
		|
		|        private static DfAlignSelf df_AlignSelf = new DfAlignSelf();
		|        [ContextProperty(""ВыравниваниеОтдельных"", ""AlignSelf"")]
		|        public DfAlignSelf AlignSelf
		|        {
		|            get { return df_AlignSelf; }
		|        }
		|
		|        private static DfAlignContent df_AlignContent = new DfAlignContent();
		|        [ContextProperty(""ВыравниваниеСодержимого"", ""AlignContent"")]
		|        public DfAlignContent AlignContent
		|        {
		|            get { return df_AlignContent; }
		|        }
		|
		|        private static DfTextAlign df_TextAlign = new DfTextAlign();
		|        [ContextProperty(""ВыравниваниеТекста"", ""TextAlign"")]
		|        public DfTextAlign TextAlign
		|        {
		|            get { return df_TextAlign; }
		|        }
		|
		|        private static DfAlignItems df_AlignItems = new DfAlignItems();
		|        [ContextProperty(""ВыравниваниеЭлементов"", ""AlignItems"")]
		|        public DfAlignItems AlignItems
		|        {
		|            get { return df_AlignItems; }
		|        }
		|
		|        private static DfCssFloat df_CssFloat = new DfCssFloat();
		|        [ContextProperty(""ГоризонтальноеВыравнивание"", ""CssFloat"")]
		|        public DfCssFloat CssFloat
		|        {
		|            get { return df_CssFloat; }
		|        }
		|
		|        private static DfHorizontalTextAlign df_HorizontalTextAlign = new DfHorizontalTextAlign();
		|        [ContextProperty(""ГоризонтальноеВыравниваниеТекста"", ""HorizontalTextAlign"")]
		|        public DfHorizontalTextAlign HorizontalTextAlign
		|        {
		|            get { return df_HorizontalTextAlign; }
		|        }
		|
		|        private static DfBorderCollapse df_BorderCollapse = new DfBorderCollapse();
		|        [ContextProperty(""ГраницаСвернута"", ""BorderCollapse"")]
		|        public DfBorderCollapse BorderCollapse
		|        {
		|            get { return df_BorderCollapse; }
		|        }
		|
		|        private static DfFontWeight df_FontWeight = new DfFontWeight();
		|        [ContextProperty(""ЖирностьШрифта"", ""FontWeight"")]
		|        public DfFontWeight FontWeight
		|        {
		|            get { return df_FontWeight; }
		|        }
		|
		|        private static DfAnimationFillMode df_AnimationFillMode = new DfAnimationFillMode();
		|        [ContextProperty(""ЗаливкаАнимации"", ""AnimationFillMode"")]
		|        public DfAnimationFillMode AnimationFillMode
		|        {
		|            get { return df_AnimationFillMode; }
		|        }
		|
		|        private static DfColumnFill df_ColumnFill = new DfColumnFill();
		|        [ContextProperty(""ЗаполнениеКолонок"", ""ColumnFill"")]
		|        public DfColumnFill ColumnFill
		|        {
		|            get { return df_ColumnFill; }
		|        }
		|
		|        private static DfResize df_Resize = new DfResize();
		|        [ContextProperty(""ИзменяемыйРазмер"", ""Resize"")]
		|        public DfResize Resize
		|        {
		|            get { return df_Resize; }
		|        }
		|
		|        private static DfBoxSizing df_BoxSizing = new DfBoxSizing();
		|        [ContextProperty(""Калибровка"", ""BoxSizing"")]
		|        public DfBoxSizing BoxSizing
		|        {
		|            get { return df_BoxSizing; }
		|        }
		|
		|        private static DfMouseButtons df_MouseButtons = new DfMouseButtons();
		|        [ContextProperty(""КнопкиМыши"", ""MouseButtons"")]
		|        public DfMouseButtons MouseButtons
		|        {
		|            get { return df_MouseButtons; }
		|        }
		|
		|        private static DfGlobalCompositeOperation df_GlobalCompositeOperation = new DfGlobalCompositeOperation();
		|        [ContextProperty(""Композиция"", ""GlobalCompositeOperation"")]
		|        public DfGlobalCompositeOperation GlobalCompositeOperation
		|        {
		|            get { return df_GlobalCompositeOperation; }
		|        }
		|
		|        private static DfCursor df_Cursor = new DfCursor();
		|        [ContextProperty(""Курсор"", ""Cursor"")]
		|        public DfCursor Cursor
		|        {
		|            get { return df_Cursor; }
		|        }
		|
		|        private static DfBackgroundRepeat df_BackgroundRepeat = new DfBackgroundRepeat();
		|        [ContextProperty(""МозаикаКартинки"", ""BackgroundRepeat"")]
		|        public DfBackgroundRepeat BackgroundRepeat
		|        {
		|            get { return df_BackgroundRepeat; }
		|        }
		|
		|        private static DfBorderImageRepeat df_BorderImageRepeat = new DfBorderImageRepeat();
		|        [ContextProperty(""МозаикаКартинкиГраницы"", ""BorderImageRepeat"")]
		|        public DfBorderImageRepeat BorderImageRepeat
		|        {
		|            get { return df_BorderImageRepeat; }
		|        }
		|
		|        private static DfTarget df_Target = new DfTarget();
		|        [ContextProperty(""Назначение"", ""Target"")]
		|        public DfTarget Target
		|        {
		|            get { return df_Target; }
		|        }
		|		
		|        private static DfDir df_Dir = new DfDir();
		|        [ContextProperty(""Направление"", ""Dir"")]
		|        public DfDir Dir
		|        {
		|            get { return df_Dir; }
		|        }
		|
		|        private static DfAnimationDirection df_AnimationDirection = new DfAnimationDirection();
		|        [ContextProperty(""НаправлениеАнимации"", ""AnimationDirection"")]
		|        public DfAnimationDirection AnimationDirection
		|        {
		|            get { return df_AnimationDirection; }
		|        }
		|
		|        private static DfFlexDirection df_FlexDirection = new DfFlexDirection();
		|        [ContextProperty(""НаправлениеЭлементов"", ""FlexDirection"")]
		|        public DfFlexDirection FlexDirection
		|        {
		|            get { return df_FlexDirection; }
		|        }
		|
		|        private static DfClear df_Clear = new DfClear();
		|        [ContextProperty(""Несвободно"", ""Clear"")]
		|        public DfClear Clear
		|        {
		|            get { return df_Clear; }
		|        }
		|
		|        private static DfBackgroundOrigin df_BackgroundOrigin = new DfBackgroundOrigin();
		|        [ContextProperty(""ОбластьКартинки"", ""BackgroundOrigin"")]
		|        public DfBackgroundOrigin BackgroundOrigin
		|        {
		|            get { return df_BackgroundOrigin; }
		|        }
		|
		|        private static DfBackgroundClip df_BackgroundClip = new DfBackgroundClip();
		|        [ContextProperty(""ОбластьРисования"", ""BackgroundClip"")]
		|        public DfBackgroundClip BackgroundClip
		|        {
		|            get { return df_BackgroundClip; }
		|        }
		|
		|        private static DfDisplay df_Display = new DfDisplay();
		|        [ContextProperty(""Отображать"", ""Display"")]
		|        public DfDisplay Display
		|        {
		|            get { return df_Display; }
		|        }
		|
		|        private static DfTextDecorationLine df_TextDecorationLine = new DfTextDecorationLine();
		|        [ContextProperty(""ОформлениеТекстаЛиния"", ""TextDecorationLine"")]
		|        public DfTextDecorationLine TextDecorationLine
		|        {
		|            get { return df_TextDecorationLine; }
		|        }
		|
		|        private static DfTextDecorationStyle df_TextDecorationStyle = new DfTextDecorationStyle();
		|        [ContextProperty(""ОформлениеТекстаСтиль"", ""TextDecorationStyle"")]
		|        public DfTextDecorationStyle TextDecorationStyle
		|        {
		|            get { return df_TextDecorationStyle; }
		|        }
		|
		|        private static DfAnimationPlayState df_AnimationPlayState = new DfAnimationPlayState();
		|        [ContextProperty(""Состояние"", ""AnimationPlayState"")]
		|        public DfAnimationPlayState AnimationPlayState
		|        {
		|            get { return df_AnimationPlayState; }
		|        }
		|
		|        private static DfFlexWrap df_FlexWrap = new DfFlexWrap();
		|        [ContextProperty(""ПереносГибких"", ""FlexWrap"")]
		|        public DfFlexWrap FlexWrap
		|        {
		|            get { return df_FlexWrap; }
		|        }
		|
		|        private static DfWordWrap df_WordWrap = new DfWordWrap();
		|        [ContextProperty(""ПереносСлов"", ""WordWrap"")]
		|        public DfWordWrap WordWrap
		|        {
		|            get { return df_WordWrap; }
		|        }
		|
		|        private static DfTextWrap df_TextWrap = new DfTextWrap();
		|        [ContextProperty(""ПереносТекста"", ""TextWrap"")]
		|        public DfTextWrap TextWrap
		|        {
		|            get { return df_TextWrap; }
		|        }
		|
		|        private static DfOverflow df_Overflow = new DfOverflow();
		|        [ContextProperty(""Переполнение"", ""Overflow"")]
		|        public DfOverflow Overflow
		|        {
		|            get { return df_Overflow; }
		|        }
		|
		|        private static DfTextOverflow df_TextOverflow = new DfTextOverflow();
		|        [ContextProperty(""ПереполнениеТекста"", ""TextOverflow"")]
		|        public DfTextOverflow TextOverflow
		|        {
		|            get { return df_TextOverflow; }
		|        }
		|
		|        private static DfPatternRepeat df_PatternRepeat = new DfPatternRepeat();
		|        [ContextProperty(""ПовторШаблона"", ""PatternRepeat"")]
		|        public DfPatternRepeat PatternRepeat
		|        {
		|            get { return df_PatternRepeat; }
		|        }
		|
		|        private static DfPosition df_Position = new DfPosition();
		|        [ContextProperty(""Позиция"", ""Position"")]
		|        public DfPosition Position
		|        {
		|            get { return df_Position; }
		|        }
		|
		|        private static DfListStylePosition df_ListStylePosition = new DfListStylePosition();
		|        [ContextProperty(""ПозицияСтиляСписка"", ""ListStylePosition"")]
		|        public DfListStylePosition ListStylePosition
		|        {
		|            get { return df_ListStylePosition; }
		|        }
		|
		|        private static DfFormPosition df_FormPosition = new DfFormPosition();
		|        [ContextProperty(""ПозицияФормы"", ""FormPosition"")]
		|        public DfFormPosition FormPosition
		|        {
		|            get { return df_FormPosition; }
		|        }
		|
		|        private static DfCaptionSide df_CaptionSide = new DfCaptionSide();
		|        [ContextProperty(""ПоложениеЗаголовка"", ""CaptionSide"")]
		|        public DfCaptionSide CaptionSide
		|        {
		|            get { return df_CaptionSide; }
		|        }
		|
		|        private static DfBackgroundPosition df_BackgroundPosition = new DfBackgroundPosition();
		|        [ContextProperty(""ПоложениеКартинки"", ""BackgroundPosition"")]
		|        public DfBackgroundPosition BackgroundPosition
		|        {
		|            get { return df_BackgroundPosition; }
		|        }
		|
		|        private static DfWhiteSpace df_WhiteSpace = new DfWhiteSpace();
		|        [ContextProperty(""Пробелы"", ""WhiteSpace"")]
		|        public DfWhiteSpace WhiteSpace
		|        {
		|            get { return df_WhiteSpace; }
		|        }
		|
		|        private static DfTextTransform df_TextTransform = new DfTextTransform();
		|        [ContextProperty(""ПрописныеТекста"", ""TextTransform"")]
		|        public DfTextTransform TextTransform
		|        {
		|            get { return df_TextTransform; }
		|        }
		|
		|        private static DfEmptyCells df_EmptyCells = new DfEmptyCells();
		|        [ContextProperty(""ПустыеЯчейки"", ""EmptyCells"")]
		|        public DfEmptyCells EmptyCells
		|        {
		|            get { return df_EmptyCells; }
		|        }
		|
		|        private static DfBackgroundSize df_BackgroundSize = new DfBackgroundSize();
		|        [ContextProperty(""РазмерКартинки"", ""BackgroundSize"")]
		|        public DfBackgroundSize BackgroundSize
		|        {
		|            get { return df_BackgroundSize; }
		|        }
		|
		|        private static DfTableLayout df_TableLayout = new DfTableLayout();
		|        [ContextProperty(""РазмещениеВТаблице"", ""TableLayout"")]
		|        public DfTableLayout TableLayout
		|        {
		|            get { return df_TableLayout; }
		|        }
		|
		|        private static DfJustifyContent df_JustifyContent = new DfJustifyContent();
		|        [ContextProperty(""РасположениеСодержимого"", ""JustifyContent"")]
		|        public DfJustifyContent JustifyContent
		|        {
		|            get { return df_JustifyContent; }
		|        }
		|
		|        private static DfTransitionProperty df_TransitionProperty = new DfTransitionProperty();
		|        [ContextProperty(""СвойствоПерехода"", ""TransitionProperty"")]
		|        public DfTransitionProperty TransitionProperty
		|        {
		|            get { return df_TransitionProperty; }
		|        }
		|		
		|        private static DfBorderStyle df_BorderStyle = new DfBorderStyle();
		|        [ContextProperty(""СтильГраницы"", ""BorderStyle"")]
		|        public DfBorderStyle BorderStyle
		|        {
		|            get { return df_BorderStyle; }
		|        }
		|
		|        private static DfOutlineStyle df_OutlineStyle = new DfOutlineStyle();
		|        [ContextProperty(""СтильКонтура"", ""OutlineStyle"")]
		|        public DfOutlineStyle OutlineStyle
		|        {
		|            get { return df_OutlineStyle; }
		|        }
		|
		|        private static DfLineCap df_LineCap = new DfLineCap();
		|        [ContextProperty(""СтильКонцовЛинии"", ""LineCap"")]
		|        public DfLineCap LineCap
		|        {
		|            get { return df_LineCap; }
		|        }
		|
		|        private static DfColumnRuleStyle df_ColumnRuleStyle = new DfColumnRuleStyle();
		|        [ContextProperty(""СтильРазделителяКолонок"", ""ColumnRuleStyle"")]
		|        public DfColumnRuleStyle ColumnRuleStyle
		|        {
		|            get { return df_ColumnRuleStyle; }
		|        }
		|
		|        private static DfTransformStyle df_TransformStyle = new DfTransformStyle();
		|        [ContextProperty(""СтильСдвига"", ""TransformStyle"")]
		|        public DfTransformStyle TransformStyle
		|        {
		|            get { return df_TransformStyle; }
		|        }
		|
		|        private static DfLineJoin df_LineJoin = new DfLineJoin();
		|        [ContextProperty(""СтильУглаПересечения"", ""LineJoin"")]
		|        public DfLineJoin LineJoin
		|        {
		|            get { return df_LineJoin; }
		|        }
		|
		|        private static DfFontStyle df_FontStyle = new DfFontStyle();
		|        [ContextProperty(""СтильШрифта"", ""FontStyle"")]
		|        public DfFontStyle FontStyle
		|        {
		|            get { return df_FontStyle; }
		|        }
		|
		|        private static DfRules df_Rules = new DfRules();
		|        [ContextProperty(""Разлиновка"", ""Rules"")]
		|        public DfRules Rules
		|        {
		|            get { return df_Rules; }
		|        }
		|
		|        private static DfSelectedFileType df_SelectedFileType = new DfSelectedFileType();
		|        [ContextProperty(""ТипВыбранногоФайла"", ""SelectedFileType"")]
		|        public DfSelectedFileType SelectedFileType
		|        {
		|            get { return df_SelectedFileType; }
		|        }
		|
		|        private static DfMarkerType df_MarkerType = new DfMarkerType();
		|        [ContextProperty(""ТипМаркера"", ""MarkerType"")]
		|        public DfMarkerType MarkerType
		|        {
		|            get { return df_MarkerType; }
		|        }
		|
		|        private static DfMenuType df_MenuType = new DfMenuType();
		|        [ContextProperty(""ТипМеню"", ""MenuType"")]
		|        public DfMenuType MenuType
		|        {
		|            get { return df_MenuType; }
		|        }
		|
		|        private static DfDisplayType df_DisplayType = new DfDisplayType();
		|        [ContextProperty(""ТипОтображения"", ""DisplayType"")]
		|        public DfDisplayType DisplayType
		|        {
		|            get { return df_DisplayType; }
		|        }
		|
		|        private static DfListStyleType df_ListStyleType = new DfListStyleType();
		|        [ContextProperty(""ТипСтиляСписка"", ""ListStyleType"")]
		|        public DfListStyleType ListStyleType
		|        {
		|            get { return df_ListStyleType; }
		|        }
		|
		|        private static DfMenuItemType df_MenuItemType = new DfMenuItemType();
		|        [ContextProperty(""ТипЭлементаМеню"", ""MenuItemType"")]
		|        public DfMenuItemType MenuItemType
		|        {
		|            get { return df_MenuItemType; }
		|        }
		|
		|        private static DfBackgroundAttachment df_BackgroundAttachment = new DfBackgroundAttachment();
		|        [ContextProperty(""ФоновоеВложение"", ""BackgroundAttachment"")]
		|        public DfBackgroundAttachment BackgroundAttachment
		|        {
		|            get { return df_BackgroundAttachment; }
		|        }
		|
		|        private static DfTransitionTimingFunction df_TransitionTimingFunction = new DfTransitionTimingFunction();
		|        [ContextProperty(""ФункцияПерехода"", ""TransitionTimingFunction"")]
		|        public DfTransitionTimingFunction TransitionTimingFunction
		|        {
		|            get { return df_TransitionTimingFunction; }
		|        }
		|
		|        private static DfAnimationTimingFunction df_AnimationTimingFunction = new DfAnimationTimingFunction();
		|        [ContextProperty(""ФункцияСинхронизации"", ""AnimationTimingFunction"")]
		|        public DfAnimationTimingFunction AnimationTimingFunction
		|        {
		|            get { return df_AnimationTimingFunction; }
		|        }
		|
		|        private static DfColor df_Color = new DfColor();
		|        [ContextProperty(""Цвет"", ""Color"")]
		|        public DfColor Color
		|        {
		|            get { return df_Color; }
		|        }
		|
		|        private static DfBorderWidth df_BorderWidth = new DfBorderWidth();
		|        [ContextProperty(""ШиринаГраницы"", ""BorderWidth"")]
		|        public DfBorderWidth BorderWidth
		|        {
		|            get { return df_BorderWidth; }
		|        }
		|
		|        [ContextMethod(""Артикль"", ""Article"")]
		|        public DfArticle Article()
		|        {
		|            return new DfArticle();
		|        }
		|
		|        [ContextMethod(""Абзац"", ""Paragraph"")]
		|        public DfParagraph Paragraph()
		|        {
		|            return new DfParagraph();
		|        }
		|
		|        [ContextProperty(""АргументыСобытия"", ""EventArgs"")]
		|        public IValue EventArgs
		|        {
		|            get { return eventArgs; }
		|        }
		|
		|        [ContextMethod(""Аудио"", ""Audio"")]
		|        public DfAudio Audio()
		|        {
		|            return new DfAudio();
		|        }
		|
		|        [ContextMethod(""Блок"", ""Div"")]
		|        public DfDiv Div()
		|        {
		|            return new DfDiv();
		|        }
		|
		|        [ContextMethod(""ВыборВремени"", ""TimeSelection"")]
		|        public DfTimeSelection TimeSelection()
		|        {
		|            return new DfTimeSelection();
		|        }
		|
		|        [ContextMethod(""ВыборДаты"", ""DateSelection"")]
		|        public DfDateSelection DateSelection()
		|        {
		|            return new DfDateSelection();
		|        }
		|
		|        [ContextMethod(""ВыборДатыВремени"", ""DateTimeSelection"")]
		|        public DfDateTimeSelection DateTimeSelection()
		|        {
		|            return new DfDateTimeSelection();
		|        }
		|
		|        [ContextMethod(""ВыборМестнойДатыВремени"", ""DateTimeLocalSelection"")]
		|        public DfDateTimeLocalSelection DateTimeLocalSelection()
		|        {
		|            return new DfDateTimeLocalSelection();
		|        }
		|
		|        [ContextMethod(""ВыборМесяца"", ""MonthSelection"")]
		|        public DfMonthSelection MonthSelection()
		|        {
		|            return new DfMonthSelection();
		|        }
		|
		|        [ContextMethod(""ВыборНедели"", ""WeekSelection"")]
		|        public DfWeekSelection WeekSelection()
		|        {
		|            return new DfWeekSelection();
		|        }
		|
		|        [ContextMethod(""ВыборФайла"", ""FileSelection"")]
		|        public DfFileSelection FileSelection()
		|        {
		|            return new DfFileSelection();
		|        }
		|
		|        [ContextMethod(""ВыборЦвета"", ""ColorSelection"")]
		|        public DfColorSelection ColorSelection()
		|        {
		|            return new DfColorSelection();
		|        }
		|
		|        [ContextMethod(""Группа"", ""Group"")]
		|        public DfGroup Group()
		|        {
		|            return new DfGroup();
		|        }
		|
		|        [ContextMethod(""ГруппаКолонок"", ""Colgroup"")]
		|        public DfColgroup Colgroup()
		|        {
		|            return new DfColgroup();
		|        }
		|
		|        [ContextMethod(""ГруппировкаПоляСписка"", ""SelectGroup"")]
		|        public DfSelectGroup SelectGroup()
		|        {
		|            return new DfSelectGroup();
		|        }
		|
		|        [ContextMethod(""Действие"", ""Action"")]
		|        public DfAction Action(IRuntimeContextInstance script, string methodName, IValue param = null)
		|        {
		|            return new DfAction(script, methodName, param);
		|        }
		|
		|        [ContextMethod(""Диалог"", ""Dialog"")]
		|        public DfDialog Dialog()
		|        {
		|            return new DfDialog();
		|        }
		|
		|        [ContextMethod(""ДополнительныйБлок"", ""AdditionalDiv"")]
		|        public DfAdditionalDiv AdditionalDiv()
		|        {
		|            return new DfAdditionalDiv();
		|        }
		|
		|        [ContextMethod(""ЖирныйТекст"", ""BoldText"")]
		|        public DfBoldText BoldText()
		|        {
		|            return new DfBoldText();
		|        }
		|
		|        [ContextMethod(""Заголовок"", ""Caption"")]
		|        public DfCaption Caption()
		|        {
		|            return new DfCaption();
		|        }
		|
		|        [ContextMethod(""Заголовок1"", ""H1"")]
		|        public DfH1 H1()
		|        {
		|            return new DfH1();
		|        }
		|
		|        [ContextMethod(""Заголовок2"", ""H2"")]
		|        public DfH2 H2()
		|        {
		|            return new DfH2();
		|        }
		|
		|        [ContextMethod(""Заголовок3"", ""H3"")]
		|        public DfH3 H3()
		|        {
		|            return new DfH3();
		|        }
		|
		|        [ContextMethod(""Заголовок4"", ""H4"")]
		|        public DfH4 H4()
		|        {
		|            return new DfH4();
		|        }
		|
		|        [ContextMethod(""Заголовок5"", ""H5"")]
		|        public DfH5 H5()
		|        {
		|            return new DfH5();
		|        }
		|
		|        [ContextMethod(""Заголовок6"", ""H6"")]
		|        public DfH6 H6()
		|        {
		|            return new DfH6();
		|        }
		|
		|        [ContextMethod(""ЗаголовокГруппы"", ""GroupTitle"")]
		|        public DfGroupTitle GroupTitle()
		|        {
		|            return new DfGroupTitle();
		|        }
		|
		|        [ContextMethod(""ЯчейкаЗаголовка"", ""HeaderCell"")]
		|        public DfHeaderCell HeaderCell()
		|        {
		|            return new DfHeaderCell();
		|        }
		|
		|        [ContextMethod(""ЗаголовокРаскрываемогоБлока"", ""ExpandableDivHeader"")]
		|        public DfExpandableDivHeader ExpandableDivHeader()
		|        {
		|            return new DfExpandableDivHeader();
		|        }
		|
		|        [ContextMethod(""Изображение"", ""Image"")]
		|        public DfImage Image()
		|        {
		|            return new DfImage();
		|        }
		|
		|        [ContextMethod(""Индикатор"", ""Progress"")]
		|        public DfProgress Progress()
		|        {
		|            return new DfProgress();
		|        }
		|
		|        [ContextMethod(""Итоги"", ""Outcome"")]
		|        public DfOutcome Outcome()
		|        {
		|            return new DfOutcome();
		|        }
		|
		|        [ContextMethod(""Карта"", ""Map"")]
		|        public DfMap Map()
		|        {
		|            return new DfMap();
		|        }
		|
		|        [ContextMethod(""Кнопка"", ""Button"")]
		|        public DfButton Button()
		|        {
		|            return new DfButton();
		|        }
		|
		|        [ContextMethod(""Код"", ""Code"")]
		|        public DfCode Code()
		|        {
		|            return new DfCode();
		|        }
		|
		|        [ContextMethod(""Колонка"", ""Column"")]
		|        public DfColumn Column()
		|        {
		|            return new DfColumn();
		|        }
		|
		|        [ContextMethod(""Колонтитул"", ""Header"")]
		|        public DfHeader Header()
		|        {
		|            return new DfHeader();
		|        }
		|
		|        [ContextMethod(""КурсивТекст"", ""ItalicsText"")]
		|        public DfItalicsText ItalicsText()
		|        {
		|            return new DfItalicsText();
		|        }
		|
		|        [ContextMethod(""Линия"", ""Line"")]
		|        public DfLine Line()
		|        {
		|            return new DfLine();
		|        }
		|
		|        [ContextMethod(""МаркированныйТекст"", ""MarkedText"")]
		|        public DfMarkedText MarkedText()
		|        {
		|            return new DfMarkedText();
		|        }
		|
		|        [ContextMethod(""МедиаГруппа"", ""MediaGroup"")]
		|        public DfMediaGroup MediaGroup()
		|        {
		|            return new DfMediaGroup();
		|        }
		|
		|        [ContextMethod(""МелкийТекст"", ""SmallText"")]
		|        public DfSmallText SmallText()
		|        {
		|            return new DfSmallText();
		|        }
		|
		|        [ContextMethod(""Меню"", ""Menu"")]
		|        public DfMenu Menu(string type)
		|        {
		|            return new DfMenu(type);
		|        }
		|
		|        [ContextMethod(""НадстрочныйТекст"", ""SupText"")]
		|        public DfSupText SupText()
		|        {
		|            return new DfSupText();
		|        }
		|
		|        [ContextMethod(""НаправленныйТекст"", ""DirectedText"")]
		|        public DfDirectedText DirectedText()
		|        {
		|            return new DfDirectedText();
		|        }
		|
		|        [ContextMethod(""НеупорядоченныйСписок"", ""UnorderedList"")]
		|        public DfUnorderedList UnorderedList()
		|        {
		|            return new DfUnorderedList();
		|        }
		|
		|        [ContextMethod(""НижнийКолонтитул"", ""Footer"")]
		|        public DfFooter Footer()
		|        {
		|            return new DfFooter();
		|        }
		|
		|        [ContextMethod(""Область"", ""Area"")]
		|        public DfArea Area()
		|        {
		|            return new DfArea();
		|        }
		|
		|        [ContextMethod(""ОбластьТаблицы"", ""TableBody"")]
		|        public DfTableBody TableBody()
		|        {
		|            return new DfTableBody();
		|        }
		|
		|        [ContextMethod(""ОбластьТекста"", ""TextArea"")]
		|        public DfTextArea TextArea()
		|        {
		|            return new DfTextArea();
		|        }
		|
		|        [ContextMethod(""ОписаниеМедиа"", ""CaptionMedia"")]
		|        public DfCaptionMedia CaptionMedia()
		|        {
		|            return new DfCaptionMedia();
		|        }
		|
		|        [ContextMethod(""Определение"", ""Definition"")]
		|        public DfDefinition Definition()
		|        {
		|            return new DfDefinition();
		|        }
		|
		|        [ContextMethod(""Переключатель"", ""Radio"")]
		|        public DfRadio Radio()
		|        {
		|            return new DfRadio();
		|        }
		|
		|        [ContextMethod(""Перенос"", ""Transfer"")]
		|        public DfTransfer Transfer()
		|        {
		|            return new DfTransfer();
		|        }
		|
		|        [ContextMethod(""Подпись"", ""Label"")]
		|        public DfLabel Label()
		|        {
		|            return new DfLabel();
		|        }
		|
		|        [ContextMethod(""ПодстрочныйТекст"", ""SubText"")]
		|        public DfSubText SubText()
		|        {
		|            return new DfSubText();
		|        }
		|
		|        [ContextMethod(""ПодчеркнутыйТекст"", ""UnderlineText"")]
		|        public DfUnderlineText UnderlineText()
		|        {
		|            return new DfUnderlineText();
		|        }
		|
		|        [ContextMethod(""ПолеПароля"", ""PasswordField"")]
		|        public DfPasswordField PasswordField()
		|        {
		|            return new DfPasswordField();
		|        }
		|
		|        [ContextMethod(""ПолеПоиска"", ""SearchField"")]
		|        public DfSearchField SearchField()
		|        {
		|            return new DfSearchField();
		|        }
		|
		|        [ContextMethod(""ПолеСписка"", ""Select"")]
		|        public DfSelect Select()
		|        {
		|            return new DfSelect();
		|        }
		|
		|        [ContextMethod(""ПолеТекста"", ""TextField"")]
		|        public DfTextField TextField()
		|        {
		|            return new DfTextField();
		|        }
		|
		|        [ContextMethod(""ПолеЧисла"", ""NumberField"")]
		|        public DfNumberField NumberField()
		|        {
		|            return new DfNumberField();
		|        }
		|
		|        [ContextMethod(""Ползунок"", ""Range"")]
		|        public DfRange Range()
		|        {
		|            return new DfRange();
		|        }
		|
		|        [ContextMethod(""РаскрываемыйБлок"", ""ExpandableDiv"")]
		|        public DfExpandableDiv ExpandableDiv()
		|        {
		|            return new DfExpandableDiv();
		|        }
		|
		|        [ContextMethod(""Результат"", ""Output"")]
		|        public DfOutput Output()
		|        {
		|            return new DfOutput();
		|        }
		|
		|        [ContextMethod(""СписокОпределений"", ""ListDefinition"")]
		|        public DfListDefinition ListDefinition()
		|        {
		|            return new DfListDefinition();
		|        }
		|
		|        [ContextMethod(""Ссылка"", ""Link"")]
		|        public DfLink Link()
		|        {
		|            return new DfLink();
		|        }
		|
		|        [ContextMethod(""СтрокаТаблицы"", ""TableRow"")]
		|        public DfTableRow TableRow()
		|        {
		|            return new DfTableRow();
		|        }
		|
		|        [ContextMethod(""Таблица"", ""Table"")]
		|        public DfTable Table()
		|        {
		|            return new DfTable();
		|        }
		|
		|        [ContextMethod(""Термин"", ""Term"")]
		|        public DfTerm Term()
		|        {
		|            return new DfTerm();
		|        }
		|
		|        [ContextMethod(""УдаленыйТекст"", ""DeletedText"")]
		|        public DfDeletedText DeletedText()
		|        {
		|            return new DfDeletedText();
		|        }
		|
		|        [ContextMethod(""УпорядоченныйСписок"", ""OrderedList"")]
		|        public DfOrderedList OrderedList()
		|        {
		|            return new DfOrderedList();
		|        }
		|
		|        [ContextMethod(""Флажок"", ""CheckBox"")]
		|        public DfCheckBox CheckBox()
		|        {
		|            return new DfCheckBox();
		|        }
		|
		|        [ContextProperty(""Форма"", ""Form"")]
		|        public DfForm Form
		|        {
		|            get { return form; }
		|        }
		|
		|        [ContextMethod(""ФорматированныйТекст"", ""PreformattedText"")]
		|        public DfPreformattedText PreformattedText()
		|        {
		|            return new DfPreformattedText();
		|        }
		|
		|        [ContextMethod(""Фрейм"", ""Frame"")]
		|        public DfFrame Frame()
		|        {
		|            return new DfFrame();
		|        }
		|
		|        [ContextMethod(""Холст"", ""Canvas"")]
		|        public DfCanvas Canvas()
		|        {
		|            return new DfCanvas();
		|        }
		|
		|        [ContextMethod(""ШапкаТаблицы"", ""TableHeader"")]
		|        public DfTableHeader TableHeader()
		|        {
		|            return new DfTableHeader();
		|        }
		|
		|        [ContextMethod(""Шкала"", ""Meter"")]
		|        public DfMeter Meter()
		|        {
		|            return new DfMeter();
		|        }
		|		
		|        [ContextMethod(""СвойстваАнимации"", ""AnimationOptions"")]
		|        public DfAnimationProperties AnimationProperties(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null)
		|        {
		|            return new DfAnimationProperties(p1, p2, p3, p4, p5, p6, p7, p8);
		|        }
		|		
		|        [ContextMethod(""ПараметрыАнимации"", ""AnimationOptions"")]
		|        public DfAnimationOptions AnimationOptions(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null)
		|        {
		|            return new DfAnimationOptions(p1, p2, p3, p4, p5, p6, p7);
		|        }
		|
		|        [ContextMethod(""Кадры"", ""Frames"")]
		|        public DfFrames Frames()
		|        {
		|            return new DfFrames();
		|        }
		|
		|        [ContextMethod(""БезьеКуб"", ""CubicBezier"")]
		|        public DfCubicBezier CubicBezier(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfCubicBezier(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""Границы"", ""Borders"")]
		|        public DfBorders Borders(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfBorders(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""ВерхняяГраница"", ""BorderTop"")]
		|        public DfBorderTop BorderTop(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfBorderTop(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Заполнение"", ""Padding"")]
		|        public DfPadding Padding(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfPadding(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""КартинкаГраницы"", ""BorderImage"")]
		|        public DfBorderImage BorderImage(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null)
		|        {
		|            return new DfBorderImage(p1, p2, p3, p4, p5);
		|        }
		|
		|        [ContextMethod(""КолонкиЭлемента"", ""Columns"")]
		|        public DfColumns Columns(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfColumns(p1, p2);
		|        }
		|
		|        [ContextMethod(""Контур"", ""Outline"")]
		|        public DfOutline Outline(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfOutline(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""ЛеваяГраница"", ""BorderLeft"")]
		|        public DfBorderLeft BorderLeft(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfBorderLeft(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Масштаб"", ""Scale"")]
		|        public DfScale Scale(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfScale(p1, p2);
		|        }
		|
		|        [ContextMethod(""Масштаб3Д"", ""Scale3D"")]
		|        public DfScale3D Scale3D(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfScale3D(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""МасштабЗет"", ""ScaleZ"")]
		|        public DfScaleZ ScaleZ(IValue p1 = null)
		|        {
		|            return new DfScaleZ(p1);
		|        }
		|
		|        [ContextMethod(""МасштабИгрек"", ""ScaleY"")]
		|        public DfScaleY ScaleY(IValue p1 = null)
		|        {
		|            return new DfScaleY(p1);
		|        }
		|
		|        [ContextMethod(""МасштабИкс"", ""ScaleX"")]
		|        public DfScaleX ScaleX(IValue p1 = null)
		|        {
		|            return new DfScaleX(p1);
		|        }
		|
		|        [ContextMethod(""Матрица"", ""Matrix"")]
		|        public DfMatrix Matrix(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null)
		|        {
		|            return new DfMatrix(p1, p2, p3, p4, p5, p6);
		|        }
		|
		|        [ContextMethod(""Матрица3Д"", ""Matrix3D"")]
		|        public DfMatrix3D Matrix3D(ArrayImpl p1 = null)
		|        {
		|            if (p1 != null)
		|            {
		|                return new DfMatrix3D(p1);
		|            }
		|            return new DfMatrix3D();
		|        }
		|
		|        [ContextMethod(""Наклон"", ""Skew"")]
		|        public DfSkew Skew(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfSkew(p1, p2);
		|        }
		|
		|        [ContextMethod(""НаклонИгрек"", ""SkewY"")]
		|        public DfSkewY SkewY(IValue p1 = null)
		|        {
		|            return new DfSkewY(p1);
		|        }
		|
		|        [ContextMethod(""НаклонИкс"", ""SkewX"")]
		|        public DfSkewX SkewX(IValue p1 = null)
		|        {
		|            return new DfSkewX(p1);
		|        }
		|
		|        [ContextMethod(""НижняяГраница"", ""BorderBottom"")]
		|        public DfBorderBottom BorderBottom(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfBorderBottom(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Отступ"", ""Margin"")]
		|        public DfMargin Margin(int p1 = 0, int p2 = 0, int p3 = 0, int p4 = 0, bool p5 = false)
		|        {
		|            return new DfMargin(p1, p2, p3, p4, p5);
		|        }
		|
		|        [ContextMethod(""Перевод"", ""Translate"")]
		|        public DfTranslate Translate(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfTranslate(p1, p2);
		|        }
		|
		|        [ContextMethod(""Перевод3Д"", ""Translate3D"")]
		|        public DfTranslate3D Translate3D(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfTranslate3D(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""ПереводЗет"", ""TranslateZ"")]
		|        public DfTranslateZ TranslateZ(IValue p1 = null)
		|        {
		|            return new DfTranslateZ(p1);
		|        }
		|
		|        [ContextMethod(""ПереводИгрек"", ""TranslateY"")]
		|        public DfTranslateY TranslateY(IValue p1 = null)
		|        {
		|            return new DfTranslateY(p1);
		|        }
		|
		|        [ContextMethod(""ПереводИкс"", ""TranslateX"")]
		|        public DfTranslateX TranslateX(IValue p1 = null)
		|        {
		|            return new DfTranslateX(p1);
		|        }
		|
		|        [ContextMethod(""Переход"", ""Transition"")]
		|        public DfTransition Transition(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfTransition(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""Перспектива"", ""Perspective"")]
		|        public DfPerspective Perspective(IValue p1 = null)
		|        {
		|            return new DfPerspective(p1);
		|        }
		|
		|        [ContextMethod(""Поворот"", ""Rotate"")]
		|        public DfRotate Rotate(IValue p1 = null)
		|        {
		|            return new DfRotate(p1);
		|        }
		|
		|        [ContextMethod(""Поворот3Д"", ""Rotate3D"")]
		|        public DfRotate3D Rotate3D(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfRotate3D(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""ПоворотЗет"", ""RotateZ"")]
		|        public DfRotateZ RotateZ(IValue p1 = null)
		|        {
		|            return new DfRotateZ(p1);
		|        }
		|
		|        [ContextMethod(""ПоворотИгрек"", ""RotateY"")]
		|        public DfRotateY RotateY(IValue p1 = null)
		|        {
		|            return new DfRotateY(p1);
		|        }
		|
		|        [ContextMethod(""ПоворотИкс"", ""RotateX"")]
		|        public DfRotateX RotateX(IValue p1 = null)
		|        {
		|            return new DfRotateX(p1);
		|        }
		|
		|        [ContextMethod(""ПраваяГраница"", ""BorderRight"")]
		|        public DfBorderRight BorderRight(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfBorderRight(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Прямоугольник"", ""Rectangle"")]
		|        public DfRectangle Rectangle(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfRectangle(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""Круг"", ""Circle"")]
		|        public DfCircle Circle(int p1 = 0, int p2 = 0, int p3 = 0)
		|        {
		|            return new DfCircle(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Полигон"", ""Polygon"")]
		|        public DfPolygon Polygon(ArrayImpl p1 = null)
		|        {
		|            return new DfPolygon(p1);
		|        }
		|
		|        [ContextMethod(""РадиусГраницы"", ""BorderRadius"")]
		|        public DfBorderRadius BorderRadius(int p1 = 0, int p2 = 0, int p3 = 0, int p4 = 0)
		|        {
		|            return new DfBorderRadius(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""РазделительКолонок"", ""ColumnRule"")]
		|        public DfColumnRule ColumnRule(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfColumnRule(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Размер"", ""Size"")]
		|        public DfSize Size(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfSize(p1, p2);
		|        }
		|
		|        [ContextMethod(""ТочкаСдвига"", ""TransformOrigin"")]
		|        public DfTransformOrigin TransformOrigin(int p1 = 0, int p2 = 0, int p3 = 0)
		|        {
		|            return new DfTransformOrigin(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Стиль"", ""Style"")]
		|        public DfStyle Style()
		|        {
		|            return new DfStyle();
		|        }
		|
		|        [ContextMethod(""СтильГраниц"", ""BordersStyle"")]
		|        public DfBordersStyle BordersStyle(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfBordersStyle(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""СтильСписка"", ""ListStyle"")]
		|        public DfListStyle ListStyle(IValue p1 = null, IValue p2 = null, IValue p3 = null)
		|        {
		|            return new DfListStyle(p1, p2, p3);
		|        }
		|
		|        [ContextMethod(""Тень"", ""BoxShadow"")]
		|        public DfBoxShadow BoxShadow(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, bool p6 = false)
		|        {
		|            return new DfBoxShadow(p1, p2, p3, p4, p5, p6);
		|        }
		|
		|        [ContextMethod(""ИсточникПерспективы"", ""PerspectiveOrigin"")]
		|        public DfPerspectiveOrigin PerspectiveOrigin(IValue p1 = null, IValue p2 = null)
		|        {
		|            return new DfPerspectiveOrigin(p1, p2);
		|        }
		|
		|        [ContextMethod(""Точка"", ""Point"")]
		|        public DfPoint Point(int p1 = 0, int p2 = 0)
		|        {
		|            return new DfPoint(p1, p2);
		|        }
		|
		|        [ContextMethod(""ФильтрИзображений"", ""ImagesFilter"")]
		|        public DfImagesFilter ImagesFilter(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null, IValue p9 = null, IValue p10 = null)
		|        {
		|            return new DfImagesFilter(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10);
		|        }
		|
		|        [ContextMethod(""ЦветГраниц"", ""BordersColor"")]
		|        public DfBordersColor BordersColor(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfBordersColor(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""ШиринаГраниц"", ""BordersWidth"")]
		|        public DfBordersWidth BordersWidth(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
		|        {
		|            return new DfBordersWidth(p1, p2, p3, p4);
		|        }
		|
		|        [ContextMethod(""Шрифт"", ""Font"")]
		|        public DfFont Font(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null)
		|        {
		|            return new DfFont(p1, p2, p3, p4, p5, p6);
		|        }
		|		
		|        [ContextMethod(""ЭлементМеню"", ""MenuItem"")]
		|        public DfMenuItem MenuItem(string label = ""меню"", string type = ""normal"", DfMenu menu = null, string key = null, string modifiers = null)
		|        {
		|            if (menu != null)
		|            {
		|                if (key != null)
		|                {
		|                    if (modifiers != null)
		|                    {
		|                        return new DfMenuItem(label, type, menu, key, modifiers);
		|                    }
		|                    else
		|                    {
		|                        return new DfMenuItem(label, type, menu, key);
		|                    }
		|                }
		|                else
		|                {
		|                    return new DfMenuItem(label, type, menu);
		|                }
		|            }
		|            else
		|            {
		|                if (key != null)
		|                {
		|                    if (modifiers != null)
		|                    {
		|                        return new DfMenuItem(label, type, key, modifiers);
		|                    }
		|                    else
		|                    {
		|                        return new DfMenuItem(label, type, key);
		|                    }
		|                }
		|                else
		|                {
		|                    return new DfMenuItem(label, type);
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""ЭлементПоляСписка"", ""SelectItem"")]
		|        public DfSelectItem SelectItem()
		|        {
		|            return new DfSelectItem();
		|        }
		|
		|        [ContextMethod(""ЭлементСписка"", ""ListItem"")]
		|        public DfListItem ListItem()
		|        {
		|            return new DfListItem();
		|        }
		|
		|        [ContextMethod(""Ячейка"", ""Cell"")]
		|        public DfCell Cell()
		|        {
		|            return new DfCell();
		|        }
		|
		|        [ContextMethod(""ЗавершитьРаботу"", ""Exit"")]
		|        public void Exit()
		|        {
		|            if (!OpenInBrowser)
		|            {
		|                Send(""gui.App.quit();"");
		|            }
		|            else
		|            {
		|                Send(""window.close();"");
		|            }
		|        }
		|
		|        [ContextMethod(""Цвет"", ""Color"")]
		|        public IValue Color2(IValue p1 = null, int p2 = 0, int p3 = 0)
		|        {
		|            if (p1 != null)
		|            {
		|                if (p1.SystemType.Name == ""Строка"")
		|                {
		|                    DfColor DfColor1 = new DfColor();
		|                    int NumberProp1 = DfColor1.FindProperty(p1.AsString());
		|                    string obj1 = DfColor1.GetPropValue(NumberProp1).AsString();
		|                    return ValueFactory.Create(obj1);
		|                }
		|                if (p1.SystemType.Name == ""Число"")
		|                {
		|                    string res = ""rgb("" + Convert.ToString(p1.AsNumber()) + "", "" + Convert.ToString(p2) + "", "" + Convert.ToString(p3) + "")"";
		|                    return ValueFactory.Create(res);
		|                }
		|            }
		|            return new DfColor();
		|        }
		|
		|        [ContextProperty(""СтрокаФункций"", ""FunctionString"")]
		|        public string FunctionString
		|        {
		|            get { return strFunctions; }
		|            set { strFunctions = value; }
		|        }
		|
		|        [ContextProperty(""oscriptПуть"", ""oscriptPath"")]
		|        public string oscriptPath
		|        {
		|            get { return _oscriptPath; }
		|            set { _oscriptPath = value; }
		|        }
		|
		|        [ContextProperty(""nwПуть"", ""nwPath"")]
		|        public string nwPath
		|        {
		|            get { return _nw; }
		|            set { _nw = value; }
		|        }
		|
		|        public static int portReceivingServer = 3333;
		|        [ContextProperty(""ПортСервераПриема"", ""PortReceivingServer"")]
		|        public int PortReceivingServer
		|        {
		|            get { return portReceivingServer; }
		|            set { portReceivingServer = value; }
		|        }
		|
		|        public static int portSendServer = 3339;
		|        [ContextProperty(""ПортСервераОтправки"", ""PortSendServer"")]
		|        public int PortSendServer
		|        {
		|            get { return portSendServer; }
		|            set { portSendServer = value; }
		|        }
		|
		|        [ContextProperty(""ОбщаяСтруктура"", ""ShareStructure"")]
		|        public StructureImpl ShareStructure
		|        {
		|            get { return shareStructure; }
		|        }
		|
		|        [ContextMethod(""ВвестиГлобальноеСвойство"", ""InjectGlobalProperty"")]
		|        public void InjectGlobalProperty(IValue obj, string name, bool onlyRead)
		|        {
		|            GlobalContext().EngineInstance.Environment.InjectGlobalProperty(obj, name, onlyRead);
		|        }
		|
		|        public static bool webserverReceivingUploaded = false;
		|        public static void LoadWsserverReceiving()
		|        {
		|            StructureImpl extContext = new StructureImpl();
		|            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
		|            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Source"")).AsString();
		|            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, """").Replace("".os"", """").Replace(separator, """");
		|            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
		|            extContext.Insert(""ОбщаяСтруктура"", shareStructure);
		|
		|            string backgroundTasksServerReceiving = @""
		|Процедура ЗапускКлиента(параметр1) Экспорт
		|	Контекст = Новый Структура(""""ДФ"""", параметр1);
		|	Стр = """"
		|	|Перем ВСПДФ;
		|	|Перем ПервоеСообщение;
		|	|
		|	|Процедура ВСПДФ_ПриПолученииСообщения() Экспорт
		|	|	Сообщение = ВСПДФ.АргументыСобытия.Сообщение;
		|	|	ДФ.ОбработатьСообщение(Сообщение);
		|	|	Если ПервоеСообщение Тогда
		|	|	    ПервоеСообщение = Ложь;
		|	|	Иначе
		|	|	    Попытка
		|	|		    ВСПДФ.ОтправитьТекст(ДФ.СтрокаФункций);
		|	|	    Исключение
		|	|	    КонецПопытки;
		|	|	    ДФ.СтрокаФункций = """""""""""""""";
		|	|	КонецЕсли;
		|	|КонецПроцедуры
		|	|   
		|	|ВСПДФ = Новый ВебСерверПолученияДекларФорм();
		|	|ВСПДФ.ПриПолученииСообщения = ВСПДФ.Действие(ЭтотОбъект, """"""""ВСПДФ_ПриПолученииСообщения"""""""");
		|	|ВСПДФ.Начать(""""""""127.0.0.1"""""""", ДФ.ПортСервераПриема);
		|	|
		|	|ПервоеСообщение = Истина;
		|	|
		|	|Пока ВСПДФ.Продолжать Цикл
		|	|   ВСПДФ.ПолучитьСобытие().Выполнить();
		|	|КонецЦикла;
		|	|"""";
		|	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
		|КонецПроцедуры
		|
		|МассивПараметров = Новый Массив(1);
		|МассивПараметров[0] = ОбщаяСтруктура.ДФ;
		|Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, """"ЗапускКлиента"""", МассивПараметров);
		|"";
		|            GlobalContext().LoadScriptFromString(backgroundTasksServerReceiving, extContext);
		|            while (!webserverReceivingUploaded)
		|            {
		|                System.Threading.Thread.Sleep(300);
		|            }		
		|        }
		|
		|        public static bool webserverSendUploaded = false;
		|        public static void LoadWsserverSend()
		|        {
		|            StructureImpl extContext = new StructureImpl();
		|            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
		|            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Source"")).AsString();
		|            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, """").Replace("".os"", """").Replace(separator, """");
		|            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
		|            extContext.Insert(""ОбщаяСтруктура"", shareStructure);
		|
		|            string backgroundTasksServerSend = @""
		|Процедура ЗапускКлиента(параметр1) Экспорт
		|	Контекст = Новый Структура(""""ДФ"""", параметр1);
		|	Стр = """"
		|	|Перем ВСОДФ;
		|	|Перем ПервоеСообщение;
		|	|
		|	|Процедура ВСОДФ_ПриПолученииСообщения() Экспорт
		|	|	Сообщение = ВСОДФ.АргументыСобытия.Сообщение;
		|	|	ДФ.ОбработатьСообщение(Сообщение);
		|	|	Если ПервоеСообщение Тогда
		|	|	    Попытка
		|	|		    ВСОДФ.ОтправитьТекст(ДФ.СтрокаФункций);
		|	|	    Исключение
		|	|	    КонецПопытки;
		|	|	    ДФ.СтрокаФункций = """""""""""""""";
		|	|	    ПервоеСообщение = Ложь;
		|	|	КонецЕсли;
		|	|КонецПроцедуры
		|	|   
		|	|ВСОДФ = Новый ВебСерверОтправкиДекларФорм();
		|	|ВСОДФ.ПриПолученииСообщения = ВСОДФ.Действие(ЭтотОбъект, """"""""ВСОДФ_ПриПолученииСообщения"""""""");
		|	|ВСОДФ.Начать(""""""""127.0.0.1"""""""", ДФ.ПортСервераОтправки);
		|	|
		|	|ПервоеСообщение = Истина;
		|	|
		|	|Пока ВСОДФ.Продолжать Цикл
		|	|   ВСОДФ.ПолучитьСобытие().Выполнить();
		|	|КонецЦикла;
		|	|"""";
		|	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
		|КонецПроцедуры
		|
		|МассивПараметров = Новый Массив(1);
		|МассивПараметров[0] = ОбщаяСтруктура.ДФ;
		|Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, """"ЗапускКлиента"""", МассивПараметров);
		|"";
		|            GlobalContext().LoadScriptFromString(backgroundTasksServerSend, extContext);
		|            while (!webserverSendUploaded)
		|            {
		|                System.Threading.Thread.Sleep(300);
		|            }
		|        }
		|
		|        public static bool clientServerUploaded = false;
		|        public void LoadClientServer()
		|        {
		|            StructureImpl extContext = new StructureImpl();
		|            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
		|            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Source"")).AsString();
		|            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, """").Replace("".os"", """").Replace(separator, """");
		|            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
		|            extContext.Insert(""ОбщаяСтруктура"", shareStructure);
		|
		|            string backgroundClientServer = @""
		|Процедура ЗапускКлиента(параметр1) Экспорт
		|	Контекст = Новый Структура(""""ДФ"""", параметр1);
		|	Стр = """"
		|	|Перем КСДФ;
		|	|Перем Клиент;
		|	|Перем ИдентификаторКлиента;
		|	|
		|	|Процедура Сервер_ПриПодключенииКлиента() Экспорт
		|	|	СерверКлиент = КСДФ.СерверКлиентАрг().Клиент;
		|	|	ИдентификаторКлиента = СерверКлиент.ИдентификаторКлиента;
		|	|	//Сообщить(""""""""Клиент подключен. Идентификатор клиента = """""""" + СерверКлиент.ИдентификаторКлиента + """""""" """""""" + ТекущаяДата());
		|	|КонецПроцедуры
		|	|
		|	|Процедура Сервер_ПриОтключенииКлиента() Экспорт
		|	|	СерверКлиент = КСДФ.СерверКлиентАрг().Клиент;
		|	|	//Сообщить(""""""""Клиент отключен. Идентификатор клиента = """""""" + СерверКлиент.ИдентификаторКлиента + """""""" """""""" + ТекущаяДата());
		|	|КонецПроцедуры
		|	|
		|	|Процедура Сервер_ПриПолученииСообщения() Экспорт
		|	|	Сообщение = КСДФ.АргументыСобытия.Сообщение;
		|	|	Отправитель = КСДФ.АргументыСобытия.Отправитель;
		|	|	ДФ.ОбработатьСообщение(Сообщение.Текст);
		|	|	
		|	|	//Сообщить(""""""""Сообщение.Текст = """""""" + Сообщение.Текст);
		|	|	Если Сообщение.Текст = """"""""ConstantClient5du4fsjiwixxf"""""""" Тогда
		|	|		Клиент = КСДФ.АргументыСобытия.Отправитель;
		|	|		ДФ.ОбщаяСтруктура.Вставить(""""""""Клиент"""""""", Клиент);
		|	|		ДФ.ОбщаяСтруктура.Вставить(""""""""КСДФ"""""""", КСДФ);
		|	|	Иначе
		|	|	КонецЕсли;
		|	|
		|	|	//Сообщить(""""""""ДФ.СтрокаФункций = """""""" + ДФ.СтрокаФункций);
		|	|	Попытка
		|	|		Клиент.ОтправитьСообщение(КСДФ.СообщениеТекст(ДФ.СтрокаФункций));
		|	|	Исключение
		|	|		Отправитель.ОтправитьСообщение(КСДФ.СообщениеТекст(ДФ.СтрокаФункций));
		|	|	КонецПопытки;
		|	|	ДФ.СтрокаФункций = """""""""""""""";
		|	|	
		|	|	Если КСДФ.РежимСтороннегоКлиента = КСДФ.РежимКлиента.Браузер Тогда
		|	|		Если Сообщение.Текст = """"""""ConstantClient5du4fsjiwixxf"""""""" Тогда
		|	|		Иначе
		|	|			Отправитель.Отключить();
		|	|		КонецЕсли;
		|	|	КонецЕсли;
		|	|	// Сообщить(""""""""== Событие обработано ======================================="""""""");
		|	|КонецПроцедуры
		|	|
		|	|КСДФ = Новый КлиентСерверДекларФорм();
		|	|TCPСервер1 = КСДФ.TCPСервер(ДФ.ПортСервераПриема);
		|	|TCPСервер1.ПриПодключенииКлиента = КСДФ.Действие(ЭтотОбъект, """"""""Сервер_ПриПодключенииКлиента""""""""); // Это свойство необходимо установить.
		|	|TCPСервер1.ПриОтключенииКлиента = КСДФ.Действие(ЭтотОбъект, """"""""Сервер_ПриОтключенииКлиента""""""""); // Это свойство необходимо установить.
		|	|TCPСервер1.ПриПолученииСообщения = КСДФ.Действие(ЭтотОбъект, """"""""Сервер_ПриПолученииСообщения"""""""");
		|	|КСДФ.РежимСтороннегоКлиента = КСДФ.РежимКлиента.Браузер;
		|	|
		|	|TCPСервер1.Начать();
		|	|
		|	|Пока КСДФ.Продолжать Цикл
		|	|   КСДФ.ПолучитьСобытие().Выполнить();
		|	|КонецЦикла;
		|	|"""";
		|	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
		|КонецПроцедуры
		|
		|МассивПараметров = Новый Массив(1);
		|МассивПараметров[0] = ОбщаяСтруктура.ДФ;
		|Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, """"ЗапускКлиента"""", МассивПараметров);
		|"";
		|            GlobalContext().LoadScriptFromString(backgroundClientServer, extContext);
		|            while (!clientServerUploaded)
		|            {
		|                System.Threading.Thread.Sleep(300);
		|            }
		|        }
		|
		|        [ContextMethod(""ЗагрузитьСценарии"", ""LoadScripts"")]
		|        public StructureImpl LoadScripts(string folderName)
		|        {
		|            StructureImpl scripts = new StructureImpl();
		|            StructureImpl attachByPath = new StructureImpl();
		|            StructureImpl extContext = new StructureImpl();
		|            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
		|            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Source"")).AsString();
		|            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty(""Path"")).AsString();
		|            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, """").Replace("".os"", """").Replace(separator, """");
		|            shareStructure.Insert(""Сценарии"", scripts);
		|            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
		|            extContext.Insert(""ОбщаяСтруктура"", shareStructure);
		|
		|            // Ставим условия для корректной загрузки в случае одиночного или многократного использования
		|            // в сценарии метода Сценарии = ДФ.ЗагрузитьСценарии(""os"");
		|            if (!scriptsIsLoad)
		|            {
		|                if (isWin)
		|                {
		|                    LoadWsserverReceiving();
		|                    LoadWsserverSend();
		|                }
		|                else
		|                {
		|                    LoadClientServer();
		|                }
		|            }
		|
		|            // Создаем в этом каталоге файл package.json с заданными в сценарии начальными свойствами формы.
		|            if (!OpenInBrowser)
		|            {
		|                File.WriteAllText(pathStartupScript + separator + ""package.json"", Packagejson.packagejson, System.Text.Encoding.UTF8);
		|            }
		|
		|            // Создаем в этом каталоге файл index.html.
		|            if (isWin)
		|            {
		|                if (OpenInBrowser)
		|                {
		|                    string strIndexhtmlBr = IndexhtmlWinBr.Indexhtml;
		|                    if (DisplayStartupWarning)
		|                    {
		|                        string str1 = ""//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);"";
		|                        string str2 = ""setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);"";
		|                        strIndexhtmlBr = strIndexhtmlBr.Replace(str1, str2);
		|                    }
		|                    File.WriteAllText(pathStartupScript + separator + ""index.html"", strIndexhtmlBr, System.Text.Encoding.UTF8);
		|                }
		|                else
		|                {
		|                    File.WriteAllText(pathStartupScript + separator + ""index.html"", IndexhtmlWin.Indexhtml, System.Text.Encoding.UTF8);
		|                }
		|            }
		|            else
		|            {
		|                if (OpenInBrowser)
		|                {
		|                    string str1 = ""//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);"";
		|                    string str2 = ""setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);"";
		|                    string strIndexhtmlBr = IndexhtmlLinBr.Indexhtml.Replace(str1, str2);
		|                    File.WriteAllText(pathStartupScript + separator + ""index.html"", strIndexhtmlBr, System.Text.Encoding.UTF8);
		|                }
		|                else
		|                {
		|                    File.WriteAllText(pathStartupScript + separator + ""index.html"", IndexhtmlLin.Indexhtml, System.Text.Encoding.UTF8);
		|                }
		|            }
		|
		|            if (isWin)
		|            {
		|                if (folderName == @"".\"")
		|                {
		|                    string path = @"".\Классы\"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                    path = @"".\Модули\""; if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                }
		|                if (folderName == @""..\"")
		|                {
		|                    string path = @""..\Классы\"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                    path = @""..\Модули\"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                }
		|                if (!(folderName.Contains(@"".\"") || folderName.Contains(@""..\"")))
		|                {
		|                    string[] result2 = folderName.Split(new string[] { "";"", ""\u000a"", ""\u000d"" }, StringSplitOptions.RemoveEmptyEntries);
		|                    string path = """";
		|                    for (int i1 = 0; i1 < result2.Length; i1++)
		|                    {
		|                        path = result2[i1].Replace(""\u0022"", """").Trim();
		|                        if (Directory.Exists(path))
		|                        {
		|                            string[] files = Directory.GetFiles(path, ""*.os"");
		|                            for (int i2 = 0; i2 < files.Length; i2++)
		|                            {
		|                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i2])));
		|                            }
		|                        }
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                if (folderName == @""./"")
		|                {
		|                    string path = @""./Классы/"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                    path = @""./Модули/"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                }
		|                if (folderName == @""../"")
		|                {
		|                    string path = @""../Классы/"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                    path = @""../Модули/"";
		|                    if (Directory.Exists(path))
		|                    {
		|                        string[] files = Directory.GetFiles(path, ""*.os"");
		|                        for (int i1 = 0; i1 < files.Length; i1++)
		|                        {
		|                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i1])));
		|                        }
		|                    }
		|                }
		|                if (!(folderName.Contains(@""./"") || folderName.Contains(@""../"")))
		|                {
		|                    string[] result2 = folderName.Split(new string[]
		|                    { "";"", ""\u000a"", ""\u000d"" }, StringSplitOptions.RemoveEmptyEntries);
		|                    string path = """";
		|                    for (int i1 = 0; i1 < result2.Length; i1++)
		|                    {
		|                        path = result2[i1].Replace(""\u0022"", """").Trim();
		|                        if (Directory.Exists(path))
		|                        {
		|                            string[] files = Directory.GetFiles(path, ""*.os"");
		|                            for (int i2 = 0; i2 < files.Length; i2++)
		|                            {
		|                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace("".os"", """"), ValueFactory.Create(Path.GetFullPath(files[i2])));
		|                            }
		|                        }
		|                    }
		|                }
		|            }
		|            foreach (var item in attachByPath)
		|            {
		|                IRuntimeContextInstance inst = GlobalContext().LoadScript(item.Value.AsString(), extContext);
		|                scripts.Insert(item.Key.AsString(), (IValue)inst);
		|            }
		|
		|            scriptsIsLoad = true;
		|
		|            return scripts;
		|        }
		|
		|        private IValue sender;
		|        [ContextProperty(""Отправитель"", ""Sender"")]
		|        public IValue Sender
		|        {
		|            get { return sender; }
		|            set { sender = value; }
		|        }
		|
		|        public static void AddToHashtable(dynamic p1, dynamic p2)
		|        {
		|            if (!hashtable.ContainsKey(p1))
		|            {
		|                hashtable.Add(p1, p2);
		|            }
		|            else
		|            {
		|                if (!((object)hashtable[p1]).Equals(p2))
		|                {
		|                    hashtable[p1] = p2;
		|                }
		|            }
		|        }
		|
		|        [ContextMethod(""НайтиЭлемент"", ""FindElement"")]
		|        public IValue FindElement(object nameObject)
		|        {
		|            try
		|            {
		|                return (IValue)hashtable[nameObject];
		|            }
		|            catch
		|            {
		|                return null;
		|            }
		|        }
		|
		|        [ContextMethod(""СообщениеФорме"", ""MessageToForm"")]
		|        public void Send(string p1)
		|        {
		|            if (isWin)
		|            {
		|                WebServerSendText(p1);
		|            }
		|            else
		|            {
		|                SendStrFunc(p1);
		|            }
		|        }
		|
		|        [ContextMethod(""ОбработатьСообщение"", ""ProcessMessage"")]
		|        public void ProcessMessage(string p1)
		|        {
		|            string strZapros = p1;
		|            string[] massiv = strZapros.Split(new string[] { paramDelimiter }, StringSplitOptions.RemoveEmptyEntries);
		|            //GlobalContext().Echo(""Сообщение.Текст = "" + p1);
		|            //GlobalContext().Echo(""СтрЗапроса = "" + strZapros);
		|		
		|            if (strZapros == ""formIsLoaded"")
		|            {
		|                try
		|                {
		|                    Execute(((DfForm)FindElement(""mainForm"")).Loaded);
		|                }
		|                catch (Exception)
		|                {
		|                    //GlobalContext().Echo(""Loaded не задан"");
		|                }
		|            }
		|		
		|            if (!(massiv.Length < 2))
		|            {
		|                string nameElement = massiv[0];
		|                string nameEvent = massiv[1];
		|                if (massiv.Length == 2) // Для событий без аргументов.
		|                {
		|                    if (nameElement == ""mainForm"" && nameEvent == ""loaded"")
		|                    {
		|                        return;
		|                    }
		|		
		|                    try
		|                    {
		|                        Sender = FindElement(nameElement);
		|                        if (Sender.GetType() == typeof(osdf.DfMenuItem))
		|                        {
		|                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent));
		|                        }
		|                        else
		|                        {
		|                            Execute((DfAction)Sender.GetType().GetProperty(nameEvent).GetValue(Sender));
		|                        }
		|                    }
		|                    catch
		|                    {
		|                        if (nameElement == ""mainForm"" && nameEvent == ""loaded"")
		|                        {
		|                            // Ничего не делаем.
		|                        }
		|                        else
		|                        {
		|                            if (Sender.GetType() != typeof(osdf.DfMenuItem))
		|                            {
		|                                GlobalContext().Echo(""Не обработано событие = "" + nameEvent);
		|                            }
		|                        }
		|                    }
		|                }
		|                else // Для событий с аргументами.
		|                {
		|                    try
		|                    {
		|                        if (nameEvent.Contains(""v5v5v""))
		|                        {
		|                            string actionItemKey = nameEvent.Replace(""v5v5v"", """");
		|                            Sender = FindElement(nameElement);
		|                            string nameProperty = """";
		|                            System.Reflection.PropertyInfo[] myPropertyInfo = Sender.GetType().GetProperties();
		|                            for (int i = 0; i < myPropertyInfo.Length; i++)
		|                            {
		|                                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
		|                                {
		|                                    string methodRus1 = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
		|                                    string methodEn1 = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
		|                                    if (methodRus1 == massiv[2] || methodEn1 == massiv[2])
		|                                    {
		|                                        nameProperty = methodEn1;
		|                                        break;
		|                                    }
		|                                }
		|                            }
		|
		|                            string propertyType = Sender.GetType().GetProperty(nameProperty).PropertyType.ToString();
		|                            IValue propValue;
		|                            if (propertyType == ""System.Int32"")
		|                            {
		|                                Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                propValue = ValueFactory.Create(Convert.ToInt32(num1));
		|                            }
		|                            else if (propertyType == ""ScriptEngine.HostedScript.Library.ArrayImpl"")
		|                            {
		|                                ArrayImpl ArrayImpl1 = new ArrayImpl();
		|                                string[] s = massiv[3].Split(new string[] { "";"" }, StringSplitOptions.RemoveEmptyEntries);
		|                                for (int i = 0; i < s.Length; i++)
		|                                {
		|                                    if (FindElement(s[i]) != null)
		|                                    {
		|                                        ArrayImpl1.Add(FindElement(s[i]));
		|                                    }
		|                                    else
		|                                    {
		|                                        ArrayImpl1.Add(ValueFactory.Create(s[i]));
		|                                    }
		|                                }
		|                                propValue = ArrayImpl1;
		|                            }		
		|                            else if (propertyType == ""osdf.DfOutcome"")
		|                            {
		|                                propValue = (DfOutcome)FindElement(massiv[3]);
		|                            }		
		|                            else if (propertyType == ""osdf.DfTableHeader"")
		|                            {
		|                                propValue = (DfTableHeader)FindElement(massiv[3]);
		|                            }		
		|                            else if (Sender.GetType() == typeof(osdf.DfImage))
		|                            {
		|                                propValue = ValueFactory.Create(massiv[3].Replace(""#"", """"));
		|                            }		
		|                            else
		|                            {
		|                                propValue = ValueFactory.Create(massiv[3]);
		|                            }
		|
		|                            try
		|                            {
		|                                // Присваивать значение будем свойству - посреднику.
		|                                string nameProperty2 = namesRusProps[massiv[2]][2].ToString();
		|                                if (nameProperty2 == ""textAlign"")
		|                                {
		|                                    nameProperty2 = ""horizontalTextAlign"";
		|                                }
		|                                if (nameProperty2 == ""border"")
		|                                {
		|                                    nameProperty2 = ""borders"";
		|                                }
		|                                if (nameProperty2 == ""borderStyle"")
		|                                {
		|                                    nameProperty2 = ""bordersStyle"";
		|                                }
		|                                if (nameProperty2 == ""borderColor"")
		|                                {
		|                                    nameProperty2 = ""bordersColor"";
		|                                }
		|                                if (nameProperty2 == ""color"")
		|                                {
		|                                    nameProperty2 = ""textColor"";
		|                                }
		|                                if (nameProperty2 == ""borderWidth"")
		|                                {
		|                                    nameProperty2 = ""bordersWidth"";
		|                                }		
		|                                dynamic obj = ((dynamic)Sender);
		|
		|                                Type type = obj.GetType().GetProperty(nameProperty2).PropertyType;
		|                                if (type == typeof(string))
		|                                {
		|                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue.AsString());
		|                                }
		|                                else if (type == typeof(bool))
		|                                {
		|                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue.AsBoolean());
		|                                }
		|                                else if (type == typeof(System.Int32))
		|                                {
		|                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, Convert.ToInt32(propValue.AsNumber()));
		|                                }
		|                                else
		|                                {
		|                                    if (nameProperty2 == ""parent"")
		|                                    {
		|                                        propValue = FindElement(massiv[3]);
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfAudio) && nameProperty2 == ""volume"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfAudio) && nameProperty2 == ""playbackRate"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }		
		|                                    if ((obj.GetType() == typeof(osdf.DfProgress) ||
		|                                        obj.GetType() == typeof(osdf.DfMeter)
		|                                        ) && nameProperty2 == ""_value"")		
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "","")) * 100;
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == ""_value"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }	
		|                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == ""_value"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }	
		|                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == ""step"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }	
		|                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == ""step"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }		
		|                                    if (obj.GetType() == typeof(osdf.DfProgress) && nameProperty2 == ""max"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "","")) * 100;
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == ""max"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == ""max"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == ""max"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "","")) * 100;
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == ""min"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == ""min"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "",""));
		|                                        propValue = ValueFactory.Create(num1);
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == ""min"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "","")) * 100;
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }		
		|                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == ""optimum"")
		|                                    {
		|                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(""."", "","")) * 100;
		|                                        string str1 = num1.ToString().TrimEnd('0');
		|                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
		|                                    }		
		|                                    if (obj.GetType() == typeof(osdf.DfTableRow) && nameProperty2 == ""rowIndex"")
		|                                    {
		|                                        propValue = ValueFactory.Create(Int32.Parse(massiv[3]));
		|                                    }
		|                                    if (obj.GetType() == typeof(osdf.DfTableRow) && nameProperty2 == ""sectionRowIndex"")
		|                                    {
		|                                        propValue = ValueFactory.Create(Int32.Parse(massiv[3]));
		|                                    }		
		|                                    if (obj.GetType() == typeof(osdf.DfColorSelection) && nameProperty2 == ""_value"")
		|                                    {
		|                                        string str1 = massiv[3].Replace(""#"", """");
		|                                        int r = Convert.ToInt32(str1.Substring(0, 2), 16);
		|                                        int g = Convert.ToInt32(str1.Substring(2, 2), 16);
		|                                        int b = Convert.ToInt32(str1.Substring(4, 2), 16);
		|                                        propValue = ValueFactory.Create(""rgb("" + r.ToString() + "", "" + g.ToString() + "", "" + b.ToString() + "")"");
		|                                    }		
		|                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue);
		|                                }
		|                            }
		|                            catch (Exception ex)
		|                            {
		|                                GlobalContext().Echo(""При присвоении значения свойству - посреднику = "" + ex.StackTrace);
		|                            }
		|                            if (actionItemKey != """")
		|                            {
		|                                Execute((DfAction)FindElement(actionItemKey));
		|                            }
		|                            else { }
		|                        }
		|                        else
		|                        {
		|                            Sender = FindElement(nameElement);
		|                            DfEventArgs eventArgs = CreateEventArgs(strZapros);
		|                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent), eventArgs);
		|                        }
		|                    }
		|                    catch
		|                    {
		|                        if (nameElement == ""mainForm"")
		|                        {
		|                            // Ничего не делаем.
		|                        }
		|                        else
		|                        {
		|                            GlobalContext().Echo(""Не обработан запрос = "" + strZapros);
		|                        }
		|                    }
		|                }
		|            }
		|            else
		|            {
		|                string resTest = """";
		|                try
		|                {
		|                    string[] massiv2 = massiv[0].Split(new string[] { "" "" }, StringSplitOptions.RemoveEmptyEntries);
		|                    string nameClass = FindElement(massiv2[0]).ToString().Replace(""Дф"", """");
		|
		|                    if (namesRusProps.ContainsKey(massiv2[1]))
		|                    {
		|                        resTest = strZapros.Replace(massiv2[0], nameClass);
		|                        if (resTest != ""Неопределено"")
		|                        {
		|                            if (!resTest.Contains(""!!!""))
		|                            {
		|                                GlobalContext().Echo(resTest);
		|                            }
		|                        }
		|                    }
		|                }
		|                catch { }
		|                if (resTest.Contains(""!!!""))
		|                {
		|                    GlobalContext().Echo(""Ошибка1: "" + resTest);
		|                }
		|            }
		|        }
		|
		|        public DfEventArgs CreateEventArgs(string p1)
		|        {
		|            DfEventArgs DfEventArgs1 = new DfEventArgs();
		|            //СтрЗапроса = d3tfonn3esun|mouseup|Button=right|X=40|Y=54
		|            //GlobalContext().Echo(""p1 = "" + p1);
		|            string[] str1 = p1.Split(new string[] { paramDelimiter }, StringSplitOptions.RemoveEmptyEntries);
		|            for (int i = 2; i < str1.Length; i++)
		|            {
		|                string[] str2 = str1[i].Split(new string[] { ""="" }, StringSplitOptions.RemoveEmptyEntries);
		|                //GlobalContext().Echo(""str2[0] = "" + str2[0]);
		|                //GlobalContext().Echo(""str2[1] = "" + str2[1]);
		|
		|                // Здесь нужно знать какой тип значения у свойства и конвертировать из строки str2[0] в нужный тип.
		|                string nameProperty = """";
		|                System.Reflection.PropertyInfo[] myPropertyInfo = DfEventArgs1.GetType().GetProperties();
		|                for (int i1 = 0; i1 < myPropertyInfo.Length; i1++)
		|                {
		|                    if (myPropertyInfo[i1].CustomAttributes.Count() == 1)
		|                    {
		|                        string methodRus1 = myPropertyInfo[i1].GetCustomAttribute<ContextPropertyAttribute>().GetName();
		|                        string methodEn1 = myPropertyInfo[i1].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
		|
		|                        if (methodRus1 == str2[0] || methodEn1 == str2[0])
		|                        {
		|                            nameProperty = methodEn1;
		|                            break;
		|                        }
		|                    }
		|                }
		|                string propertyType;
		|                try
		|                {
		|                    propertyType = ((dynamic)Sender).GetType().GetProperty(nameProperty).PropertyType.ToString();
		|                }
		|                catch
		|                {
		|                    propertyType = DfEventArgs1.GetType().GetProperty(nameProperty).PropertyType.ToString();
		|                }
		|
		|                try
		|                {
		|                    IValue propValue;
		|                    if (propertyType == ""System.Int32"")
		|                    {
		|                        Decimal num1 = Decimal.Parse(str2[1].Replace(""."", "",""));
		|                        propValue = ValueFactory.Create(Convert.ToInt32(num1));
		|                    }
		|                    else if (propertyType == ""ScriptEngine.HostedScript.Library.ArrayImpl"")
		|                    {
		|                        ArrayImpl ArrayImpl1 = new ArrayImpl();
		|                        string[] s = str2[1].Split(new string[] { "";"" }, StringSplitOptions.RemoveEmptyEntries);
		|                        for (int i1 = 0; i1 < s.Length; i1++)
		|                        {
		|                            if (FindElement(s[i1]) != null)
		|                            {
		|                                ArrayImpl1.Add(FindElement(s[i1]));
		|                            }
		|                            else
		|                            {
		|                                ArrayImpl1.Add(ValueFactory.Create(s[i1]));
		|                            }
		|                        }
		|                        propValue = ArrayImpl1;
		|                    }		
		|                    else if (propertyType == ""System.Boolean"")
		|                    {
		|                        propValue = ValueFactory.Create(Boolean.Parse(str2[1]));
		|                    }		
		|                    else
		|                    {
		|                        propValue = ValueFactory.Create(str2[1]);
		|                    }
		|
		|                    // Здесь нужно преобразовать общее для многих свойство АргументыСобытия.Значение (EventArgs.Value)
		|                    // из типа данных ScriptEngine.Machine.IValue в тип данных свойства Value данного объекта.
		|                    if (Sender.GetType() == typeof(osdf.DfRange) ||
		|                        Sender.GetType() == typeof(osdf.DfNumberField)
		|                        )
		|                    {
		|                        Decimal num1 = Decimal.Parse(str2[1].Replace(""."", "",""));
		|                        propValue = ValueFactory.Create(num1);
		|                    }
		|                    if (Sender.GetType() == typeof(osdf.DfCheckBox))
		|                    {
		|                        ((DfCheckBox)Sender)._checked = propValue.AsBoolean();
		|                        DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), propValue);
		|                    }
		|                    else
		|                    {
		|                        DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), propValue);
		|                    }
		|                }
		|                catch (Exception ex)
		|                {
		|                    GlobalContext().Echo(""При изменении значения свойства отправителя = "" + ex.StackTrace);
		|                }
		|
		|                // Изменим и значение свойства объекта.
		|                try
		|                {
		|                    // Присваивать значение будем свойству - посреднику.
		|                    string nameProperty2 = namesRusProps[str2[0]][2].ToString();
		|                    dynamic obj = (dynamic)Sender;
		|                    string propertyType2 = Sender.GetType().GetProperty(nameProperty2).PropertyType.ToString();
		|                    dynamic propValue2;
		|                    if (propertyType == ""System.Int32"")
		|                    {
		|                        Decimal num1 = Decimal.Parse(str2[1].Replace(""."", "",""));
		|                        propValue2 = Convert.ToInt32(num1);
		|                    }
		|                    else if (propertyType == ""ScriptEngine.HostedScript.Library.ArrayImpl"")
		|                    {
		|                        ArrayImpl ArrayImpl1 = new ArrayImpl();
		|                        string[] s = str2[1].Split(new string[] { "";"" }, StringSplitOptions.RemoveEmptyEntries);
		|                        for (int i1 = 0; i1 < s.Length; i1++)
		|                        {
		|                            if (FindElement(s[i1]) != null)
		|                            {
		|                                ArrayImpl1.Add(FindElement(s[i1]));
		|                            }
		|                            else
		|                            {
		|                                ArrayImpl1.Add(ValueFactory.Create(s[i1]));
		|                            }
		|                        }
		|                        propValue2 = ArrayImpl1;
		|                    }
		|                    else if (propertyType == ""System.Boolean"")
		|                    {
		|                        propValue2 = Boolean.Parse(str2[1]);
		|                    }
		|                    else if (Sender.GetType() == typeof(osdf.DfRange) ||
		|                        Sender.GetType() == typeof(osdf.DfNumberField)
		|                        )
		|                    {
		|                        Decimal num1 = Decimal.Parse(str2[1].Replace(""."", "",""));
		|                        propValue2 = ValueFactory.Create(num1);
		|                    }		
		|                    else if (propertyType == ""ScriptEngine.Machine.IValue"")
		|                    {
		|                        propValue2 = ValueFactory.Create(str2[1]);
		|                    }
		|                    else
		|                    {
		|                        propValue2 = str2[1];
		|                    }
		|                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue2);
		|                }
		|                catch (Exception)
		|                {
		|                    //GlobalContext().Echo(""При изменении значения свойства объекта = "" + ex.StackTrace);
		|                }
		|            }
		|            return DfEventArgs1;
		|        }
		|
		|        [ContextMethod(""Выполнить"", ""Execute"")]
		|        public IValue Execute(DfAction p1, DfEventArgs p2 = null)
		|        {
		|            if (p2 != null)
		|            {
		|                eventArgs = p2;
		|            }
		|            else
		|            {
		|                eventArgs = new DfEventArgs();
		|            }
		|            eventArgs.Parameter = p1.Parameter;
		|            eventArgs.Sender = Sender;
		|
		|            DfAction Action1 = p1;
		|            IRuntimeContextInstance script = Action1.Script;
		|            string method = Action1.MethodName;
		|            ReflectorContext reflector = new ReflectorContext();
		|            IValue res = ValueFactory.Create();
		|            try
		|            {
		|                res = reflector.CallMethod(script, method, null);
		|            }
		|            catch (Exception ex)
		|            {
		|                GlobalContext().Echo(""Ошибка2: "" + ex.Message);
		|            }
		|            return res;
		|        }
		|		
		|        public static void WebServerSendText(string p1)
		|        {
		|            osws.WebServerSendDeclarForms.WebServer.SendText(p1);
		|        }		
		|		
		|        [ContextMethod(""ПолучитьСвойство"", ""GetObjectProperty"")]
		|        public void GetObjectProperty(IValue p1, string p2, DfAction p3)
		|        {
		|            string itemKeyObj;
		|            string resObj;
		|            string function1 = """";
		|            string enPropName = (string)namesRusProps[p2][2];
		|            bool notStyle = (bool)namesRusProps[p2][1];
		|            if ((p1.GetType() == typeof(osdf.DfTimeSelection) ||   
		|                p1.GetType() == typeof(osdf.DfDateSelection) || 
		|                p1.GetType() == typeof(osdf.DfDateTimeLocalSelection) || 
		|                p1.GetType() == typeof(osdf.DfMonthSelection) || 
		|                p1.GetType() == typeof(osdf.DfWeekSelection) || 
		|                p1.GetType() == typeof(osdf.DfColorSelection) || 
		|                p1.GetType() == typeof(osdf.DfProgress) ||	
		|                p1.GetType() == typeof(osdf.DfTextArea) ||		
		|                p1.GetType() == typeof(osdf.DfRadio) ||		
		|                p1.GetType() == typeof(osdf.DfPasswordField) ||		
		|                p1.GetType() == typeof(osdf.DfSearchField) ||		
		|                p1.GetType() == typeof(osdf.DfSelect) ||		
		|                p1.GetType() == typeof(osdf.DfTextField) ||		
		|                p1.GetType() == typeof(osdf.DfNumberField) ||		
		|                p1.GetType() == typeof(osdf.DfRange) ||		
		|                p1.GetType() == typeof(osdf.DfOutput) ||		
		|                p1.GetType() == typeof(osdf.DfCheckBox) ||		
		|                p1.GetType() == typeof(osdf.DfMeter) ||		
		|                p1.GetType() == typeof(osdf.DfSelectItem) ||
		|                p1.GetType() == typeof(osdf.DfDateTimeSelection)
		|                ) && p2 == ""Значение"")
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['value'];"";
		|            }
		|            else if (p1.GetType() == typeof(osdf.DfTextArea) && p2 == ""Текст"")
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['value'];"";
		|            }
		|            else if ((p1.GetType() == typeof(osdf.DfImage) ||
		|                p1.GetType() == typeof(osdf.DfArea)
		|                ) && p2 == ""Описание"")
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['аlt'];"";
		|            }		
		|            else if ((p1.GetType() == typeof(osdf.DfRadio) ||
		|                p1.GetType() == typeof(osdf.DfCheckBox)
		|                ) && p2 == ""Помечен"")		
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['checked'];"";
		|            }		
		|            else if ((p1.GetType() == typeof(osdf.DfImage) ||
		|                p1.GetType() == typeof(osdf.DfCanvas)
		|                ) && p2 == ""Высота"")
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['height'];"";
		|            }
		|            else if ((p1.GetType() == typeof(osdf.DfImage) ||
		|                p1.GetType() == typeof(osdf.DfCanvas)
		|                ) && p2 == ""Ширина"")
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['width'];"";
		|            }		
		|            else if (p1.GetType() == typeof(osdf.DfStyle) && p2 == ""Позиция"")
		|            {
		|                itemKeyObj = ((dynamic)p1).Owner.ItemKey;
		|                resObj = ""el.style['position'];"";
		|                notStyle = false;
		|            }		
		|            else if (notStyle)
		|            {
		|                itemKeyObj = ((dynamic)p1).ItemKey;
		|                resObj = ""el['"" + enPropName + ""'];"";
		|            }
		|            else
		|            {
		|                itemKeyObj = ((dynamic)p1).Owner.ItemKey;
		|                resObj = ""el.style['"" + enPropName + ""'];"";
		|            }
		|
		|            if (enPropName == ""parent"")
		|            {
		|                function1 = """" +
		|                    ""let res;"" +
		|                    ""let el = mapKeyEl.get('"" + itemKeyObj + ""');"" +
		|                    ""try"" +
		|                    ""{"" +
		|                    ""    if (el.parentElement == document.body)"" +
		|                    ""    {"" +
		|                    ""        res = 'mainForm';"" +
		|                    ""    }"" +
		|                    ""    else"" +
		|                    ""    {"" +
		|                    ""        res = mapElKey.get(el.parentElement);"" +
		|                    ""    }"" +
		|                    ""    sendPost("" +
		|                    ""    '"" + ((dynamic)p1).ItemKey + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + 'v5v5v"" + p3.ItemKey + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + '"" + p2 + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + res +"" +
		|                    ""    '"" + paramDelimiter + ""' + '"" + notStyle.ToString().ToLower() + ""');"" +
		|                    ""}"" +
		|                    ""catch (err)"" +
		|                    ""{"" +
		|                    ""    sendPost('!!! Ошибка3:' + err.message);"" +
		|                    ""}"" +
		|                    """";
		|            }
		|            else if (notStyle)
		|            {
		|                if (p1.GetType() == typeof(osdf.DfTextArea) && p2 == ""Строки"")
		|                {
		|                    function1 = """" +
		|                        ""let res;"" +
		|                        ""let el = mapKeyEl.get('"" + itemKeyObj + ""');"" +
		|                        ""try"" +
		|                        ""{"" +
		|                        ""    {"" +
		|                        ""        res = "" + resObj +
		|                        ""    }"" +
		|                        ""    sendPost("" +
		|                        ""    '"" + ((dynamic)p1).ItemKey + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + 'v5v5v"" + p3.ItemKey + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + '"" + p2 + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + res +"" +
		|                        ""    '"" + paramDelimiter + ""' + true);"" +
		|                        ""}"" +
		|                        ""catch (err)"" +
		|                        ""{"" +
		|                        ""    sendPost('!!! Ошибка3:' + err.message);"" +
		|                        ""}"" +
		|                        """";
		|                }
		|                else
		|                {
		|                    function1 = """" +
		|                        ""let res;"" +
		|                        ""let el = mapKeyEl.get('"" + itemKeyObj + ""');"" +
		|                        ""try"" +
		|                        ""{"" +
		|
		|                        ""    if ('"" + enPropName + ""' == 'class')"" +
		|                        ""    {"" +
		|                        ""        res = el['className'];"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'tFoot')"" +
		|                        ""    {"" +
		|                        ""        let tFoot = el['tFoot'];"" +
		|                        ""        res = mapElKey.get(tFoot);"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'tHead')"" +
		|                        ""    {"" +
		|                        ""        let tHead = el['tHead'];"" +
		|                        ""        res = mapElKey.get(tHead);"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'areas')"" +
		|                        ""    {"" +
		|                        ""        res = '';"" +
		|                        ""        if (el.areas.length > 0)"" +
		|                        ""        {"" +
		|                        ""            for (var i = 0; i < el.areas.length; i++)"" +
		|                        ""            {"" +
		|                        ""                res = res + mapElKey.get(el.areas[i]) + ';';"" +
		|                        ""            }"" +
		|                        ""        }"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'cells')"" +
		|                        ""    {"" +
		|                        ""        res = '';"" +
		|                        ""        if (el.cells.length > 0)"" +
		|                        ""        {"" +
		|                        ""            for (var i = 0; i < el.cells.length; i++)"" +
		|                        ""            {"" +
		|                        ""                res = res + mapElKey.get(el.cells[i]) + ';';"" +
		|                        ""            }"" +
		|                        ""        }"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'rows')"" +
		|                        ""    {"" +
		|                        ""        res = '';"" +
		|                        ""        if (el.rows.length > 0)"" +
		|                        ""        {"" +
		|                        ""            for (var i = 0; i < el.rows.length; i++)"" +
		|                        ""            {"" +
		|                        ""                res = res + mapElKey.get(el.rows[i]) + ';';"" +
		|                        ""            }"" +
		|                        ""        }"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'tBodies')"" +
		|                        ""    {"" +
		|                        ""        res = '';"" +
		|                        ""        if (el.tBodies.length > 0)"" +
		|                        ""        {"" +
		|                        ""            for (var i = 0; i < el.tBodies.length; i++)"" +
		|                        ""            {"" +
		|                        ""                res = res + mapElKey.get(el.tBodies[i]) + ';';"" +
		|                        ""            }"" +
		|                        ""        }"" +
		|                        ""    }"" +
		|                        ""    else if ('"" + enPropName + ""' == 'options')"" +
		|                        ""    {"" +
		|                        ""        res = '';"" +
		|                        ""        if (el.options.length > 0)"" +
		|                        ""        {"" +
		|                        ""            for (var i = 0; i < el.options.length; i++)"" +
		|                        ""            {"" +
		|                        ""                res = res + mapElKey.get(el.options[i]) + ';';"" +
		|                        ""            }"" +
		|                        ""        }"" +
		|                        ""    }"" +
		|                        ""    else"" +
		|                        ""    {"" +
		|                        ""        res = "" + resObj +
		|                        ""    }"" +
		|
		|                        ""    sendPost("" +
		|                        ""    '"" + ((dynamic)p1).ItemKey + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + 'v5v5v"" + p3.ItemKey + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + '"" + p2 + ""' +"" +
		|                        ""    '"" + paramDelimiter + ""' + res +"" +
		|                        ""    '"" + paramDelimiter + ""' + true);"" +
		|                        ""}"" +
		|                        ""catch (err)"" +
		|                        ""{"" +
		|                        ""    sendPost('!!! Ошибка3:' + err.message);"" +
		|                        ""}"" +
		|                        """";
		|                }
		|            }
		|            else
		|            {
		|                function1 = """" +
		|                    ""let res;"" +
		|                    ""let el = mapKeyEl.get('"" + itemKeyObj + ""');"" +
		|                    ""try"" +
		|                    ""{"" +
		|
		|                    ""    res = "" + resObj +
		|
		|                    ""    sendPost("" +
		|                    ""    '"" + ((dynamic)p1).ItemKey + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + 'v5v5v"" + p3.ItemKey + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + '"" + p2 + ""' +"" +
		|                    ""    '"" + paramDelimiter + ""' + res +"" +
		|                    ""    '"" + paramDelimiter + ""' + false);"" +
		|                    ""}"" +
		|                    ""catch (err)"" +
		|                    ""{"" +
		|                    ""    sendPost('!!! Ошибка3:' + err.message);"" +
		|                    ""}"" +
		|                    """";
		|            }
		|            function1 = function1.Replace(""    "", "" "").Replace(""  "", "" "");
		|
		|            if (isWin)
		|            {
		|                //WebServerSendText(function1);
		|                DeclarativeForms.SendStrFunc(function1); // А может так?
		|                // Здесь поставим задержку для формирования формой ответа.
		|                System.Threading.Thread.Sleep(100);		
		|            }
		|            else
		|            {
		|                SendStrFunc(function1);
		|            }
		|        }
		|
		|        public static dynamic DefineTypeIValue(dynamic p1)
		|        {
		|            if (p1.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
		|            {
		|                return p1.AsString();
		|            }
		|            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
		|            {
		|                return p1.AsNumber();
		|            }
		|            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.BooleanValue))
		|            {
		|                return p1.AsBoolean();
		|            }
		|            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.DateValue))
		|            {
		|                return p1.AsDate();
		|            }
		|            else
		|            {
		|                return p1;
		|            }
		|        }
		|
		|        public static dynamic GetEventParameter(dynamic dll_objEvent)
		|        {
		|            if (dll_objEvent != null)
		|            {
		|                dynamic eventType = dll_objEvent.GetType();
		|                if (eventType == typeof(DelegateAction))
		|                {
		|                    return null;
		|                }
		|                else if (eventType == typeof(DfAction))
		|                {
		|                    return ((DfAction)dll_objEvent).Parameter;
		|                }
		|                else
		|                {
		|                    return null;
		|                }
		|            }
		|            else
		|            {
		|                return null;
		|            }
		|        }
		|
		|        public static string ParseBetween(string p1, string p2 = null, string p3 = null)
		|        {
		|            //p1 - исходная строка
		|            //p2 - подстрока поиска от которой ведем поиск
		|            //p3 - подстрока поиска до которой ведем поиск
		|            //возвращает строку, ограниченную p2 и p3
		|            string str1 = p1;
		|            int Position1;
		|            if (p2 != null && p3 == null)
		|            {
		|                Position1 = str1.IndexOf(p2);
		|                if (Position1 >= 0)
		|                {
		|                    return str1.Substring(Position1 + p2.Length);
		|                }
		|            }
		|            else if (p2 == null && p3 != null)
		|            {
		|                Position1 = str1.IndexOf(p3) + 1;
		|                if (Position1 > 0)
		|                {
		|                    return str1.Substring(0, Position1 - 1);
		|                }
		|            }
		|            else if (p2 != null && p3 != null)
		|            {
		|                Position1 = str1.IndexOf(p2);
		|                while (Position1 >= 0)
		|                {
		|                    string Стр2;
		|                    Стр2 = str1.Substring(Position1 + p2.Length);
		|                    int Position2 = Стр2.IndexOf(p3) + 1;
		|                    int SumPosition2 = Position2;
		|                    while (Position2 > 0)
		|                    {
		|                        if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
		|                        {
		|                            return Стр2.Substring(0, SumPosition2 - 1);
		|                        }
		|                        try
		|                        {
		|                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
		|                            SumPosition2 = SumPosition2 + Position2 + 1;
		|                        }
		|                        catch
		|                        {
		|                            break;
		|                        }
		|                    }
		|                    str1 = str1.Substring(Position1 + 1);
		|                    Position1 = str1.IndexOf(p2);
		|                }
		|            }
		|            return null;
		|        }
		|
		|        public static DfArrayList StrFindBetween(string p1, string p2 = null, string p3 = null, bool p4 = true, bool p5 = true)
		|        {
		|            //p1 - исходная строка
		|            //p2 - подстрока поиска от которой ведем поиск
		|            //p3 - подстрока поиска до которой ведем поиск
		|            //p4 - не включать p2 и p3 в результат
		|            //p5 - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
		|            //функция возвращает массив строк
		|            string str1 = p1;
		|            int Position1;
		|            DfArrayList DfArrayList1 = new DfArrayList();
		|            if (p2 != null && p3 == null)
		|            {
		|                Position1 = str1.IndexOf(p2);
		|                while (Position1 >= 0)
		|                {
		|                    DfArrayList1.Add(ValueFactory.Create("""" + ((p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1))));
		|                    str1 = str1.Substring(Position1 + 1);
		|                    Position1 = str1.IndexOf(p2);
		|                }
		|            }
		|            else if (p2 == null && p3 != null)
		|            {
		|                Position1 = str1.IndexOf(p3) + 1;
		|                int SumPosition1 = Position1;
		|                while (Position1 > 0)
		|                {
		|                    DfArrayList1.Add(ValueFactory.Create("""" + ((p4) ? str1.Substring(0, SumPosition1 - 1) : str1.Substring(0, SumPosition1 - 1 + p3.Length))));
		|                    try
		|                    {
		|                        Position1 = str1.Substring(SumPosition1 + 1).IndexOf(p3) + 1;
		|                        SumPosition1 = SumPosition1 + Position1 + 1;
		|                    }
		|                    catch
		|                    {
		|                        break;
		|                    }
		|                }
		|            }
		|            else if (p2 != null && p3 != null)
		|            {
		|                Position1 = str1.IndexOf(p2);
		|                while (Position1 >= 0)
		|                {
		|                    string Стр2;
		|                    Стр2 = (p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1);
		|                    int Position2 = Стр2.IndexOf(p3) + 1;
		|                    int SumPosition2 = Position2;
		|                    while (Position2 > 0)
		|                    {
		|                        if (p5)
		|                        {
		|                            if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
		|                            {
		|                                DfArrayList1.Add(ValueFactory.Create("""" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
		|                            }
		|                        }
		|                        else
		|                        {
		|                            DfArrayList1.Add(ValueFactory.Create("""" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
		|                        }
		|                        try
		|                        {
		|                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
		|                            SumPosition2 = SumPosition2 + Position2 + 1;
		|                        }
		|                        catch
		|                        {
		|                            break;
		|                        }
		|                    }
		|                    str1 = str1.Substring(Position1 + 1);
		|                    Position1 = str1.IndexOf(p2);
		|                }
		|            }
		|            return DfArrayList1;
		|        }
		|
		|        // Для метода Добавить класса DfFrames. Имена свойств и атрибутов.
		|        public static Dictionary<string, object[]> namesStyleProps = new Dictionary<string, object[]>
		|        {
		|            //object[0] Имя как в справке - HorizontalTextAlign
		|            //object[1] Имя как в js (горбатый стиль)- style['textAlign']
		|            //object[2] Имя скрытого поля в стиле (private string horizontalTextAlign) - horizontalTextAlign
		|            //object[3] Имя как в css(через тире)- text-align
		|            {""Анимация"", new object[4] { ""Animation"", ""animation"", ""Animation"", ""animation"" } },
		|            {""БазоваяДлина"", new object[4] { ""FlexBasis"", ""flexBasis"", ""flexBasis"", ""flex-basis"" } },
		|            {""ВариантШрифта"", new object[4] { ""FontVariant"", ""fontVariant"", ""fontVariant"", ""font-variant"" } },
		|            {""ВертикальноеВыравнивание"", new object[4] { ""VerticalAlign"", ""verticalAlign"", ""verticalAlign"", ""vertical-align"" } },
		|            {""Верх"", new object[4] { ""Top"", ""top"", ""top"", ""top"" } },
		|            {""ВерхняяГраница"", new object[4] { ""BorderTop"", ""borderTop"", ""borderTop"", ""border-top"" } },
		|            {""Видимость"", new object[4] { ""Visibility"", ""visibility"", ""visibility"", ""visibility"" } },
		|            {""ВписываниеОбъекта"", new object[4] { ""ObjectFit"", ""objectFit"", ""objectFit"", ""object-fit"" } },
		|            {""ВремяПерехода"", new object[4] { ""TransitionDuration"", ""transitionDuration"", ""transitionDuration"", ""transition-duration"" } },
		|            {""ВыделениеПользователем"", new object[4] { ""UserSelect"", ""userSelect"", ""userSelect"", ""user-select"" } },
		|            {""ВыравниваниеОтдельных"", new object[4] { ""AlignSelf"", ""alignSelf"", ""alignSelf"", ""align-self"" } },
		|            {""ВыравниваниеСодержимого"", new object[4] { ""AlignContent"", ""alignContent"", ""alignContent"", ""align-content"" } },
		|            {""ВыравниваниеЭлементов"", new object[4] { ""AlignItems"", ""alignItems"", ""alignItems"", ""align-items"" } },
		|            {""Высота"", new object[4] { ""Height"", ""height"", ""height"", ""height"" } },
		|            {""ВысотаСтроки"", new object[4] { ""LineHeight"", ""lineHeight"", ""lineHeight"", ""line-height"" } },
		|            {""Гибкость"", new object[4] { ""Flex"", ""flex"", ""flex"", ""flex"" } },
		|            {""ГоризонтальноеВыравнивание"", new object[4] { ""CssFloat"", ""cssFloat"", ""cssFloat"", ""css-float"" } },
		|            {""ГоризонтальноеВыравниваниеТекста"", new object[4] { ""HorizontalTextAlign"", ""textAlign"", ""horizontalTextAlign"", ""text-align"" } },/////////////////////////////////////////////////
		|            {""ГраницаСвернута"", new object[4] { ""BorderCollapse"", ""borderCollapse"", ""borderCollapse"", ""border-collapse"" } },
		|            {""Границы"", new object[4] { ""Borders"", ""border"", ""borders"", ""border"" } },///////////////////////////////////////////////////////////////////////////////////////////////////////
		|            {""ДиапазонКолонокЭлемента"", new object[4] { ""ColumnSpan"", ""columnSpan"", ""columnSpan"", ""column-span"" } },
		|            {""ДлинаТабуляции"", new object[4] { ""TabSize"", ""tabSize"", ""tabSize"", ""tab-size"" } },
		|            {""ДлительностьАнимации"", new object[4] { ""AnimationDuration"", ""animationDuration"", ""animationDuration"", ""animation-duration"" } },
		|            {""ЖирностьШрифта"", new object[4] { ""FontWeight"", ""fontWeight"", ""fontWeight"", ""font-weight"" } },
		|            {""ЗадержкаАнимации"", new object[4] { ""AnimationDelay"", ""animationDelay"", ""animationDelay"", ""animation-delay"" } },
		|            {""ЗадержкаПерехода"", new object[4] { ""TransitionDelay"", ""transitionDelay"", ""transitionDelay"", ""transition-delay"" } },
		|            {""ЗаливкаАнимации"", new object[4] { ""AnimationFillMode"", ""animationFillMode"", ""animationFillMode"", ""animation-fill-mode"" } },
		|            {""Заполнение"", new object[4] { ""Padding"", ""padding"", ""padding"", ""padding"" } },
		|            {""ЗаполнениеКолонок"", new object[4] { ""ColumnFill"", ""columnFill"", ""columnFill"", ""column-fill"" } },
		|            {""ЗаполнениеСверху"", new object[4] { ""PaddingTop"", ""paddingTop"", ""paddingTop"", ""padding-top"" } },
		|            {""ЗаполнениеСлева"", new object[4] { ""PaddingLeft"", ""paddingLeft"", ""paddingLeft"", ""padding-left"" } },
		|            {""ЗаполнениеСнизу"", new object[4] { ""PaddingBottom"", ""paddingBottom"", ""paddingBottom"", ""padding-bottom"" } },
		|            {""ЗаполнениеСправа"", new object[4] { ""PaddingRight"", ""paddingRight"", ""paddingRight"", ""padding-right"" } },
		|            {""Значок"", new object[4] { ""Icon"", ""icon"", ""icon"", ""icon"" } },
		|            {""ИзменяемыйРазмер"", new object[4] { ""Resize"", ""resize"", ""resize"", ""resize"" } },
		|            {""ИмяАнимации"", new object[4] { ""AnimationName"", ""animationName"", ""animationName"", ""animation-name"" } },
		|            {""ИнтервалГраницы"", new object[4] { ""BorderSpacing"", ""borderSpacing"", ""borderSpacing"", ""border-spacing"" } },
		|            {""ИнтервалКолонок"", new object[4] { ""ColumnGap"", ""columnGap"", ""columnGap"", ""column-gap"" } },
		|            {""ИнтервалСимволов"", new object[4] { ""LetterSpacing"", ""letterSpacing"", ""letterSpacing"", ""letter-spacing"" } },
		|            {""ИнтервалСлов"", new object[4] { ""WordSpacing"", ""wordSpacing"", ""wordSpacing"", ""word-spacing"" } },
		|            {""ИсточникПерспективы"", new object[4] { ""PerspectiveOrigin"", ""perspectiveOrigin"", ""perspectiveOrigin"", ""perspective-origin"" } },
		|            {""Калибровка"", new object[4] { ""BoxSizing"", ""boxSizing"", ""boxSizing"", ""box-sizing"" } },
		|            {""КартинкаГраницы"", new object[4] { ""BorderImage"", ""borderImage"", ""borderImage"", ""border-image"" } },
		|            {""КартинкаСтиляСписка"", new object[4] { ""ListStyleImage"", ""listStyleImage"", ""listStyleImage"", ""list-style-image"" } },
		|            {""КоличествоКолонок"", new object[4] { ""ColumnCount"", ""columnCount"", ""columnCount"", ""column-count"" } },
		|            {""КоличествоПовторов"", new object[4] { ""AnimationIterationCount"", ""animationIterationCount"", ""animationIterationCount"", ""animation-iteration-count"" } },
		|            {""КолонкиЭлемента"", new object[4] { ""Columns"", ""columns"", ""columns"", ""columns"" } },
		|            {""Контур"", new object[4] { ""Outline"", ""outline"", ""outline"", ""outline"" } },
		|            {""Курсор"", new object[4] { ""Cursor"", ""cursor"", ""cursor"", ""cursor"" } },
		|            {""ЛеваяГраница"", new object[4] { ""BorderLeft"", ""borderLeft"", ""borderLeft"", ""border-left"" } },
		|            {""Лево"", new object[4] { ""Left"", ""left"", ""left"", ""left"" } },
		|            {""ЛевыйРадиусВерхнейГраницы"", new object[4] { ""BorderTopLeftRadius"", ""borderTopLeftRadius"", ""borderTopLeftRadius"", ""border-top-left-radius"" } },
		|            {""ЛевыйРадиусНижнейГраницы"", new object[4] { ""BorderBottomLeftRadius"", ""borderBottomLeftRadius"", ""borderBottomLeftRadius"", ""border-bottom-left-radius"" } },
		|            {""МаксимальнаяВысота"", new object[4] { ""MaxHeight"", ""maxHeight"", ""maxHeight"", ""max-height"" } },
		|            {""МаксимальнаяШирина"", new object[4] { ""MaxWidth"", ""maxWidth"", ""maxWidth"", ""max-width"" } },
		|            {""МинимальнаяВысота"", new object[4] { ""MinHeight"", ""minHeight"", ""minHeight"", ""min-height"" } },
		|            {""МинимальнаяШирина"", new object[4] { ""MinWidth"", ""minWidth"", ""minWidth"", ""min-width"" } },
		|            {""МозаикаКартинки"", new object[4] { ""BackgroundRepeat"", ""backgroundRepeat"", ""backgroundRepeat"", ""background-repeat"" } },
		|            {""НаправлениеАнимации"", new object[4] { ""AnimationDirection"", ""animationDirection"", ""animationDirection"", ""animation-direction"" } },
		|            {""НаправлениеЭлементов"", new object[4] { ""FlexDirection"", ""flexDirection"", ""flexDirection"", ""flex-direction"" } },
		|            {""Непрозрачность"", new object[4] { ""Opacity"", ""opacity"", ""opacity"", ""opacity"" } },
		|            {""Несвободно"", new object[4] { ""Clear"", ""clear"", ""clear"", ""clear"" } },
		|            {""НижняяГраница"", new object[4] { ""BorderBottom"", ""borderBottom"", ""borderBottom"", ""border-bottom"" } },
		|            {""Низ"", new object[4] { ""Bottom"", ""bottom"", ""bottom"", ""bottom"" } },
		|            {""ОбластьКартинки"", new object[4] { ""BackgroundOrigin"", ""backgroundOrigin"", ""backgroundOrigin"", ""background-origin"" } },
		|            {""ОбластьРисования"", new object[4] { ""BackgroundClip"", ""backgroundClip"", ""backgroundClip"", ""background-clip"" } },
		|            {""Обрезка"", new object[4] { ""Clip"", ""clip"", ""clip"", ""clip"" } },
		|            {""Отображать"", new object[4] { ""Display"", ""display"", ""display"", ""display"" } },
		|            {""Отступ"", new object[4] { ""Margin"", ""margin"", ""margin"", ""margin"" } },
		|            {""ОтступСверху"", new object[4] { ""MarginTop"", ""marginTop"", ""marginTop"", ""margin-top"" } },
		|            {""ОтступСлева"", new object[4] { ""MarginLeft"", ""marginLeft"", ""marginLeft"", ""margin-left"" } },
		|            {""ОтступСнизу"", new object[4] { ""MarginBottom"", ""marginBottom"", ""marginBottom"", ""margin-bottom"" } },
		|            {""ОтступСправа"", new object[4] { ""MarginRight"", ""marginRight"", ""marginRight"", ""margin-right"" } },
		|            {""ОтступТекста"", new object[4] { ""TextIndent"", ""textIndent"", ""textIndent"", ""text-indent"" } },
		|            {""ОформлениеТекстаЛиния"", new object[4] { ""TextDecorationLine"", ""textDecorationLine"", ""textDecorationLine"", ""text-decoration-line"" } },
		|            {""ОформлениеТекстаСтиль"", new object[4] { ""TextDecorationStyle"", ""textDecorationStyle"", ""textDecorationStyle"", ""text-decoration-style"" } },
		|            {""ОформлениеТекстаЦвет"", new object[4] { ""TextDecorationColor"", ""textDecorationColor"", ""textDecorationColor"", ""text-decoration-color"" } },
		|            {""ПереносГибких"", new object[4] { ""FlexWrap"", ""flexWrap"", ""flexWrap"", ""flex-wrap"" } },
		|            {""ПереносСлов"", new object[4] { ""WordWrap"", ""wordWrap"", ""wordWrap"", ""word-wrap"" } },
		|            {""Переполнение"", new object[4] { ""Overflow"", ""overflow"", ""overflow"", ""overflow"" } },
		|            {""ПереполнениеИгрек"", new object[4] { ""OverflowY"", ""overflowY"", ""overflowY"", ""overflow-y"" } },
		|            {""ПереполнениеИкс"", new object[4] { ""OverflowX"", ""overflowX"", ""overflowX"", ""overflow-x"" } },
		|            {""ПереполнениеТекста"", new object[4] { ""TextOverflow"", ""textOverflow"", ""textOverflow"", ""text-overflow"" } },
		|            {""Переход"", new object[4] { ""Transition"", ""transition"", ""transition"", ""transition"" } },
		|            {""Перспектива"", new object[4] { ""Perspective"", ""perspective"", ""perspective"", ""perspective"" } },
		|            {""Позиция"", new object[4] { ""Position"", ""position"", ""position"", ""position"" } },
		|            {""ПозицияОбъекта"", new object[4] { ""ObjectPosition"", ""objectPosition"", ""objectPosition"", ""object-position"" } },
		|            {""ПозицияСтиляСписка"", new object[4] { ""ListStylePosition"", ""listStylePosition"", ""listStylePosition"", ""list-style-position"" } },
		|            {""ПоложениеЗаголовка"", new object[4] { ""CaptionSide"", ""captionSide"", ""captionSide"", ""caption-side"" } },
		|            {""ПоложениеКартинки"", new object[4] { ""BackgroundPosition"", ""backgroundPosition"", ""backgroundPosition"", ""background-position"" } },
		|            {""Порядок"", new object[4] { ""Order"", ""order"", ""order"", ""order"" } },
		|            {""ПраваяГраница"", new object[4] { ""BorderRight"", ""borderRight"", ""borderRight"", ""border-right"" } },
		|            {""Право"", new object[4] { ""Right"", ""right"", ""right"", ""right"" } },
		|            {""ПравыйРадиусВерхнейГраницы"", new object[4] { ""BorderTopRightRadius"", ""borderTopRightRadius"", ""borderTopRightRadius"", ""border-top-right-radius"" } },
		|            {""ПравыйРадиусНижнейГраницы"", new object[4] { ""BorderBottomRightRadius"", ""borderBottomRightRadius"", ""borderBottomRightRadius"", ""border-bottom-right-radius"" } },
		|            {""Пробелы"", new object[4] { ""WhiteSpace"", ""whiteSpace"", ""whiteSpace"", ""white-space"" } },
		|            {""ПрописныеТекста"", new object[4] { ""TextTransform"", ""textTransform"", ""textTransform"", ""text-transform"" } },
		|            {""ПустыеЯчейки"", new object[4] { ""EmptyCells"", ""emptyCells"", ""emptyCells"", ""empty-cells"" } },
		|            {""РадиусГраницы"", new object[4] { ""BorderRadius"", ""borderRadius"", ""borderRadius"", ""border-radius"" } },
		|            {""РазделительКолонок"", new object[4] { ""ColumnRule"", ""columnRule"", ""columnRule"", ""column-rule"" } },
		|            {""РазмерКартинки"", new object[4] { ""BackgroundSize"", ""backgroundSize"", ""backgroundSize"", ""background-size"" } },
		|            {""РазмерШрифта"", new object[4] { ""FontSize"", ""fontSize"", ""fontSize"", ""font-size"" } },
		|            {""РазмещениеВТаблице"", new object[4] { ""TableLayout"", ""tableLayout"", ""tableLayout"", ""table-layout"" } },
		|            {""РасположениеСодержимого"", new object[4] { ""JustifyContent"", ""justifyContent"", ""justifyContent"", ""justify-content"" } },
		|            {""СвойствоПерехода"", new object[4] { ""TransitionProperty"", ""transitionProperty"", ""transitionProperty"", ""transition-property"" } },
		|            {""Сдвиг"", new object[4] { ""Transform"", ""transform"", ""transform"", ""transform"" } },
		|            {""СемействоШрифтов"", new object[4] { ""FontFamily"", ""fontFamily"", ""fontFamily"", ""font-family"" } },
		|            {""Смещение"", new object[4] { ""Offset"", ""offset"", ""offset"", ""offset"" } },
		|            {""СмещениеКонтура"", new object[4] { ""OutlineOffset"", ""outlineOffset"", ""outlineOffset"", ""outline-offset"" } },
		|            {""Состояние"", new object[4] { ""AnimationPlayState"", ""animationPlayState"", ""animationPlayState"", ""animation-play-state"" } },
		|            {""СтильВерхнейГраницы"", new object[4] { ""BorderTopStyle"", ""borderTopStyle"", ""borderTopStyle"", ""border-top-style"" } },
		|            {""СтильГраниц"", new object[4] { ""BordersStyle"", ""borderStyle"", ""bordersStyle"", ""border-style"" } },//////////////////////////////////////////////////////////////////////////
		|            {""СтильКонтура"", new object[4] { ""OutlineStyle"", ""outlineStyle"", ""outlineStyle"", ""outline-style"" } },
		|            {""СтильЛевойГраницы"", new object[4] { ""BorderLeftStyle"", ""borderLeftStyle"", ""borderLeftStyle"", ""border-left-style"" } },
		|            {""СтильНижнейГраницы"", new object[4] { ""BorderBottomStyle"", ""borderBottomStyle"", ""borderBottomStyle"", ""border-bottom-style"" } },
		|            {""СтильПравойГраницы"", new object[4] { ""BorderRightStyle"", ""borderRightStyle"", ""borderRightStyle"", ""border-right-style"" } },
		|            {""СтильРазделителяКолонок"", new object[4] { ""ColumnRuleStyle"", ""columnRuleStyle"", ""columnRuleStyle"", ""column-rule-style"" } },
		|            {""СтильСдвига"", new object[4] { ""TransformStyle"", ""transformStyle"", ""transformStyle"", ""transform-style"" } },
		|            {""СтильСписка"", new object[4] { ""ListStyle"", ""listStyle"", ""listStyle"", ""list-style"" } },
		|            {""СтильШрифта"", new object[4] { ""FontStyle"", ""fontStyle"", ""fontStyle"", ""font-style"" } },
		|            {""Тень"", new object[4] { ""BoxShadow"", ""boxShadow"", ""boxShadow"", ""box-shadow"" } },
		|            {""ТеньТекста"", new object[4] { ""TextShadow"", ""textShadow"", ""textShadow"", ""text-shadow"" } },
		|            {""ТипСтиляСписка"", new object[4] { ""ListStyleType"", ""listStyleType"", ""listStyleType"", ""list-style-type"" } },
		|            {""ТочкаСдвига"", new object[4] { ""TransformOrigin"", ""transformOrigin"", ""transformOrigin"", ""transform-origin"" } },
		|            {""Увеличение"", new object[4] { ""FlexGrow"", ""flexGrow"", ""flexGrow"", ""flex-grow"" } },
		|            {""Уменьшение"", new object[4] { ""FlexShrink"", ""flexShrink"", ""flexShrink"", ""flex-shrink"" } },
		|            {""Фильтр"", new object[4] { ""Filter"", ""filter"", ""filter"", ""filter"" } },
		|            {""ФоновоеВложение"", new object[4] { ""BackgroundAttachment"", ""backgroundAttachment"", ""backgroundAttachment"", ""background-attachment"" } },
		|            {""ФоновоеИзображение"", new object[4] { ""BackgroundImage"", ""backgroundImage"", ""backgroundImage"", ""background-image"" } },
		|            {""ФункцияПерехода"", new object[4] { ""TransitionTimingFunction"", ""transitionTimingFunction"", ""transitionTimingFunction"", ""transition-timing-function"" } },
		|            {""ФункцияСинхронизации"", new object[4] { ""AnimationTimingFunction"", ""animationTimingFunction"", ""animationTimingFunction"", ""animation-timing-function"" } },
		|            {""ЦветВерхнейГраницы"", new object[4] { ""BorderTopColor"", ""borderTopColor"", ""borderTopColor"", ""border-top-color"" } },
		|            {""ЦветГраниц"", new object[4] { ""BordersColor"", ""borderColor"", ""bordersColor"", ""border-color"" } },//////////////////////////////////////////////////////////////////////////
		|            {""ЦветКонтура"", new object[4] { ""OutlineColor"", ""outlineColor"", ""outlineColor"", ""outline-color"" } },
		|            {""ЦветКурсора"", new object[4] { ""CaretColor"", ""caretColor"", ""caretColor"", ""caret-color"" } },
		|            {""ЦветЛевойГраницы"", new object[4] { ""BorderLeftColor"", ""borderLeftColor"", ""borderLeftColor"", ""border-left-color"" } },
		|            {""ЦветНижнейГраницы"", new object[4] { ""BorderBottomColor"", ""borderBottomColor"", ""borderBottomColor"", ""border-bottom-color"" } },
		|            {""ЦветПравойГраницы"", new object[4] { ""BorderRightColor"", ""borderRightColor"", ""borderRightColor"", ""border-right-color"" } },
		|            {""ЦветРазделителяКолонок"", new object[4] { ""ColumnRuleColor"", ""columnRuleColor"", ""columnRuleColor"", ""column-rule-color"" } },
		|            {""ЦветТекста"", new object[4] { ""TextColor"", ""color"", ""textColor"", ""color"" } }, //////////////////////////////////////////////////////////////////////////////////////////
		|            {""ЦветФона"", new object[4] { ""BackgroundColor"", ""backgroundColor"", ""backgroundColor"", ""background-color"" } },
		|            {""Ширина"", new object[4] { ""Width"", ""width"", ""width"", ""width"" } },
		|            {""ШиринаВерхнейГраницы"", new object[4] { ""BorderTopWidth"", ""borderTopWidth"", ""borderTopWidth"", ""border-top-width"" } },
		|            {""ШиринаГраниц"", new object[4] { ""BordersWidth"", ""borderWidth"", ""bordersWidth"", ""border-width"" } }, ////////////////////////////////////////////////////////////////////////
		|            {""ШиринаКартинкиГраницы"", new object[4] { ""BorderImageWidth"", ""borderImageWidth"", ""borderImageWidth"", ""border-image-width"" } },
		|            {""ШиринаКолонок"", new object[4] { ""ColumnWidth"", ""columnWidth"", ""columnWidth"", ""column-width"" } },
		|            {""ШиринаКонтура"", new object[4] { ""OutlineWidth"", ""outlineWidth"", ""outlineWidth"", ""outline-width"" } },
		|            {""ШиринаЛевойГраницы"", new object[4] { ""BorderLeftWidth"", ""borderLeftWidth"", ""borderLeftWidth"", ""border-left-width"" } },
		|            {""ШиринаНижнейГраницы"", new object[4] { ""BorderBottomWidth"", ""borderBottomWidth"", ""borderBottomWidth"", ""border-bottom-width"" } },
		|            {""ШиринаПравойГраницы"", new object[4] { ""BorderRightWidth"", ""borderRightWidth"", ""borderRightWidth"", ""border-right-width"" } },
		|            {""ШиринаРазделителяКолонок"", new object[4] { ""ColumnRuleWidth"", ""columnRuleWidth"", ""columnRuleWidth"", ""column-rule-width"" } },
		|            {""Шрифт"", new object[4] { ""Font"", ""font"", ""font"", ""font"" } }
		|        };		
		|		
		|        // Для метода ПолучитьСвойство и для установки аргументов событий. Имена свойств.
		|        public static Dictionary<string, object[]> namesRusProps = new Dictionary<string, object[]>
		|            {
		|                // methodRus tail isProperty jsMethodEn
		|                // tail - хвостик к значению свойства.
		|                // isProperty - это свойство объекта, иначе, - это свойство стиля.
		|                // Это для DfEventArgs
		|                {""ListItem"", new object[3] { """", true, ""listItem"" } },
		|                {""Y"", new object[3] { """", true, ""y"" } },
		|                {""X"", new object[3] { """", true, ""x"" } },
		|                {""Button"", new object[3] { """", true, ""button"" } },
		|                {""Files"", new object[3] { """", true, ""files"" } },		
		|                {""Value"", new object[3] { """", true, ""_value"" } },
		|                // Это для объектов
		|                {""WindowHeight"", new object[3] { """", true, ""windowHeight"" } },
		|                {""WindowWidth"", new object[3] { """", true, ""windowWidth"" } },
		|                {""ЦветФона"", new object[3] { """", false, ""backgroundColor"" } },
		|                {""Направление"", new object[3] { """", true, ""dir"" } },
		|                {""ГоризонтальноеПрокручивание"", new object[3] { """", true, ""scrollLeft"" } },
		|                {""ВертикальноеПрокручивание"", new object[3] { """", true, ""scrollTop"" } },
		|                {""Длительность"", new object[3] { """", true, ""duration"" } },
		|                {""НаПаузе"", new object[3] { """", true, ""paused"" } },
		|                {""Завершено"", new object[3] { """", true, ""ended"" } },
		|                {""Скорость"", new object[3] { """", true, ""playbackRate"" } },
		|                {""ИндексЯчейки"", new object[3] { """", true, ""cellIndex"" } },
		|                {""Индекс"", new object[3] { """", true, ""index"" } },
		|                {""ДиапазонКолонок"", new object[3] { """", true, ""colSpan"" } },
		|                {""Заголовки"", new object[3] { """", true, ""headers"" } },
		|                {""ДиапазонСтрок"", new object[3] { """", true, ""rowSpan"" } },
		|                {""Класс"", new object[3] { """", true, ""className"" } },
		|                {""СмещениеЛево"", new object[3] { """", true, ""offsetLeft"" } },
		|                {""СмещениеВерх"", new object[3] { """", true, ""offsetTop"" } },
		|                {""СмещениеШирина"", new object[3] { """", true, ""offsetWidth"" } },
		|                {""СмещениеВысота"", new object[3] { """", true, ""offsetHeight"" } },
		|                {""Имя"", new object[3] { """", true, ""name"" } },
		|                {""Загружено"", new object[3] { """", true, ""complete"" } },
		|                {""Карта"", new object[3] { """", true, ""isMap"" } },
		|                {""ИсходнаяШирина"", new object[3] { """", true, ""naturalWidth"" } },
		|                {""ИсходнаяВысота"", new object[3] { """", true, ""naturalHeight"" } },
		|                {""Области"", new object[3] { """", true, ""areas"" } },
		|                {""Изображения"", new object[3] { """", true, ""images"" } },
		|                {""Файлы"", new object[3] { """", true, ""files"" } },
		|                {""Позиция"", new object[3] { """", true, ""position"" } },		
		|                {""Количество"", new object[3] { """", true, ""length"" } },
		|                {""ЭлементыСписка"", new object[3] { """", true, ""options"" } },
		|                {""Помечен"", new object[3] { """", true, ""_checked"" } },
		|                {""Ячейки"", new object[3] { """", true, ""cells"" } },
		|                {""ИндексСтроки"", new object[3] { """", true, ""rowIndex"" } },
		|                {""ИндексСтрокиВСекции"", new object[3] { """", true, ""sectionRowIndex"" } },
		|                {""Строки"", new object[3] { """", true, ""rows"" } },
		|                {""ОбластиТаблицы"", new object[3] { """", true, ""tBodies"" } },
		|                {""Итоги"", new object[3] { """", true, ""tFoot"" } },
		|                {""ШапкаТаблицы"", new object[3] { """", true, ""tHead"" } },
		|                {""Значение"", new object[3] { """", true, ""_value"" } },
		|                {""БазоваяДлина"", new object[3] { """", false, ""flexBasis"" } },
		|                {""ВариантШрифта"", new object[3] { """", false, ""fontVariant"" } },
		|                {""ВертикальноеВыравнивание"", new object[3] { """", false, ""verticalAlign"" } },
		|                {""Родитель"", new object[3] { """", true, ""parent"" } },
		|                {""Идентификатор"", new object[3] { """", true, ""id"" } },
		|                {""Текст"", new object[3] { """", true, ""innerText"" } },
		|                {""Видимость"", new object[3] { """", false, ""visibility"" } },
		|                {""ВерхняяГраница"", new object[3] { """", false, ""borderTop"" } },
		|                {""ВписываниеОбъекта"", new object[3] { """", false, ""objectFit"" } },
		|                {""ВремяПерехода"", new object[3] { """", false, ""transitionDuration"" } },
		|                {""ВыделениеПользователем"", new object[3] { """", false, ""userSelect"" } },
		|                {""ВыравниваниеОтдельных"", new object[3] { """", false, ""alignSelf"" } },
		|                {""ВыравниваниеСодержимого"", new object[3] { """", false, ""alignContent"" } },
		|                {""ВыравниваниеЭлементов"", new object[3] { """", false, ""alignItems"" } },
		|                {""Высота"", new object[3] { """", false, ""height"" } },
		|                {""ВысотаСтроки"", new object[3] { """", false, ""lineHeight"" } },
		|                {""ГоризонтальноеВыравнивание"", new object[3] { """", false, ""cssFloat"" } },
		|                {""ГоризонтальноеВыравниваниеТекста"", new object[3] { """", false, ""textAlign"" } },
		|                {""ГраницаСвернута"", new object[3] { """", false, ""borderCollapse"" } },
		|                {""Границы"", new object[3] { """", false, ""border"" } },
		|                {""ДиапазонКолонокЭлемента"", new object[3] { """", false, ""columnSpan"" } },
		|                {""ДлинаТабуляции"", new object[3] { """", false, ""tabSize"" } },
		|                {""ДлительностьАнимации"", new object[3] { """", false, ""animationDuration"" } },
		|                {""ЖирностьШрифта"", new object[3] { """", false, ""fontWeight"" } },
		|                {""ЗадержкаАнимации"", new object[3] { """", false, ""animationDelay"" } },
		|                {""ЗадержкаПерехода"", new object[3] { """", false, ""transitionDelay"" } },
		|                {""ЗаливкаАнимации"", new object[3] { """", false, ""animationFillMode"" } },
		|                {""Заполнение"", new object[3] { """", false, ""padding"" } },
		|                {""ЗаполнениеКолонок"", new object[3] { """", false, ""columnFill"" } },
		|                {""ЗаполнениеСверху"", new object[3] { """", false, ""paddingTop"" } },
		|                {""ЗаполнениеСлева"", new object[3] { """", false, ""paddingLeft"" } },
		|                {""ЗаполнениеСнизу"", new object[3] { """", false, ""paddingBottom"" } },
		|                {""ЗаполнениеСправа"", new object[3] { """", false, ""paddingRight"" } },
		|                {""ИзменяемыйРазмер"", new object[3] { """", false, ""resize"" } },
		|                {""ИмяАнимации"", new object[3] { """", false, ""animationName"" } },
		|                {""ИнтервалГраницы"", new object[3] { """", false, ""borderSpacing"" } },
		|                {""ИнтервалКолонок"", new object[3] { """", false, ""columnGap"" } },
		|                {""ИнтервалСимволов"", new object[3] { """", false, ""letterSpacing"" } },
		|                {""ИнтервалСлов"", new object[3] { """", false, ""wordSpacing"" } },
		|                {""ИсточникКартинкиГраницы"", new object[3] { """", false, ""borderImageSource"" } },
		|                {""ИсточникПерспективы"", new object[3] { """", false, ""perspectiveOrigin"" } },
		|                {""Калибровка"", new object[3] { """", false, ""boxSizing"" } },
		|                {""КартинкаГраницы"", new object[3] { """", false, ""borderImage"" } },
		|                {""КартинкаСтиляСписка"", new object[3] { """", false, ""listStyleImage"" } },
		|                {""КоличествоКолонок"", new object[3] { """", false, ""columnCount"" } },
		|                {""КоличествоПовторов"", new object[3] { """", false, ""animationIterationCount"" } },
		|                {""КолонкиЭлемента"", new object[3] { """", false, ""columns"" } },
		|                {""Контур"", new object[3] { """", false, ""outline"" } },
		|                {""Ширина"", new object[3] { """", false, ""width"" } },
		|                {""Курсор"", new object[3] { """", false, ""cursor"" } },
		|                {""ЛеваяГраница"", new object[3] { """", false, ""borderLeft"" } },
		|                {""Лево"", new object[3] { """", false, ""left"" } },
		|                {""ЛевыйРадиусВерхнейГраницы"", new object[3] { """", false, ""borderTopLeftRadius"" } },
		|                {""ЛевыйРадиусНижнейГраницы"", new object[3] { """", false, ""borderBottomLeftRadius"" } },
		|                {""МаксимальнаяВысота"", new object[3] { """", false, ""maxHeight"" } },
		|                {""МаксимальнаяШирина"", new object[3] { """", false, ""maxWidth"" } },
		|                {""МинимальнаяВысота"", new object[3] { """", false, ""minHeight"" } },
		|                {""МинимальнаяШирина"", new object[3] { """", false, ""minWidth"" } },
		|                {""МозаикаКартинки"", new object[3] { """", false, ""backgroundRepeat"" } },
		|                {""МозаикаКартинкиГраницы"", new object[3] { """", false, ""borderImageRepeat"" } },
		|                {""НаправлениеАнимации"", new object[3] { """", false, ""animationDirection"" } },
		|                {""НаправлениеЭлементов"", new object[3] { """", false, ""flexDirection"" } },
		|                {""НарезкаКартинкиГраницы"", new object[3] { """", false, ""borderImageSlice"" } },
		|                {""Непрозрачность"", new object[3] { """", false, ""opacity"" } },
		|                {""Несвободно"", new object[3] { """", false, ""clear"" } },
		|                {""НижняяГраница"", new object[3] { """", false, ""borderBottom"" } },
		|                {""Низ"", new object[3] { """", false, ""bottom"" } },
		|                {""ОбластьКартинки"", new object[3] { """", false, ""backgroundOrigin"" } },
		|                {""ОбластьРисования"", new object[3] { """", false, ""backgroundClip"" } },
		|                {""Обрезка"", new object[3] { """", false, ""clip"" } },
		|                {""Отображать"", new object[3] { """", false, ""display"" } },
		|                {""Отступ"", new object[3] { """", false, ""margin"" } },
		|                {""ОтступСверху"", new object[3] { """", false, ""marginTop"" } },
		|                {""ОтступСлева"", new object[3] { """", false, ""marginLeft"" } },
		|                {""ОтступСнизу"", new object[3] { """", false, ""marginBottom"" } },
		|                {""ОтступСправа"", new object[3] { """", false, ""marginRight"" } },
		|                {""ОтступТекста"", new object[3] { """", false, ""textIndent"" } },
		|                {""ОформлениеТекстаЛиния"", new object[3] { """", false, ""textDecorationLine"" } },
		|                {""ОформлениеТекстаСтиль"", new object[3] { """", false, ""textDecorationStyle"" } },
		|                {""ОформлениеТекстаЦвет"", new object[3] { """", false, ""textDecorationColor"" } },
		|                {""ПереносГибких"", new object[3] { """", false, ""flexWrap"" } },
		|                {""ПереносСлов"", new object[3] { """", false, ""wordWrap"" } },
		|                {""Переполнение"", new object[3] { """", false, ""overflow"" } },
		|                {""ПереполнениеИгрек"", new object[3] { """", false, ""overflowY"" } },
		|                {""ПереполнениеИкс"", new object[3] { """", false, ""overflowX"" } },
		|                {""ПереполнениеТекста"", new object[3] { """", false, ""textOverflow"" } },
		|                {""Переход"", new object[3] { """", false, ""transition"" } },
		|                {""Перспектива"", new object[3] { """", false, ""perspective"" } },	
		|                {""ПозицияОбъекта"", new object[3] { """", false, ""objectPosition"" } },
		|                {""ПозицияСтиляСписка"", new object[3] { """", false, ""listStylePosition"" } },
		|                {""ПоложениеЗаголовка"", new object[3] { """", false, ""captionSide"" } },
		|                {""ПоложениеКартинки"", new object[3] { """", false, ""backgroundPosition"" } },
		|                {""Порядок"", new object[3] { """", false, ""order"" } },
		|                {""ПраваяГраница"", new object[3] { """", false, ""borderRight"" } },
		|                {""Право"", new object[3] { """", false, ""right"" } },
		|                {""ПравыйРадиусВерхнейГраницы"", new object[3] { """", false, ""borderTopRightRadius"" } },
		|                {""ПравыйРадиусНижнейГраницы"", new object[3] { """", false, ""borderBottomRightRadius"" } },
		|                {""Пробелы"", new object[3] { """", false, ""whiteSpace"" } },
		|                {""ПрописныеТекста"", new object[3] { """", false, ""textTransform"" } },
		|                {""ПустыеЯчейки"", new object[3] { """", false, ""emptyCells"" } },
		|                {""РадиусГраницы"", new object[3] { """", false, ""borderRadius"" } },
		|                {""РазделительКолонок"", new object[3] { """", false, ""columnRule"" } },
		|                {""РазмерКартинки"", new object[3] { """", false, ""backgroundSize"" } },
		|                {""РазмерШрифта"", new object[3] { """", false, ""fontSize"" } },
		|                {""РазмещениеВТаблице"", new object[3] { """", false, ""tableLayout"" } },
		|                {""РасположениеСодержимого"", new object[3] { """", false, ""justifyContent"" } },
		|                {""СвойствоПерехода"", new object[3] { """", false, ""transitionProperty"" } },
		|                {""СемействоШрифтов"", new object[3] { """", false, ""fontFamily"" } },
		|                {""СмещениеКартинкиГраницы"", new object[3] { """", false, ""borderImageOutset"" } },
		|                {""СмещениеКонтура"", new object[3] { """", false, ""outlineOffset"" } },
		|                {""Состояние"", new object[3] { """", false, ""animationPlayState"" } },
		|                {""СтильВерхнейГраницы"", new object[3] { """", false, ""borderTopStyle"" } },
		|                {""СтильГраниц"", new object[3] { """", false, ""borderStyle"" } },
		|                {""СтильКонтура"", new object[3] { """", false, ""outlineStyle"" } },	
		|                {""СтильЛевойГраницы"", new object[3] { """", false, ""borderLeftStyle"" } },
		|                {""СтильНижнейГраницы"", new object[3] { """", false, ""borderBottomStyle"" } },
		|                {""СтильПравойГраницы"", new object[3] { """", false, ""borderRightStyle"" } },
		|                {""СтильРазделителяКолонок"", new object[3] { """", false, ""columnRuleStyle"" } },
		|                {""СтильСдвига"", new object[3] { """", false, ""transformStyle"" } },
		|                {""СтильСписка"", new object[3] { """", false, ""listStyle"" } },
		|                {""СтильШрифта"", new object[3] { """", false, ""fontStyle"" } },
		|                {""Тень"", new object[3] { """", false, ""boxShadow"" } },
		|                {""ТеньТекста"", new object[3] { """", false, ""textShadow"" } },
		|                {""ТипСтиляСписка"", new object[3] { """", false, ""listStyleType"" } },
		|                {""ТочкаСдвига"", new object[3] { """", false, ""transformOrigin"" } },
		|                {""Увеличение"", new object[3] { """", false, ""flexGrow"" } },
		|                {""Уменьшение"", new object[3] { """", false, ""flexShrink"" } },
		|                {""Фильтр"", new object[3] { """", false, ""filter"" } },
		|                {""Фон"", new object[3] { """", false, ""background"" } },
		|                {""ФоновоеВложение"", new object[3] { """", false, ""backgroundAttachment"" } },
		|                {""ФоновоеИзображение"", new object[3] { """", false, ""backgroundImage"" } },
		|                {""ФункцияПерехода"", new object[3] { """", false, ""transitionTimingFunction"" } },
		|                {""ФункцияСинхронизации"", new object[3] { """", false, ""animationTimingFunction"" } },
		|                {""ЦветВерхнейГраницы"", new object[3] { """", false, ""borderTopColor"" } },
		|                {""ЦветГраниц"", new object[3] { """", false, ""borderColor"" } },
		|                {""ЦветКонтура"", new object[3] { """", false, ""outlineColor"" } },
		|                {""ЦветКурсора"", new object[3] { """", false, ""caretColor"" } },
		|                {""ЦветЛевойГраницы"", new object[3] { """", false, ""borderLeftColor"" } },
		|                {""ЦветНижнейГраницы"", new object[3] { """", false, ""borderBottomColor"" } },
		|                {""ЦветПравойГраницы"", new object[3] { """", false, ""borderRightColor"" } },
		|                {""ЦветРазделителяКолонок"", new object[3] { """", false, ""columnRuleColor"" } },
		|                {""ЦветТекста"", new object[3] { """", false, ""color"" } },
		|                {""ШиринаВерхнейГраницы"", new object[3] { """", false, ""borderTopWidth"" } },
		|                {""ШиринаГраниц"", new object[3] { """", false, ""borderWidth"" } },
		|                {""ШиринаКартинкиГраницы"", new object[3] { """", false, ""borderImageWidth"" } },
		|                {""ШиринаКолонок"", new object[3] { """", false, ""columnWidth"" } },
		|                {""ШиринаКонтура"", new object[3] { """", false, ""outlineWidth"" } },
		|                {""ШиринаЛевойГраницы"", new object[3] { """", false, ""borderLeftWidth"" } },
		|                {""ШиринаНижнейГраницы"", new object[3] { """", false, ""borderBottomWidth"" } },
		|                {""ШиринаПравойГраницы"", new object[3] { """", false, ""borderRightWidth"" } },
		|                {""ШиринаРазделителяКолонок"", new object[3] { """", false, ""columnRuleWidth"" } },
		|                {""Шрифт"", new object[3] { """", false, ""font"" } },
		|                {""ТолькоЧтение"", new object[3] { """", true, ""readOnly"" } },
		|                {""АвтоФокус"", new object[3] { """", true, ""autofocus"" } },		
		|                {""Адрес"", new object[3] { """", true, ""href"" } },
		|                {""Асинхронно"", new object[3] { """", true, ""async"" } },
		|                {""Беззвучно"", new object[3] { """", true, ""muted"" } },
		|                {""КлавишаДоступа"", new object[3] { """", true, ""accessKey"" } },
		|                {""ПорядокОбхода"", new object[3] { """", true, ""tabIndex"" } },
		|                {""Редактируемый"", new object[3] { """", true, ""contentEditable"" } },		
		|                {""Отключено"", new object[3] { """", true, ""disabled"" } },		
		|                {""Шаг"", new object[3] { """", true, ""step"" } },		
		|                {""Максимум"", new object[3] { """", true, ""max"" } },
		|                {""Минимум"", new object[3] { """", true, ""min"" } },		
		|                {""Открыт"", new object[3] { """", true, ""open"" } },		
		|                {""Заполнитель"", new object[3] { """", true, ""placeholder"" } },		
		|                {""МаксимальнаяДлина"", new object[3] { """", true, ""maxLength"" } },		
		|                {""Размер"", new object[3] { """", true, ""size"" } },
		|                {""Источник"", new object[3] { """", true, ""src"" } },
		|                {""Разлиновка"", new object[3] { """", true, ""rules"" } },
		|                {""Громкость"", new object[3] { """", true, ""volume"" } },
		|                {""Контролы"", new object[3] { """", true, ""controls"" } },
		|                {""Повтор"", new object[3] { """", true, ""loop"" } },
		|                {""ТекущаяПозиция"", new object[3] { """", true, ""currentTime"" } },
		|                {""Оптимум"", new object[3] { """", true, ""optimum"" } },
		|                {""Диапазон"", new object[3] { """", true, ""span"" } },
		|                {""Описание"", new object[3] { """", true, ""_аlt"" } },
		|                {""ИмяКарты"", new object[3] { """", true, ""useMap"" } },
		|                {""ИндексВыбранного"", new object[3] { """", true, ""selectedIndex"" } },
		|                {""МножественныйВыбор"", new object[3] { """", true, ""multiple"" } },
		|                {""Начало"", new object[3] { """", true, ""start"" } },
		|                {""Обратный"", new object[3] { """", true, ""reversed"" } },
		|                {""ТипМаркера"", new object[3] { """", true, ""type"" } },		
		|                {""Выбран"", new object[3] { """", true, ""selected"" } },
		|                {""Надпись"", new object[3] { """", true, ""label"" } },
		|                {""ПереносТекста"", new object[3] { """", true, ""wrap"" } },
		|                {""Колонки"", new object[3] { """", true, ""cols"" } },
		|                {""Принимаемый"", new object[3] { """", true, ""accept"" } },
		|                {""Скачать"", new object[3] { """", true, ""download"" } },
		|                {""Подсказка"", new object[3] { """", true, ""title"" } },
		|                {""Назначение"", new object[3] { """", true, ""target"" } },
		|                {""Неопределено"", new object[3] { """", true, ""indeterminate"" } },
		|                {""Форма"", new object[3] { """", true, ""form"" } },		
		|                {""Отложено"", new object[3] { """", true, ""defer"" } },
		|                {""Связь"", new object[3] { """", true, ""htmlFor"" } },		
		|                {""Гибкость"", new object[3] { """", false, ""flex"" } },
		|
		|		
		|        };
		|    }
		|}
		|";
		ТекстДокХХХ = Новый ТекстовыйДокумент;
		ТекстДокХХХ.УстановитьТекст(СтрВыгрузки);
		ТекстДокХХХ.Записать(КаталогВыгрузки + "\" + ИмяФайлаДФ + ".cs");
	КонецЕсли;
КонецПроцедуры//СоздатьФайлДФ

Функция СловарьСобытий(КлассАнгл)
	М = РазобратьСтроку(СловарьСобытий[КлассАнгл], "=");
	Возврат М;
КонецФункции

Функция СловарьСвойств(КлассАнгл)
	М = РазобратьСтроку(СловарьСвойств[КлассАнгл], "=");
	Возврат М;
КонецФункции

Функция СловарьКлассов(КлассАнгл)
	М = РазобратьСтроку(СловарьКлассов[КлассАнгл], "=");
	Возврат М;
КонецФункции

КаталогСправки = "C:\444\OSDFormsRu";// без слэша в конце
КаталогВыгрузки = "C:\444\ВыгрузкаДекларФорм";// без слэша в конце

СловарьСобытий = Новый Структура();
СловарьСобытий.Вставить("DoubleClick", "ДвойноеНажатие=dblclick=dblclick=====");
СловарьСобытий.Вставить("Loaded", "Загружена=======");
СловарьСобытий.Вставить("Click", "Нажатие=click=click=====");
СловарьСобытий.Вставить("MouseUp", "ПриОтпусканииМыши=mouseup=mouseup=====");
СловарьСобытий.Вставить("Input", "Ввод=input=input=====");
СловарьСобытий.Вставить("Change", "ПриИзменении=change=change=====");
СловарьСобытий.Вставить("MouseOver", "МышьНадЭлементом=mouseover=mouseover=====");
СловарьСобытий.Вставить("MouseOut", "МышьПокинулаЭлемент=mouseout=mouseout=====");
СловарьСобытий.Вставить("LostFocus", "ФокусПотерян=blur=blur=====");
СловарьСобытий.Вставить("Focused", "ФокусПолучен=focus=focus=====");

СловарьСвойств = Новый Структура();
// ПриватИмяСвойства = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[0];
// ИмяСвойстваДляJS = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[1];
// Хвостик = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[2]; // Хвостик к значению свойства.
// ТипЗнач = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[3];
// ПриведениеКbool = СловарьСвойств(СвойствоРус + "_" + СвойствоАнгл)[4];

// ПриватИмяСвойства=ИмяСвойстваДляJS=Хвостик=ТипЗнач=ПриведениеКbool
СловарьСвойств.Вставить("Угол_Angle", "angle===int====");
СловарьСвойств.Вставить("УголИкс_AngleX", "angleX===int====");
СловарьСвойств.Вставить("УголИгрек_AngleY", "angleY===int====");
СловарьСвойств.Вставить("Зет_Z", "z===int====");
СловарьСвойств.Вставить("Цвет_Color", "color===DfColor====");
СловарьСвойств.Вставить("Числа_Numbers", "numbers===ArrayImpl====");
СловарьСвойств.Вставить("Число1_Number1", "number1===IValue====");
СловарьСвойств.Вставить("Число2_Number2", "number2===IValue====");
СловарьСвойств.Вставить("Число3_Number3", "number3===IValue====");
СловарьСвойств.Вставить("Число4_Number4", "number4===IValue====");
СловарьСвойств.Вставить("ВариантШрифта_FontVariant", "fontVariant=fontVariant==IValue====");
СловарьСвойств.Вставить("ВысотаСтроки_LineHeight", "lineHeight=lineHeight=px=IValue====");
СловарьСвойств.Вставить("ЖирностьШрифта_FontWeight", "fontWeight=fontWeight==IValue====");
СловарьСвойств.Вставить("РазмерШрифта_FontSize", "fontSize=fontSize=px=IValue====");
СловарьСвойств.Вставить("СемействоШрифтов_FontFamily", "fontFamily=fontFamily==IValue====");
СловарьСвойств.Вставить("СтильШрифта_FontStyle", "fontStyle=fontStyle==IValue====");
СловарьСвойств.Вставить("Связь_HtmlFor", "htmlFor=htmlFor==string====");
СловарьСвойств.Вставить("Икс1_X1", "x1===int====");
СловарьСвойств.Вставить("Икс2_X2", "x2===int====");
СловарьСвойств.Вставить("Игрек1_Y1", "y1===int====");
СловарьСвойств.Вставить("Игрек2_Y2", "y2===int====");
СловарьСвойств.Вставить("ВремяПерехода_TransitionDuration", "transitionDuration===int====");
СловарьСвойств.Вставить("ЗадержкаПерехода_TransitionDelay", "transitionDelay===int====");
СловарьСвойств.Вставить("ПоложениеИкс_AxisX", "axisX===int====");
СловарьСвойств.Вставить("ПоложениеИгрек_AxisY", "axisY===int====");
СловарьСвойств.Вставить("ПоложениеЗет_AxisZ", "axisZ===int====");
СловарьСвойств.Вставить("Множитель_Ratio", "ratio===int====");
СловарьСвойств.Вставить("Высота_Height", "height===int====");
СловарьСвойств.Вставить("Ширина_Width", "width===int====");
СловарьСвойств.Вставить("Величина_Spread", "spread===int====");
СловарьСвойств.Вставить("Внутренняя_Inset", "inset===bool====");
СловарьСвойств.Вставить("Размытие_Blur", "blur===int====");
СловарьСвойств.Вставить("Инверсия_Invert", "invert===int====");
СловарьСвойств.Вставить("Контраст_Contrast", "contrast===int====");
СловарьСвойств.Вставить("Насыщенность_Saturate", "saturate===int====");
СловарьСвойств.Вставить("Непрозрачность_Opacity", "opacity===int====");
СловарьСвойств.Вставить("ОттенкиСерого_Grayscale", "grayscale===int====");
СловарьСвойств.Вставить("ПоворотОттенка_HueRotate", "hueRotate===int====");
СловарьСвойств.Вставить("Ретро_Sepia", "sepia===int====");
СловарьСвойств.Вставить("Яркость_Brightness", "brightness===int====");
СловарьСвойств.Вставить("СтильВерхнейГраницы_BorderTopStyle", "borderTopStyle===string====");
СловарьСвойств.Вставить("СтильЛевойГраницы_BorderLeftStyle", "borderLeftStyle===string====");
СловарьСвойств.Вставить("СтильНижнейГраницы_BorderBottomStyle", "borderBottomStyle===string====");
СловарьСвойств.Вставить("СтильПравойГраницы_BorderRightStyle", "borderRightStyle===string====");
СловарьСвойств.Вставить("ШиринаВерхнейГраницы_BorderTopWidth", "borderTopWidth===string====");
СловарьСвойств.Вставить("ШиринаЛевойГраницы_BorderLeftWidth", "borderLeftWidth===string====");
СловарьСвойств.Вставить("ШиринаНижнейГраницы_BorderBottomWidth", "borderBottomWidth===string====");
СловарьСвойств.Вставить("ШиринаПравойГраницы_BorderRightWidth", "borderRightWidth===string====");
СловарьСвойств.Вставить("ЦветВерхнейГраницы_BorderTopColor", "borderTopColor===string====");
СловарьСвойств.Вставить("ЦветЛевойГраницы_BorderLeftColor", "borderLeftColor===string====");
СловарьСвойств.Вставить("ЦветНижнейГраницы_BorderBottomColor", "borderBottomColor===string====");
СловарьСвойств.Вставить("ЦветПравойГраницы_BorderRightColor", "borderRightColor===string====");
СловарьСвойств.Вставить("ВертикальноеВыравнивание_VerticalAlign", "verticalAlign===string====");
СловарьСвойств.Вставить("СтильГраниц_BordersStyle", "bordersStyle=borderStyle==DfBordersStyle====");
СловарьСвойств.Вставить("ГраницаСвернута_BorderCollapse", "borderCollapse=borderCollapse==string====");
СловарьСвойств.Вставить("ВерхняяГраница_BorderTop", "borderTop=borderTop==DfBorderTop====");
СловарьСвойств.Вставить("СтильГраницы_BorderStyle", "borderStyle=borderStyle==string====");
СловарьСвойств.Вставить("ШиринаГраницы_BorderWidth", "borderWidth=borderWidth==string====");
СловарьСвойств.Вставить("ЦветГраниц_BordersColor", "bordersColor=bordersColor==string====");
СловарьСвойств.Вставить("Границы_Borders", "borders=border==DfBorders====");
СловарьСвойств.Вставить("Разлиновка_Rules", "rules=rules==string====");
СловарьСвойств.Вставить("РазмещениеВТаблице_TableLayout", "tableLayout=tableLayout==string====");
СловарьСвойств.Вставить("Заполнение_Padding", "padding=padding==DfPadding====");
СловарьСвойств.Вставить("ЗаполнениеСверху_PaddingTop", "paddingTop=paddingTop=px=int====");
СловарьСвойств.Вставить("ЗаполнениеСлева_PaddingLeft", "paddingLeft=paddingLeft=px=int====");
СловарьСвойств.Вставить("ЗаполнениеСнизу_PaddingBottom", "paddingBottom=paddingBottom=px=int====");
СловарьСвойств.Вставить("ЗаполнениеСправа_PaddingRight", "paddingRight=paddingRight=px=int====");
СловарьСвойств.Вставить("Радиус_Radius", "radius=radius==int====");
СловарьСвойств.Вставить("ИмяКарты_UseMap", "useMap=useMap==string====");
СловарьСвойств.Вставить("ИсточникКартинкиГраницы_BorderImageSource", "borderImageSource=borderImageSource==string====");
СловарьСвойств.Вставить("МозаикаКартинкиГраницы_BorderImageRepeat", "borderImageRepeat=borderImageRepeat==string====");
СловарьСвойств.Вставить("НарезкаКартинкиГраницы_BorderImageSlice", "borderImageSlice=borderImageSlice==int====");
СловарьСвойств.Вставить("СмещениеКартинкиГраницы_BorderImageOutset", "borderImageOutset=borderImageOutset==int====");
СловарьСвойств.Вставить("ШиринаКартинкиГраницы_BorderImageWidth", "borderImageWidth=borderImageWidth==int====");
СловарьСвойств.Вставить("КартинкаГраницы_BorderImage", "borderImage=borderImage==DfBorderImage====");
СловарьСвойств.Вставить("КоличествоКолонок_ColumnCount", "columnCount=columnCount==IValue====");
СловарьСвойств.Вставить("ШиринаКолонок_ColumnWidth", "columnWidth=columnWidth=px=IValue====");
СловарьСвойств.Вставить("КолонкиЭлемента_Columns", "columns=columns==DfColumns====");
СловарьСвойств.Вставить("СтильКонтура_OutlineStyle", "outlineStyle=outlineStyle==string====");
СловарьСвойств.Вставить("ЦветКонтура_OutlineColor", "outlineColor=outlineColor==string====");
СловарьСвойств.Вставить("ШиринаКонтура_OutlineWidth", "outlineWidth=outlineWidth==string====");
СловарьСвойств.Вставить("Контур_Outline", "outline=outline==DfOutline====");
СловарьСвойств.Вставить("Контекст2d_Context2d", "context2d===DfContext2d====");
СловарьСвойств.Вставить("nwПуть_NwPath", "=======");
СловарьСвойств.Вставить("oscriptПуть_OscriptPath", "=======");
СловарьСвойств.Вставить("АвтоФокус_AutoFocus", "autofocus=autofocus==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Адрес_Href", "href=href==string====");
СловарьСвойств.Вставить("Альфа_GlobalAlpha", "=======");
СловарьСвойств.Вставить("АргументыСобытия_EventArgs", "=======");
СловарьСвойств.Вставить("БазоваяЛинияТекста_TextBaseline", "=======");
СловарьСвойств.Вставить("Беззвучно_Muted", "muted=muted==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Бесшовный_Seamless", "seamless=seamless==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("ВертикальноеПрокручивание_ScrollTop", "scrollTop=scrollTop==int====");
СловарьСвойств.Вставить("Верх_Top", "top=top==int====");
СловарьСвойств.Вставить("Выбран_Selected", "selected=selected==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("ВыбранныйПоУмолчанию_DefaultSelected", "defaultSelected=defaultSelected======");
СловарьСвойств.Вставить("ВыравниваниеТекста_TextAlign", "textAlign=textAlign==string====");
СловарьСвойств.Вставить("ВысокоеЗначение_High", "high=high==int====");
СловарьСвойств.Вставить("Высота_Height", "height=height=px=int====");
СловарьСвойств.Вставить("ГоризонтальноеВыравниваниеТекста_HorizontalTextAlign", "horizontalTextAlign=textAlign==string====");
СловарьСвойств.Вставить("ГоризонтальноеПрокручивание_ScrollLeft", "scrollLeft=scrollLeft==int====");
СловарьСвойств.Вставить("Громкость_Volume", "volume=volume==int====");
СловарьСвойств.Вставить("ДанныеРисунка_ImageDataData", "=======");
СловарьСвойств.Вставить("Диапазон_Span", "span=span==int====");
СловарьСвойств.Вставить("ДиапазонКолонок_ColSpan", "colSpan=colSpan==int====");
СловарьСвойств.Вставить("ДиапазонСтрок_RowSpan", "rowSpan=rowSpan==int====");
СловарьСвойств.Вставить("Длительность_Duration", "duration=duration==int====");
СловарьСвойств.Вставить("Доступность_Enabled", "=======");
СловарьСвойств.Вставить("Завершено_Ended", "ended=ended==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Заголовки_Headers", "headers=headers==string====");
СловарьСвойств.Вставить("Заголовок_Caption", "=======");
СловарьСвойств.Вставить("Заголовок_Title", "=======");
СловарьСвойств.Вставить("Загружено_Complete", "complete=complete==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Заполнитель_Placeholder", "placeholder=placeholder==string====");
СловарьСвойств.Вставить("Значение_Value", "_value=value==IValue====");
СловарьСвойств.Вставить("Значок_Icon", "=======");
СловарьСвойств.Вставить("Значок_Icon", "=======");
СловарьСвойств.Вставить("Игрек_Y", "y===int====");
СловарьСвойств.Вставить("Идентификатор_Id", "id=id==string====");
СловарьСвойств.Вставить("ИзменяемыйРазмер_Resizable", "=======");
СловарьСвойств.Вставить("Изображения_Images", "=======");
СловарьСвойств.Вставить("Икс_X", "x===int====");
СловарьСвойств.Вставить("Имя_Name", "=======");
СловарьСвойств.Вставить("Класс_Class", "className=className==string====");
СловарьСвойств.Вставить("ИмяМетода_MethodName", "=======");
СловарьСвойств.Вставить("ИндексЯчейки_CellIndex", "cellIndex=cellIndex==int====");
СловарьСвойств.Вставить("Индекс_Index", "index=index==int====");
СловарьСвойств.Вставить("ИндексВыбранного_SelectedIndex", "selectedIndex=selectedIndex==int====");
СловарьСвойств.Вставить("ИндексСтроки_RowIndex", "rowIndex=rowIndex==int====");
СловарьСвойств.Вставить("ИндексСтрокиВСекции_SectionRowIndex", "sectionRowIndex=sectionRowIndex==int====");
СловарьСвойств.Вставить("Источник_Src", "src=src==string====");
СловарьСвойств.Вставить("ИсходнаяВысота_NaturalHeight", "naturalHeight=naturalHeight==int====");
СловарьСвойств.Вставить("ИсходнаяШирина_NaturalWidth", "naturalWidth=naturalWidth==int====");
СловарьСвойств.Вставить("Итоги_TFoot", "tFoot=tFoot==DfOutcome====");
СловарьСвойств.Вставить("Карта_IsMap", "isMap=isMap==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Киоск_Kiosk", "=======");
СловарьСвойств.Вставить("КлавишаДоступа_AccessKey", "accessKey=accessKey==string====");
СловарьСвойств.Вставить("Кнопка_Button", "=======");
СловарьСвойств.Вставить("Количество_Length", "length=length==int====");
СловарьСвойств.Вставить("Колонки_Cols", "cols=cols==int====");
СловарьСвойств.Вставить("Композиция_GlobalCompositeOperation", "=======");
СловарьСвойств.Вставить("Контент_Body", "=======");
СловарьСвойств.Вставить("Контролы_Controls", "controls=controls==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Координаты_Coordinates", "coordinates=coordinates==ArrayImpl====");
СловарьСвойств.Вставить("Лево_Left", "offsetLeft=offsetLeft==int====");
СловарьСвойств.Вставить("МаксимальнаяВысота_MaxHeight", "=======");
СловарьСвойств.Вставить("МаксимальнаяДлина_MaxLength", "maxLength=maxLength==int====");
СловарьСвойств.Вставить("МаксимальнаяШирина_MaxWidth", "=======");
СловарьСвойств.Вставить("Максимум_Max", "max=max==int====");
СловарьСвойств.Вставить("Меню_Menu", "=======");
СловарьСвойств.Вставить("МинимальнаяВысота_MinHeight", "=======");
СловарьСвойств.Вставить("МинимальнаяШирина_MinWidth", "=======");
СловарьСвойств.Вставить("Минимум_Min", "min=min==int====");
СловарьСвойств.Вставить("МножественныйВыбор_Multiple", "multiple=multiple==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Надпись_Label", "label=label==string====");
СловарьСвойств.Вставить("Назначение_Target", "target=target==string====");
СловарьСвойств.Вставить("НаПаузе_Paused", "paused=paused==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Направление_Dir", "dir=dir==string====");
СловарьСвойств.Вставить("НаправлениеТекста_Direction", "=======");
СловарьСвойств.Вставить("Начало_Start", "start=start==int====");
СловарьСвойств.Вставить("Неопределено_Indeterminate", "indeterminate=indeterminate==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("НизкоеЗначение_Low", "low=low==int====");
СловарьСвойств.Вставить("НоваяСтрока_NewLine", "=======");
СловарьСвойств.Вставить("Области_Areas", "areas=areas==ArrayImpl====");
СловарьСвойств.Вставить("Обратный_Reversed", "reversed=reversed==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("ОбщаяСтруктура_ShareStructure", "=======");
СловарьСвойств.Вставить("Описание_Alt", "alt=alt==string====");
СловарьСвойств.Вставить("Оптимум_Optimum", "optimum=optimum==decimal====");
СловарьСвойств.Вставить("Отключено_Disabled", "disabled=disabled==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Открыт_Open", "open=open==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Отображать_Display", "display=display==string====");
СловарьСвойств.Вставить("Отправитель_Sender", "=======");
СловарьСвойств.Вставить("Асинхронно_Async", "async=async==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Кодировка_Charset", "charset=charset==string====");
СловарьСвойств.Вставить("Отложено_Defer", "defer=defer==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Параметр_Parameter", "=======");
СловарьСвойств.Вставить("ПереносТекста_TextWrap", "wrap=wrap==string====");
СловарьСвойств.Вставить("Переполнение_Overflow", "overflow=overflow==string====");
СловарьСвойств.Вставить("ПереполнениеИгрек_OverflowY", "overflowY=overflowY==string====");
СловарьСвойств.Вставить("ПереполнениеИкс_OverflowX", "overflowX=overflowX==string====");
СловарьСвойств.Вставить("Повтор_Loop", "loop=loop==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Подменю_Submenu", "=======");
СловарьСвойств.Вставить("Подсказка_Title", "title=title==string====");
СловарьСвойств.Вставить("Позиция_Position", "position=position==string====");
СловарьСвойств.Вставить("Показать_Show", "=======");
СловарьСвойств.Вставить("ПоказатьВПанели_ShowInTaskbar", "=======");
СловарьСвойств.Вставить("Полноэкранный_Fullscreen", "=======");
СловарьСвойств.Вставить("Помечен_Checked", "_checked=checked==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("ПомеченПоУмолчанию_DefaultChecked", "=======");
СловарьСвойств.Вставить("Порт_Port", "=======");
СловарьСвойств.Вставить("ПорядокОбхода_TabIndex", "tabIndex=tabIndex==int====");
СловарьСвойств.Вставить("Постер_Poster", "=======");
СловарьСвойств.Вставить("ПределСреза_MiterLimit", "=======");
СловарьСвойств.Вставить("Принимаемый_Accept", "accept=accept==string====");
СловарьСвойств.Вставить("Пробелы_WhiteSpace", "whiteSpace=whiteSpace==string====");
СловарьСвойств.Вставить("Прозрачный_Transparent", "=======");
СловарьСвойств.Вставить("Размер_Size", "size=size==int====");
СловарьСвойств.Вставить("РазмытиеТени_ShadowBlur", "=======");
СловарьСвойств.Вставить("Редактируемый_ContentEditable", "contentEditable=contentEditable==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Родитель_Parent", "=======");
СловарьСвойств.Вставить("Скачать_Download", "download=download==string====");
СловарьСвойств.Вставить("Скорость_PlaybackRate", "playbackRate=playbackRate==int====");
СловарьСвойств.Вставить("СмещениеТениИгрек_ShadowOffsetY", "=======");
СловарьСвойств.Вставить("СмещениеТениИкс_ShadowOffsetX", "=======");
СловарьСвойств.Вставить("СтильЗаливки_FillStyle", "=======");
СловарьСвойств.Вставить("СтильКонцовЛинии_LineCap", "=======");
СловарьСвойств.Вставить("СтильОбводки_StrokeStyle", "=======");
СловарьСвойств.Вставить("СтильУглаПересечения_LineJoin", "=======");
СловарьСвойств.Вставить("СтрокаФункций_FunctionString", "=======");
СловарьСвойств.Вставить("Строки_Rows", "rows=rows==int====");
СловарьСвойств.Вставить("Сценарий_Script", "=======");
СловарьСвойств.Вставить("Текст_Text", "innerText=innerText==string====");
СловарьСвойств.Вставить("ТекстСсылки_LinkText", "=======");
СловарьСвойств.Вставить("ТекущаяПозиция_CurrentTime", "currentTime=currentTime==int====");
СловарьСвойств.Вставить("ТипМаркера_Type", "type=type==string====");
СловарьСвойств.Вставить("ТолькоЧтение_ReadOnly", "readOnly=readOnly==bool=.ToString().ToLower()===");
СловарьСвойств.Вставить("Файлы_Files", "files=files==string====");
СловарьСвойств.Вставить("Форма_Form", "=======");
СловарьСвойств.Вставить("Форма_Shape", "form=shape==IValue====");
СловарьСвойств.Вставить("Фрейм_Frame", "=======");
СловарьСвойств.Вставить("ЦветТени_ShadowColor", "=======");
СловарьСвойств.Вставить("ЦветФона_BackgroundColor", "backgroundColor=backgroundColor==string====");
СловарьСвойств.Вставить("Шаг_Step", "step=step==int====");
СловарьСвойств.Вставить("ШапкаТаблицы_THead", "tHead=tHead==DfTableHeader====");
СловарьСвойств.Вставить("Ширина_Width", "width=width=px=int====");
СловарьСвойств.Вставить("ШиринаЛинии_LineWidth", "=======");
СловарьСвойств.Вставить("Шрифт_Font", "=======");
СловарьСвойств.Вставить("Элементы_Children", "=======");
СловарьСвойств.Вставить("ЭлементыСписка_Options", "оptions=оptions======");
СловарьСвойств.Вставить("Ячейки_Cells", "cells=cells==ArrayImpl====");
СловарьСвойств.Вставить("ОбластиТаблицы_TBodies", "tBodies=tBodies==ArrayImpl====");

СловарьКлассов = Новый Структура();
// КлассРус=Тег=ТипДляinput=
СловарьКлассов.Вставить("AdditionalDiv", "ДополнительныйБлок=aside==");
СловарьКлассов.Вставить("Area", "Область=area==");
СловарьКлассов.Вставить("Audio", "Аудио=audio==");
СловарьКлассов.Вставить("Body", "Контент=body==");
СловарьКлассов.Вставить("BoldText", "ЖирныйТекст=b==");
СловарьКлассов.Вставить("Button", "Кнопка=button==");
СловарьКлассов.Вставить("Canvas", "Холст=canvas==");
СловарьКлассов.Вставить("Caption", "Заголовок=caption==");
СловарьКлассов.Вставить("CaptionMedia", "ОписаниеМедиа=figcaption==");
СловарьКлассов.Вставить("Cell", "Ячейка=td==");
СловарьКлассов.Вставить("CheckBox", "Флажок=input=checkbox=");
СловарьКлассов.Вставить("Code", "Код=code==");
СловарьКлассов.Вставить("Colgroup", "ГруппаКолонок=colgroup==");
СловарьКлассов.Вставить("ColorSelection", "ВыборЦвета=input=color=");
СловарьКлассов.Вставить("Column", "Колонка=col==");
СловарьКлассов.Вставить("Datalist", "СписокДанных=datalist==");
СловарьКлассов.Вставить("DateSelection", "ВыборДаты=input=date=");
СловарьКлассов.Вставить("DateTimeLocalSelection", "ВыборМестнойДатыВремени=input=datetime-local=");
СловарьКлассов.Вставить("DateTimeSelection", "ВыборДатыВремени=input=datetime=");
СловарьКлассов.Вставить("DeclarativeForms", "ДекларативныеФормы===");
СловарьКлассов.Вставить("Definition", "Определение=dd==");
СловарьКлассов.Вставить("DeletedText", "УдаленыйТекст=del==");
СловарьКлассов.Вставить("Dialog", "Диалог=dialog==");
СловарьКлассов.Вставить("DirectedText", "НаправленныйТекст=bdo==");
СловарьКлассов.Вставить("Div", "Блок=div==");
СловарьКлассов.Вставить("Element", "Элемент===");
СловарьКлассов.Вставить("ExpandableDiv", "РаскрываемыйБлок=details==");
СловарьКлассов.Вставить("ExpandableDivHeader", "ЗаголовокРаскрываемогоБлока=summary==");
СловарьКлассов.Вставить("FileSelection", "ВыборФайла=input=file=");
СловарьКлассов.Вставить("Footer", "НижнийКолонтитул=footer==");
СловарьКлассов.Вставить("Form", "Форма===");
СловарьКлассов.Вставить("Frame", "Фрейм=iframe==");
СловарьКлассов.Вставить("Group", "Группа=fieldset==");
СловарьКлассов.Вставить("GroupTitle", "ЗаголовокГруппы=legend==");
СловарьКлассов.Вставить("H1", "Заголовок1=h1==");
СловарьКлассов.Вставить("H2", "Заголовок2=h2==");
СловарьКлассов.Вставить("H3", "Заголовок3=h3==");
СловарьКлассов.Вставить("H4", "Заголовок4=h4==");
СловарьКлассов.Вставить("H5", "Заголовок5=h5==");
СловарьКлассов.Вставить("H6", "Заголовок6=h6==");
СловарьКлассов.Вставить("Header", "Колонтитул=header==");
СловарьКлассов.Вставить("HeaderCell", "ЯчейкаЗаголовка=th==");
СловарьКлассов.Вставить("Image", "Изображение=img==");
СловарьКлассов.Вставить("ImagesFilter", "ФильтрИзображений===");
СловарьКлассов.Вставить("ItalicsText", "КурсивТекст=cite==");
СловарьКлассов.Вставить("Label", "Подпись=label==");
СловарьКлассов.Вставить("Line", "Линия=hr==");
СловарьКлассов.Вставить("Link", "Ссылка=a==");
СловарьКлассов.Вставить("ListDefinition", "СписокОпределений=dl==");
СловарьКлассов.Вставить("ListItem", "ЭлементСписка=li==");
СловарьКлассов.Вставить("Map", "Карта=map==");
СловарьКлассов.Вставить("MarkedText", "МаркированныйТекст=mark==");
СловарьКлассов.Вставить("MediaGroup", "МедиаГруппа=figure==");
СловарьКлассов.Вставить("Menu", "Меню===");
СловарьКлассов.Вставить("MenuItem", "ЭлементМеню===");
СловарьКлассов.Вставить("Meter", "Шкала=meter==");
СловарьКлассов.Вставить("MonthSelection", "ВыборМесяца=input=month=");
СловарьКлассов.Вставить("NumberField", "ПолеЧисла=input=number=");
СловарьКлассов.Вставить("OrderedList", "УпорядоченныйСписок=ol==");
СловарьКлассов.Вставить("Outcome", "Итоги=tfoot==");
СловарьКлассов.Вставить("Output", "Результат=output==");
СловарьКлассов.Вставить("Paragraph", "Абзац=p==");
СловарьКлассов.Вставить("Article", "Артикль=article==");
СловарьКлассов.Вставить("PasswordField", "ПолеПароля=input=password=");
СловарьКлассов.Вставить("PreformattedText", "ФорматированныйТекст=pre==");
СловарьКлассов.Вставить("Progress", "Индикатор=progress==");
СловарьКлассов.Вставить("Radio", "Переключатель=input=radio=");
СловарьКлассов.Вставить("Range", "Ползунок=input=range=");
СловарьКлассов.Вставить("SearchField", "ПолеПоиска=input=search=");
СловарьКлассов.Вставить("Select", "ПолеСписка=select==");
СловарьКлассов.Вставить("SelectGroup", "ГруппировкаПоляСписка=optgroup==");
СловарьКлассов.Вставить("SelectItem", "ЭлементПоляСписка=option==");
СловарьКлассов.Вставить("SmallText", "МелкийТекст=small==");
СловарьКлассов.Вставить("SubText", "ПодстрочныйТекст=sub==");
СловарьКлассов.Вставить("SupText", "НадстрочныйТекст=sup==");
СловарьКлассов.Вставить("Table", "Таблица=table==");
СловарьКлассов.Вставить("TableBody", "ОбластьТаблицы=tbody==");
СловарьКлассов.Вставить("TableHeader", "ШапкаТаблицы=thead==");
СловарьКлассов.Вставить("TableRow", "СтрокаТаблицы=tr==");
СловарьКлассов.Вставить("Term", "Термин=dt==");
СловарьКлассов.Вставить("TextArea", "ОбластьТекста=textarea==");
СловарьКлассов.Вставить("TextField", "ПолеТекста=input=text=");
СловарьКлассов.Вставить("TimeSelection", "ВыборВремени=input=time=");
СловарьКлассов.Вставить("Transfer", "Перенос=br==");
СловарьКлассов.Вставить("UnderlineText", "ПодчеркнутыйТекст=u==");
СловарьКлассов.Вставить("UnorderedList", "НеупорядоченныйСписок=ul==");
СловарьКлассов.Вставить("WeekSelection", "ВыборНедели=input=week=");
СловарьКлассов.Вставить("Script", "Скрипт=script==");

ВыгрузкаДляДекларФорм();
